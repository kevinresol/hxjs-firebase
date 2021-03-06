package;

import haxe.macro.Expr;
import haxe.macro.Printer;

using haxe.Json;
using haxe.io.Path;
using sys.io.File;
using sys.FileSystem;
using Lambda;
using StringTools;

class Main {
	
	static var types:Map<String, TypeDefinition>;
	static var fields:Map<String, Array<Field>>;
	
	static var typeParamRe = ~/([^<>]*)(<!?\??(.*)>)?/;
	static var keywords = ['catch'];
	
	static function main() {
		var items:Array<Item> = 'ast.json'.getContent().parse();
		
		function kindOf(type:String) {
			
			var re = typeParamRe;
			if(re.match(type)) {
				var type = re.matched(1);
				var params = switch re.matched(3) {
					case null: null;
					case v: v.split(',').map(function(n) return TPType(toHaxeType([n]).type));
				}
				return switch items.find(function(i) return i.longname == type) {
					case null: throw '$type not found';
					case i: return {
						kind: i.kind,
						name: type,
						params: params,
					}
				}
			}
			throw 'todo';
		}
		
		types = new Map();
		fields = new Map();
		
		function addField(type:String, field:Field) {
			if(type == null) return;
			if(type == 'firebase') type = 'firebase.Firebase';
			if(!fields.exists(type)) fields[type] = [];
			fields[type].push(field);
		}
		
		function isEnum(name:String):Bool {
			return switch items.find(item -> item.longname == name) {
				case null: false;
				case item: item.isEnum;
			}
		}
		
		for(item in items) {
			if(item.memberof == 'firebase') {
				if(item.kind != 'class' && item.params != null) item.kind = 'function';
			}
			switch item.kind {
				case 'file':
				case 'namespace':
					if(item.longname == 'firebase') {
						var td = createTypeDefinition('firebase.Firebase', TDClass(null, null, false));
						td.meta = [
							{name: ':jsRequire', params: [macro 'firebase'], pos: null}
						];
					}
				case 'function':
					var name = item.name;
					var meta = [];
					if(keywords.indexOf(name) != -1) {
						name = name + '_';
						meta.push({name: ':native', params: [{expr: EConst(CString(item.name)), pos: null}], pos: null});
					}
					addField(item.memberof, {
						access: item.scope == 'static' ? [AStatic] : [],
						doc: item.description,
						kind: FFun({
							args: item.params == null ? [] : [for(param in item.params) {
								var type = toHaxeType(param.type.names);
								{
									meta: null,
									name: param.name,
									opt: param.optional == true || param.nullable == true || type.optional,
									type: type.type,
									value: null,
								}
							}],
							expr: null,
							ret: item.returns == null || item.returns.length == 0 ? macro:Void : switch toHaxeType(item.returns[0].type.names) {
								case {optional: true}: macro:Void;
								case {optional: false, type: type}: type;
							},
						}),
						meta: meta,
						name: name,
						pos: null,
					});
				case 'member' if(item.isEnum && item.scope == 'static'):
					if(!types.exists(item.longname)) {
						createTypeDefinition(item.longname, TDAbstract(toHaxeType(item.type.names).type, [], []));
					}
				case 'member' if(isEnum(item.memberof)):
					addField(item.memberof, {
						access: [],
						doc: item.description,
						kind: FVar(null),
						meta: null,
						name: item.name,
						pos: null,
					});
				case 'member':
					if(item.type != null) addField(item.memberof, {
						access: item.scope == 'static' ? [AStatic] : [],
						doc: item.description,
						kind: FVar(toHaxeType(item.type.names).type),
						meta: null,
						name: item.name,
						pos: null,
					});
				case 'interface':
					if(!types.exists(item.longname)) {
						var superClass = null;
						var interfaces = [];
						if(item.augments != null) for(a in item.augments) {
							switch kindOf(a) {
								case {kind: 'interface', name: name, params: params}: interfaces.push(asTypePath(name, params));
								case v: throw 'unhandled kind "$v"';
							}
						}
						createTypeDefinition(item.longname, TDClass(superClass, interfaces, true));
					}
				case 'class':
					if(!types.exists(item.longname)) {
						var superClass = null;
						var interfaces = [];
						if(item.augments != null) for(a in item.augments) {
							switch kindOf(a) {
								case {kind: 'interface' | 'class', name: name, params: params}: interfaces.push(asTypePath(name, params));
								case v: throw 'unhandled kind "$v"';
							}
						}
						switch Reflect.field(item, 'implements') {
							case null:
							case v:
								for(a in (v:Array<String>)) {
									switch kindOf(a) {
										case {kind: 'interface', name: name, params: params}: interfaces.push(asTypePath(name, params));
										case v: throw 'unhandled kind "$v"';
									}
								}
						}
						createTypeDefinition(item.longname, TDClass(superClass, interfaces, false));
					}
				case 'typedef':
					trace('typedef: ' + item.name);
					var start = ~/@typedef\s?{{/;
					var re = ~/\s*\*\s*([^,]*),?/;
					var end = ~/}}/;
					var lines = [];
					var started = false;
					for(line in item.comment.split('\n')) {
						if(started && end.match(line)) break;
						if(started) {
							if(re.match(line)) {
								lines.push(re.matched(1));
							}
						} else if(start.match(line)) started = true; 
					}
					
					
					var parent = if(item.scope == 'instance') {
						item.memberof;
					} else if(item.scope == 'static') {
						createTypeDefinition(item.longname, TDStructure);
						item.longname;
					} else {
						throw 'unhandled scope: "${item.scope}"';
					}
					addField(parent, {
						doc: item.description,
						kind: FVar(toHaxeType(['{' + lines.join(',') + '}']).type),
						meta: null,
						name: item.name,
						pos: null,
					});
				case 'constant':
					
				case 'package':
				case v: throw 'unhandled kind "$v"';
			}
			// trace('${item.kind}: ${item.longname}, ${item.memberof}');
		}
		
		for(typeName in fields.keys()) {
			try {
				if(typeName == 'firebase') typeName = 'firebase.Firebase';
				types[typeName].fields = fields[typeName];
			} catch(e:Dynamic) {
				// trace(typeName);
			}
		}
		
		var printer = new Printer();
		var cwd = Sys.programPath().directory();
		var root = '$cwd/../src/';
		
		var subtypes = [];
		
		for(type in types) {
			// skip promise
			switch type.name {
				case 'Promise': continue; // we use js.Promise, no need to generate
				case 'Thenable': continue; // we have some manual adjustments done, don't override
				default: 
			}
			
			// append this type to existing .hx file
			switch type.pack {
				case []: false;
				case v:
					if(isCapitalLetter(v[v.length - 1].charCodeAt(0)) && types.exists(v.join('.'))) {
						subtypes.push(type);
						continue;
					}
			}
			
			var folder = root + type.pack.join('/') + '/';
			if(!FileSystem.exists(folder)) folder.createDirectory();
			var fullpath = folder + type.name + '.hx';
			
			try {
				var source = printer.printTypeDefinition(type);
				source = source.replace('@:jsRequire("firebase")', '#if firebase_global @:native("firebase") #else @:jsRequire("firebase") #end');
				fullpath.saveContent(source); 
			} catch(e:Dynamic) {
				trace(type);
				trace(type.name);
				trace(e);
			}
		}
		
		for(type in subtypes) {
			var fullpath = root + type.pack.join('/') + '.hx';
			var source = printer.printTypeDefinition(type);
			source = source.replace('@:jsRequire("firebase")', '#if firebase_global @:native("firebase") #else @:jsRequire("firebase") #end');
			source = source.split('\n').filter(v -> !v.startsWith('package')).join('\n');
			fullpath.saveContent(fullpath.getContent() + '\n' + source); 
		}
		
		// '$cwd/manual/firebase'.copy('$root/firebase');
		
	}
	
	static function isCapitalLetter(code:Int):Bool {
		var s = String.fromCharCode(code);
		return s == s.toUpperCase();
	}
	
	static function createTypeDefinition(fullname:String, kind:TypeDefKind) {
		if(!fields.exists(fullname)) fields[fullname] = [];
		var pack = fullname.split('.');
		var name = pack.pop();
		
		function makeJsRequireMeta() {
			return {
				name: ':jsRequire', 
				params:
					switch pack {
						case []:
							[{expr: EConst(CString(name)), pos: null}];
						case _:
							[{expr: EConst(CString(pack[0])), pos: null}, {expr: EConst(CString(pack.slice(1).concat([name]).join('.'))), pos: null}];
					},
				pos: null,
			}
		}
			
		types[fullname] = {
			fields: [],
			isExtern: true,
			kind: kind,
			meta: switch kind {
				case TDClass(_):
					[makeJsRequireMeta()];
				case TDAbstract(_):
					[
						makeJsRequireMeta(),
						{
							name: ':enum',
							params: [],
							pos: null,
						}
					];
					
				default: [];
			},
			name: name,
			pack: pack,
			params: null,
			pos: null,
		}
		return types[fullname];
	}
	
	static function toHaxeType(names:Array<String>):{ type : haxe.macro.ComplexType, optional : Bool } {
		function toType(name:String):ComplexType {
			name = name.trim();
			if(name.startsWith('(') && name.endsWith(')')) name = name.substr(1, name.length - 2);
			// if(name.indexOf('|') != -1)
			if(name.startsWith('!')) name = name.substr(1);
			if(name.startsWith('?')) name = name.substr(1);
			return switch name {
				case 'Error': macro:js.Error;
				case 'firebase.Promise': macro:js.Promise<Dynamic>;
				case 'firebase.Thenable': macro:js.Promise.Thenable<Dynamic>;
				case v if(v.startsWith('{')):
					var content = v.substr(1, v.length - 2);
					var fields = 
						if(content.trim() == '') []
						else [for(item in content.split(',')) {
							if(item.trim() == '') continue;
							var s = item.split(':');
							var typeStr = s[1].trim();
							if(typeStr.startsWith('(') && typeStr.endsWith(')'))
								typeStr = typeStr.substr(1, typeStr.length - 2);
							
							{
								name: s[0].trim(),
								kind: FVar(toHaxeType(typeStr.split('|')).type),
								meta: s[1].trim().startsWith('?') ? [{
									name: ':optional',
									pos: null,
								}] : null,
								pos: null,
							}
						}];
					
					TAnonymous(fields);
					 
				case v if(v.indexOf('<') != -1):
					typeParamRe.match(v);
					var type = switch typeParamRe.matched(1) {
						case v if(v.indexOf('Promise') != -1): 'js.Promise';
						case v if(v.endsWith('.')): v.substr(0, v.length - 1);
						case v: v;
					}
					if(type == 'Object') type = 'Dynamic';
					var params = typeParamRe.matched(3);
					if(type == 'firebase.Observer') {
						TPath(asTypePath(type, [TPType(toHaxeType(params.split(',')).type)]));
					} else {
						TPath(asTypePath(type, [TPType(toType(params))]));
						// TPath(asTypePath(type, params.split(',').map(function(n) return TPType(toType(n)))));
					}
				case v if(v.indexOf('.') != -1):
					if(v.indexOf('Promise') != -1) TPath(asTypePath('js.Promise', [TPType(macro:Dynamic)]));
					else TPath(asTypePath(v));
				case 'boolean': macro:Bool;
				case 'function': macro:haxe.Constraints.Function; // TODO
				case 'string': macro:String;
				case 'number': macro:Float;
				case 'void': macro:Dynamic;
				case 'Object': macro:Dynamic;
				case 'Uint8Array': macro:js.html.Uint8Array;
				case 'ArrayBuffer': macro:js.html.ArrayBuffer;
				case 'Blob': macro:js.html.Blob;
				case 'Error': macro:js.Error;
				case 'Promise': macro:js.Promise<Dynamic>;
				default: 
					// trace(name);
					macro:Dynamic;
			}
		}
		
		var optional = false;
		var names = names.copy();
		names.remove('undefined');
		names.remove('null');
		var type = 
			if(names.length == 1)
				toType(names[0]);
			else
				names.fold(function(n, last) {
					var t = toType(n);
					if(n == 'null' || n == 'undefined') {
						optional = true;
						return last;
					}
					return if(last == null) t else macro:haxe.extern.EitherType<$t, $last>; 
				}, null);
				
		return {
			optional: optional,
			type: type,
		}
	}
	
	static public function asTypePath(s:String, ?params):TypePath {
		var parts = s.split('.');
		var name = parts.pop(),
		sub = null;
		if (parts.length > 0 && parts[parts.length - 1].charCodeAt(0) < 0x5B) {
			sub = name;
			name = parts.pop();
			if(sub == name) sub = null;
		}
		return {
			name: name,
			pack: parts,
			params: params == null ? [] : params,
			sub: sub
		};
	}
}

typedef Item = {
	comment:String,
	meta:Meta,
	name:String,
	kind:String,
	description:String,
	preserveName:Bool,
	tags:Array<Tag>,
	longname:String,
	scope:String,
	?isEnum:Bool,
	?memberof:String,
	?type:JsType,
	?params:Array<Param>,
	?returns:Array<Return>,
	?augments:Array<String>,
	// ?implements:Array<String>,
}

typedef Meta = {
	var range:Array<Int>;
	var filename:String;
	var lineno:Int;
	var path:String;
	var code:Code;
}

typedef Code = {
}

typedef Tag = {
	var originalTitle:String;
	var title:String;
	var text:String;
}

typedef Param = {
	type:JsType,
	description:String,
	name:String,
	nullable:Bool,
	optional:Bool,
}

typedef Return = {
	type:JsType,
	nullable:Bool,
}

typedef JsType = {
	names:Array<String>,
}

package js.npm.fetch;

import haxe.extern.EitherType;

import js.Promise;

@:enum
abstract RedirectOption(String) {
  var Follow = 'follow';
  var Manual = 'manual';
  var Error = 'error';
}

typedef FetchOptions = {
	@:optional var method :String;
	@:optional var body :EitherType<String, js.node.stream.Readable.IReadable>;
	@:optional var headers :Dynamic<String>;
	@:optional var redirect :RedirectOption;
	@:optional var follow :Int;
	@:optional var timeout :Int;
	@:optional var compress :Bool;
	@:optional var size :Int;
	@:optional var agent :Dynamic;
}

#if nodejs
	@:jsRequire("node-fetch")
#else
	@:jsRequire("fetch")
#end
extern class Fetch
{
	@:selfCall
	public static function fetch(url :String, ?options :FetchOptions) :Promise<FetchResponse>;
}

extern class FetchResponse
{
	public function json() :Promise<Dynamic>;
	public function text() :Promise<String>;
#if nodejs
	public var body :js.node.stream.Readable.IReadable;
#else
	public var bodyUsed :Bool;
	public function blob() :Promise<js.html.Blob>;
	public function arrayBuffer() :Promise<js.html.ArrayBuffer>;
	public function formData() :Promise<js.html.FormData>;
#end
}
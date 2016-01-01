package js.node;

import js.Node;

@:native("Canvas")
extern class NodeCanvasElement
{
	var height : Int;
	var width : Int;
	function getContext( contextId : String ) : Dynamic;//NodeCanvasRenderingContext2D
	function toDataURL( ?type : String ) : String;
	public function createPNGStream() :NodeWriteStream;
	public function toBuffer() :NodeBuffer;

	public function new(width :Int, height :Int) : Void;

	private static function __init__() : Void untyped
	{
		var Canvas = untyped __js__("require('canvas')");
	}
}





package js.node;

import js.Node;

@:native("Image")
extern class NodeCanvasImage
{
	var src : NodeBuffer;
	var height : Int;
	var width : Int;
	public function new() : Void;

	private static function __init__() : Void untyped
	{
		try {
			var Image = untyped __js__("require('canvas')").Image;
		} catch (e :Dynamic) {}
	}

}





package js.npm.reactdnd;
/**
 * http://react-dnd.github.io/react-dnd/docs-overview.html
 */

import haxe.extern.EitherType;

import react.ReactComponent;

typedef XY={x:Float,y:Float};

typedef DragTargetType<T:String>=EitherType<T,EitherType<Void->EitherType<T,Array<T>>,Array<T>>>;

@:jsRequire('react-dnd')
extern class ReactDnD
{
	public static function DragSource<DragType :String, SourceProps, DraggedItemProps, CollectedProps>(type :DragTargetType<DragType>, spec: DragSourceSpec<SourceProps,DraggedItemProps>, collect :CollectDragSource<DraggedItemProps, CollectedProps>) :Class<ReactComponent>->Class<ReactComponent>;
	public static function DropTarget<DragType:String, SourceProps, DraggedItemProps, DropResult, CollectedProps>(type :DragTargetType<DragType>, spec: DropTargetSpec<DraggedItemProps, DropResult>, collect :CollectDropTarget<DraggedItemProps, DropResult, CollectedProps>) :Class<ReactComponent>->Class<ReactComponent>;
	public static function DragDropContext(contextClass :Class<Dynamic>) :Class<ReactComponent>->Class<ReactComponent>;
	public static function DragLayer<DraggedItemProps, CollectedProps>(collect :CollectDragLayer<DraggedItemProps, CollectedProps> ,?options :Dynamic) :Class<ReactComponent>->Class<ReactComponent>;
}

typedef DragSourceSpec<SourceProps,DraggedItemProps> =
{
	// DraggedItemProps is the minimal props
	function beginDrag(props :SourceProps, monitor :DragSourceMonitor<DraggedItemProps>, component :ReactComponent) :DraggedItemProps;
	@:optional function endDrag(props :SourceProps, monitor :DragSourceMonitor<DraggedItemProps>, component :ReactComponent) :Void;
	@:optional function canDrag(props :SourceProps, monitor :DragSourceMonitor<DraggedItemProps>) :Bool;
	@:optional function isDragging(props :SourceProps, monitor :DragSourceMonitor<DraggedItemProps>) :Bool;
}

//http://react-dnd.github.io/react-dnd/docs-drop-target.html
typedef DropTargetSpec<DraggedItemProps, DropResult> =
{
	/**
	 * If you return an object, it is going to become the drop result and
	 * will be available to the drag source in its endDrag method as
	 * monitor.getDropResult()
	 */
	@:optional function drop(props :DraggedItemProps, monitor :DropTargetMonitor<DraggedItemProps, DropResult>, component :Dynamic) :Null<Dynamic>;
	@:optional function hover(props :DraggedItemProps, monitor :DropTargetMonitor<DraggedItemProps, DropResult>, component :Dynamic) :Void;
	@:optional function canDrop(props :DraggedItemProps, monitor :DropTargetMonitor<DraggedItemProps, DropResult>) :Bool;
}

typedef DragSourceMonitor<DraggedItemProps> = {
	function canDrag() :Bool;
	function isDragging() :Bool;
	function getItemType() :String;
	function getItem() :DraggedItemProps;
	function getDropResult() :Dynamic;
	function didDrop() :Bool;
	function getInitialClientOffset() :XY;
	function getInitialSourceClientOffset() :XY;
	function getClientOffset() :XY;
	function getDifferenceFromInitialOffset() :XY;
	function getSourceClientOffset() :XY;
}

typedef DropTargetMonitor<DraggedItemProps, DropResult> = {
	function canDrop() :Bool;
	function isOver(?opts :{ shallow: Bool }) :Bool;
	function getItemType() :String;
	function getItem() :DraggedItemProps;
	function getDropResult() :DropResult;
	function didDrop() :Bool;
	function getInitialClientOffset() :XY;
	function getInitialSourceClientOffset() :XY;
	function getClientOffset() :XY;
	function getDifferenceFromInitialOffset() :XY;
	function getSourceClientOffset() :XY;
}

typedef DragLayerMonitor<DraggedItemProps> = {
	function isDragging() :Bool;
	function getItemType() :String;
	function getItem() :DraggedItemProps;
	function getInitialClientOffset() :XY;
	function getInitialSourceClientOffset() :XY;
	function getClientOffset() :XY;
	function getDifferenceFromInitialOffset() :XY;
	function getSourceClientOffset() :XY;
}

typedef ElementOrNode=Dynamic;

typedef DragSourceConnector = {
	function dragSource() :ElementOrNode->?Dynamic->ReactElement;
	function dragPreview() :ElementOrNode->?Dynamic->ReactElement;
}

typedef DropTargetConnector = {
	function dropTarget() :ElementOrNode->?Dynamic->ReactElement;
}

/*
 * Specifies which props to inject into your component.
 * It should return a plain object of the props to inject into your component.
 */
typedef CollectDragSource<DraggedItemProps, CollectedProps> = DragSourceConnector->DragSourceMonitor<DraggedItemProps>->CollectedProps;
typedef CollectDropTarget<DraggedItemProps, DropResult, CollectedProps> = DropTargetConnector->DropTargetMonitor<DraggedItemProps,DropResult>->CollectedProps;
typedef CollectDragLayer<DraggedItemProps, CollectedProps> = DragLayerMonitor<DraggedItemProps>->CollectedProps;

@:jsRequire('react-dnd-html5-backend')
extern class HTML5Backend {}

@:jsRequire('react-dnd', 'DragDropContextProvider')
extern class DragDropContextProvider extends react.ReactComponent  { }

@:jsRequire('react-dnd', 'DragDropContext')
extern class DragDropContext extends react.ReactComponent  { }

package js.npm.moment;

@:jsRequire("moment")
extern class Moment
{
	@:selfCall public function new(?date :String, ?format :String);

	public function isValid() :Bool;
	public function format(format :String) :Moment;
	public function fromNow() :Moment;
	public function calendar() :Moment;
	public function startOf(format :String) :Moment;
	public function endOf(format :String) :Moment;
	public function add(count :Int, type :String) :Moment;
	public function subtract(count :Int, type :String) :Moment;

	public function toString() :String;
}
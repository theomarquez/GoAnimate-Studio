package com.jumpeye.flashEff2.presets
{
	import flash.display.Sprite;
	
	public class JFETP21 extends Sprite
	{
		 
		
		public function JFETP21()
		{
			super();
		}
		
		public static function fep(param1:Array) : Object
		{
			var _loc2_:* = undefined;
			var _loc3_:int = 0;
			var _loc6_:uint = 0;
			var _loc4_:Array = [];
			var _loc5_:uint = param1.length;
			var _loc7_:uint = 0;
			var _loc8_:uint = Math.ceil(_loc5_ / 2);
			_loc2_ = 0;
			while(_loc2_ < _loc5_)
			{
				_loc4_[_loc2_] = [];
				_loc7_ = _loc7_ + param1[_loc2_].length;
				_loc2_++;
			}
			var _loc9_:uint = _loc7_;
			_loc2_ = 0;
			while(_loc2_ < _loc8_)
			{
				_loc6_ = param1[_loc2_].length;
				_loc3_ = _loc2_;
				while(_loc3_ <= _loc5_ - _loc2_ - 2)
				{
					_loc6_ = param1[_loc3_].length;
					if(_loc2_ < _loc6_)
					{
						if(isNaN(_loc4_[_loc3_][_loc2_]))
						{
							_loc7_--;
							_loc4_[_loc3_][_loc2_] = _loc7_;
						}
					}
					_loc3_++;
				}
				_loc6_ = param1[_loc5_ - _loc2_ - 1].length;
				_loc3_ = _loc2_;
				while(_loc3_ <= _loc6_ - _loc2_ - 1)
				{
					_loc6_ = param1[_loc5_ - _loc2_ - 1].length;
					if(isNaN(_loc4_[_loc5_ - _loc2_ - 1][_loc3_]))
					{
						_loc7_--;
						_loc4_[_loc5_ - _loc2_ - 1][_loc3_] = _loc7_;
					}
					_loc3_++;
				}
				_loc3_ = _loc5_ - _loc2_ - 2;
				while(_loc3_ > _loc2_)
				{
					_loc6_ = param1[_loc3_].length;
					if(_loc6_ - _loc2_ - 1 > _loc2_)
					{
						if(isNaN(_loc4_[_loc3_][_loc6_ - _loc2_ - 1]))
						{
							_loc7_--;
							_loc4_[_loc3_][_loc6_ - _loc2_ - 1] = _loc7_;
						}
					}
					_loc3_--;
				}
				_loc6_ = param1[_loc2_].length;
				if(_loc2_ < _loc5_ - _loc2_ - 1)
				{
					_loc3_ = _loc6_ - _loc2_ - 1;
					while(_loc3_ > _loc2_)
					{
						if(isNaN(_loc4_[_loc2_][_loc3_]))
						{
							_loc7_--;
							_loc4_[_loc2_][_loc3_] = _loc7_;
						}
						_loc3_--;
					}
				}
				_loc2_++;
			}
			return {
				"maxItems":_loc9_,
				"timeMatrix":_loc4_
			};
		}
	}
}

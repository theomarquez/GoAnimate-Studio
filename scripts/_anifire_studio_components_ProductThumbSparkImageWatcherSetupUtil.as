package
{
	import anifire.studio.components.ProductThumbSparkImage;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;
	
	public class _anifire_studio_components_ProductThumbSparkImageWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _anifire_studio_components_ProductThumbSparkImageWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			ProductThumbSparkImage.watcherSetupUtil = new _anifire_studio_components_ProductThumbSparkImageWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[0] = new PropertyWatcher("maskRect",{"propertyChange":true},[param4[0]],param2);
			param5[1] = new PropertyWatcher("displayObject",{"propertyChange":true},[param4[0]],null);
			param5[0].updateParent(param1);
			param5[0].addChild(param5[1]);
		}
	}
}

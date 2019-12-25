package
{
	import anifire.studio.components.UploadFontMenuItemRenderer;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;
	
	public class _anifire_studio_components_UploadFontMenuItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _anifire_studio_components_UploadFontMenuItemRendererWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			UploadFontMenuItemRenderer.watcherSetupUtil = new _anifire_studio_components_UploadFontMenuItemRendererWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[0] = new PropertyWatcher("model",{"propertyChange":true},[param4[0],param4[1],param4[2]],param2);
			param5[2] = new PropertyWatcher("icon",{"propertyChange":true},[param4[2]],null);
			param5[1] = new PropertyWatcher("enabled",{"propertyChange":true},[param4[0],param4[1]],null);
			param5[0].updateParent(param1);
			param5[0].addChild(param5[2]);
			param5[0].addChild(param5[1]);
		}
	}
}

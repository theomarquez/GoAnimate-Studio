package
{
	import anifire.studio.components.SceneThumbnailChooser;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	
	public class _anifire_studio_components_SceneThumbnailChooserWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _anifire_studio_components_SceneThumbnailChooserWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			SceneThumbnailChooser.watcherSetupUtil = new _anifire_studio_components_SceneThumbnailChooserWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
		}
	}
}

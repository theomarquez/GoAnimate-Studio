package
{
	import anifire.studio.components.StageControlPanel;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	
	public class _anifire_studio_components_StageControlPanelWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _anifire_studio_components_StageControlPanelWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			StageControlPanel.watcherSetupUtil = new _anifire_studio_components_StageControlPanelWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
		}
	}
}

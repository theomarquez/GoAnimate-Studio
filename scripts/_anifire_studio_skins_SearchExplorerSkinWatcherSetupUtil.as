package
{
	import anifire.studio.skins.SearchExplorerSkin;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;
	
	public class _anifire_studio_skins_SearchExplorerSkinWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _anifire_studio_skins_SearchExplorerSkinWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			SearchExplorerSkin.watcherSetupUtil = new _anifire_studio_skins_SearchExplorerSkinWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1]],param2);
			param5[1] = new PropertyWatcher("selectedCollection",{"propertyChange":true},[param4[0],param4[1]],null);
			param5[4] = new PropertyWatcher("emptyMessage",{"propertyChange":true},[param4[1]],null);
			param5[2] = new PropertyWatcher("length",{"collectionChange":true},[param4[0]],null);
			param5[3] = new PropertyWatcher("emptyPrompt",{"propertyChange":true},[param4[1]],null);
			param5[0].updateParent(param1);
			param5[0].addChild(param5[1]);
			param5[1].addChild(param5[4]);
			param5[1].addChild(param5[2]);
			param5[0].addChild(param5[3]);
		}
	}
}

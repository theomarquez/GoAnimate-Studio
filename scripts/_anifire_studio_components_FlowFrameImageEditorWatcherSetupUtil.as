package
{
	import anifire.studio.components.FlowFrameImageEditor;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;
	
	public class _anifire_studio_components_FlowFrameImageEditorWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _anifire_studio_components_FlowFrameImageEditorWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			FlowFrameImageEditor.watcherSetupUtil = new _anifire_studio_components_FlowFrameImageEditorWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[1] = new PropertyWatcher("maskLayer",{"propertyChange":true},[param4[2]],param2);
			param5[1].updateParent(param1);
		}
	}
}

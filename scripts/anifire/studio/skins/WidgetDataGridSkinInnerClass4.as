package anifire.studio.skins
{
	import mx.core.IFlexModuleFactory;
	import mx.events.PropertyChangeEvent;
	import spark.skins.spark.DefaultGridHeaderRenderer;
	
	public class WidgetDataGridSkinInnerClass4 extends DefaultGridHeaderRenderer
	{
		 
		
		private var _88844982outerDocument:WidgetDataGridSkin;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		public function WidgetDataGridSkinInnerClass4()
		{
			super();
			mx_internal::_document = this;
		}
		
		override public function set moduleFactory(param1:IFlexModuleFactory) : void
		{
			super.moduleFactory = param1;
			if(this.__moduleFactoryInitialized)
			{
				return;
			}
			this.__moduleFactoryInitialized = true;
		}
		
		override public function initialize() : void
		{
			super.initialize();
		}
		
		[Bindable(event="propertyChange")]
		public function get outerDocument() : WidgetDataGridSkin
		{
			return this._88844982outerDocument;
		}
		
		public function set outerDocument(param1:WidgetDataGridSkin) : void
		{
			var _loc2_:Object = this._88844982outerDocument;
			if(_loc2_ !== param1)
			{
				this._88844982outerDocument = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
				}
			}
		}
	}
}

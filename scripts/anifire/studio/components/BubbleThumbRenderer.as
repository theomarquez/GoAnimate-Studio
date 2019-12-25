package anifire.studio.components
{
	import anifire.constant.ResponseConstants;
	import anifire.constant.ServerConstants;
	import anifire.managers.AppConfigManager;
	import anifire.studio.core.BubbleThumb;
	import anifire.studio.core.Console;
	import anifire.studio.core.Thumb;
	import anifire.studio.managers.SharedAssetManager;
	import anifire.studio.managers.UserAssetManager;
	import anifire.studio.models.ThumbModel;
	import anifire.util.ApiRequest;
	import anifire.util.FontManager;
	import anifire.util.UtilDict;
	import anifire.util.UtilSite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLStream;
	import flash.net.URLVariables;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.DragSource;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import mx.utils.StringUtil;
	import spark.components.HGroup;
	import spark.events.PopUpEvent;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class BubbleThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _BubbleThumbRenderer_Rect1:Rect;
		
		private var _818490127_BubbleThumbRenderer_SolidColorStroke2:SolidColorStroke;
		
		private var _1781625235buttonGroup:HGroup;
		
		private var _1245745987deleteButton:IconButton;
		
		private var _2024940825imageDisplay:BubbleThumbSparkImage;
		
		private var _1302741632infoButton:IconButton;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _model:ThumbModel;
		
		protected var _dataSource:BubbleThumb;
		
		protected var _1692934083_editable:Boolean;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function BubbleThumbRenderer()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._BubbleThumbRenderer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_BubbleThumbRendererWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return BubbleThumbRenderer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 70;
			this.height = 70;
			this.buttonMode = true;
			this.mxmlContent = [this._BubbleThumbRenderer_BubbleThumbSparkImage1_i(),this._BubbleThumbRenderer_Rect2_c()];
			this.currentState = "normal";
			var _BubbleThumbRenderer_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._BubbleThumbRenderer_HGroup1_i);
			var _BubbleThumbRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._BubbleThumbRenderer_Rect1_i);
			states = [new State({
				"name":"normal",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_BubbleThumbRenderer_SolidColorStroke2",
					"name":"alpha",
					"value":0
				})]
			}),new State({
				"name":"hovered",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_BubbleThumbRenderer_HGroup1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["imageDisplay"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_BubbleThumbRenderer_Rect1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["imageDisplay"]
				})]
			}),new State({
				"name":"dragging",
				"overrides":[]
			})];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			BubbleThumbRenderer._watcherSetupUtil = param1;
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
		
		override public function set data(param1:Object) : void
		{
			super.data = param1;
			this._model = data as ThumbModel;
			if(this._model)
			{
				this._dataSource = this._model.thumb as BubbleThumb;
				this._editable = this._model.editable;
			}
			else
			{
				this._dataSource = null;
				this._editable = false;
			}
			if(this._dataSource)
			{
				this.updateThumbData();
			}
			this.imageDisplay.model = this._model;
		}
		
		protected function updateThumbData() : void
		{
			_toolTipContent = "";
			if(this._dataSource.name)
			{
				_toolTipContent = this._dataSource.name;
			}
			if(this._dataSource.isWhiteboardAsset)
			{
				_toolTipContent = _toolTipContent + ("\n" + UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"with handwritten motion"));
			}
		}
		
		override protected function createDragProxy() : IFlexDisplayObject
		{
			var _loc1_:BubbleThumbRenderer = new BubbleThumbRenderer();
			_loc1_.dragging = true;
			_loc1_.data = this._model;
			return _loc1_;
		}
		
		override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
		{
			var _loc3_:DragSource = new DragSource();
			_loc3_.addData(this._dataSource,Thumb.DRAG_DATA_FORMAT);
			return _loc3_;
		}
		
		override protected function shouldStartDrag(param1:MouseEvent) : Boolean
		{
			return true;
		}
		
		protected function infoButton_mouseDownHandler(param1:MouseEvent) : void
		{
			this.showInfoDialog();
		}
		
		protected function deleteButton_mouseDownHandler(param1:MouseEvent) : void
		{
			this.showDeleteDialog();
		}
		
		protected function showInfoDialog() : void
		{
			var _loc1_:EditAssetPopUp = new EditAssetPopUp();
			_loc1_.showPublishOptions = false;
			_loc1_.nameLabelEditable = false;
			_loc1_.thumb = this._dataSource;
			_loc1_.nameLabel = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"assetinfo_name");
			_loc1_.tagsLabel = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"assetinfo_tags");
			_loc1_.optionPrivateLabel = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"assetinfo_private");
			_loc1_.optionPublicLabel = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"assetinfo_public");
			_loc1_.confirmText = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"assetinfo_update");
			_loc1_.cancelText = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"assetinfo_cancel");
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmEdit);
			_loc1_.open(parentApplication as UIComponent,true);
		}
		
		protected function confirmEdit(param1:PopUpEvent) : void
		{
			var _loc2_:Object = null;
			if(param1.commit)
			{
				_loc2_ = param1.data;
				if(_loc2_)
				{
					this._dataSource.name = _loc2_["name"];
					this._dataSource.tags = _loc2_["tags"];
					this._dataSource.isPublished = _loc2_["published"];
					this._dataSource.sharingOptions = _loc2_["share"];
					UserAssetManager.instance.updateAsset(this._dataSource.aid,this._dataSource.encAssetId,this._dataSource.name,this._dataSource.tags,this._dataSource.isPublished,this._dataSource.sharingOptions);
				}
			}
		}
		
		protected function showDeleteDialog() : void
		{
			var _loc1_:ConfirmPopUp = new ConfirmPopUp();
			if(Console.getConsole().thumbTray.isInTeamTheme())
			{
				_loc1_.title = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET,LABEL_TYPE_FONT));
				_loc1_.message = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET_MESSAGE,LABEL_TYPE_FONT));
			}
			else
			{
				_loc1_.title = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"Delete font");
				_loc1_.message = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"You will not be able to use this font any more!");
			}
			_loc1_.confirmText = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"goalert_delete");
			_loc1_.cancelText = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"goalert_cancel");
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmDelete);
			_loc1_.open(parentApplication as UIComponent,true);
		}
		
		protected function confirmDelete(param1:PopUpEvent) : void
		{
			if(param1.commit)
			{
				this.deleteThumbnail();
			}
		}
		
		protected function deleteThumbnail() : void
		{
			var _loc2_:Object = null;
			var _loc3_:ApiRequest = null;
			var _loc4_:URLVariables = null;
			var _loc5_:Object = null;
			var _loc6_:URLRequest = null;
			var _loc7_:URLStream = null;
			if(UtilSite.isGoAnimate)
			{
				_loc2_ = {};
				_loc2_[ResponseConstants.ID] = this._dataSource.encAssetId;
				_loc3_ = new ApiRequest();
				_loc3_.post(ServerConstants.ACTION_DELETE_ASSET_V2,_loc2_);
			}
			else
			{
				_loc4_ = AppConfigManager.instance.createURLVariables();
				_loc5_ = FontManager.CUSTOM_FONT_ID_REGEXP.exec(this._dataSource.id);
				if(_loc5_)
				{
					_loc4_["assetId"] = _loc5_[1];
					_loc6_ = new URLRequest(ServerConstants.ACTION_DELETE_ASSET);
					_loc6_.method = URLRequestMethod.POST;
					_loc6_.data = _loc4_;
					_loc7_ = new URLStream();
					_loc7_.load(_loc6_);
				}
			}
			var _loc1_:String = this._dataSource.id;
			UserAssetManager.instance.removeBubbleByAssetId(_loc1_);
			SharedAssetManager.adminTeamInstance.removeBubbleByAssetId(_loc1_);
		}
		
		private function _BubbleThumbRenderer_BubbleThumbSparkImage1_i() : BubbleThumbSparkImage
		{
			var _loc1_:BubbleThumbSparkImage = new BubbleThumbSparkImage();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.id = "imageDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.imageDisplay = _loc1_;
			BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
			return _loc1_;
		}
		
		private function _BubbleThumbRenderer_Rect1_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._BubbleThumbRenderer_SolidColorStroke1_c();
			_loc1_.initialized(this,"_BubbleThumbRenderer_Rect1");
			this._BubbleThumbRenderer_Rect1 = _loc1_;
			BindingManager.executeBindings(this,"_BubbleThumbRenderer_Rect1",this._BubbleThumbRenderer_Rect1);
			return _loc1_;
		}
		
		private function _BubbleThumbRenderer_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 5093288;
			return _loc1_;
		}
		
		private function _BubbleThumbRenderer_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.left = 1;
			_loc1_.top = 1;
			_loc1_.paddingLeft = 2;
			_loc1_.paddingTop = 2;
			_loc1_.gap = 2;
			_loc1_.mxmlContent = [this._BubbleThumbRenderer_IconButton1_i(),this._BubbleThumbRenderer_IconButton2_i()];
			_loc1_.id = "buttonGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.buttonGroup = _loc1_;
			BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
			return _loc1_;
		}
		
		private function _BubbleThumbRenderer_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.styleName = "infoSmall";
			_loc1_.addEventListener("mouseDown",this.__infoButton_mouseDown);
			_loc1_.id = "infoButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.infoButton = _loc1_;
			BindingManager.executeBindings(this,"infoButton",this.infoButton);
			return _loc1_;
		}
		
		public function __infoButton_mouseDown(param1:MouseEvent) : void
		{
			this.infoButton_mouseDownHandler(param1);
		}
		
		private function _BubbleThumbRenderer_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.styleName = "deleteSmall";
			_loc1_.addEventListener("mouseDown",this.__deleteButton_mouseDown);
			_loc1_.id = "deleteButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.deleteButton = _loc1_;
			BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
			return _loc1_;
		}
		
		public function __deleteButton_mouseDown(param1:MouseEvent) : void
		{
			this.deleteButton_mouseDownHandler(param1);
		}
		
		private function _BubbleThumbRenderer_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._BubbleThumbRenderer_SolidColorStroke2_i();
			_loc1_.fill = this._BubbleThumbRenderer_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _BubbleThumbRenderer_SolidColorStroke2_i() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 5093288;
			this._BubbleThumbRenderer_SolidColorStroke2 = _loc1_;
			BindingManager.executeBindings(this,"_BubbleThumbRenderer_SolidColorStroke2",this._BubbleThumbRenderer_SolidColorStroke2);
			return _loc1_;
		}
		
		private function _BubbleThumbRenderer_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _BubbleThumbRenderer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Boolean
			{
				return _editable;
			},null,"buttonGroup.visible");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _BubbleThumbRenderer_SolidColorStroke2() : SolidColorStroke
		{
			return this._818490127_BubbleThumbRenderer_SolidColorStroke2;
		}
		
		public function set _BubbleThumbRenderer_SolidColorStroke2(param1:SolidColorStroke) : void
		{
			var _loc2_:Object = this._818490127_BubbleThumbRenderer_SolidColorStroke2;
			if(_loc2_ !== param1)
			{
				this._818490127_BubbleThumbRenderer_SolidColorStroke2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BubbleThumbRenderer_SolidColorStroke2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get buttonGroup() : HGroup
		{
			return this._1781625235buttonGroup;
		}
		
		public function set buttonGroup(param1:HGroup) : void
		{
			var _loc2_:Object = this._1781625235buttonGroup;
			if(_loc2_ !== param1)
			{
				this._1781625235buttonGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get deleteButton() : IconButton
		{
			return this._1245745987deleteButton;
		}
		
		public function set deleteButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._1245745987deleteButton;
			if(_loc2_ !== param1)
			{
				this._1245745987deleteButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deleteButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get imageDisplay() : BubbleThumbSparkImage
		{
			return this._2024940825imageDisplay;
		}
		
		public function set imageDisplay(param1:BubbleThumbSparkImage) : void
		{
			var _loc2_:Object = this._2024940825imageDisplay;
			if(_loc2_ !== param1)
			{
				this._2024940825imageDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get infoButton() : IconButton
		{
			return this._1302741632infoButton;
		}
		
		public function set infoButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._1302741632infoButton;
			if(_loc2_ !== param1)
			{
				this._1302741632infoButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _editable() : Boolean
		{
			return this._1692934083_editable;
		}
		
		protected function set _editable(param1:Boolean) : void
		{
			var _loc2_:Object = this._1692934083_editable;
			if(_loc2_ !== param1)
			{
				this._1692934083_editable = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_editable",_loc2_,param1));
				}
			}
		}
	}
}

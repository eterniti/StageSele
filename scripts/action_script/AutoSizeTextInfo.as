package action_script
{
   import flash.text.TextField;
   
   public class AutoSizeTextInfo
   {
       
      
      public var default_initialized:Boolean;
      
      public var default_align:String;
      
      public var default_width:Number;
      
      public var default_height:Number;
      
      public var default_x:Number;
      
      public var default_y:Number;
      
      public var default_scale_x:Number;
      
      public var default_scale_y:Number;
      
      public function AutoSizeTextInfo()
      {
         super();
         this.default_initialized = false;
      }
      
      public function Initialize(param1:TextField) : *
      {
         if(this.default_initialized)
         {
            return;
         }
         this.default_initialized = true;
         this.default_align = param1.getTextFormat().align;
         this.default_width = param1.width;
         this.default_height = param1.height;
         this.default_x = param1.x;
         this.default_y = param1.y;
         this.default_scale_x = param1.scaleX;
         this.default_scale_y = param1.scaleY;
      }
   }
}

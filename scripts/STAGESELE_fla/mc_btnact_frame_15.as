package STAGESELE_fla
{
   import flash.display.MovieClip;
   
   public dynamic class mc_btnact_frame_15 extends MovieClip
   {
       
      
      public var stage_frame_off:MovieClip;
      
      public function mc_btnact_frame_15()
      {
         super();
         addFrameScript(8,this.frame9,58,this.frame59);
      }
      
      function frame9() : *
      {
         stop();
      }
      
      function frame59() : *
      {
         gotoAndPlay("on");
      }
   }
}

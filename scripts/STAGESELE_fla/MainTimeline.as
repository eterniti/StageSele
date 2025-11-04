package STAGESELE_fla
{
   import action_script.StageSele;
   import action_script.Test;
   import flash.display.MovieClip;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var cmn_m_frame:MovieClip;
      
      public var select_sel:MovieClip;
      
      public var stage_arw:MovieClip;
      
      public var stage_img:MovieClip;
      
      public var stage_new:MovieClip;
      
      public var stage_select:MovieClip;
      
      public var timer:MovieClip;
      
      public var m_main:StageSele;
	  
	  //////////
	  public var aaaa1:_CMN_M_frame_20
	  public var aaaa2:mc_arw_l_31
	  public var aaaa3:mc_arw_r_34
	  public var aaaa4:mc_btnact_frame_15
	  public var aaaa5:mc_btnact_stagesel2_39
	  public var aaaa6:mc_btnact_stagesel_3
	  public var aaaa7:mc_inact_stage_9
	  public var aaaa8:mc_inact_stageimage_11
	  public var aaaa9:mc_select2_40
	  public var aaaa10:mc_select_23
	  public var aaaa11:mc_stage_arrow_29
	  public var aaaa12:mc_stage_icn_set2_38
	  public var aaaa13:mc_stage_icn_set_2
	  public var aaaa14:mc_stage_new2_41
	  public var aaaa15:mc_stage_new_26
	  public var aaaa16:mc_stage_select2_37
	  public var aaaa17:mc_stage_select_1
	  public var aaaa18:mc_timer_35
	  public var aaaa19:po_icn_stage_new_27
	  //////////
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         this.m_main = null;
         if(!this.m_main)
         {
            this.m_main = new StageSele();
         }
         this.m_main.Initialize(this);
         stop();
         stop();
         Test.Run(this,this.m_main);
      }
   }
}

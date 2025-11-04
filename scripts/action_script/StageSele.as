package action_script
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   
   public class StageSele
   {
      
      private static const StageFrameNum:int = 37;
      
      private static const ImageFrameInvalid:int = StageFrameNum + 1;
      
      private static const StartSelectIndex:int = 0;
      
      private static const StageID_LBY:int = 0;
      
      private static const StageID_BFlbb:int = 1;
      
      private static const StageID_BFlby:int = 2;
      
      private static const StageID_BFpln:int = 3;
      
      private static const StageID_BFrck:int = 4;
      
      private static const StageID_BFrcn:int = 5;
      
      private static const StageID_BFnmc:int = 6;
      
      private static const StageID_BFnms:int = 7;
      
      private static const StageID_BFnmb:int = 8;
      
      private static const StageID_BFtwc:int = 9;
      
      private static const StageID_BFtwn:int = 10;
      
      private static const StageID_BFtwh:int = 11;
      
      private static const StageID_BFcel:int = 12;
      
      private static const StageID_BFceb:int = 13;
      
      private static const StageID_BFkoh:int = 14;
      
      private static const StageID_BFsin:int = 15;
      
      private static const StageID_BFsky:int = 16;
      
      private static const StageID_BFsei:int = 17;
      
      private static const StageID_BFkai:int = 18;
      
      private static const StageID_BFspe:int = 19;
      
      private static const StageID_BFspv:int = 20;
      
      private static const StageID_BFice:int = 21;
      
      private static const StageID_BFtfl:int = 22;
      
      private static const StageID_BFgen:int = 23;
      
      private static const StageID_BFten:int = 24;
      
      private static const StageID_BFund:int = 25;
      
      private static const StageID_DMtwh:int = 26;
      
      private static const StageID_BFlnd:int = 27;
      
      private static const StageID_BFlnc:int = 28;
      
      private static const StageID_BFhel:int = 29;
      
      private static const StageID_BFtre:int = 30;
      
      private static const StageID_BFtok:int = 31;
      
      private static const StageID_BFsmt:int = 32;
      
      private static const StageID_BFtwf:int = 33;
      
      private static const StageID_BFpot:int = 34;
      
      private static const StageID_BFvol:int = 35;
      
      private static const StageID_BFrrg:int = 36;
      
      private static const StageID_BFlbh:int = 37;
      
      public static const StageIDNum:int = 38;
      
      private static const StageIDInvlaid:int = -1;
      
      private static const IndexNumRow:int = 3;
      
      private static const IndexNumColumn_All:int = 9;
      
      private static const IndexNumColumn_Local:int = 4;
      
      private static const NewIconMax1:int = 33;
      
      private static const NewIconMax2:int = 12;
      
      private static const kGotoSelectedStatusTime:int = 2000;
	  
	  //////////
	  // Commenting things that will go unused now
      
      //private static const StageIdTable:Array = [StageID_BFten,StageID_BFsei,StageID_BFkoh,StageID_BFpln,StageID_BFrck,StageID_BFrcn,StageID_BFnmc,StageID_BFnmb,StageID_BFtre,StageID_BFlnd,StageID_BFcel,StageID_BFceb,StageID_BFtwh,StageID_BFtwn,StageID_BFtwc,StageID_DMtwh,StageID_BFsin,StageID_BFsky,StageID_BFlnc,StageID_BFhel,StageID_BFkai,StageID_BFspe,StageID_BFspv,StageID_BFund,StageID_BFice,StageID_BFtfl,StageID_BFgen,StageID_BFtok];
      
      //private static const StageIdTable_DLC2:Array = [StageID_BFsmt];
      
      //private static const StageIdTable_DLC4:Array = [StageID_BFtwf];
      
      //private static const StageIdTable_DLC8:Array = [StageID_BFpot];
      
      //private static const StageIdTable_DLC13:Array = [StageID_BFvol];
      
      //private static const StageIdTable_DLC16:Array = [StageID_BFrrg];
      
      //private static const StageIdTable_DLC21:Array = [StageID_BFlbh];
      
      private static const StageIdInfo:Array = [ImageFrameInvalid,ImageFrameInvalid,1,2,3,4,5,7,6,10,11,12,8,9,13,15,14,16,17,19,20,21,22,23,24,18,26,25,27,28,30,29,31,32,33,34,35,36];
      
      //private static const LocalBattle_StageIdTable:Array = [StageID_BFten,StageID_BFnmc,StageID_BFsei,StageID_BFcel,StageID_DMtwh,StageID_BFkai,StageID_BFtfl];
      
      //private static const LocalBattle_StageIdTable_DLC2:Array = [StageID_BFsmt];
      
      //private static const LocalBattle_StageIdTable_DLC8:Array = [StageID_BFpot];
      
      //private static const LocalBattle_StageIdTable_DLC16:Array = [StageID_BFrrg];
      
      //private static const LocalBattle_StageIdTable_DLC21:Array = [StageID_BFlbh];
	  //////////
      
      private static const StageNameInvalid:String = "???";
      
      public static const ReceiveTypeFlagCancel:int = 0;
      
      public static const ReceiveTypeMode:int = 1;
      
      public static const ReceiveTypeStageStrStart:int = ReceiveTypeMode + 1;
      
      public static const ReceiveTypeStageStrEnd:int = ReceiveTypeStageStrStart + StageIDNum - 1;
      
      public static const ReceiveTypeStageUnlockStart:int = ReceiveTypeStageStrEnd + 1;
      
      public static const ReceiveTypeStageUnlockEnd:int = ReceiveTypeStageUnlockStart + StageIDNum - 1;
      
      public static const ReceiveTypeImageStrStart:int = ReceiveTypeStageUnlockEnd + 1;
      
      public static const ReceiveTypeImageStrEnd:int = ReceiveTypeImageStrStart + StageIDNum - 1;
      
      public static const ReceiveTypeSelectedStart:int = ReceiveTypeImageStrEnd + 1;
      
      public static const ReceiveTypeSelectedEnd:int = ReceiveTypeSelectedStart + StageIDNum - 1;
      
      public static const ReceiveTypeTime:int = ReceiveTypeSelectedEnd + 1;
      
      public static const ReceiveTypeFlagExit:int = ReceiveTypeTime + 1;
      
      public static const ReceiveType_DlcFlag_1:int = ReceiveTypeFlagExit + 1;
      
      public static const ReceiveType_DlcFlag_2:int = ReceiveType_DlcFlag_1 + 1;
      
      public static const ReceiveType_DlcFlag_3:int = ReceiveType_DlcFlag_2 + 1;
      
      public static const ReceiveType_DlcFlag_4:int = ReceiveType_DlcFlag_3 + 1;
      
      public static const ReceiveType_DlcFlag_8:int = ReceiveType_DlcFlag_4 + 1;
      
      public static const ReceiveType_DlcFlag_13:int = ReceiveType_DlcFlag_8 + 1;
      
      public static const ReceiveType_DlcFlag_16:int = ReceiveType_DlcFlag_13 + 1;
      
      public static const ReceiveType_DlcFlag_21:int = ReceiveType_DlcFlag_16 + 1;
      
      public static const ReceiveTypeNum:int = ReceiveType_DlcFlag_21 + 1;
      
      private static const SendType_DecideTime:int = 0;
      
      private static const SendType_SelectedStage:int = 1;
      
      private static const SendType_CountDownSe:int = 2;
      
      private static const SendType_EnableOptionBGM:int = 3;
       
      
      private var m_callback:Callback = null;
      
      private var m_timer:CountDownTimer = null;
      
      private var m_timeline:MovieClip = null;
      
      private var m_select_index:int;
      
      private var m_stage_image:Array;
      
      private var m_stage_table:Array;
      
      private var m_selected_stage:Array;
      
      private var m_unlock_flag:Array;
      
      private var m_select_timer:int;
      
      private var m_start_time:int;
      
      private var m_index_num_column:int;
      
      private var m_stage_num_column:int;
      
      private var m_pre_time:int;
      
      private var m_start:int;
      
      private var m_new_icon_max:int;
      
      private var m_mode_type:int;
      
      private var m_select_row:int;
      
      private var m_select_column:int;
      
      private var m_select_column_start:int;
      
      private var m_flag_next:Boolean;
      
      private var m_flag_change_l:Boolean;
	  
	  //////////
	  //private static const XV2P_TestString:String = "[24,0][17,0][14,0][3,0][4,0][5,0][6,0][8,0][30,0][27,0][12,0][13,0][11,0][10,0][9,0][26,0][15,0][16,0][28,0][29,0][18,0][19,0][20,0][25,0][21,0][22,0][23,0][31,0][32,2][33,4][34,8]";
	  //private static const XV2P_TestStringLocal:String = "[24,0][6,0][17,0][12,0][26,0][18,0][22,0][32,2][34,8]";	

	  private var SSNum:int = 0;
	   
	  private var all_stages:Array = null;
	  private var all_local_stages:Array = null;
	  private var my_stages:Array = null;
	  
	  //private var start_index:int = 0; // Won't need in 1.25.1 RETROSPECTIVE COMMENT
	  private var first_run:Boolean = true;
	  
	  private var local_original_mode:Boolean = false;
	  
	  private var last_selection:int = -1;
	  //private var saved_rnd_selection:int = -1; // Won't need in 1.25.1 RETROSPECTIVE COMMENT
	  //////////
	  
	  //////////
	  private function GetStages(local:Boolean, stages:Array) : void
	  {
		  //var SlotsString:String = (local) ? XV2P_TestStringLocal : XV2P_TestString;
		  var SlotsString:String = (local) ? XV2Patcher.GetLocalStagesSlotsData() : XV2Patcher.GetStagesSlotsData();
		  var i:int = 0;
		 		  
		  while (i < SlotsString.length)
		  {
		     var has_dlc:int = 1;
			 
			 if (SlotsString.substr(i, 1) != "[")
			 {
				trace("Format error 1\n");
				return;
			 }
			 
			 i++;
			 
			 var pos:int = SlotsString.indexOf("]", i);
			 if (pos == -1)
			 {
				trace("Format error 2\n");
				return;
			 }
			 
			 var stage:String = SlotsString.substring(i,pos);
			 var fields:Array = stage.split(",");
			 
			 if (fields.length != 2)
			 {
				trace("Invalid number of elements: " + fields.length);
				return;
			 }			 
			
			 var dlc:int = int(fields[1]);
			 
			 if (dlc == 2)
			 {
				has_dlc = m_callback.GetUserDataInt(ReceiveType_DlcFlag_2);
			 }
			 else if (dlc == 4)
			 {
				has_dlc = m_callback.GetUserDataInt(ReceiveType_DlcFlag_4);
			 }
			 else if (dlc == 8)
			 {
				has_dlc = m_callback.GetUserDataInt(ReceiveType_DlcFlag_8);
			 }
			 else if (dlc == 13)
			 {
				has_dlc = m_callback.GetUserDataInt(ReceiveType_DlcFlag_13);
			 }
			 else if (dlc == 16)
			 {
				has_dlc = m_callback.GetUserDataInt(ReceiveType_DlcFlag_16);
			 }
			 else if (dlc == 21)
			 {
				has_dlc = m_callback.GetUserDataInt(ReceiveType_DlcFlag_21);
			 }

			 if (has_dlc != 0)
			 {
				 stages.push(int(fields[0]));
			 }
			 
			 i = pos+1;
		  }
	  }
	  
	  private function setImage(mc:MovieClip, id:int) : void
      {
         var bm:Bitmap = null;
         var _loc5_:String = null;
         if(!mc)
         {
            return;
         }
		 
         while(mc.numChildren > 1)
         {
            mc.removeChildAt(mc.numChildren-1);
         } 
		 
		 //trace(mc.numChildren);
		 
		 if (id < StageIDNum) // Original stages get the icon data from the iggytex frame thing
			return;
			
		 if (id >= SSNum)
			return;
	   
	     bm = new Bitmap(null);
	     IggyFunctions.setTextureForBitmap(bm, XV2Patcher.GetStageIconString(id));		
		 
		 //trace("bm w/h = " + bm.width + "/" + bm.height);
		 //trace("mc w/h = " + mc.width + "/" + mc.height);
		 
		 // These numbers give the same exact aspect as original. Don't question the numbers!		 
		 bm.scaleX = 0.6666; // mc.width / bm.width;
		 bm.scaleY = 0.6666; // mc.height / bm.height;
		 
		 // For the record, 80/28 = 240/84 (icon size) = 150/52.5 (mc size)		 
		 bm.x -= 80;
		 bm.y -= 28;		 
           
         mc.addChild(bm);         
      }	  
	  //////////
      
      public function StageSele()
      {
         super();
         this.m_callback = new Callback(ReceiveTypeNum);
         this.m_timer = new CountDownTimer();
         this.m_timeline = null;
         this.m_select_index = 0;
         this.m_stage_image = null;
         this.m_selected_stage = null;
         this.m_unlock_flag = null;
         this.m_select_timer = 0;
         this.m_index_num_column = 0;
         this.m_stage_num_column = 0;
         this.m_pre_time = 99;
         this.m_start = 0;
         this.m_mode_type = 0;
         this.m_select_row = 0;
         this.m_select_column = 0;
         this.m_select_column_start = 0;
         this.m_flag_next = false;
         this.m_flag_change_l = false;
      }
      
      public function Initialize(param1:MovieClip) : void
      {
         this.m_timeline = param1;
         this.m_timeline.stage.addEventListener(Event.ENTER_FRAME,this.updatePhaseWaitStart);
         this.m_timeline.visible = false;
         this.m_timeline.cmn_m_frame.visible = false;
         this.m_timeline.stage_img.visible = false;
         this.m_timeline.stage_new.visible = false;
         this.m_timeline.stage_select.visible = false;
         this.m_timeline.stage_arw.visible = false;
         this.m_timeline.cmn_m_frame.stop();
         this.m_timeline.stage_img.stop();
         this.m_timeline.stage_select.stop();
         this.m_timer.Initialize(this.m_timeline.timer.nest._CMN_M_B_mc_timer,null);
         this.m_select_index = 0;
         this.m_stage_table = this.m_stage_table;
         this.m_flag_next = false;
      }
      
      private function updatePhaseWaitStart(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Boolean = false;
         _loc2_ = 0;
         while(ReceiveTypeNum > _loc2_)
         {
            _loc4_ = this.m_callback.GetUserDataValidFlag(_loc2_);
            if(!_loc4_)
            {
               return;
            }
            _loc2_++;
         }
		 
		 //////////	
		 if (first_run)
		 {
			 first_run = false;
			 SSNum = XV2Patcher.GetNumSsStages();
			 
			 all_stages = new Array();		 	
			 GetStages(false, all_stages);
			
			 all_local_stages = new Array();		 
			 GetStages(true, all_local_stages);	
		 }
		 //////////	
		 
         var _loc3_:int = 1;
         this.m_mode_type = this.m_callback.GetUserDataInt(ReceiveTypeMode);
		 //////////
		 // Replaced code
         /*if(this.m_mode_type == 1)
         {
            _loc3_ = 2;
         }*/
		 if(this.m_mode_type == 1)
		 {
			my_stages = all_local_stages;		
			local_original_mode = (my_stages.length >= 7 && my_stages.length <= 10);
		 }
		 else
		 {
		 	my_stages = all_stages;	
			local_original_mode = false;
		 }
		 if (local_original_mode)
		 {
			_loc3_ = 2;
		 }
		 //////////
         if(this.m_timeline.currentFrame != _loc3_)
         {
            this.m_timeline.gotoAndStop(_loc3_);
         }
         this.m_timeline.stage.removeEventListener(Event.ENTER_FRAME,this.updatePhaseWaitStart);
         this.m_timeline.stage.addEventListener(Event.ENTER_FRAME,this.updatePhaseInitStart);
      }
      
      private function updatePhaseInitStart(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc20_:Boolean = false;
         var _loc21_:int = 0;
         var _loc22_:Bitmap = null;
         var _loc23_:String = null;
         var _loc24_:int = 0;
         var _loc25_:MovieClip = null;
         var _loc26_:MovieClip = null;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:Boolean = false;
         var _loc30_:int = 0;
         var _loc31_:Boolean = false;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = 0;
         while(ReceiveTypeNum > _loc2_)
         {
            _loc20_ = this.m_callback.GetUserDataValidFlag(_loc2_);
            if(!_loc20_)
            {
               return;
            }
            _loc2_++;
         }
         this.m_timeline.stage_select.visible = false;
         this.m_timeline.stage_new.visible = false;
		 
         //////////switch(this.m_mode_type)
		 var mode:int = this.m_mode_type;
		 if (!local_original_mode)
			mode = 0;
		 switch (mode)
		 //////////
         {
            case 0:
               //////////this.m_stage_table = StageIdTable;
			   this.m_stage_table = my_stages;
			   //////////
               this.m_index_num_column = IndexNumColumn_All;
               _loc4_ = this.m_index_num_column + 1;
               this.m_new_icon_max = NewIconMax1;
               if(this.calcIconIndexColumn(StartSelectIndex) <= 0)
               {
                  this.m_timeline.stage_select["stage_icn_set0"].visible = false;
                  this.m_timeline.stage_new["stage_new_0"].visible = false;
                  this.m_timeline.stage_new["stage_new_1"].visible = false;
                  this.m_timeline.stage_new["stage_new_2"].visible = false;
               }
               break;
            case 1:
			   //////////this.m_stage_table = LocalBattle_StageIdTable;
			   this.m_stage_table = my_stages;
			   //////////
               this.m_index_num_column = IndexNumColumn_Local;
               _loc4_ = this.m_index_num_column;
               this.m_new_icon_max = NewIconMax2;
               break;
            default: // ???
			   //////////this.m_stage_table = StageIdTable;
			   this.m_stage_table = my_stages;
			   /////////
               this.m_index_num_column = IndexNumColumn_All;
               _loc4_ = this.m_index_num_column + 1;
               this.m_new_icon_max = NewIconMax1;
         }
		 //////////
		 // Replaced code
		 /*
         var _loc5_:int = this.m_callback.GetUserDataInt(ReceiveType_DlcFlag_1);
         var _loc6_:int = this.m_callback.GetUserDataInt(ReceiveType_DlcFlag_2);
         var _loc7_:int = this.m_callback.GetUserDataInt(ReceiveType_DlcFlag_3);
         var _loc8_:int = this.m_callback.GetUserDataInt(ReceiveType_DlcFlag_4);
         var _loc9_:int = this.m_callback.GetUserDataInt(ReceiveType_DlcFlag_8);
         var _loc10_:int = this.m_callback.GetUserDataInt(ReceiveType_DlcFlag_13);
         var _loc11_:int = this.m_callback.GetUserDataInt(ReceiveType_DlcFlag_16);
         var _loc12_:int = this.m_callback.GetUserDataInt(ReceiveType_DlcFlag_21);
         if(this.m_mode_type == 0)
         {
            if(_loc6_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(StageIdTable_DLC2);
            }
            if(_loc8_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(StageIdTable_DLC4);
            }
            if(_loc9_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(StageIdTable_DLC8);
            }
            if(_loc10_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(StageIdTable_DLC13);
            }
            if(_loc11_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(StageIdTable_DLC16);
            }
            if(_loc12_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(StageIdTable_DLC21);
            }
         }
         else if(this.m_mode_type == 1)
         {
            if(_loc6_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(LocalBattle_StageIdTable_DLC2);
            }
            if(_loc9_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(LocalBattle_StageIdTable_DLC8);
            }
            if(_loc11_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(LocalBattle_StageIdTable_DLC16);
            }
            if(_loc12_ == 1)
            {
               this.m_stage_table = this.m_stage_table.concat(LocalBattle_StageIdTable_DLC21);
            }
            if(this.m_stage_table.length < IndexNumRow * 3 + 1)
            {
               this.m_index_num_column = 3;
               _loc4_ = IndexNumColumn_Local;
            }
         }*/
		 if (local_original_mode && this.m_stage_table.length < IndexNumRow * 3 + 1)
		 {
			this.m_index_num_column = 3;
            _loc4_ = IndexNumColumn_Local;
		 }
         //////////		 
         var _loc13_:int = 0;
         _loc2_ = 0;
         while(this.m_stage_table.length > _loc2_)
         {
            _loc13_ = StartSelectIndex + _loc2_;
            _loc13_ = _loc13_ % this.m_stage_table.length;
            if(!this.checkUnlockStage(this.calcStageId(_loc13_)))
            {
               _loc2_++;
               continue;
            }
            this.m_select_index = _loc13_;
            break;
         }
         this.m_select_row = this.calcIconIndexRow(this.m_select_index);
         this.m_select_column = this.calcIconIndexColumn(this.m_select_index);
         this.m_stage_num_column = (this.m_stage_table.length - 1) / IndexNumRow + 1;
         this.m_timeline.cmn_m_frame.visible = true;
         this.m_timeline.stage_img.visible = true;
         this.m_timeline.stage_select.visible = false;
         this.m_timeline.cmn_m_frame.cmn_m_frame.gotoAndPlay("start");
         this.m_timeline.stage_img.gotoAndPlay("start");
		 //////////
         //this.m_stage_image = new Array(StageIDNum);
		  m_stage_image = new Array(SSNum);
		 ////////// 
         _loc2_ = 0;
         while(this.m_stage_table.length > _loc2_)
         {
            _loc21_ = this.calcStageId(_loc2_);
            if(_loc21_ != StageIDInvlaid)
            {
               _loc22_ = new Bitmap(null);
               //////////_loc23_ = this.m_callback.GetUserDataString(ReceiveTypeImageStrStart + _loc21_);
			   if (_loc21_ >= StageIDNum && _loc21_ < SSNum)
			   {
				   _loc23_ = XV2Patcher.GetStageImageString(_loc21_);
			   }
			   else
			   {
				   _loc23_ = m_callback.GetUserDataString(ReceiveTypeImageStrStart + _loc21_)
			   }
			   //////////
               IggyFunctions.setTextureForBitmap(_loc22_,_loc23_);
               _loc22_.scaleX = 1024 / _loc22_.width;
               _loc22_.scaleY = 256 / _loc22_.height;
               this.m_stage_image[_loc21_] = _loc22_;
            }
            _loc2_++;
         }
         //////////this.m_selected_stage = new Array(StageIDNum);
         //this.m_unlock_flag = new Array(StageIDNum);
		 m_selected_stage = new Array(SSNum);
		 m_unlock_flag = new Array(SSNum);
		 //////////
         _loc2_ = 0;
         //////////while(StageIDNum > _loc2_)
		 while(SSNum > _loc2_)
		 //////////
         {
            //////////_loc24_ = this.m_callback.GetUserDataInt(ReceiveTypeSelectedStart + _loc2_);
			if (_loc2_ >= StageIDNum)
			{
				_loc24_ = XV2Patcher.StageHasBeenSelectedBefore(_loc2_);
			}
			else
			{
				_loc24_ = m_callback.GetUserDataInt(ReceiveTypeSelectedStart + _loc2_);
			}
			//////////
            this.m_selected_stage[_loc2_] = _loc24_;
            this.m_unlock_flag[_loc2_] = false;
            _loc2_++;
         }
         var _loc14_:MovieClip = this.m_timeline.stage_new;
         var _loc15_:MovieClip = null;
         _loc2_ = 0;
         while(_loc2_ < this.m_new_icon_max)
         {
            _loc15_ = _loc14_["stage_new_" + _loc2_];
            _loc15_.visible = false;
            _loc2_++;
         }
         this.m_timeline.stage_new.gotoAndPlay("start");
         this.m_timeline.stage_new.visible = true;
         var _loc16_:MovieClip = this.m_timeline.stage_select;
         _loc3_ = 0;
         while(_loc4_ > _loc3_) // Loop changed in 1.25: Now uses _loc4 instead of m_index_num_column
         {
            //////////if(this.m_mode_type == 1)
			if(local_original_mode)
			//////////
            {
               _loc25_ = _loc16_["stage_icn_set" + _loc3_];
            }
            else
            {
               _loc25_ = _loc16_["stage_icn_set" + (_loc3_ + 1)];
            }
            _loc2_ = 0;
            while(IndexNumRow > _loc2_)
            {
               _loc26_ = _loc25_["nest_stage_sel" + (_loc2_ + 1)];
               _loc27_ = this.calcStageListIndex(_loc2_,_loc3_ + this.m_select_column_start);
               _loc28_ = this.calcStageId(_loc27_);
               _loc15_ = null;
               if(_loc28_ != StageIDInvlaid)
               {
                  _loc15_ = _loc14_["stage_new_" + (_loc27_ + IndexNumRow)];
               }
               if(_loc28_ == StageIDInvlaid)
               {
                  _loc26_.visible = false;
                  if(_loc15_)
                  {
                     _loc15_.visible = false;
                  }
               }
               else
               {
                  _loc29_ = false;
                  if(_loc28_ != StageIDInvlaid)
                  {
                     _loc32_ = this.m_stage_table[_loc27_];
                     _loc33_ = this.m_selected_stage[_loc32_];
                     if(this.m_selected_stage[this.m_stage_table[_loc27_]] == 1)
                     {
                        _loc29_ = false;
                     }
                     else
                     {
                        _loc29_ = true;
                     }
                  }
                  _loc30_ = this.getStageFrame(_loc32_);
                  _loc26_.btn_act.img_icon_frm.gotoAndStop(_loc30_);
				  //////////
				  setImage(_loc26_.btn_act, _loc28_);
				  //////////
                  _loc31_ = this.checkUnlockStage(_loc28_);
                  if(!_loc31_)
                  {
                     _loc26_.gotoAndStop("lock");
                     _loc29_ = false;
                  }
                  else
                  {
                     _loc26_.btn_act.img_icon_frm.gotoAndStop(_loc30_);
                     _loc26_.gotoAndStop("off");
                  }
                  if(_loc15_)
                  {
                     _loc15_.visible = _loc29_;
                     _loc34_ = !!_loc29_?1:0;
                     _loc35_ = this.m_stage_table[_loc27_];
                     this.m_unlock_flag[_loc35_] = _loc34_;
                  }
               }
               _loc2_++;
            }
            _loc3_++;
         }
		 
		 //////////
		 // RETROSPECTIVE COMMENT
		 // Before 1.25.1, we would put code to hide icons here. But this may not be needed now because there is no "restart"?
		 //////////
		 
         var _loc17_:MovieClip = this.m_timeline.stage_img;
         var _loc18_:int = this.calcStageId(this.m_select_index);
         _loc17_.sys_stagename.sys_stagename.autoSize = "left";
         _loc17_.sys_stagename.sys_stagename.wordWrap = false;
         _loc17_.sys_stagename.sys_stagename.htmlText = this.getStageName(_loc18_);
         var _loc19_:int = this.m_callback.GetUserDataInt(ReceiveTypeTime);
         if(_loc19_ < 0)
         {
            this.m_timeline.timer.visible = false;
         }
         else
         {
            this.m_timeline.timer.visible = true;
            this.m_timer.Start(_loc19_,this.cbFuncEndTimer);
         }
         this.m_start = 1;
         this.m_timeline.stage.removeEventListener(Event.ENTER_FRAME,this.updatePhaseInitStart);
         this.m_timeline.stage.addEventListener(Event.ENTER_FRAME,this.updatePhaseOpen);
      }
      
      private function updatePhaseOpen(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         this.m_timeline.visible = true;
         var _loc2_:MovieClip = this.m_timeline.stage_select;
         _loc2_.visible = true;
         this.m_timeline.stage_arw.visible = true;
         if(this.m_start == 1)
         {
            this.m_timeline.stage_select.gotoAndPlay("start");
            this.m_timeline.stage_new.gotoAndPlay("start");
            this.m_timeline.stage_arw.gotoAndPlay("start");
            if(this.m_stage_table.length > 13)
            {
               this.m_timeline.stage_new["stage_new_28"].visible = false;
               this.m_timeline.stage_new["stage_new_29"].visible = false;
            }
            _loc3_ = 0;
            //////////if(this.m_mode_type == 1)
			if(local_original_mode)
			//////////
            {
               _loc3_ = IndexNumColumn_Local * IndexNumRow;
            }
            else
            {
               _loc3_ = (this.m_index_num_column + 2) * IndexNumRow;
            }
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(this.m_timeline.stage_new["stage_new_" + _loc4_].visible)
               {
                  _loc5_ = this.m_stage_table[_loc4_];
                  _loc6_ = this.m_unlock_flag[_loc5_] == 1?true:false;
                  this.m_timeline.stage_new["stage_new_" + _loc4_].visible = _loc6_;
               }
               _loc4_++;
            }
            this.m_start = 0;
         }
         if(this.m_timeline.stage_img.currentFrame != Utility.GetLabelEndFrame(this.m_timeline.stage_img,"start"))
         {
            return;
         }
         this.changeSelectStage(this.m_select_index);
         this.updateSelectSel();
         this.m_timeline.select_sel.visible = true;
         this.m_timeline.select_sel.gotoAndPlay("on");
         this.m_callback.CallbackUserData("user",SendType_EnableOptionBGM,1);
         this.clearSelectTimer();
         this.m_timeline.stage.removeEventListener(Event.ENTER_FRAME,this.updatePhaseOpen);
         this.m_timeline.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.checkKey);
         this.m_flag_next = false;
         this.m_timeline.stage.addEventListener(Event.ENTER_FRAME,this.updatePhaseMain);
      }
      
      private function updatePhaseMain(param1:Event) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = undefined;
         var _loc8_:Bitmap = null;
         var _loc9_:int = 0;
         if(this.m_timer)
         {
            _loc6_ = this.m_timer.GetTime();
            if(this.m_pre_time != _loc6_)
            {
               if(_loc6_ < 10 && _loc6_ > 0)
               {
                  _loc7_ = 8;
                  this.m_callback.CallbackUserData("user",SendType_CountDownSe,_loc7_);
               }
               this.m_pre_time = _loc6_;
            }
         }
         //////////if(this.m_mode_type == 1)
		 if(local_original_mode)
		 //////////
         {
            this.updateStageIconLocal();
         }
         else
         {
            this.updateStageIconNormal();
            this.updateEdgeFrame();
         }
         this.updateSelectSel();
         this.updateSelectedTimer();
         var _loc2_:int = this.calcStageId(this.m_select_index);
         var _loc3_:MovieClip = this.m_timeline.stage_img;
         if(_loc3_.stage_img.currentFrame == Utility.GetLabelEndFrame(_loc3_.stage_img,"push_out"))
         {
            _loc3_.stage_img.gotoAndPlay("push_in");
            _loc3_.sys_stagename.sys_stagename.autoSize = "left";
            _loc3_.sys_stagename.sys_stagename.wordWrap = false;
            _loc3_.sys_stagename.sys_stagename.htmlText = this.getStageName(_loc2_);
            if(_loc3_.stage_img.stageimg.numChildren > 0)
            {
               _loc3_.stage_img.stageimg.removeChildAt(0);
            }
            _loc8_ = this.m_stage_image[_loc2_];
            if(_loc8_)
            {
               _loc3_.stage_img.stageimg.addChildAt(_loc8_,0);
            }
         }
         else if(_loc3_.stage_img.currentFrame == Utility.GetLabelEndFrame(_loc3_.stage_img,"push_in"))
         {
            _loc3_.stage_img.gotoAndPlay("wait");
         }
         var _loc4_:int = this.m_callback.GetUserDataInt(ReceiveTypeFlagExit);
         if(_loc4_)
         {
            this.m_flag_next = true;
         }
         var _loc5_:MovieClip = this.m_timeline.select_sel;
         if(_loc5_.currentLabel == "push")
         {
            this.m_timeline.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.checkKey);
         }
         if(_loc5_.currentFrame == Utility.GetLabelEndFrame(_loc5_,"push"))
         {
            this.m_callback.CallbackDecide(_loc2_);
            this.sendSelectedStage();
            _loc9_ = -1;
            if(this.m_timer)
            {
               _loc9_ = this.m_timer.GetTime();
            }
            this.m_callback.CallbackUserData("user",SendType_DecideTime,_loc9_);
            this.m_flag_next = true;
         }
         if(!this.m_flag_next)
         {
            return;
         }
         this.m_timeline.cmn_m_frame.cmn_m_frame.gotoAndPlay("end");
         this.m_timeline.stage_img.gotoAndPlay("end");
         this.m_timeline.stage_select.gotoAndPlay("end");
         this.m_timeline.stage_new.gotoAndPlay("end");
         this.m_timeline.stage_arw.gotoAndPlay("end");
         this.m_timer.End();
         this.m_timeline.timer.gotoAndPlay("end");
         this.m_timeline.stage.removeEventListener(Event.ENTER_FRAME,this.updatePhaseMain);
         this.m_flag_next = false;
         this.m_timeline.stage.addEventListener(Event.ENTER_FRAME,this.updatePhaseEnd);
      }
      
      private function updatePhaseEnd(param1:Event) : void
      {
         this.updateSelectSel();
         if(this.m_timeline.stage_img.currentFrame != Utility.GetLabelEndFrame(this.m_timeline.stage_img,"end"))
         {
            return;
         }
         this.m_timeline.select_sel.visible = false;
         this.m_timeline.stage.removeEventListener(Event.ENTER_FRAME,this.updatePhaseEnd);
         this.m_callback.CallbackExit();
      }
      
      private function getStageFrame(param1:int) : int
      {
         //////////
		 if (param1 >= StageIDNum && param1 < SSNum)
			return 0;
		 //////////
		 
		 var _loc2_:int = ImageFrameInvalid;
         if(0 <= param1 && param1 < StageIdInfo.length)
         {
            _loc2_ = StageIdInfo[param1];
         }
         return _loc2_;
      }
      
      private function getStageName(param1:int) : String
      {
         //////////
		 if (param1 >= StageIDNum && param1 < SSNum)
			return XV2Patcher.GetStageName(param1);
		 //////////
		 
		 if(0 <= param1 && param1 < StageIdInfo.length)
         {
            return this.m_callback.GetUserDataString(ReceiveTypeStageStrStart + param1);
         }
         return StageNameInvalid;
      }
      
      private function calcStageListIndex(param1:int, param2:int) : int
      {
         return param1 + param2 * IndexNumRow;
      }
      
      private function calcIconIndexRow(param1:int) : int
      {
         if(param1 < 0 || this.m_stage_table.length <= param1)
         {
            return -1;
         }
         return param1 % IndexNumRow;
      }
      
      private function calcIconIndexColumn(param1:int) : int
      {
         if(param1 < 0 || this.m_stage_table.length <= param1)
         {
            return -1;
         }
         return param1 / IndexNumRow;
      }
      
      private function calcStageId(param1:int) : int
      {
         if(param1 < 0 || this.m_stage_table.length <= param1)
         {
            return StageIDInvlaid;
         }
         return this.m_stage_table[param1];
      }
      
      private function checkUnlockStage(param1:*) : Boolean
      {
         //////////
		 if (param1 >= StageIDNum && param1 < SSNum)
			return true;
		 //////////
		 
		 if(param1 < 0 || StageIDNum <= param1)
         {
            return false;
         }
         return Boolean(this.m_callback.GetUserDataInt(ReceiveTypeStageUnlockStart + param1));
      }
      
      private function updatePage() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc6_:MovieClip = null;
         var _loc3_:MovieClip = this.m_timeline.stage_select;
         var _loc4_:MovieClip = this.m_timeline.stage_new;
         var _loc5_:MovieClip = null;
         _loc1_ = -1;
         while(this.m_index_num_column + 1 > _loc1_)
         {
            _loc6_ = _loc3_["stage_icn_set" + (_loc1_ + 1)];
            if(this.m_flag_change_l)
            {
               _loc6_.gotoAndPlay("push_l");
               this.m_timeline.stage_arw.spinbtn_l.cmn_CMN_M_B_mc_spinbtn_l.gotoAndPlay("push");
               _loc2_ = 0;
               while(NewIconMax1 > _loc2_)
               {
                  _loc5_ = _loc4_["stage_new_" + _loc2_];
                  _loc5_.gotoAndPlay("push_l");
                  _loc2_++;
               }
            }
            else
            {
               _loc6_.gotoAndPlay("push_r");
               this.m_timeline.stage_arw.spinbtn_r.cmn_CMN_M_B_mc_spinbtn_r.gotoAndPlay("push");
               _loc2_ = 0;
               while(NewIconMax1 > _loc2_)
               {
                  _loc5_ = _loc4_["stage_new_" + _loc2_];
                  _loc5_.gotoAndPlay("push_r");
                  _loc2_++;
               }
            }
            _loc1_++;
         }
      }
      
      private function updateStageIconLocal() : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:MovieClip = null;
         var _loc10_:MovieClip = null;
         var _loc11_:Boolean = false;
         var _loc1_:MovieClip = this.m_timeline.stage_select;
         var _loc2_:int = 0;
         while(this.m_index_num_column > _loc2_)
         {
            _loc3_ = _loc1_["stage_icn_set" + _loc2_];
            _loc4_ = 0;
            while(IndexNumRow > _loc4_)
            {
               _loc5_ = _loc3_["nest_stage_sel" + (_loc4_ + 1)];
               _loc6_ = this.calcStageListIndex(_loc4_,_loc2_);
               _loc7_ = this.calcStageId(_loc6_);
               _loc5_.visible = true;
               _loc8_ = this.getStageFrame(_loc7_);
               _loc5_.btn_act.img_icon_frm.gotoAndStop(_loc8_);
               _loc9_ = this.m_timeline.stage_new;
               _loc10_ = _loc9_["stage_new_" + _loc6_];
               _loc10_.visible = false;
               _loc11_ = this.checkUnlockStage(_loc7_);
               if(!_loc11_)
               {
                  if(_loc6_ >= this.m_stage_table.length)
                  {
                     _loc5_.visible = false;
                  }
                  else
                  {
                     _loc5_.gotoAndStop("lock");
                  }
               }
               else
               {
                  _loc5_.btn_act.img_icon_frm.gotoAndStop(_loc8_);
                  _loc5_.gotoAndStop("off");
                  if(this.m_selected_stage[_loc7_] == 0)
                  {
                     _loc10_.visible = true;
                  }
               }
               _loc4_++;
            }
            _loc2_++;
         }
      }
      
      private function updateStageIconNormal() : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:MovieClip = null;
         var _loc10_:MovieClip = null;
         var _loc11_:Boolean = false;
         var _loc1_:MovieClip = this.m_timeline.stage_select;
         var _loc2_:int = -1;
         while(this.m_index_num_column + 1 > _loc2_)
         {
            _loc3_ = _loc1_["stage_icn_set" + (_loc2_ + 1)];
            _loc4_ = 0;
            while(IndexNumRow > _loc4_)
            {
               _loc5_ = _loc3_["nest_stage_sel" + (_loc4_ + 1)];
               _loc6_ = this.calcStageListIndex(_loc4_,_loc2_ + this.m_select_column_start);
               _loc7_ = this.calcStageId(_loc6_);
               _loc5_.visible = true;
               _loc8_ = this.getStageFrame(_loc7_);
               _loc5_.btn_act.img_icon_frm.gotoAndStop(_loc8_);
			   //////////
			   setImage(_loc5_.btn_act, _loc7_)
			   //////////
               _loc9_ = this.m_timeline.stage_new;
               _loc10_ = _loc9_["stage_new_" + this.calcStageListIndex(_loc4_,_loc2_ + 1)];
               _loc10_.visible = false;
               _loc11_ = this.checkUnlockStage(_loc7_);
               if(!_loc11_)
               {
                  if(_loc6_ >= this.m_stage_table.length)
                  {
                     _loc5_.visible = false;
                  }
                  else
                  {
                     _loc5_.gotoAndStop("lock");
                  }
               }
               else
               {
                  _loc5_.btn_act.img_icon_frm.gotoAndStop(_loc8_);
                  _loc5_.gotoAndStop("off");
                  if(this.m_selected_stage[_loc7_] == 0)
                  {
                     _loc10_.visible = true;
                  }
               }
               _loc4_++;
            }
            _loc2_++;
         }
      }
      
      private function updateEdgeFrame() : void
      {
         var _loc1_:MovieClip = this.m_timeline.stage_select;
         var _loc2_:MovieClip = _loc1_["stage_icn_set0"];
         if(this.m_select_column_start <= 0)
         {
            _loc2_.visible = false;
         }
         else
         {
            _loc2_.visible = true;
         }
         var _loc3_:MovieClip = _loc1_["stage_icn_set" + (this.m_index_num_column + 1)];
         if(this.m_stage_num_column <= this.m_select_column_start + this.m_index_num_column)
         {
            _loc3_.visible = false;
         }
         else
         {
            _loc3_.visible = true;
         }
      }
      
      private function updateSelectedTimer() : *
      {
         this.m_select_timer = getTimer();
         var _loc1_:int = this.m_select_timer - this.m_start_time;
         if(_loc1_ > kGotoSelectedStatusTime)
         {
            this.sendSelectedStage();
         }
      }
      
      private function sendSelectedStage() : *
      {
         var _loc1_:int = this.calcStageListIndex(this.m_select_row,this.m_select_column + this.m_select_column_start);
         var _loc2_:int = this.calcStageId(this.calcStageListIndex(this.m_select_row,this.m_select_column + this.m_select_column_start));
         var _loc3_:MovieClip = this.m_timeline.stage_new;
         var _loc4_:MovieClip = _loc3_["stage_new_" + this.calcStageListIndex(this.m_select_row,this.m_select_column)];
         if(_loc4_)
         {
            if(this.m_selected_stage[_loc2_] == 0)
            {
               this.m_selected_stage[_loc2_] = 1;
               this.m_callback.CallbackUserData("user",SendType_SelectedStage,this.m_stage_table[_loc1_]);
            }
         }
      }
      
      private function clearSelectTimer() : *
      {
         this.m_select_timer = 0;
         this.m_start_time = getTimer();
      }
      
      private function changeLR(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         this.clearSelectTimer();
         while(true)
         {
            if(param1)
            {
               this.m_select_column--;
               if(this.m_select_column < 0)
               {
                  if(0 < this.m_select_column_start)
                  {
                     this.m_select_column = 0;
                     this.m_select_column_start--;
                  }
                  else
                  {
                     this.m_select_column = this.m_index_num_column - 1;
                     this.m_select_row--;
                     this.m_select_row = this.m_select_row + IndexNumRow;
                     this.m_select_row = this.m_select_row % IndexNumRow;
                     this.m_select_column_start = this.m_stage_num_column - this.m_index_num_column;
                  }
                  //////////if(this.m_mode_type != 1)
				  if(!local_original_mode)
				  //////////
                  {
                     this.m_flag_change_l = true;
                     this.updatePage();
                  }
               }
            }
            else
            {
               this.m_select_column++;
               if(this.m_index_num_column <= this.m_select_column)
               {
                  if(this.m_select_column_start < this.m_stage_num_column - (this.m_index_num_column - 1))
                  {
                     this.m_select_column = this.m_index_num_column - 1;
                     this.m_select_column_start++;
                  }
                  else
                  {
                     this.m_select_column = 0;
                     this.m_select_row++;
                     this.m_select_row = this.m_select_row + IndexNumRow;
                     this.m_select_row = this.m_select_row % IndexNumRow;
                     this.m_select_column_start = 0;
                  }
                  //////////if(this.m_mode_type != 1)
				  if(!local_original_mode)
				  //////////
                  {
                     this.m_flag_change_l = false;
                     this.updatePage();
                  }
               }
            }
            _loc2_ = this.calcStageListIndex(this.m_select_row,this.m_select_column_start + this.m_select_column);
            _loc3_ = this.calcStageId(_loc2_);
            _loc4_ = this.checkUnlockStage(_loc3_);
            if(!_loc4_)
            {
               continue;
            }
            break;
         }
         this.changeSelectStage(_loc2_);
      }
      
      private function changeUD(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         this.clearSelectTimer();
         while(true)
         {
            if(param1)
            {
               this.m_select_row--;
               if(this.m_select_row < 0)
               {
                  this.m_select_row = IndexNumRow - 1;
                  this.m_select_column--;
                  if(this.m_select_column < 0)
                  {
                     if(0 < this.m_select_column_start)
                     {
                        this.m_select_column = 0;
                        this.m_select_column_start--;
                     }
                     else
                     {
                        this.m_select_column = this.m_index_num_column - 1;
                        this.m_select_column_start = this.m_stage_num_column - this.m_index_num_column;
                     }
                     //////////if(this.m_mode_type != 1)
					 if(!local_original_mode)
					 //////////
                     {
                        this.m_flag_change_l = true;
                        this.updatePage();
                     }
                  }
                  else
                  {
                     this.m_select_column = this.m_select_column + this.m_index_num_column;
                     this.m_select_column = this.m_select_column % this.m_index_num_column;
                  }
               }
            }
            else
            {
               this.m_select_row++;
               if(IndexNumRow <= this.m_select_row)
               {
                  this.m_select_row = 0;
                  this.m_select_column++;
                  if(this.m_select_column > this.m_index_num_column - 1)
                  {
                     if(this.m_select_column_start < this.m_stage_num_column - (this.m_index_num_column - 1))
                     {
                        this.m_select_column = this.m_index_num_column - 1;
                        this.m_select_column_start++;
                     }
                     else
                     {
                        this.m_select_column = 0;
                        this.m_select_column_start = 0;
                     }
                     //////////if(this.m_mode_type != 1)
					 if(!local_original_mode)
					 //////////
                     {
                        this.m_flag_change_l = false;
                        this.updatePage();
                     }
                  }
                  else
                  {
                     this.m_select_column = this.m_select_column + this.m_index_num_column;
                     this.m_select_column = this.m_select_column % this.m_index_num_column;
                  }
               }
            }
            _loc2_ = this.calcStageListIndex(this.m_select_row,this.m_select_column_start + this.m_select_column);
            _loc3_ = this.calcStageId(_loc2_);
            _loc4_ = this.checkUnlockStage(_loc3_);
            if(!_loc4_)
            {
               continue;
            }
            break;
         }
         this.changeSelectStage(_loc2_);
      }
      
      private function updateSelectSel() : void
      {
         var _loc1_:int = 0;
         //////////if(this.m_mode_type == 1)
		 if(local_original_mode)
		 //////////
         {
            _loc1_ = this.m_select_column;
         }
         else
         {
            _loc1_ = this.m_select_column + 1;
         }
         var _loc2_:MovieClip = this.m_timeline.stage_select;
         var _loc3_:MovieClip = _loc2_["stage_icn_set" + _loc1_];
         var _loc4_:MovieClip = _loc3_["nest_stage_sel" + (this.m_select_row + 1)];
         var _loc5_:MovieClip = this.m_timeline.select_sel;
         _loc5_.x = _loc2_.x + _loc3_.x + _loc4_.x;
         _loc5_.y = _loc2_.y + _loc3_.y + _loc4_.y;
         _loc5_.alpha = _loc4_.alpha;
         var _loc6_:int = this.calcStageId(this.m_select_index);
         var _loc7_:int = this.getStageFrame(_loc6_);
         _loc5_.btn_act.img_icon_frm.gotoAndStop(_loc7_);
		 //////////
		 if (last_selection != m_select_index)
		 {
			setImage(_loc5_.btn_act, _loc6_);
			last_selection = m_select_index;
		 }
		 //////////
      }
      
      private function changeSelectStage(param1:int) : void
      {
         var _loc2_:MovieClip = this.m_timeline.stage_img;
         if(_loc2_.stage_img.currentLabel != "push_out")
         {
            _loc2_.stage_img.gotoAndPlay("push_out");
         }
         this.m_select_index = param1;
      }
      
      private function cbFuncEndTimer() : void
      {
         this.pushEnter();
      }
      
      private function pushU() : void
      {
         this.changeUD(true);
         this.m_callback.CallbackSe(this.m_callback.SeTypeCarsol);
      }
      
      private function pushD() : void
      {
         this.changeUD(false);
         this.m_callback.CallbackSe(this.m_callback.SeTypeCarsol);
      }
      
      private function pushL() : void
      {
         this.changeLR(true);
         this.m_callback.CallbackSe(this.m_callback.SeTypeCarsol);
      }
      
      private function pushR() : void
      {
         this.changeLR(false);
         this.m_callback.CallbackSe(this.m_callback.SeTypeCarsol);
      }
      
      private function pushRandom() : void
      {
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         this.clearSelectTimer();
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(this.m_stage_table.length > _loc1_)
         {
            _loc4_ = StartSelectIndex + _loc1_;
            _loc4_ = _loc4_ % this.m_stage_table.length;
            if(this.checkUnlockStage(this.calcStageId(_loc4_)))
            {
               _loc2_++;
            }
            _loc1_++;
         }
         var _loc3_:int = 0;
         if(_loc2_ > 1)
         {
            _loc3_ = Math.random() * _loc2_;
         }
         _loc1_ = 0;
         while(_loc3_ > _loc1_)
         {
            this.changeLR(false);
            _loc1_++;
         }
         this.m_callback.CallbackSe(this.m_callback.SeTypeCarsol);
      }
      
      private function pushEnter() : void
      {
         this.m_callback.CallbackUserData("user",SendType_EnableOptionBGM,0);
         var _loc1_:MovieClip = this.m_timeline.select_sel;
         _loc1_.gotoAndPlay("push");
         this.m_callback.CallbackSe(this.m_callback.SeTypeDecide);
         var _loc2_:int = this.m_callback.GetUserDataInt(ReceiveTypeTime);
         if(_loc2_ >= 0)
         {
            this.m_timer.Stop();
         }
      }
      
      private function pushCancel() : void
      {
         if(!this.m_callback.GetUserDataInt(ReceiveTypeFlagCancel))
         {
            return;
         }
         this.m_flag_next = true;
         this.m_callback.CallbackSe(this.m_callback.SeTypeCancel);
         this.m_callback.CallbackCancel();
      }
      
      private function checkKey(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.UP:
               this.pushU();
               break;
            case Keyboard.DOWN:
               this.pushD();
               break;
            case Keyboard.LEFT:
               this.pushL();
               break;
            case Keyboard.RIGHT:
               this.pushR();
               break;
            case 89:
            case Keyboard.END:
               this.pushRandom();
               break;
            case Keyboard.ESCAPE:
               this.pushCancel();
               break;
            case Keyboard.ENTER:
               this.pushEnter();
         }
      }
      
      public function SetUserDataInt(param1:int, param2:int) : *
      {
         this.m_callback.AddCallbackSetUserDataInt(param1,param2);
      }
      
      public function SetUserDataString(param1:int, param2:String) : *
      {
         this.m_callback.AddCallbackSetUserDataString(param1,param2);
      }
      
      public function TestDestroy() : void
      {
         this.m_callback = null;
         this.m_timeline.stage.removeEventListener(Event.ENTER_FRAME,this.updatePhaseWaitStart);
         this.m_timeline.stage.removeEventListener(Event.ENTER_FRAME,this.updatePhaseOpen);
         this.m_timeline.stage.removeEventListener(Event.ENTER_FRAME,this.updatePhaseMain);
         this.m_timeline.stage.removeEventListener(Event.ENTER_FRAME,this.updatePhaseEnd);
         this.m_timeline.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.checkKey);
         this.m_timer.Destroy();
         this.m_timer = null;
         this.m_timeline.visible = false;
         this.m_timeline = null;
      }
   }
}

package action_script
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class Test
   {
       
      
      public function Test()
      {
         super();
      }
      
      public static function Run(param1:MovieClip, param2:StageSele) : void
      {
         var i:int = 0;
         var StageName:Array = null;
         var checkKey:Function = null;
         var waitRequestList:Function = null;
         var timeline:MovieClip = param1;
         var main:StageSele = param2;
         checkKey = function(param1:KeyboardEvent):void
         {
            switch(param1.keyCode)
            {
               case 49:
                  if(main)
                  {
                     main.TestDestroy();
                  }
                  main = new StageSele();
                  main.Initialize(timeline);
                  main.SetUserDataInt(StageSele.ReceiveTypeFlagCancel,1);
                  i = 0;
                  while(StageSele.StageIDNum > i)
                  {
                     main.SetUserDataString(StageSele.ReceiveTypeStageStrStart + i,StageName[i]);
                     main.SetUserDataString(StageSele.ReceiveTypeImageStrStart + i,StageName[i]);
                     main.SetUserDataInt(StageSele.ReceiveTypeStageUnlockStart + i,i % 3);
                     main.SetUserDataInt(StageSele.ReceiveTypeSelectedStart + i,0);
                     i++;
                  }
                  main.SetUserDataInt(StageSele.ReceiveTypeTime,5);
                  main.SetUserDataInt(StageSele.ReceiveTypeFlagExit,0);
                  break;
               case 50:
                  break;
               case 51:
                  break;
               case 52:
                  break;
               case 53:
                  break;
               case 54:
                  break;
               case 55:
                  break;
               case 56:
            }
         };
         waitRequestList = function(param1:Event):void
         {
            if(!main)
            {
               return;
            }
         };
         i = 0;
         var j:int = 0;
         var k:int = 0;
         var l:int = 0;
         StageName = ["?????????","?????????????????????","????????????????????????????????????","?????????????????????","??????","???????????????","???????????????","????????????????????????","???????????????????????????","????????????????????????????????????","????????????????????????","????????????????????????","?????????????????????","?????????????????????????????????","??????","???????????????","???","?????????????????????","????????????","??????????????????","??????????????????????????????","??????","????????????","??????","????????????????????????","?????????","????????????","????????????????????????????????????","??????(???)","??????(???)","Unknown Stage"];
         timeline.stage.addEventListener(KeyboardEvent.KEY_DOWN,checkKey);
         timeline.stage.addEventListener(Event.ENTER_FRAME,waitRequestList);
      }
   }
}

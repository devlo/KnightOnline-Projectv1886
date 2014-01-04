
-- [¹«¸í Àü»ç]

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°ø?

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;

-- [¹«¸íÀü»ç][¿¤¸ð] Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, 14414);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 3212, 14414, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- ¹» ÇÏ´Â °É±î?
			 Ret = 1; -- ÀÌ°Ç ¿Ö ÀúÀå ½ÃÄÑ¿ä? ±×³É RETURNÀº ¾ÈµÇ³ª¿ä?
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          NpcMsg(UID, 3000,14414)
      else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--local SHOW_MAP; -- Áöµµ º¸¿©ÁÖ´« ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä

if EVENT == 195 then
   SelectMsg(UID, 1, 305, 3001, 14414, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 333);
   SaveEvent(UID, 3043);
end

if EVENT == 197 then
   SelectMsg(UID, 1, 305, 3002, 14414, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- ¹«¸íÀü»ç 102¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 200 then
   SelectMsg(UID, 2, 305, 3003, 14414, 10, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 305, 3004, 14414, 22, 202, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 202 then
   SaveEvent(UID, 3044);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 205 then
   SaveEvent(UID, 3046);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 305, 3005, 14414, 3009, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 305, 3006, 14414, 3009, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 210 then
	ITEM_COUNT = GetMaxExchange(UID, 305); --exchange Å×ÀÌºí ÀÎµ¦½º°ª 
      if  ITEM_COUNT <= 0 then -- Àç·á ¾øÀ»¶§
         SelectMsg(UID, 2, 305, 3007, 14414, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
         elseif ITEM_COUNT  > 0 then-- Àç·á ÀÖÀ»¶§
         SelectMsg(UID, 4, 305, 3008, 14414, 10, 214, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

if EVENT == 213 then
   ShowMap(UID, 22);
end

local Check;

if EVENT == 214 then
   Check = CheckExchange(UID, 305)
   if  Check ==1 then
   min_count = GetMaxExchange(UID, 305);
 	RunCountExchange(UID, 305, min_count);	
   SaveEvent(UID, 3047);
   else
  Ret = 1;	
  end	 
end

------------------------------------------------------
-- ¾ð´ÙÀ× ÅðÄ¡ ½ÃÀÛ 
------------------------------------------------------
--½Ãµå, ¹Ì¼¿ È£Ãâ 
if EVENT == 9000 then
--  NATION = CheckNation(UID);
--  if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 328, 170, 14414, 24, 9001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9001 then
   ShowMap(UID, 333);
   SaveEvent(UID, 7002);
end

if EVENT == 9002 then
   SelectMsg(UID, 2, 328, 172, 14414, 24, 9001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 320¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì 


if EVENT == 300 then
   SelectMsg(UID, 2, 328, 3845, 14414,  3006, 301, 13, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 308 then
   SelectMsg(UID, 2, 328, 3846, 14414,  3000, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 301 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
      SelectMsg(UID, 4, 328, 3847, 14414, 22, 302, 23, 309, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);

	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
 		SelectMsg(UID, 2, 328, 173, 14414, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 309 then
   SelectMsg(UID, 2, 328, 3849, 14414,  10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 302 then
   SaveEvent(UID, 7003);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå¿Í ¹Ì¼¿ÀÇ ¶Ç µîÀå 
if EVENT == 303 then
   SaveEvent(UID, 7005);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 328, 3851, 14414, 3003, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif NATION == 2 then -- ¿¤¸ðÀÏ¶§ 
      SelectMsg(UID, 1, 328, 3852, 14414, 3003, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

-- 320ÀÇ 1¹ø 3¹øÀÎ °æ¿ì 

local MonsterCount = 0;

if EVENT == 305 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 10 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
      SelectMsg(UID, 2, 328, 3850, 14414, 10, 306, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
      SelectMsg(UID, 4, 328, 3853, 14414, 10, 307, 27, 306, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 306 then
   ShowMap(UID, 22);
end

local Check;

if EVENT == 307 then
   Check = CheckExchange(UID, 328)
   if  Check ==1 then
   RunExchange(UID, 328);
   SaveEvent(UID, 7004);
   else
  Ret = 1;	
  end	 
end

------------------------------------------------------
-- ¾ð´ÙÀ× ÅðÄ¡ ³¡ 
------------------------------------------------------

-------------------------------
------- ¶óÆ° ¾ÆÀÌÁî ÅðÄ¡ ------
-------------------------------

if EVENT == 8400 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8490);
    EVENT = 8401
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8495);
    EVENT = 8401
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8500);
    EVENT = 8401
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8505);
     EVENT = 8401
   end
end

if EVENT == 8401 then
    SelectMsg(UID, 1, 830, 8322, 14414, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8402 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 830, 8323, 14414, 10, 8405, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 830, 8324, 14414, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8405 then
    SelectMsg(UID, 4, 830, 8325, 14414, 22, 8403, 23, 8404, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8403 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8491);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8496);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8501);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8506);
   end
end

if EVENT == 8404 then
   SaveEvent(UID, 8494); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 8410 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8493);
    EVENT = 8411
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8498);
    EVENT = 8411
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8503);
    EVENT = 8411
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8508);
    EVENT = 8411
   end
end

if EVENT == 8411 then
    SelectMsg(UID, 1, 830, 8326, 14414, 56, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8406 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
     SelectMsg(UID, 2, 830, 8327, 14414, 10, 8407, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
     SelectMsg(UID, 4, 830, 8328, 14414, 10, 8408, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8407 then
   ShowMap(UID, 576);
end

local Check;

if EVENT == 8408 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 904)
        if  Check ==1 then        
        RunExchange(UID, 904);
        SaveEvent(UID, 8492);
        SaveEvent(UID, 8471);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 905)
        if  Check ==1 then        
        RunExchange(UID, 905);
        SaveEvent(UID, 8497);
        SaveEvent(UID, 8471);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 906)
        if  Check ==1 then        
        RunExchange(UID, 906);
        SaveEvent(UID, 8502);
        SaveEvent(UID, 8471);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 907)
        if  Check ==1 then        
        RunExchange(UID, 907);
        SaveEvent(UID, 8507);
        SaveEvent(UID, 8471);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
---- ¶óÆ° ¾ÆÀÌÁî ÅðÄ¡ ³¡ ------
-------------------------------

-------------------------------
-------- ¹ÙÅ»¸®¾ð ÅðÄ¡ --------
-------------------------------

if EVENT == 8850 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8742);
    EVENT = 8851
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8747);
    EVENT = 8851
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8752);
    EVENT = 8851
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8757);
     EVENT = 8851
   end
end

if EVENT == 8851 then
    SelectMsg(UID, 1, 854, 8329, 14414, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8852 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 2, 854, 8330, 14414, 10, 8855, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, 854, 8324, 14414, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8855 then
    SelectMsg(UID, 4, 854, 8331, 14414, 22, 8853, 23, 8854, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8853 then --¼ö¶ô½Ã
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8743);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8748);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8753);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8758);
   end
end

if EVENT == 8854 then
   SaveEvent(UID, 8746); -- °ÅÀý½Ã 
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 8860 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8745);
    EVENT = 8861
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8750);
    EVENT = 8861
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8755);
    EVENT = 8861
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8760);
    EVENT = 8861
   end
end

if EVENT == 8861 then
    SelectMsg(UID, 1, 854, 8326, 14414, 56, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8856 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
     SelectMsg(UID, 2, 854, 8327, 14414, 10, 8857, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
     SelectMsg(UID, 4, 854, 8332, 14414, 10, 8858, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8857 then
   ShowMap(UID, 580);
end

local Check;

if EVENT == 8858 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 961)
        if  Check ==1 then        
        RunExchange(UID, 961);
        SaveEvent(UID, 8744);
        SaveEvent(UID, 8723);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 962)
        if  Check ==1 then        
        RunExchange(UID, 962);
        SaveEvent(UID, 8749);
        SaveEvent(UID, 8723);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 963)
        if  Check ==1 then        
        RunExchange(UID, 963);
        SaveEvent(UID, 8754);
        SaveEvent(UID, 8723);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 964)
        if  Check ==1 then        
        RunExchange(UID, 964);
        SaveEvent(UID, 8759);
        SaveEvent(UID, 8723);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
------- ¹ÙÅ»¸®¾ð ÅðÄ¡ ³¡-------
-------------------------------

return Ret;

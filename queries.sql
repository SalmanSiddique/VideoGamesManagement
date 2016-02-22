select c.Console_Name, count(distinct vg.VGCon_Game_ID) from videogamesconsoles vg, videogames v, consoles c where vg.VGCon_Game_ID = v.Game_ID AND vg.VGCon_Console_ID = c.Console_ID group by vg.VGCon_Console_ID;
SELECT v.Game_Name, COUNT(vc.VGCon_Game_ID) number_of_duplicates FROM videogamesconsoles vc, videogames v where vc.VGCon_Game_ID=v.Game_ID GROUP BY vc.VGCon_Game_ID HAVING number_of_duplicates>1;
select SUM(GC_AmtPurchased) AS total_Cost_of_Collection from gamecontents;
select  videogames.Game_Name, consoles.Console_Name, consoles.Console_Type, gamecomleteness.Completeness_Description , conditionsmaster.Condition_Name from videogames 
join videogamesconsoles on videogames.Game_ID=videogamesconsoles.VGCon_Game_ID 
join consoles on consoles.Console_ID=videogamesconsoles.VGCon_Console_ID
join gamecontents on gamecontents.GC_VGCon_ID= videogamesconsoles.VGCon_ID 
join conditionsmaster on conditionsmaster.Condition_ID= gamecontents.GC_Condition_ID
join gamecomleteness on gamecomleteness.Completeness_ID= gamecontents.GC_Completeness_ID
where ((gamecontents.GC_Completeness_ID in (5,8)) or (gamecontents.GC_Completeness_ID in (1,2,3,4,6,7)));
select  videogames.Game_Name, consoles.Console_Name, consoles.Console_Type, gamecontents.GC_CurMarketValue from videogames 
join videogamesconsoles on videogames.Game_ID=videogamesconsoles.VGCon_Game_ID 
join consoles on consoles.Console_ID=videogamesconsoles.VGCon_Console_ID
join gamecontents on gamecontents.GC_VGCon_ID= videogamesconsoles.VGCon_ID and gamecontents.GC_ID in (select gamecontents.GC_ID from gamecontents where gamecontents.GC_CurMarketValue in (select MAX(gamecontents.GC_CurMarketValue) from gamecontents));
select Game_Name, GC_CurMarketValue, GC_AmtPurchased from videogames v, videogamesconsoles vc, gamecontents gc where gc.GC_AmtPurchased < gc.GC_CurMarketValue and gc.GC_VGCon_ID = vc.VGCon_ID and vc.VGCon_Game_ID = v.Game_ID group by Game_Name;
select  videogames.Game_Name, consoles.Console_Name, consoles.Console_Type, gamecontents.GC_CurMarketValue, gamecontents.GC_AmtPurchased, gamecontents.GC_CurMarketValue - gamecontents.GC_AmtPurchased as "IncreasedValue"  from videogames 
join videogamesconsoles on videogames.Game_ID=videogamesconsoles.VGCon_Game_ID 
join consoles on consoles.Console_ID=videogamesconsoles.VGCon_Console_ID
join gamecontents on gamecontents.GC_VGCon_ID= videogamesconsoles.VGCon_ID
order by IncreasedValue Desc limit 1;
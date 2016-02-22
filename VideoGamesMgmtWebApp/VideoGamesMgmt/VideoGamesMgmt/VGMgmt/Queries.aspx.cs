using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoGamesMgmt
{
    public partial class Queries : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["videogamesmgmtConnectionString"].ConnectionString);
        MySqlCommand cmd;
        MySqlDataAdapter adp;
        DataSet ds;

        public void setGrid(string query, GridView querygrid)
        {
            con.Open();
            cmd = new MySqlCommand(query, con);
            adp = new MySqlDataAdapter(cmd);
            ds = new DataSet();
            adp.Fill(ds);
            querygrid.DataSource = ds;
            querygrid.DataBind();
            con.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            #region Query 1: The number of unique games per system
            setGrid("select c.Console_Name, count(distinct vg.VGCon_Game_ID) from videogamesconsoles vg, videogames v, consoles c where vg.VGCon_Game_ID = v.Game_ID AND vg.VGCon_Console_ID = c.Console_ID group by vg.VGCon_Console_ID;", query1grid);
            #endregion

            #region Query 2: A list with the duplicate games in the collection
            //Query 2: A list with the duplicate games in the collection
            setGrid("SELECT v.Game_Name, COUNT(vc.VGCon_Game_ID) number_of_duplicates FROM videogamesconsoles vc, videogames v where vc.VGCon_Game_ID=v.Game_ID GROUP BY vc.VGCon_Game_ID HAVING number_of_duplicates>1;", query2grid);
            #endregion

            #region Query 3: The total cost of the person’s collection
            //Query 3: The total cost of the person’s collection
            setGrid("select SUM(GC_AmtPurchased) AS total_Cost_of_Collection from gamecontents;", query3grid);
            #endregion

            #region Query 4: The collector’s complete games and the games missing something (box and/or manual)
            //Query 4: The collector’s complete games and the games missing something (box and/or manual)
            setGrid("select  videogames.Game_Name, consoles.Console_Name, consoles.Console_Type, gamecomleteness.Completeness_Description , conditionsmaster.Condition_Name from videogames join videogamesconsoles on videogames.Game_ID=videogamesconsoles.VGCon_Game_ID join consoles on consoles.Console_ID=videogamesconsoles.VGCon_Console_ID join gamecontents on gamecontents.GC_VGCon_ID= videogamesconsoles.VGCon_ID join conditionsmaster on conditionsmaster.Condition_ID= gamecontents.GC_Condition_ID join gamecomleteness on gamecomleteness.Completeness_ID= gamecontents.GC_Completeness_ID where ((gamecontents.GC_Completeness_ID in (5,8)) or (gamecontents.GC_Completeness_ID in (1,2,3,4,6,7)));", query4grid);
            #endregion

            #region Query 5: The collector’s most expensive game (based on the current market value)
            //Query 5: The collector’s most expensive game (based on the current market value)
            setGrid("select  videogames.Game_Name, consoles.Console_Name, consoles.Console_Type, gamecontents.GC_CurMarketValue from videogames join videogamesconsoles on videogames.Game_ID=videogamesconsoles.VGCon_Game_ID join consoles on consoles.Console_ID=videogamesconsoles.VGCon_Console_ID join gamecontents on gamecontents.GC_VGCon_ID= videogamesconsoles.VGCon_ID and gamecontents.GC_ID in (select gamecontents.GC_ID from gamecontents where gamecontents.GC_CurMarketValue in (select MAX(gamecontents.GC_CurMarketValue) from gamecontents));", query5grid);
            #endregion

            #region Query 6: The games that the collector purchased for a price lower than the current market price
            //Query 6: The games that the collector purchased for a price lower than the current market price
            setGrid("select Game_Name, GC_CurMarketValue, GC_AmtPurchased from videogames v, videogamesconsoles vc, gamecontents gc where gc.GC_AmtPurchased < gc.GC_CurMarketValue and gc.GC_VGCon_ID = vc.VGCon_ID and vc.VGCon_Game_ID = v.Game_ID group by Game_Name;", query6grid);
            #endregion

            #region Query 7: The game that has the highest increase in value (current value minus money paid) for and what is this increase
            //Query 7: The game that has the highest increase in value (current value minus money paid) for and what is this increase
            setGrid("select  videogames.Game_Name, consoles.Console_Name, consoles.Console_Type, gamecontents.GC_CurMarketValue, gamecontents.GC_AmtPurchased, gamecontents.GC_CurMarketValue - gamecontents.GC_AmtPurchased as 'IncreasedValue'  from videogames join videogamesconsoles on videogames.Game_ID=videogamesconsoles.VGCon_Game_ID join consoles on consoles.Console_ID=videogamesconsoles.VGCon_Console_ID join gamecontents on gamecontents.GC_VGCon_ID= videogamesconsoles.VGCon_ID order by IncreasedValue Desc limit 1;",query7grid);
            #endregion

        }
    }
}
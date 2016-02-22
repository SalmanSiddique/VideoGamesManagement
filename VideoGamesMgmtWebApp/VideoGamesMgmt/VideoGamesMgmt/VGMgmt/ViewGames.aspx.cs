using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace VideoGamesMgmt
{
    public partial class ViewGames : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["videogamesmgmtConnectionString"].ConnectionString);

        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {
            setGrid();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void setGrid()
        {
            con.Open();
            String st = DropDownList1.SelectedValue;
            MySqlCommand cmd = new MySqlCommand("SELECT consoles.Console_Name 'Console',videogames.Game_Name 'Game',categoriesmaster.Category_Name 'Category',gamecontents.GC_DatePurchased 'Purchased Date',gamecontents.GC_AmtPurchased 'Amount Purchased', conditionsmaster.Condition_Name 'Condition',gamecomleteness.Completeness_Description 'Completeness',gamecontents.GC_CurMarketValue 'Current Market Value' from videogames,consoles,videogamesconsoles,gamecontents,conditionsmaster, gamecomleteness,categoriesmaster,videogamescategories where videogames.Game_ID=videogamesconsoles.VGCon_Game_ID and consoles.Console_ID=videogamesconsoles.VGCon_Console_ID and videogamesconsoles.VGCon_ID = gamecontents.GC_VGCon_ID and videogames.Game_ID = videogamescategories.VGCat_Game_ID and videogamescategories.VGCat_Category_ID = categoriesmaster.Category_ID and gamecontents.GC_Condition_ID = conditionsmaster.Condition_ID and gamecontents.GC_Completeness_ID = gamecomleteness.Completeness_ID and consoles.Console_Name='" + st + "';", con);
            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            setGrid();
        }

    }
}
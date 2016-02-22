using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoGamesMgmt
{
    public partial class Insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var context = new videogamesmgmtEntities())
            {
                Session["gameid"] = context.videogames.OrderByDescending(c => c.Game_ID).FirstOrDefault().Game_ID;
            }
        }
       
        protected void Button1_Click1(object sender, EventArgs e)
        {
            using (var context = new videogamesmgmtEntities())
            {
                Session["gameid"] = Convert.ToInt32(Session["gameid"]) + 1;
                var videogames = context.Set<videogame>();
                videogames.Add(new videogame { Game_ID = Convert.ToInt32(Session["gameid"]), Game_Name = txtGameName.Text, Game_Title = txtGameTitle.Text, Game_Desc = txtGameDesc.Text });
                context.SaveChanges();
            }
            Response.Redirect("AddGameCategories.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoGamesMgmt.VGMgmt
{
    public partial class MultipleGameCategories : System.Web.UI.Page
    {
        public int gameid { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            gameid = (int)Session["gameid"];
            using (var context = new videogamesmgmtEntities())
            {
                var addedgame = (from r in context.videogames select r).Where(w=> w.Game_ID==gameid).ToList();
                selectedGameGrid.DataSource = addedgame;
                selectedGameGrid.DataBind();
                getCategoriesGrid();
            }
        }

        public void getCategoriesGrid()
        {
            gameid = (int)Session["gameid"];
            using (var context = new videogamesmgmtEntities())
            {
                var cat = (from vg in context.videogames join vgc in context.videogamescategories on vg.Game_ID equals vgc.VGCat_Game_ID join cm in context.categoriesmasters on vgc.VGCat_Category_ID equals cm.Category_ID where vg.Game_ID == gameid select new { GameName = vg.Game_Name, GameCat = cm.Category_Name }).ToList();
                categoriesgrid.DataSource = cat;
                categoriesgrid.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (var context = new videogamesmgmtEntities())
            {
                var _videogamescategories = context.Set<videogamescategory>();
                _videogamescategories.Add(new videogamescategory { VGCat_Game_ID = (int)Session["gameid"],VGCat_Category_ID = Convert.ToInt32(ddlCategories.SelectedValue) });
                context.SaveChanges();
                //Response.Write("Category Added Successfully");
            }
            getCategoriesGrid();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SelectConsoles.aspx");
        }
    }
}
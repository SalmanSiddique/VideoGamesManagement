using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoGamesMgmt.VGMgmt
{
    public partial class AddContents : System.Web.UI.Page
    {
        public int VGConID { get; set; }
        public int gameid { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            gameid = (int)Session["gameid"];
            VGConID = (int)Session["selectedvgconid"];
            using (var context = new videogamesmgmtEntities())
            {
                //Session["vgconid"] = context.videogamesconsoles.OrderByDescending(c => c.VGCon_ID).FirstOrDefault().VGCon_ID;
                var addedgame = (from vg in context.videogames join vgc in context.videogamesconsoles on vg.Game_ID equals vgc.VGCon_Game_ID join cm in context.consoles on vgc.VGCon_Console_ID equals cm.Console_ID where vg.Game_ID == gameid select new { Collection_ID = vgc.VGCon_ID, Console_Name = cm.Console_Name, Game_Name = vg.Game_Name }).Where(w => w.Collection_ID == VGConID).ToList();
                selectedGameGrid.DataSource = addedgame;
                selectedGameGrid.DataBind();
            }
            getContentsGrid();
        }

        public void getContentsGrid()
        {
            gameid = (int)Session["gameid"];
            VGConID = (int)Session["selectedvgconid"];
            using (var context = new videogamesmgmtEntities())
            {
                var cat = (from vg in context.videogames join vgc in context.videogamesconsoles on vg.Game_ID equals vgc.VGCon_Game_ID join con in context.consoles on vgc.VGCon_Console_ID equals con.Console_ID where vg.Game_ID == gameid join gc in context.gamecontents on vgc.VGCon_ID equals gc.GC_VGCon_ID join cm in context.conditionsmasters on gc.GC_Condition_ID equals cm.Condition_ID join gcom in context.gamecomletenesses on gc.GC_Completeness_ID equals gcom.Completeness_ID select new { Collection_ID = vgc.VGCon_ID, Console_Name = con.Console_Name, Game_Name = vg.Game_Name, GameCompleteness = gcom.Completeness_Description, GameCondition = cm.Condition_Name, PurchaseAmount =  gc.GC_AmtPurchased, CurMktValue = gc.GC_CurMarketValue,PurchaseDate=gc.GC_DatePurchased}).Where(r => r.Collection_ID==VGConID).ToList();
                contentsgrid.DataSource = cat;
                contentsgrid.DataBind();
            }
        }

        protected void btnFinish_Click(object sender, EventArgs e)
        {
            Response.Redirect("Queries.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (var context = new videogamesmgmtEntities())
            {
                VGConID = (int)Session["selectedvgconid"];                
                var _gamecontents = context.Set<gamecontent>();
                _gamecontents.Add(new gamecontent { GC_VGCon_ID = VGConID, GC_Completeness_ID = Convert.ToInt32(ddlgamecompleteness.SelectedValue), GC_Condition_ID = Convert.ToInt32(ddlgamecondition.SelectedValue), GC_AmtPurchased = Convert.ToInt32(txtAmtPurchased.Text), GC_CurMarketValue = Convert.ToInt32(txtCurMarketValue.Text), GC_DatePurchased = CalPurchaseDate.SelectedDate });
                context.SaveChanges();
               // Response.Write("Successfully added contents for this game!!");
            }
            getContentsGrid();
        }

        protected void bthAddOther_Click(object sender, EventArgs e)
        {
            Response.Redirect("SelectConsoles.aspx");
        }
    }
}
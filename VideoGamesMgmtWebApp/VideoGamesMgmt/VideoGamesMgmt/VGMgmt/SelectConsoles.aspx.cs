using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoGamesMgmt.VGMgmt
{
    public partial class AskConsoles : System.Web.UI.Page
    {
        public int gameid { get; set; }
        public int VGConID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            gameid = (int)Session["gameid"];
            using (var context = new videogamesmgmtEntities())
            {
                Session["vgconid"] = context.videogamesconsoles.OrderByDescending(c => c.VGCon_ID).FirstOrDefault().VGCon_ID;
                var addedgame = (from r in context.videogames select r).Where(w => w.Game_ID == gameid).ToList();
                selectedGameGrid.DataSource = addedgame;
                selectedGameGrid.DataBind();
            }
            getConsolesGrid();
        }

        public void getConsolesGrid()
        {
            gameid = (int)Session["gameid"];
            using (var context = new videogamesmgmtEntities())
            {
                var cat = (from vg in context.videogames join vgc in context.videogamesconsoles on vg.Game_ID equals vgc.VGCon_Game_ID join cm in context.consoles on vgc.VGCon_Console_ID equals cm.Console_ID where vg.Game_ID == gameid select new { ReleaseID = vgc.VGCon_ID, GameName = vg.Game_Name, ConsoleName = cm.Console_Name, ConsoleType=cm.Console_Type }).ToList();
                consolesgrid.DataSource = cat;
                consolesgrid.DataBind();
            }
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            using (var context = new videogamesmgmtEntities())
            {
                Session["vgconid"] = Convert.ToInt32(Session["vgconid"]) + 1;
                VGConID = (int)Session["vgconid"];
                var _videogamesconsoles = context.Set<videogamesconsole>();
                _videogamesconsoles.Add(new videogamesconsole { VGCon_ID =  VGConID,VGCon_Game_ID=gameid,VGCon_Console_ID= Convert.ToInt32(ddlconsoles.SelectedValue)});
                context.SaveChanges();
               // Response.Write("Successfully added console for this game!!");
            }
            getConsolesGrid();
        }

        protected void consolesgrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = consolesgrid.SelectedRow;
            Session["selectedvgconid"]=Convert.ToInt32(gr.Cells[0].Text);
            Response.Redirect("AddContents.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoGamesMgmt.VGMgmt
{
    public partial class AddNewConsole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var context = new videogamesmgmtEntities())
            {
                Session["consoleid"] = context.consoles.OrderByDescending(c => c.Console_ID).FirstOrDefault().Console_ID;
            }
            setConsolesGrid();
        }

        public void setConsolesGrid()
        {
            using (var context = new videogamesmgmtEntities())
            {
                var cat = (from r in context.consoles select r).ToList();
                consolegrid.DataSource = cat;
                consolegrid.DataBind();
            }
        }

        protected void bthAdd_Click(object sender, EventArgs e)
        {
            using (var context = new videogamesmgmtEntities())
            {
                Session["consoleid"] = Convert.ToInt32(Session["consoleid"]) + 1;
                var consoles = context.Set<console>();
                consoles.Add(new console { Console_ID = Convert.ToInt32(Session["consoleid"]), Console_Name = txtConsoleName.Text, Console_Type = ddlConsoleType.SelectedValue });
                context.SaveChanges();
            }
            setConsolesGrid();
        }
    }
}
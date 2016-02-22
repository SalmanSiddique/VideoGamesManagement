using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VideoGamesMgmt.Startup))]
namespace VideoGamesMgmt
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

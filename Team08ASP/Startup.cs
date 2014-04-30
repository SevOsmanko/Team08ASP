using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Team08ASP.Startup))]
namespace Team08ASP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdventureLife.Controllers
{
    public class ActivityController : Controller
    {
        private AdventureLifeEntities db = new AdventureLifeEntities();

        // GET: Activity
        public ActionResult Index()
        {
            return View();
        }

        // GET: Activity = Bow tag
        public ActionResult Bowtag()
        {
            ViewBag.Details = db.activities.First(a => a.name == "Bow tag");
            return View();
        }

        // GET: Activity = Paintball
        public ActionResult Paintball()
        {
            ViewBag.Details = db.activities.First(a => a.name == "Paintball");
            return View();
        }

        // GET: Activity = Rock climbing
        public ActionResult Rockclimbing()
        {
            ViewBag.Details = db.activities.First(a => a.name == "Rock climbing");
            return View();
        }
    }
}
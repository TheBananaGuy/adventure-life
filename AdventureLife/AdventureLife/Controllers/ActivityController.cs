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

        // GET: Activity = Archery
        public ActionResult Archery()
        {
            ViewBag.Suffix = "arch";
            ViewBag.Details = db.activities.First(a => a.name == "Archery");
            return View();
        }

        // GET: Activity = Paintball
        public ActionResult Paintball()
        {
            ViewBag.Suffix = "paint";
            ViewBag.Details = db.activities.First(a => a.name == "Paintball");
            return View();
        }

        // GET: Activity = Rock climbing
        public ActionResult Rockclimbing()
        {
            ViewBag.Suffix = "rock";
            ViewBag.Details = db.activities.First(a => a.name == "Rock climbing");
            return View();
        }
    }
}
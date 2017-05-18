using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AdventureLife;
namespace AdventureLife.Areas.Admin.Controllers
{
    public class QualificationTypeController
    {
        private AdventureLifeEntities db = new AdventureLifeEntities();

        public ActionResult Index()
        {
            if (db.employees.employeeID == 1)
            {
                db.employees.employeeID = qualification.QualificationType.BowTag;
            }
            else if (db.employees.employeeID == 2)
            {
                db.employees.employeeID = qualification.QualificationType.Paintball;
            }
            else if (db.employees.employeeID == 3)
            {
                db.employees.employeeID = qualification.QualificationType.Rockclimbing;
            }
        }
    }
}
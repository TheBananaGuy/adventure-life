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
    public class TimeslotsController : Controller
    {
        private AdventureLifeEntities db = new AdventureLifeEntities();

        // GET: Admin/Timeslots
        public ActionResult Index()
        {
            return View(db.eventTimes.ToList());
        }

        // GET: Admin/Timeslots/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            eventTime eventTime = db.eventTimes.Find(id);
            if (eventTime == null)
            {
                return HttpNotFound();
            }
            return View(eventTime);
        }

        // GET: Admin/Timeslots/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Timeslots/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,startTime")] eventTime eventTime)
        {
            if (ModelState.IsValid)
            {
                db.eventTimes.Add(eventTime);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(eventTime);
        }

        // GET: Admin/Timeslots/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            eventTime eventTime = db.eventTimes.Find(id);
            if (eventTime == null)
            {
                return HttpNotFound();
            }
            return View(eventTime);
        }

        // POST: Admin/Timeslots/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,startTime")] eventTime eventTime)
        {
            if (ModelState.IsValid)
            {
                db.Entry(eventTime).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(eventTime);
        }

        // GET: Admin/Timeslots/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            eventTime eventTime = db.eventTimes.Find(id);
            if (eventTime == null)
            {
                return HttpNotFound();
            }
            return View(eventTime);
        }

        // POST: Admin/Timeslots/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            eventTime eventTime = db.eventTimes.Find(id);
            db.eventTimes.Remove(eventTime);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

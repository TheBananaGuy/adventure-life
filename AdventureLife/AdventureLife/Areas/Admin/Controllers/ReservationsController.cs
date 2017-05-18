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
    public class ReservationsController : Controller
    {
        private AdventureLifeEntities db = new AdventureLifeEntities();

        // GET: Admin/Reservations
        public ActionResult Index()
        {
            var reservations = db.reservations.Include(r => r.activity).Include(r => r.employee).Include(r => r.eventTime);
            return View(reservations.ToList());
        }

        // GET: Admin/Reservations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            reservation reservation = db.reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // GET: Admin/Reservations/Create
        public ActionResult Create()
        {
            ViewBag.activityID = new SelectList(db.activities, "id", "name");
            ViewBag.employeeID = new SelectList(db.employees, "id", "initial");
            ViewBag.eventTimeID = new SelectList(db.eventTimes, "id", "startTime");
            return View();
        }

        // POST: Admin/Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,phone,email,people,eventDate,eventTimeID,activityID,employeeID")] reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.reservations.Add(reservation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.activityID = new SelectList(db.activities, "id", "name", reservation.activityID);
            ViewBag.employeeID = new SelectList(db.employees, "id", "initial", reservation.employeeID);
            ViewBag.eventTimeID = new SelectList(db.eventTimes, "id", "startTime", reservation.eventTimeID);
            return View(reservation);
        }

        // GET: Admin/Reservations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            reservation reservation = db.reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            ViewBag.activityID = new SelectList(db.activities, "id", "name", reservation.activityID);
            ViewBag.employeeID = new SelectList(db.employees, "id", "initial", reservation.employeeID);
            ViewBag.eventTimeID = new SelectList(db.eventTimes, "id", "startTime", reservation.eventTimeID);
            return View(reservation);
        }

        // POST: Admin/Reservations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,phone,email,people,eventDate,eventTimeID,activityID,employeeID")] reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.activityID = new SelectList(db.activities, "id", "name", reservation.activityID);
            ViewBag.employeeID = new SelectList(db.employees, "id", "initial", reservation.employeeID);
            ViewBag.eventTimeID = new SelectList(db.eventTimes, "id", "startTime", reservation.eventTimeID);
            return View(reservation);
        }

        // GET: Admin/Reservations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            reservation reservation = db.reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // POST: Admin/Reservations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            reservation reservation = db.reservations.Find(id);
            db.reservations.Remove(reservation);
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

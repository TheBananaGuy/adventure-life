using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AdventureLife;

namespace AdventureLife.Controllers
{
    public class BookingController : Controller
    {
        private AdventureLifeEntities db = new AdventureLifeEntities();

        // GET: Booking/Create
        public ActionResult Index()
        {
            ViewBag.activityID = new SelectList(db.activities, "id", "name");
            ViewBag.eventTimeID = new SelectList(db.eventTimes, "id", "startTime");
            return View();
        }

        // POST: Booking/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index([Bind(Include = "id,name,phone,email,people,eventDate,eventTimeID,activityID")] reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.reservations.Add(reservation);
                db.SaveChanges();
                // ViewBag.Booking = reservation;
                // then send email
                ViewBag.Bread = "Booking";
                return RedirectToAction("Confirm", reservation);
            }

            ViewBag.activityID = new SelectList(db.activities, "id", "name", reservation.activityID);
            ViewBag.eventTimeID = new SelectList(db.eventTimes, "id", "startTime", reservation.eventTimeID);
            return View();
        }

        public ActionResult Confirm(reservation reservation)
        {
            if (reservation == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            reservation booked = db.reservations.Find(reservation.id);
            if (booked == null)
            {
                return HttpNotFound();
            }
            return View(booked);
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

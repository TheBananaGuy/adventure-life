using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdventureLife.Areas.Admin.Controllers
{
    public class qualification
    {
        public int EmployeeID { get; set; }
        public int ActivityID { get; set; }

        public QualificationType empType;

        public enum QualificationType
        {
            BowTag,
            Rockclimbing,
            Paintball
        }

        //constructors
        public qualification() { }


        public qualification(int employeeID, int activityID, QualificationType type)
        {
            this.EmployeeID = employeeID;
            this.ActivityID = activityID;
            this.empType = type;
        }



    }
}
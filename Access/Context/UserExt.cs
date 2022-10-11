using System;
using System.Collections.Generic;

#nullable disable

namespace Access.Context
{
    public partial class UserExt
    {
        public string Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int AccessType { get; set; }
        public string Country { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public bool UserCompletedProfile { get; set; }
    }
}

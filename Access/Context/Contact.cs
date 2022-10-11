using System;
using System.Collections.Generic;

#nullable disable

namespace Access.Context
{
    public partial class Contact
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string ContactType { get; set; }
        public string ContactNumber { get; set; }
    }
}

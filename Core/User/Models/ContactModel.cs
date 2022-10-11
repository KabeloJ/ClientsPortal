using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.User.Models
{
    public class ContactModel
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        [Display(Name = "Contact Type")]
        [Required(ErrorMessage = "Type required")]
        public string ContactType { get; set; }
        [Display(Name = "Contact Number")]
        [Required(ErrorMessage = "Number required")]
        public string ContactNumber { get; set; }
    }
}

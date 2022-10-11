using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.User.Models
{
    public class UserExtModel
    {
        public string Id { get; set; }
        [Required(ErrorMessage = "Firstname is required")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Lastname is required")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        public int AccessType { get; set; }
        public string Country { get; set; }
        public string Gender { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public DateTime DateOfBirth { get; set; }
        public bool UserCompletedProfile { get; set; }
        public List<InterestModel> Interests { get; set; }
        public List<ContactModel> Contacts { get; set; }

    }
}

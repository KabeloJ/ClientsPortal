using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.User.Models
{
    public class InterestModel
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        [Required]
        [Display(Name = "Interest")]
        public string Interest1 { get; set; }
    }
}

using Core.User.Application;
using Core.User.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using StudentPortal.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace StudentPortal.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserServices _userServices;


        public HomeController(ILogger<HomeController> logger, UserManager<IdentityUser> userManager, SignInManager<IdentityUser> signInManager, IUserServices userServices)
        {
            _userServices = userServices;
            _logger = logger;
            _userManager = userManager;
            _signInManager = signInManager;
        }
        [Authorize]
        public IActionResult Index()
        {
            var user = _userServices.GetUser(_userManager.GetUserId(User));
            if (user == null)
                return Redirect("/Identity/Account/Login");
            else
            {
                if (!user.UserCompletedProfile) 
                {
                    return Redirect($"/User/Edit/{user.Id}");
                }
            }
            return View(user);
        }
        #region Contacts
        public IActionResult Contacts()
        {
            var contacts = _userServices.GetContacts(_userManager.GetUserId(User));
            return View(contacts);
        }

        public IActionResult AddContact()
        {
            var userId = _userManager.GetUserId(User);
            return View(new ContactModel() { UserId = userId });
        }
        [HttpPost]
        public IActionResult AddContact([FromBody]ContactModel model)
        {
            if (model != null)
                model.UserId = _userManager.GetUserId(User);
            if (ModelState.IsValid)
            {
                _userServices.CreateContact(model);
                return Ok();
            }
            else
            {
                return BadRequest("Contact type & number are required");
            }
        }
        #endregion

        #region Interests
        public IActionResult Interests()
        {
            var interets = _userServices.GetInterets(_userManager.GetUserId(User));
            return View(interets);
        }
        public IActionResult AddInterest()
        {
            var userId = _userManager.GetUserId(User);
            return View(new InterestModel() { UserId = userId });
        }

        [HttpPost]
        public IActionResult AddInterest([FromBody]InterestModel model)
        {
            if (model != null)
                model.UserId = _userManager.GetUserId(User);
            if (ModelState.IsValid)
            {
                _userServices.CreateInterest(model);
                return Ok();
            }
            else
            {
                return BadRequest("Interest is required");
            }
        }
        #endregion
        
        [Authorize]
        public IActionResult Account()
        {
            var accountModel = _userServices.GetUser(_userManager.GetUserId(User));
            return View(accountModel);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

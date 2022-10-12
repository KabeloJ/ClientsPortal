using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using Core.User.Application;
using Core.User.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.EntityFrameworkCore;

namespace ClientsPortal.Controllers
{
    public class UserController : Controller
    {
        private readonly IUserServices _userServices;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;

        public UserController(IUserServices userServices, SignInManager<IdentityUser> signInManager, UserManager<IdentityUser> userManager)
        {
            _userServices = userServices;
            _signInManager = signInManager;
            _userManager = userManager;
        }
        [Authorize]
        public IActionResult Index()
        {
            return View();
        }
        [Authorize]
        public IActionResult AllUsers()
        {
            var user = _userServices.GetUser(_userManager.GetUserId(User));
            if (user != null && user.AccessType > 0)
            {
                var users = _userServices.GetUsers();
                return View(users);
            }
            return Unauthorized();
        }

        // GET: User/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var user = _userServices.GetUser(_userManager.GetUserId(User));
            if (user != null)
            {
                var userExt = _userServices.GetUser(id);
                if (user.AccessType > 0)
                {
                    userExt.AdminViewing = true;
                }
                if (userExt != null)
                {
                    return View(userExt);
                }
            }
            return NotFound();
        }
        [Authorize]
        public async Task<IActionResult> ResetPassword(string id)
        {
            if (id != null)
            {
                var currentUser = _userServices.GetUser(_userManager.GetUserId(User));
                if (currentUser != null && currentUser.AccessType > 0)
                {
                    var user = await _userManager.FindByIdAsync(id);
                    if (user == null || !(await _userManager.IsEmailConfirmedAsync(user)))
                    {
                        return Redirect("/Home/Error");
                    }

                    // For more information on how to enable account confirmation and password reset please 
                    // visit https://go.microsoft.com/fwlink/?LinkID=532713
                    var code = await _userManager.GeneratePasswordResetTokenAsync(user);
                    code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                    string email = user.Email;
                    var callbackUrl = Url.Page(
                        "/Account/ResetPassword",
                        pageHandler: null,
                        values: new { area = "Identity", code },
                        protocol: Request.Scheme);
                    string redirectUrl = HtmlEncoder.Default.Encode(callbackUrl);
                    redirectUrl = redirectUrl + "&email=" + email;
                    return Redirect(redirectUrl);
                }
                return Unauthorized();
            }
            return NotFound();
        }
        [Authorize]
        public IActionResult Details(string id)
        {
            var userExt = _userServices.GetUser(id);
            if (userExt != null)
            {
                return View(userExt);
            }
            else
            {
                return NotFound();
            }
        }
        [Authorize]
        public IActionResult DetailsPage(string id)
        {
            ViewData["Id"] = id;
            return View();
        }

        // POST: User/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,FirstName,LastName,AccessType,Country,Gender,DateOfBirth,UserCompletedProfile")] UserExtModel userExt)
        {
            if (id != userExt.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                userExt.UserCompletedProfile = true;
                _userServices.Update(userExt);
                return Redirect("/");
            }
            return View(userExt);
        }
    }
}

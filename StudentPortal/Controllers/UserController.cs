using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ClientsPortal.Models;
using Core.User.Application;
using Core.User.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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

            var userExt = _userServices.GetUser(id);
            if (userExt == null)
            {
                return NotFound();
            }
            return View(userExt);
        }
        //[Authorize]
        //public IActionResult ResetPassword(string id)
        //{
        //    if (id != null)
        //    {
        //        var user = _userServices.GetUser(_userManager.GetUserId(User));
        //        if (user != null && user.AccessType > 0)
        //        {
        //            return View(new PasswordModel() { UserId = id });
        //        }
        //        return Unauthorized();
        //    }
        //    return NotFound();
        //}
        //[Authorize]
        //public IActionResult ResetPassword(PasswordModel model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var user = _userServices.GetUser(_userManager.GetUserId(User));
        //        if (user != null && user.AccessType > 0)
        //        {
        //            var result = await _userManager.ResetPasswordAsync(user, Input.Code, Input.Password);
        //        }
        //        return BadRequest();
        //    }
        //    return View(model);
        //}
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

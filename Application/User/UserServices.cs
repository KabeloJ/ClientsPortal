using Core.User.Access;
using Core.User.Application;
using Core.User.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.User
{
    public class UserServices : IUserServices
    {
        private readonly IUserAccess _data;
        private readonly IInterestsAccess _interests;
        private readonly IContactAccess _contacts;
        private readonly IAspUserAccess _aspUsers;
        public UserServices(IUserAccess data, IContactAccess contactAccess, IInterestsAccess interestsAccess, IAspUserAccess aspUsers)
        {
            _aspUsers = aspUsers;
            _data = data;
            _interests = interestsAccess;
            _contacts = contactAccess;
        }
        public UserExtModel GetUser(string id)
        {
            var model = _data.GetById(id);
            if (model != null)
            {
                model.Interests = GetInterets(id);
                model.Contacts = GetContacts(id);
            }
            return model;
        }

        public List<ContactModel> GetContacts(string id)
        {
            var model = new List<ContactModel>();
            List<ContactModel> contacts = _contacts.GetByUserId(id);
            if (contacts != null && contacts.Count > 0)
            {
                model = contacts;
            }
            else
            {
                model= new List<ContactModel>() { 
                new ContactModel(){UserId=id},
                };
            }
            return model;
        }
        public List<InterestModel> GetInterets(string id)
        {

            var model = new List<InterestModel>();
            List<InterestModel> interests = _interests.GetByUserId(id);
            if (interests != null && interests.Count > 0)
            {
                model = interests;
            }
            else
            {
                model = new List<InterestModel>() {
                new InterestModel(){UserId = id}
                };
            }
            return model;
        }
        List<UserExtModel> MapAspUsers(List<UserExtModel> users, List<UserExtModel> aspUsers)
        {
            var newUsers = new List<UserExtModel>();
            foreach (var aspUser in aspUsers)
            {
                var u = users.Where(x => x.Id == aspUser.Id).FirstOrDefault();
                if (u == null)
                {
                    u = new UserExtModel();
                }
                newUsers.Add(new UserExtModel()
                {
                    AccessType = u.AccessType,
                    DateOfBirth = u.DateOfBirth,
                    Email = aspUser.Email,
                    UserCompletedProfile = u.UserCompletedProfile,
                    FirstName = u.FirstName,
                    LastName = u.LastName,
                    Id = aspUser.Id,
                    UserName = aspUser.UserName,
                    Country = u.Country,
                    Gender = u.Gender

                });
            }
            return newUsers;
        }
        public List<UserExtModel> GetUsers()
        {
            var aspUsers = _aspUsers.GetUsers();
            if (aspUsers != null && aspUsers.Count > 0)
            {
                var models = _data.GetAll();
                if (models != null)
                {
                    models = MapAspUsers(models, aspUsers);
                }
                return models;
            }
            return null;
        }
        public UserExtModel Update(UserExtModel model)
        {
            if (model != null)
            {
                _data.Update(model);
                return model;
            }
            return model;
        }
        public UserExtModel Register(UserExtModel model)
        {
            if (model != null)
            {
                model.Id= _data.Create(model);
                return model;
            }
            return null;
        }

        public int CreateContact(ContactModel model)
        {
            return _contacts.Create(model);
        }

        public int CreateInterest(InterestModel model)
        {
            return _interests.Create(model);
        }
    }
}

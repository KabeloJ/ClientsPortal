using Core.User.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.User.Application
{
    public interface IUserServices
    {
        List<ContactModel> GetContacts(string id);
        List<InterestModel> GetInterets(string id);
        UserExtModel Update(UserExtModel model);
        UserExtModel Register(UserExtModel model);
        List<UserExtModel> GetUsers();
        UserExtModel GetUser(string id);
        int CreateContact(ContactModel model);
        int CreateInterest(InterestModel model);
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.User.Models;

namespace Core.User.Access
{
    public interface IUserAccess
    {
        string Create(UserExtModel model);
        string Update(UserExtModel model);
        List<UserExtModel> GetAll();
        UserExtModel GetById(string id);
    }
}

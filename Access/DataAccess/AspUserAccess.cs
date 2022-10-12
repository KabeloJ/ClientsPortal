using Access.ContextIdentity;
using Core.User.Access;
using Core.User.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Access.DataAccess
{
    public class AspUserAccess: IAspUserAccess
    {
        public UserExtModel GetUser(string Id)
        {
            using (var db = new ClientsPortalContext())
            {
                var data = db.AspNetUsers.Select(x => new { x.UserName, x.Email, x.Id })
                    .Where(x => x.Id == Id).FirstOrDefault();
                var user = new UserExtModel();
                if (data != null)
                {
                    user.Id = data.Id;
                    user.UserName = data.UserName;
                    user.Email = data.Email;
                }
                return user;
            }
        }

        public List<UserExtModel> GetUsers()
        {
            using (var db = new ClientsPortalContext())
            {
                var data = db.AspNetUsers.Select(x => new { x.Id, x.NormalizedEmail, x.UserName }).ToList();
                var model = new List<UserExtModel>();
                foreach (var item in data)
                {
                    model.Add(new UserExtModel()
                    {
                        Email = item.NormalizedEmail,
                        UserName = item.UserName,
                        Id = item.Id,
                    });
                }
                return model;
            }
        }
    }
}

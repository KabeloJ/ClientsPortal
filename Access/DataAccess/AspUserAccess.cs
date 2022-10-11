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

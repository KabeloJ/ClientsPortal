using Access.Context;
using AutoMapper;
using Core.User.Access;
using Core.User.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Access.DataAccess
{
    public class UserAccess : IUserAccess
    {
        private readonly IMapper _map;
        public UserAccess(IMapper map)
        {
            _map = map;
        }
        public string Create(UserExtModel model)
        {
            using (var db = new ClientsPortalContext())
            {
                var data = _map.Map<UserExt>(model);
                db.UserExts.Add(data);
                db.SaveChanges();
                return data.Id;
            }
        }

        public List<UserExtModel> GetAll()
        {
            using (var db = new ClientsPortalContext())
            {
                var models = db.UserExts.AsQueryable();
                return _map.Map<List<UserExtModel>>(models);
            }
        }

        public UserExtModel GetById(string id)
        {
            using (var db = new ClientsPortalContext())
            {
                var model = db.UserExts.Find(id);
                return _map.Map<UserExtModel>(model);
            }
        }

        public string Update(UserExtModel model)
        {
            using (var db = new ClientsPortalContext())
            {
                var data = _map.Map<UserExt>(model);
                var target = db.UserExts.Find(model.Id);
                db.Entry(target).CurrentValues.SetValues(data);
                db.SaveChanges();
                return data.Id;
            }
        }
    }
}

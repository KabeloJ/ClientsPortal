using Access.Context;
using AutoMapper;
using Core.User.Access;
using Core.User.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Access.DataAccess
{
    public class InterestsAccess: IInterestsAccess
    {
        private readonly IMapper _map;
        public InterestsAccess(IMapper map)
        {
            _map = map;
        }
        public int Create(InterestModel model)
        {
            using (var db = new ClientsPortalContext())
            {
                var data = _map.Map<Interest>(model);
                db.Interests.Add(data);
                db.SaveChanges();
                return data.Id;
            }
        }

        public List<InterestModel> GetByUserId(string id)
        {
            using (var db = new ClientsPortalContext())
            {
                var data = db.Interests.Where(x => x.UserId == id).ToList();
                return _map.Map<List<InterestModel>>(data);
            }
        }
    }
}

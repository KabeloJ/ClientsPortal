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
    public class ContactAccess : IContactAccess
    {
        private readonly IMapper _map;
        public ContactAccess(IMapper map)
        {
            _map = map;
        }
        public int Create(ContactModel model)
        {
            using (var db = new ClientsPortalContext())
            {
                var data = _map.Map<Contact>(model);
                db.Contacts.Add(data);
                db.SaveChanges();
                return data.Id;
            }
        }

        public List<ContactModel> GetByUserId(string id)
        {
            using (var db = new ClientsPortalContext())
            {
                var data = db.Contacts.Where(x => x.UserId == id).ToList();
                return _map.Map<List<ContactModel>>(data);
            }
        }
    }
}

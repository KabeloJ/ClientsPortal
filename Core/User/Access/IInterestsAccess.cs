using Core.User.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.User.Access
{
    public interface IInterestsAccess
    {
        List<InterestModel> GetByUserId(string id);
        int Create(InterestModel model);
    }
}

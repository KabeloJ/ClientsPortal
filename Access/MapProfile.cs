using Access.Context;
using AutoMapper;
using Core.User.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Access
{
    public class MapProfile : Profile
    {
        public MapProfile()
        {
            //Map your DBContext with Models
            CreateMap<Contact, ContactModel>().ReverseMap();
            CreateMap<Interest, InterestModel>().ReverseMap();
            CreateMap<UserExt, UserExtModel>().ReverseMap();
        }
    }
}

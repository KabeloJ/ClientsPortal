using Access.DataAccess;
using Core.User.Access;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using AutoMapper;
using System;

namespace Access
{
    public static class Bootstrapper
    {
        public static void AddDAL(this IServiceCollection services, IConfiguration config)
        {
            ConnectionString = config.GetConnectionString("DefaultConnection");

            services.AddSingleton<IUserAccess, UserAccess>();
            services.AddSingleton<IContactAccess, ContactAccess>();
            services.AddSingleton<IInterestsAccess, InterestsAccess>();
            services.AddSingleton<IAspUserAccess, AspUserAccess>();
            services.AddAutoMapper(typeof(MapProfile));
        }
        public static string ConnectionString { get; set; }
    }
}

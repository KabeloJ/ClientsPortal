using Application.User;
using Core.User.Application;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace Application
{
    public static class Boostrapper
    {
        public static void AddApp(this IServiceCollection services)
        {
            services.AddSingleton<IUserServices, UserServices>();
        }
    }
}

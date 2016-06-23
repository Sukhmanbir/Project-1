using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Project_1.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Project_1.IdentityExtensions
{
    class ApplicationUserManager : UserManager<IdentityUser>
    {
        public ApplicationUserManager() : base(new UserStore<IdentityUser>(new IdentityDbContext()))
         {
               PasswordValidator = new MinimumLengthValidator(10);
         }
}
}

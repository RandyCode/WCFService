﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Microsoft.Practices.Unity;
using System.ServiceModel.Activation;
using Repository;
using System.Threading.Tasks;
using Aspect;
using System.Transactions;

namespace Service
{
    //IIS 寄宿  -》 采用http协议   
    //WAS寄宿 ->协议： .net.tcp   .net.pipe .net.msmq
    //winform , console , window service 寄宿
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [Aop.Init]
    public class TestService : ITestService
    {
        [Dependency]
        public IDatabaseRepository DatabaseRepository { get; set; }


        //[Aop.BeforeMethod]
        //[Aop.WCFTransaction()]
        [Aop.VerifyAuthority]
        public User GetData()
        {
            Console.WriteLine("utils.dowork");

            return new User();
        }

        [Aop.CatchWcfException]
        public void ThrowFault()
        {
            int j = 1;
            int i = 1 / (j-1);
        }
    }


}

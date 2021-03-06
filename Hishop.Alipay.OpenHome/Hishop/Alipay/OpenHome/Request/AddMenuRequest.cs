﻿namespace Hishop.Alipay.OpenHome.Request
{
    using Hishop.Alipay.OpenHome.Model;
    using Newtonsoft.Json;
    using System;

    public class AddMenuRequest : IRequest
    {
        private Menu menu;

        public AddMenuRequest(Menu menu)
        {
            this.menu = menu;
        }

        public string GetBizContent()
        {
            JsonSerializerSettings settings = new JsonSerializerSettings {
                NullValueHandling = NullValueHandling.Ignore
            };
            return JsonConvert.SerializeObject(this.menu, settings);
        }

        public string GetMethodName()
        {
            return "alipay.mobile.public.menu.add";
        }
    }
}


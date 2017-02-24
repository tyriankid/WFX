﻿namespace Hidistro.Membership.Context
{
    using Hidistro.Core;
    using Hidistro.Membership.Core;
    using System;
    using System.Runtime.InteropServices;
    using System.Text.RegularExpressions;
    using System.Web;

    public class UserCookie : IUserCookie
    {
        private readonly HttpContext context = null;
        private readonly HiContext hiContext = HiContext.Current;

        public UserCookie(IUser user)
        {
            if (!((user == null) || user.IsAnonymous))
            {
                this.context = this.hiContext.Context;
            }
        }

        public void DeleteCookie(HttpCookie cookie)
        {
            if ((cookie != null) && (this.context != null))
            {
                this.SetCookieDomain(cookie);
                cookie.Expires = DateTime.Now.AddDays(-1.0);
                this.context.Response.Cookies.Add(cookie);
            }
        }

        private void SetCookieDomain(HttpCookie cookie)
        {
            Regex regex = new Regex(@"[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)+$", RegexOptions.Compiled | RegexOptions.IgnoreCase);
            if (regex.IsMatch(this.context.Request.Url.Host) && this.context.Request.Url.Host.ToLower().EndsWith(this.hiContext.SiteSettings.SiteUrl.ToLower()))
            {
                cookie.Path = "/";
                cookie.Domain = this.hiContext.SiteSettings.SiteUrl;
            }
        }

        public void WriteCookie(HttpCookie cookie, int days, bool autoLogin)
        {
            if ((cookie != null) && (this.context != null))
            {
                this.SetCookieDomain(cookie);
                if (autoLogin)
                {
                    cookie.Expires = DateTime.Now.AddDays((double) days);
                }
                this.context.Response.Cookies.Add(cookie);
            }
        }

        public void WriteStoreCookie(string UserName, int days = 0)
        {
            HttpCookie cookie = new HttpCookie("Store-Admin") {
                Value = HiCryptographer.Encrypt(Globals.UrlEncode(UserName))
            };
            if (days > 0)
            {
                cookie.Expires = DateTime.Now.AddDays((double) days);
            }
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public void WriteUserCookie(string UserName, int days)
        {
            HttpCookie cookie = new HttpCookie("Vshop-Member") {
                Value = HiCryptographer.Encrypt(Globals.UrlEncode(UserName))
            };
            if (days > 0)
            {
                cookie.Expires = DateTime.Now.AddDays((double) days);
            }
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
    }
}


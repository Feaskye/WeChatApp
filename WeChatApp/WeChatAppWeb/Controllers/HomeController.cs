using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeChatApp.Common;

namespace WeChatAppWeb.Controllers
{
    public class HomeController : Controller
    {
        /// <summary>
        /// https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1421141115
        /// https://www.cnblogs.com/wangqiideal/p/8041724.html
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            var appId = System.Configuration.ConfigurationManager.AppSettings["AppId"];
            var appSecret = System.Configuration.ConfigurationManager.AppSettings["AppSecret"];
            JsSdkHelper jssdk = new JsSdkHelper(appId, appSecret);
            Hashtable hs = jssdk.getSignPackage();
            string signature = hs["signature"].ToString();
            string timestamp = hs["timestamp"].ToString();
            string nonce = hs["nonceStr"].ToString();

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
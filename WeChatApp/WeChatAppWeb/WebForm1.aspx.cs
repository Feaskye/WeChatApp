using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WeChatApp.Common;

namespace WeChatAppWeb
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        public string signature;
        public string timestamp;
        public string appId;
        public string nonce;
        public string WeChatImg;
        public string url;
        public string desc;
        public string title;
        protected void Page_Load(object sender, EventArgs e)
        {
            appId = System.Configuration.ConfigurationManager.AppSettings["AppId"];
            var appSecret = System.Configuration.ConfigurationManager.AppSettings["AppSecret"];
            JsSdkHelper jssdk = new JsSdkHelper(appId, appSecret);
            Hashtable hs = jssdk.getSignPackage();
            signature = hs["signature"].ToString();
            timestamp = hs["timestamp"].ToString();
            nonce = hs["nonceStr"].ToString();
        }
    }
}
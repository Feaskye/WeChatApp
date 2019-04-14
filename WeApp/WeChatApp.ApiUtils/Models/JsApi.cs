using System;
using System.Collections.Generic;
using System.Text;

namespace WeChatApp.ApiUtils.Models
{
    //创建Json序列化 及反序列化类目  
    #region
    //创建JSon类 保存文件 jsapi_ticket.json  
    public class JSTicket
    {

        public string jsapi_ticket { get; set; }

        public double expire_time { get; set; }
    }

    //创建 JSon类 保存文件 access_token.json  
    public class AccToken
    {

        public string access_token { get; set; }

        public double expires_in { get; set; }
    }


    //创建从微信返回结果的一个类 用于获取ticket  
    public class Jsapi
    {

        public int errcode { get; set; }

        public string errmsg { get; set; }

        public string ticket { get; set; }

        public string expires_in { get; set; }
    }
    #endregion
}

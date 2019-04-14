<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WeChatAppWeb.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>微信分享功能测试</h3>

            <img src="海报图.jpg" width="300px" height="600px" />
        </div>
    </form>
    <div>
    
</div>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
<script type="text/javascript">
            var dataForWeixin = {
                appId: "<%=appId%>",
                MsgImg: "<%=WeChatImg%>",
                TLImg: "<%=WeChatImg%>",
                url: "<%=url%>",
                title: "<%=title%>",
                desc: "<%=desc%>",
                timestamp: '<%=timestamp%>',
                nonceStr: '<%=nonce%>',
                signature: '<%=signature%>',
                jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo'],
                fakeid: "",
                callback: function () { }
            };
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: dataForWeixin.appId, // 必填，公众号的唯一标识
                timestamp: dataForWeixin.timestamp, // 必填，生成签名的时间戳
                nonceStr: dataForWeixin.nonceStr, // 必填，生成签名的随机串
                signature: dataForWeixin.signature,// 必填，签名，见附录1
                jsApiList: dataForWeixin.jsApiList  // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });
            wx.ready(function () {
                //在此输入各种API
                //分享到朋友圈
                wx.onMenuShareTimeline({
                    title: dataForWeixin.title, // 分享标题
                    link: dataForWeixin.url, // 分享链接
                    imgUrl: dataForWeixin.MsgImg, // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });
                //分享给朋友
                wx.onMenuShareAppMessage({
                    title: dataForWeixin.title, // 分享标题
                    desc: dataForWeixin.desc, // 分享描述
                    link: dataForWeixin.url, // 分享链接
                    imgUrl: dataForWeixin.TLImg, // 分享图标
                    type: '', // 分享类型,music、video或link，不填默认为link
                    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });
                //QQ
                wx.onMenuShareQQ({
                    title: dataForWeixin.title, // 分享标题
                    desc: dataForWeixin.desc, // 分享描述
                    link: dataForWeixin.url, // 分享链接
                    imgUrl: dataForWeixin.MsgImg,// 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });
                //QQ微博
                wx.onMenuShareWeibo({
                    title: dataForWeixin.title, // 分享标题
                    desc: dataForWeixin.desc, // 分享描述
                    link: dataForWeixin.url, // 分享链接
                    imgUrl: dataForWeixin.TLImg, // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });
                // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，
                //所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
            });
            wx.error(function (res) {
                //alert(res);
                // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
            });
</script>
</body>
</html>

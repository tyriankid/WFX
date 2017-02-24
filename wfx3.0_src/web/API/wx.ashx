<%@ WebHandler Language="C#" Class="Hidistro.UI.Web.API.wx" %>

using System;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.IO;
using System.Web;
using Hidistro.Core;
using Hishop.Weixin.MP.Util;
using Hishop.Weixin.MP;
using Hishop.Weixin.MP.Request.Event;

namespace Hidistro.UI.Web.API
{
    public class wx : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            HttpRequest request = context.Request;

            //context.Response.Write(request.PhysicalApplicationPath);

            string weixinToken = SettingsManager.GetMasterSettings(false).WeixinToken;

            string signature = request["signature"];
            string nonce = request["nonce"];
            string timestamp = request["timestamp"];
            string echostr = request["echostr"];

            if (request.HttpMethod == "GET")
            {

                if (CheckSignature.Check(signature, timestamp, nonce, weixinToken))
                {
                    context.Response.Write(echostr);
                }
                else
                {
                    context.Response.Write("");
                }

                context.Response.End();

            }
            else
            {

                try
                {

                    #region 注释
                    //InputStream解析后的内容
                    //                    <xml>
                    //    <ToUserName><![CDATA[gh_dc0ab279f02f]]></ToUserName>
                    //    <FromUserName><![CDATA[oCM3zt5He8DK3qFTd7tctL3dlBoE]]></FromUserName>
                    //    <CreateTime>1421732431</CreateTime>
                    //    <MsgType><![CDATA[text]]></MsgType>
                    //    <Content><![CDATA[大转盘]]></Content>
                    //    <MsgId>6106294295011598972</MsgId>
                    //    <Encrypt><![CDATA[r0k6memfAlKPeVTX8A/KeFclN0oDtB2hNr8aPdJBZeiKesfQQViipGo8cw3vQFBTyJZbo1yNHCg6f8+Kok+UHkCUOHjZ7UB1uNHt3drruB4H/5UYEoIjGdk3Erq19lnx1Y4gvaNyPfsYr7oa2QDjeDWk7ynjhgPc3zIRKZmAECVvmJm2jZyz5va194J+8jSXzCUcI9Ll5znvdkyvPVSnOyB8SNEzjip13d58jY3pWYZGTD8Ug0BhwMEMQ4EDu7NU/Oxjbu5NKveQOgrlqBVygT2dwcKGDtkTDSNTzF+VvxeT+ryInxe+hripTbQSHRXFw4gBrnD+LDYDLVEi+E8s40zwlCWCcojf0oKuy05AYWec7/II0iIeXbo3C7QTIJ1sK++fROT2uZXK9/8Dkc82LnDbUG+agPnUCI2w1nDETJmjA5YEaEo1bwDQX6IViQAJyuy9+DRil6pkeDNV93NpVw==]]></Encrypt>
                    //</xml>

                    //using (XmlReader reader = XmlReader.Create(request.InputStream))
                    //{

                    //    XDocument RequestDocument = XDocument.Load(reader);

                    //    string msgType = "";
                    //    try
                    //    {
                    //        Hishop.Weixin.MP.AbstractRequest RequestMessage = RequestMessageFactory.GetRequestEntity(RequestDocument);
                    //        msgType = RequestMessage.MsgType.ToString();
                    //    }
                    //    catch { }

                    //    StreamWriter wreq = File.AppendText(context.Server.MapPath("mylogoA.txt"));
                    //    // wreq.WriteLine(request.PhysicalApplicationPath);
                    //    // wreq.WriteLine("msgType=" + msgType);
                    //    wreq.WriteLine(RequestDocument.ToString());
                    //    wreq.Flush();
                    //    wreq.Close();
                    //}
                    #endregion

                    //                    CustomMsgHandler handler = new CustomMsgHandler(@"
                    //                                                                              <xml>
                    //                                                                                <ToUserName><![CDATA[gh_79df89059edb]]></ToUserName>
                    //                                                                                <FromUserName><![CDATA[os4vXsuUzJg0XhQNZBA5v05uoaOs]]></FromUserName>
                    //                                                                                <CreateTime>1437749773</CreateTime>
                    //                                                                                <MsgType><![CDATA[text]]></MsgType>
                    //                                                                                <Content>
                    //                                                                                  <![CDATA[呵呵]]>
                    //                                                                                </Content>
                    //                                                                                <MsgId>6175088255077806429</MsgId>
                    //                                                                              </xml>");

                    CustomMsgHandler handler = new CustomMsgHandler(@"<xml>
                                                                        <ToUserName><![CDATA[toUser]]></ToUserName>
                                                                        <FromUserName><![CDATA[fromUser]]></FromUserName>
                                                                        <CreateTime>123456789</CreateTime>
                                                                        <MsgType><![CDATA[event]]></MsgType>
                                                                        <Event><![CDATA[LOCATION]]></Event>
                                                                        <Latitude>23.137466</Latitude>
                                                                        <Longitude>113.352425</Longitude>
                                                                        <Precision>119.385040</Precision>
                                                                        </xml>");

                    //CustomMsgHandler handler = new CustomMsgHandler(request.InputStream);

                    handler.Execute();

                    AbstractRequest req = handler.RequestMessage as LocationEventRequest;
                    //   if (handler.RequestMessage.MsgType != Hishop.Weixin.MP.RequestMsgType.Event)
                    if (null == req)//&& req.MsgType != RequestMsgType.Location)
                    {
                        // string file = context.Server.MapPath("log.txt");
                        //File.AppendAllText(file, "未匹配时类型:" + handler);
                        // File.AppendAllText(file, "MsgType:" + handler.ResponseMessage.MsgType.ToString());
                        context.Response.Write(handler.ResponseDocument);
                        #region 返回给微信日志
                        //StreamWriter wreq = File.AppendText(context.Server.MapPath("RET.txt"));
                        //wreq.WriteLine("handler.RequestMessage.MsgType=" + handler.RequestMessage.MsgType);
                        //wreq.WriteLine(handler.ResponseDocument);
                        //wreq.Flush();
                        //wreq.Close();
                        #endregion
                    }
                }
                catch (Exception exception)
                {
                    string file = context.Server.MapPath("error.txt");

                    StreamWriter writer = File.AppendText(file);

                    StringBuilder logstr = new StringBuilder();

                    logstr.Append(file + Environment.NewLine);

                    if (!string.IsNullOrEmpty(signature))
                        logstr.AppendFormat("signature={0}", signature);

                    if (!string.IsNullOrEmpty(nonce))
                        logstr.AppendFormat("&nonce={0}", nonce);

                    if (!string.IsNullOrEmpty(timestamp))
                        logstr.AppendFormat("&timestamp={0}", timestamp);

                    if (!string.IsNullOrEmpty(echostr))
                        logstr.AppendFormat("&echostr={0}", echostr);

                    //if(logstr.Length == 0) logstr.

                    writer.Write("logstr=" + logstr.ToString());

                    // writer.Write(string.Format("signature={0}&nonce={1}&timestamp=[2}&echostr={3}\r\n", signature, nonce, timestamp, echostr));
                    writer.WriteLine(exception.Message);
                    writer.WriteLine(exception.StackTrace);
                    writer.Flush();
                    writer.Close();
                }

            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}

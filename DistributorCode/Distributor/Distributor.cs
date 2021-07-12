using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using IBatisNet.DataMapper;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;
using System.Net.Mail;
using System.IO;
using System.Net.Mime;
using System.Text.RegularExpressions;
using com.topdev.aa.data;
using System.Xml.Linq;

namespace Distributor
{
    public class Distributor
    {
        /// <summary>
        /// Starts the Distributor
        /// </summary>
        public static void Start()
        {
            ServiceLogging.LogDebug("Reading Notification List from the database");
            IList ListNotifications = Helpers.NotificationInformation().SelectAll();//Read the new notifications.


            //Scan the notification list one by one.
            ServiceLogging.LogDebug("Scan Notification List");
            foreach (bobjNotificationInformation Notfinfo in ListNotifications)
            {
                bobjNotificationInformation Ni = Notfinfo;
                if (Ni.notificationEventDirectInformation != null)
                {
                    Ni = OpenInformation(Ni);
                }

                ServiceLogging.LogDebug("Calling the method to add the format with the xslt file");
                string MessageBody = XsltTransform(Ni);

                //Check the communication method decode 

                ServiceLogging.LogDebug("Checking the communication method decode");
                if (Ni.communicationMethodDecode.ToUpper() == "EMAIL")
                {
                    SendEmail(Ni, MessageBody);
                }
                if (Ni.communicationMethodDecode.ToUpper() == "SMS")
                {
                    SendEmail(Ni, MessageBody);
                }

                Helpers.Notification().MarkAsSent(Ni.notificationId);
            }


        }
        /// <summary>
        /// Add the format to the xml information.
        /// </summary>
        /// <param name="XsltName"></param>
        /// <param name="XmlString"></param>
        /// <returns></returns>
        static string XsltTransform(bobjNotificationInformation Ni)
        {
            string st = "";
            ServiceLogging.LogDebug("Converting the xml string");
            XmlDocument Xml = new XmlDocument();
            if (Ni.notificationEventDirectInformation != null)
            {
                try
                {

                    Xml.LoadXml(Ni.notificationEventDirectInformation);
                }
                catch (Exception ex)
                {
                    ServiceLogging.LogError(ex);
                }

            }
            else
            {
                try
                {

                    Xml.LoadXml(Ni.notificationInformation);
                }
                catch (Exception ex)
                {
                    ServiceLogging.LogError(ex);
                }

            }


            try
            {

                XDocument xsltFile = new XDocument();
                XslCompiledTransform xslt = new XslCompiledTransform();
                xslt.Load(XmlReader.Create(new StringReader(Ni.notificationTextText)));
                ServiceLogging.LogDebug("Transform the xml with the xslt file");
                MemoryStream stm = new MemoryStream();
                xslt.Transform(Xml, null, stm);
                stm.Position = 0;
                StreamReader sr = new StreamReader(stm);
                st = sr.ReadToEnd();

            }
            catch (Exception ex)
            {
                ServiceLogging.LogError(ex);
            }
            return st;

        }



        /// <summary>
        /// Sends email
        /// </summary>
        /// <param name="Ni"></param>
        /// <param name="MessageBody"></param>
        /// <param name="attachments"></param>
        static void SendEmail(bobjNotificationInformation Ni, string MessageBody)
        {
            ServiceLogging.LogDebug("sending email method");

            MailMessage msg = new MailMessage();
            msg.To.Add(new MailAddress(Ni.deviceAddress));


            if (Ni.subscriptionTypeEmailCc != null)
            {
                if (Ni.subscriptionTypeEmailCc.Contains(","))
                {
                    string[] addrs = Ni.subscriptionTypeEmailCc.Split(new char[] { ',' }, StringSplitOptions.None);
                    foreach (string email in addrs)
                    {
                        msg.CC.Add(email);
                    }
                }
                else
                {
                    msg.CC.Add(Ni.subscriptionTypeEmailCc);
                }
            }

            if (Ni.notificationEventEmailCc != null)
            {
                if (Ni.notificationEventEmailCc.Contains(","))
                {
                    string[] addrs = Ni.notificationEventEmailCc.Split(new char[] { ',' }, StringSplitOptions.None);
                    foreach (string email in addrs)
                    {
                        msg.CC.Add(email);
                    }
                }
                else
                {
                    msg.CC.Add(new MailAddress(Ni.notificationEventEmailCc));
                }
            }

            if (Ni.subscriptionTypeEmailBcc != null)
            {
                if (Ni.subscriptionTypeEmailBcc.Contains(","))
                {
                    string[] addrs = Ni.subscriptionTypeEmailBcc.Split(new char[] { ',' }, StringSplitOptions.None);
                    foreach (string email in addrs)
                    {
                        msg.Bcc.Add(email);
                    }
                }
                else
                {
                    msg.Bcc.Add(new MailAddress(Ni.subscriptionTypeEmailBcc));
                }
            }

            if (Ni.notificationEventEmailBcc != null)
            {
                if (Ni.notificationEventEmailBcc.Contains(","))
                {
                    string[] addrs = Ni.notificationEventEmailBcc.Split(new char[] { ',' }, StringSplitOptions.None);
                    foreach (string email in addrs)
                    {
                        msg.Bcc.Add(email);
                    }
                }
                else
                {
                    msg.Bcc.Add(new MailAddress(Ni.notificationEventEmailBcc));
                }
            }

            msg.From = new MailAddress(Ni.subscriptionTypeEmailAddress);

            if (Ni.subscriptionTypeReplyAddress != null)
                msg.ReplyTo = new MailAddress(Ni.subscriptionTypeReplyAddress);

            msg.Subject = EmailSubject(Ni);

            msg.Body = MessageBody.Replace("<?xml version=\"1.0\" encoding=\"utf-8\"?>", "");


            if (Ni.notificationEventAttachment != null)
            {
                ServiceLogging.LogDebug("if attachment");
                IList Attachments = new List<bobjAttachments>();
                Attachments = GetAttachments(Ni.notificationEventAttachment);

                foreach (bobjAttachments attach in Attachments)
                {
                    ServiceLogging.LogDebug("adding attachments");
                    MemoryStream ms = new MemoryStream(attach.anlaDatei);

                    Attachment attached = new Attachment(ms, attach.anlaName, MediaTypeNames.Application.Octet);

                    msg.Attachments.Add(attached);

                }
            }

            ServiceLogging.LogDebug("server");
            SmtpClient clienteSmtp = new SmtpClient(Helpers.SystemEinstellungen().SelectServer());

            clienteSmtp.Credentials = new System.Net.NetworkCredential(Helpers.SystemEinstellungen().SelectUser(),
                Helpers.SystemEinstellungen().SelectPassw());



            try
            {
                ServiceLogging.LogDebug("Sending the email");
                clienteSmtp.Send(msg);

            }

            catch (Exception ex)
            {
                ServiceLogging.LogError(ex);
            }

        }


        /// <summary>
        /// Creates a list for the attachments
        /// </summary>
        /// <param name="xml"></param>
        /// <returns></returns>
        public static IList GetAttachments(string xml)
        {
            ServiceLogging.LogDebug("reading attachments from xml");
            ServiceLogging.LogDebug("GetXmlParameters()");
            XmlDocument xDoc = new XmlDocument();

            xDoc.LoadXml(xml);
            //necessary commands for scanning the xml data
            XmlNodeList XmlData = xDoc.GetElementsByTagName("attachments");
            XmlNodeList List = ((XmlElement)XmlData[0]).GetElementsByTagName("attachment");
            IList AttachmentList = new List<bobjAttachments>();
            for (int i = 0; i < List.Count; i++)
            {
                XmlAttributeCollection xmlattrc = List[i].Attributes;
                bobjAttachments b = null;

                //all the attributes of the xml data are read and added into the bobjXmlData object
                foreach (XmlAttribute xmlattr in xmlattrc)
                {
                    if (xmlattr.Name == "id")
                    {
                        bobjAttachments Attachment = new bobjAttachments();
                        Attachment.anlaId = xmlattr.Value.ToString();
                        b = ((bobjAttachments)Helpers.Attachments().GetFile(Attachment));
                    }

                }
                //and then added into the list
                AttachmentList.Add(b);

            }
            ServiceLogging.LogDebug("there are: " + AttachmentList.Count + " attachments");
            return AttachmentList;
        }

        /// <summary>
        /// Checks if the subject is dynamic or just returns the subject of the email.
        /// </summary>
        /// <param name="Ni"></param>
        /// <returns></returns>
        public static string EmailSubject(bobjNotificationInformation Ni)
        {
            ServiceLogging.LogDebug("EmailSubject()");
            XmlDocument xDoc = new XmlDocument();
            xDoc.LoadXml(Ni.subscriptionTypeEmailSubject);
            XmlNodeList XmlData = xDoc.GetElementsByTagName("xmldata");
            XmlNodeList Data = ((XmlElement)XmlData[0]).GetElementsByTagName("data");
            string Subject = Data[0].Attributes[0].Value;

            ServiceLogging.LogDebug("Checking if the subject is dynamic");
            if (Ni.subscriptionTypeIsDynamicSub == "1")//Checks if the subject is dynamic.
            {
                XmlNodeList Fields = ((XmlElement)XmlData[0]).GetElementsByTagName("fields");
                XmlNodeList Field = ((XmlElement)XmlData[0]).GetElementsByTagName("field");


                foreach (XmlNode node in Field)
                {
                    ServiceLogging.LogDebug("Replacing the attributes in the email subject");
                    if (Ni.notificationEventDirectInformation != null)
                    {
                        Subject = Subject.Replace("#" + node.Attributes[0].Value + "#",
                                FindField(Ni.notificationEventDirectInformation, node.Attributes[0].Value));
                        //Calls the FindField method to find the correct fields to replace in the subject.
                    }
                    else
                    {
                        Subject = Subject.Replace("#" + node.Attributes[0].Value + "#",
                                FindField(Ni.notificationInformation, node.Attributes[0].Value));
                        //Calls the FindField method to find the correct fields to replace in the subject.
                    }
                }
            }
            return Subject;
        }


        /// <summary>
        /// If the subject is dynamic, finds the fields and replaces the subject with them.
        /// </summary>
        /// <param name="NotificationXml"></param>
        /// <param name="Field"></param>
        /// <returns></returns>
        public static string FindField(string NotificationXml, string Field)
        {
            ServiceLogging.LogDebug("FindField()");
            string value = "";
            XmlDocument xDoc = new XmlDocument();
            xDoc.LoadXml(NotificationXml);
            XmlNodeList XmlData = xDoc.GetElementsByTagName("xmldata");
            XmlNodeList Data = ((XmlElement)XmlData[0]).GetElementsByTagName("data");

            XmlAttributeCollection xmlattrc = Data[0].Attributes;
            foreach (XmlAttribute attribute in xmlattrc)
            {
                ServiceLogging.LogDebug("Compares the fields to find matches");
                if (attribute.Name == Field)
                {
                    value = attribute.Value;
                }
            }

            return value;
        }



        /// <summary>
        /// Opens the xml information in case it is a direct notification(without subscription)
        /// </summary>
        /// <param name="Ni"></param>
        /// <returns></returns>
        public static bobjNotificationInformation OpenInformation(bobjNotificationInformation Ni)
        {
            ServiceLogging.LogDebug("OpenInformation()");
            XmlDocument xDoc = new XmlDocument();
            xDoc.LoadXml(Ni.notificationEventDirectInformation);
            XmlNodeList XmlData = xDoc.GetElementsByTagName("xmldata");
            XmlNodeList List = ((XmlElement)XmlData[0]).GetElementsByTagName("data");
            for (int i = 0; i < List.Count; i++)
            {
                XmlAttributeCollection xmlattrc = List[i].Attributes;
                foreach (XmlAttribute xmlattr in xmlattrc)
                {
                    ServiceLogging.LogDebug("Pass the xml information from NFEV_DIRECTINFORMATION into an object");
                    if (xmlattr.Name == "SBTP_EMAILADR")
                        Ni.subscriptionTypeEmailAddress = xmlattr.Value;
                    if (xmlattr.Name == "SBTP_EMAILSUB")
                        Ni.subscriptionTypeEmailSubject = xmlattr.Value;
                    if (xmlattr.Name == "SBTP_EMAILREPLYADR")
                        Ni.subscriptionTypeReplyAddress = xmlattr.Value;
                    if (xmlattr.Name == "SBTP_EMAILCC")
                        Ni.subscriptionTypeEmailCc = xmlattr.Value;
                    if (xmlattr.Name == "SBTP_EMAILBCC")
                        Ni.subscriptionTypeEmailBcc = xmlattr.Value;
                    if (xmlattr.Name == "SBTP_ISDYNAMICSUB")
                        Ni.subscriptionTypeIsDynamicSub = xmlattr.Value;
                    if (xmlattr.Name == "DEVC_ADDRESS")
                        Ni.deviceAddress = xmlattr.Value;
                    if (xmlattr.Name == "NOTX_ID")
                        Ni.notificationTextText = Helpers.NotificationText().Select(xmlattr.Value).notificationTextText;
                }
                String SubjectXmlFields = "<xmldata>";
                if (Ni.notificationEventDirectInformation.Contains("<fields>"))
                {
                    ServiceLogging.LogDebug("contiene fields");
                    SubjectXmlFields += getXmlFields(Ni.notificationEventDirectInformation);
                }
                ServiceLogging.LogDebug(SubjectXmlFields);
                SubjectXmlFields += "<data subject=\"" + Ni.subscriptionTypeEmailSubject + "\"/></xmldata>";
                Ni.subscriptionTypeEmailSubject = SubjectXmlFields;
                Ni.communicationMethodDecode = "EMAIL";
            }
            return Ni;
        }
        public static String getXmlFields(String file)
        {
            ServiceLogging.LogDebug("getXmlFields Method");
            String SubjectXmlFields = "";
            int c;
            string[] Xml = file.Split(new string[] { "<xmldata>" }, StringSplitOptions.None);
            for (int x = 0; x < Xml.Length; x++)
            {
                file = Xml[x];
            }
            StringReader reader = new StringReader(file);
            while ((c = reader.Read()) != -1)
            {
                char character = (char)c;
                if ((SubjectXmlFields.Contains("</fields>")) == false)
                {
                    SubjectXmlFields += character;
                }
                
            }
            return SubjectXmlFields;
        }
    }
}

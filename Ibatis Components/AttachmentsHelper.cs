using System.Collections;

namespace com.topdev.aa.data
{
    public class AttachmentsHelper : Helper
    {
        public bobjAttachments Select(string id)
        {
            return (bobjAttachments)Mapper().QueryForObject("Attachments.Select", int.Parse(id));
        }
        public bobjAttachments GetFile(bobjAttachments bobjAttachments)
        {
            return (bobjAttachments)Mapper().QueryForObject("GetFile.IUDProcedure", bobjAttachments);
        }
       

    }
}
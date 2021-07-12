using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for CommunicationMethod entities.
    /// </summary>

    public class CommunicationMethodHelper: Helper
    {
        public bobjCommunicationMethod Select(string id)
        {
            return (bobjCommunicationMethod)Mapper().QueryForObject("CommunicationMethod.Select", id);
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("CommunicationMethod.Select", null);
        }

        public void Insert(bobjCommunicationMethod CommunicationMethod)
        {
            CommunicationMethod.actionCode = "10";
            Mapper().Insert("CommunicationMethod.IUDProcedure", CommunicationMethod);
        }

        public int Update(bobjCommunicationMethod CommunicationMethod)
        {
            CommunicationMethod.actionCode = "20";
            return Mapper().Update("CommunicationMethod.IUDProcedure", CommunicationMethod);
        }

        public int Delete(bobjCommunicationMethod CommunicationMethod)
        {
            CommunicationMethod.actionCode = "90";
            return Mapper().Delete("CommunicationMethod.IUDProcedure", CommunicationMethod);
        }



    }
}
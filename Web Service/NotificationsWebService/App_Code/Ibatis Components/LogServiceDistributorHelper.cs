
using System.Collections;

namespace com.topdev.aa.data
{

    public class LogServiceDistributorHelper : Helper
    {
        public bobjLogServiceDistributor Select(string id)
        {
            return (bobjLogServiceDistributor)Mapper().QueryForObject("LogServiceDistributor.Select", int.Parse(id));
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("LogServiceDistributor.Select", null);
        }


        public void Insert(bobjLogServiceDistributor bobjLogServiceDistributor)
        {
            bobjLogServiceDistributor.actionCode = "10";
            Mapper().Insert("LogServiceDistributor.IUDProcedure", bobjLogServiceDistributor);
        }

        public int Update(bobjLogServiceDistributor bobjLogServiceDistributor)
        {
            bobjLogServiceDistributor.actionCode = "20";
            return Mapper().Update("LogServiceDistributor.IUDProcedure", bobjLogServiceDistributor);
        }

        public int Delete(bobjLogServiceDistributor bobjLogServiceDistributor)
        {
            bobjLogServiceDistributor.actionCode = "90";
            return Mapper().Delete("LogServiceDistributor.IUDProcedure", bobjLogServiceDistributor);
        }



    }
}
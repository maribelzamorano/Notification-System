using System;
namespace com.topdev.aa.data
{
    [Serializable]
    public abstract class ArcBusinessObject
    {
        private static readonly long serialVersionUID = 1L;

        public String id = "0";
        public String user;
        public String sessionId;
        public String orgUser;
        public String orgXPts;
        public String isDeleted = "0";
        public String isModified = "0";

        public String isDeletable = "0";
        public String isModifiable = "0";
        public String actionCode;

        public ValidationError[] validationErrors = null;

        public bool isNew()
        {
            //if(Validator.empty(id) || Validator.Equals(id, "0")) return true;
            return false;
        }

        public String getActionCode()
        {
            //if(!Validator.empty(actionCode)) return actionCode;
            if (isDeleted != null && isDeleted.Equals("1")) return ActionCode.delete;
            if (isNew()) return ActionCode.insert;
            return ActionCode.update;
        }
        public void setActionCode(String actionCode)
        {
            if (!ActionCode.insert.Equals(actionCode) &&
                    !ActionCode.update.Equals(actionCode) &&
                    !ActionCode.delete.Equals(actionCode))
                this.actionCode = actionCode;
        }


        public String getId()
        {
            return id;
        }
        public void setId(String id)
        {
            this.id = id;
        }
        public String getUser()
        {
            return user;
        }
        public void setUser(String user)
        {
            this.user = user;
        }
        public String getIsDeleted()
        {
            return isDeleted;
        }
        public void setIsDeleted(String isDeleted)
        {
            this.isDeleted = isDeleted;
        }

        public String getIsModified()
        {
            return isModified;
        }
        public void setIsModified(String isModified)
        {
            this.isModified = isModified;
        }
        public String getOrgUser()
        {
            return orgUser;
        }
        public void setOrgUser(String orgUser)
        {
            this.orgUser = orgUser;
        }
        public String getSessionId()
        {
            return sessionId;
        }
        public void setSessionId(String sessionId)
        {
            this.sessionId = sessionId;
        }
        public ValidationError[] getValidationErrors()
        {
            return validationErrors;
        }
        public void setValidationErrors(ValidationError[] validationErrors)
        {
            this.validationErrors = validationErrors;
        }

        public String getIsDeletable()
        {
            return isDeletable;
        }

        public void setIsDeletable(String isDeletable)
        {
            this.isDeletable = isDeletable;
        }

        public String getIsModifiable()
        {
            return isModifiable;
        }

        public void setIsModifiable(String isModifiable)
        {
            this.isModifiable = isModifiable;
        }

        public String getOrgXPts()
        {
            return orgXPts;
        }

        public void setOrgXPts(String orgXPts)
        {
            this.orgXPts = orgXPts;
        }

    }
}
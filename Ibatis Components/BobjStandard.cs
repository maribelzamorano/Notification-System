using System;

namespace com.topdev.aa.data
{
    [Serializable]
public class BobjStandard : ArcBusinessObject
{
	private static readonly long	serialVersionUID	= 1L;
	protected static readonly String internalCode ="U09346IHDELW3JN798R3OI78V6DQ47SBCOJHYZ3Y7CP79O0";
	public String sid;
	
	public bool checkInternalCode()
	{
		if(internalCode.Equals(sid)) return true;
		return false;
	}
	
	public BobjStandard()
	{
		this.sid = internalCode;
	}
	
	public BobjStandard(String user)
	{
		this.sid = internalCode;
		this.user = user;
	}
	public BobjStandard(String user, String sessionId)
	{
		this.sid = internalCode;
		this.user = user;
		this.sessionId = sessionId;
	}
	public BobjStandard(String user, String sessionId, String id)
	{
		this.sid = internalCode;
		this.user = user;
		this.id = id;
		this.sessionId = sessionId;
	}

	public String getSid()
	{
		return sid;
	}

	public void setSid(String sid)
	{
		this.sid = sid;
	}
}
}
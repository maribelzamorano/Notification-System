/*	
 * topdev GmbH, erstellt am 07.02.2010 14:00
 *
 * $Author: Harald Dahlen $
 * $Date: 2010-02-07 14:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (10) data.EVST.sql $
 *
 */

declare	@sbtp_code	UDT_CODE,
		@evtp_code	UDT_CODE,
		@pts		UDT_PTS

select	@pts = getdate();

-- Relationship between Event types and Subscription types for accreditation project

select	@evtp_code = '1', @sbtp_code = '1'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '2', @sbtp_code = '2'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '3', @sbtp_code = '3'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '4', @sbtp_code = '4'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '5', @sbtp_code = '5'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '6', @sbtp_code = '6'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '7', @sbtp_code = '7'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '8', @sbtp_code = '8'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '9', @sbtp_code = '9'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '10', @sbtp_code = '10'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '11', @sbtp_code = '11'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '12', @sbtp_code = '12'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '13', @sbtp_code = '13'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '14', @sbtp_code = '14'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '15', @sbtp_code = '15'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '16', @sbtp_code = '16'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '17', @sbtp_code = '17'
if ( not exists( select 1 from notifadm.IO_EVENT_SUBSCRIPTION_TYPE where EVTP_CODE = @evtp_code AND SBTP_CODE = @sbtp_code ))
begin
	insert into notifadm.IO_EVENT_SUBSCRIPTION_TYPE( 
			EVTP_CODE, SBTP_CODE, EVST_PTS, EVST_#PTS )
	values(	 @evtp_code, @sbtp_code, @pts, convert( nvarchar(23), @pts, 121 ) )
end

GO


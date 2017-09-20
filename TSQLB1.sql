USE ONLINE_SHOP
GO

/* 
* Viết stored-procedure tính tổng 2 số a, b và in kết quả theo định dạng sau:
* ‘Tổng 2 số’ + @a + ‘và’ + @b ‘là:’ + @kq
*/
IF OBJECT_ID('uspCau1', 'P') IS NOT NULL
	DROP PROC uspCau1	
GO

CREATE PROC uspCau1
	@a int = 0,
	@b int = 0
AS
	RETURN (@a + @b)	
GO

DECLARE @x int = 5, @y int = 10, @tong int = 0
EXEC @tong = uspCau1 @x, @y
PRINT N'Tổng 2 số ' + CAST(@x AS varchar) + ' và ' + CAST(@y AS varchar) + ' là: ' + CAST(@tong AS varchar)


IF OBJECT_ID('uspCau1b', 'P') IS NOT NULL
	DROP PROC uspCau1b	
GO

CREATE PROC uspCau1b
	@a float = 0,
	@b float = 0,
	@tong float OUT
AS
	SET @tong = @a + @b
GO

DECLARE @x float = 5.2, @y float = 10.8, @tong float = 0
EXEC uspCau1b @x, @y, @tong OUT
PRINT N'Tổng 2 số ' + CAST(@x AS varchar) + ' và ' + CAST(@y AS varchar) + ' là: ' + CAST(@tong AS varchar)

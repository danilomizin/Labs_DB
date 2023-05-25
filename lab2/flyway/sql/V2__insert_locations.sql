INSERT INTO locations (regname, areaname, tername, tertypename)
	SELECT DISTINCT Regname, AreaName, TerName, TerTypeName FROM zno_data;
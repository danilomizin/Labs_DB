INSERT INTO educational_organizations (eo_name, eo_type, location_id)
SELECT DISTINCT EOName, EOTypeName, locations.location_id
FROM zno_data
JOIN locations ON zno_data.Regname = locations.regname
	AND zno_data.AreaName = locations.areaname
	AND zno_data.TerName = locations.tername
	AND zno_data.TerTypeName = locations.tertypename;


UPDATE students
SET location_id = loc.location_id,
    eo_id = eo.eo_id
FROM zno_data
JOIN locations loc ON zno_data.Regname = loc.regname
                   AND zno_data.AreaName = loc.areaname
                   AND zno_data.TerName = loc.tername
JOIN educational_organizations eo ON zno_data.EOName = eo.eo_name
                                 AND zno_data.EOTypeName = eo.eo_type
WHERE students.location_id IS NULL AND students.eo_id IS NULL
  AND students.outid = zno_data.OutID
  AND students.birth = zno_data.Birth
  AND students.sextypename = zno_data.SexTypeName;

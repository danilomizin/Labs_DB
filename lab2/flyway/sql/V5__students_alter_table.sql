ALTER TABLE students
ADD FOREIGN KEY (location_id) REFERENCES locations(location_id);

ALTER TABLE students
ADD FOREIGN KEY (eo_id) REFERENCES educational_organizations(eo_id);
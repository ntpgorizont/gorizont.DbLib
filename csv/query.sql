DROP TABLE IF EXISTS resistors; 
CREATE TABLE resistors(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"case" VARCHAR(45),
"value" VARCHAR(45),
"tolerance" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS crystals; 
CREATE TABLE crystals(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"case" VARCHAR(45),
"value" VARCHAR(45),
"tolerance" VARCHAR(45),
"Cp" VARCHAR(45),
"Cl" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS connectors; 
CREATE TABLE connectors(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS zenners; 
CREATE TABLE zenners(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"case" VARCHAR(45),
"Uz" VARCHAR(45),
"Imax" VARCHAR(45),
"Imin" VARCHAR(45),
"Uf" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS transformers; 
CREATE TABLE transformers(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS AnalogDevices; 
CREATE TABLE AnalogDevices(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS Microchip; 
CREATE TABLE Microchip(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS capacitors; 
CREATE TABLE capacitors(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"value" VARCHAR(45),
"tolerance" VARCHAR(45),
"Umax" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS diodes; 
CREATE TABLE diodes(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"Ifmax" VARCHAR(45),
"Irmax" VARCHAR(45),
"Uf" VARCHAR(45),
"Umax" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS inductors; 
CREATE TABLE inductors(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"value" VARCHAR(45),
"tolerance" VARCHAR(45),
"Ir" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS modules; 
CREATE TABLE modules(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS filters; 
CREATE TABLE filters(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"value" VARCHAR(45),
"tolerance" VARCHAR(45),
"Ir" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS miscellaneous; 
CREATE TABLE miscellaneous(
"Part Name" VARCHAR(45),
"Type" VARCHAR(45),
"TU" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS mosfeets; 
CREATE TABLE mosfeets(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"Vds" VARCHAR(45),
"Id" VARCHAR(45),
"VgsMAX" VARCHAR(45),
"VgsMIN" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);
DROP TABLE IF EXISTS bipolars; 
CREATE TABLE bipolars(
"Part Name" VARCHAR(45),
"TU" VARCHAR(45),
"Vceo" VARCHAR(45),
"Ic" VARCHAR(45),
"hfe" VARCHAR(45),
"case" VARCHAR(45),
"manufacturer" VARCHAR(45),
"Description" VARCHAR(255),
"Library Ref" VARCHAR(45),
"Footprint Ref" VARCHAR(45),
"PCB3D Ref" VARCHAR(45)
);

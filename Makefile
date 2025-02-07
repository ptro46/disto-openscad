OPENSCAD = openscad
OPTS = -q -p parameters.json

STLFILES = part_1.stl part_1_1.stl part_1_2.stl part_2.stl part_2_1.stl part_2_2.stl part_3.stl part_3_1.stl part_3_2.stl all_parts.stl

SCAD_TMP_FILES = part_1.scad part_1_1.scad part_1_2.scad part_2.scad part_2_1.scad part_2_2.scad part_3.scad part_3_1.scad part_3_2.scad all_parts.scad

.SUFFIXES: .stl .scad

.scad.stl:
	$(OPENSCAD) -q -o "$@" -p parameters.json -P $(subst .stl,,$@)  "$<"

prepare: distox.scad
	ln -s distox.scad part_1.scad 
	ln -s distox.scad part_1_1.scad 
	ln -s distox.scad part_1_2.scad 
	ln -s distox.scad part_2.scad 
	ln -s distox.scad part_2_1.scad 
	ln -s distox.scad part_2_2.scad 
	ln -s distox.scad part_3.scad 
	ln -s distox.scad part_3_1.scad 
	ln -s distox.scad part_3_2.scad 
	ln -s distox.scad all_parts.scad 


build: $(STLFILES)

end:
	rm -f $(SCAD_TMP_FILES)

clean:
	rm -f *.stl $(SCAD_TMP_FILES)

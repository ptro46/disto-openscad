
do_all_parts=true;
do_part_1 = false ;
do_part_1_1 = false ;
do_part_1_2 = false ;
do_part_2 = false ;
do_part_2_1 = false ;
do_part_2_2 = false ;
do_part_3 = false ;
do_part_3_1 = false ;
do_part_3_2 = false ;

/* [Hidden] */
$fn = 100 ;

part_1_x = 300 ;
part_1_y = 300 ;
part_1_z = 20 ;
pos_part_1_mark = 150 ;
part_1_mark_size = 75 ;
part_1_mark_width = 25 ;
part_1_h = sqrt(part_1_x*part_1_x + part_1_y*part_1_y);

size_of_mark = part_1_mark_size-part_1_mark_width/2;

part_2_x = 250 ;
part_2_y = 250 ;
part_2_z = 50 ;
part_2_h = sqrt(part_2_x*part_2_x + part_2_y*part_2_y);

part_3_x = 200 ;
part_3_y = 200 ;
part_3_z = 50 ;
part_3_h = sqrt(part_3_x*part_3_x + part_3_y*part_3_y);

joint_x = 20 ;
joint_y = 10 ;
joint_z = 10 ;

module point() {
    color("red") { 
        sphere(1); 
    }
}

module encoche_part_1(h) {
    union() {
        cube([part_1_mark_width,size_of_mark,h+2],center=true);
        translate([0,part_1_mark_size/2-part_1_mark_width/4,0]) {
            cylinder(h=h+2,d=part_1_mark_width,center=true);
        }
    }
}

module part_1() {
    difference() {
        cube([part_1_x,part_1_y,part_1_z],center=true);

        translate([part_1_h/2,part_1_h/2,0]) {
            rotate([0,0,45]) {
                cube([2*part_1_x,2*part_1_y,2*part_1_z],center=true);
            }
        }
    }
}

module part_2() {
    difference() {
        cube([part_2_x,part_2_y,part_2_z],center=true);

        translate([part_2_h/2,part_2_h/2,0]) {
            rotate([0,0,45]) {
                cube([2*part_2_x,2*part_2_y,2*part_2_z],center=true);
            }
        }
    }
}

module part_3() {
    difference() {
        cube([part_3_x,part_3_y,part_3_z],center=true);

        translate([part_3_h/2,part_3_h/2,0]) {
            rotate([0,0,45]) {
                cube([2*part_3_x,2*part_3_y,2*part_3_z],center=true);
            }
        }
    }
}

if ( do_all_parts == true ) {
    difference() {
        union() {
            part_1();
            translate([(part_1_x-part_2_x)/2,-(part_1_y-part_2_y)/2,part_2_z/2+part_1_z/2]) {
                part_2();
            }
            translate([0,0,-(part_3_z/2+part_1_z/2)]) {
                part_3();
            }
        }
        mark_z = part_1_z + part_2_z + part_3_z ;
        translate([-part_1_x/2,-part_1_y/2,0]) {
            translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                encoche_part_1(mark_z);
            }
        }    
        translate([-part_1_x/2,-part_1_y/2,0]) {
            translate([0,part_1_x-pos_part_1_mark,0]) {
                rotate([0,0,-90]) {
                    translate([0,size_of_mark/2-0.1,0]){
                        encoche_part_1(mark_z);
                    }
                }
            }
        }
    }
}

if ( do_part_1 == true ) {
    difference() {
        union() {
            part_1();
        }
        mark_z = part_1_z + part_2_z + part_3_z ;
        translate([-part_1_x/2,-part_1_y/2,0]) {
            translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                encoche_part_1(mark_z);
            }
        }    
        translate([-part_1_x/2,-part_1_y/2,0]) {
            translate([0,part_1_x-pos_part_1_mark,0]) {
                rotate([0,0,-90]) {
                    translate([0,size_of_mark/2-0.1,0]){
                        encoche_part_1(mark_z);
                    }
                }
            }
        }
    }
}

if ( do_part_1_1 == true ) {
    difference() {
        difference() {
            difference() {
                union() {
                    part_1();
                }
                mark_z = part_1_z + part_2_z + part_3_z ;
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                        encoche_part_1(mark_z);
                    }
                }    
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([0,part_1_x-pos_part_1_mark,0]) {
                        rotate([0,0,-90]) {
                            translate([0,size_of_mark/2-0.1,0]){
                                encoche_part_1(mark_z);
                            }
                        }
                    }
                }
            }
            rotate([0,0,-45]) {
                translate([part_1_x/2+0.1,-part_1_y/2+0.1,0,]) {
                    cube([part_1_x, part_1_y, 2*part_1_z],center=true);
                }
            }
        }
        translate([-part_1_x/4,-part_1_y/4,0]) {
            rotate([0,0,45]) {
                cube([joint_x, joint_y,joint_z],center=true);
            }
        }
    }
}

if ( do_part_1_2 == true ) {
    difference(){
        intersection() {
            difference() {
                union() {
                    part_1();
                }
                mark_z = part_1_z + part_2_z + part_3_z ;
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                        encoche_part_1(mark_z);
                    }
                }    
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([0,part_1_x-pos_part_1_mark,0]) {
                        rotate([0,0,-90]) {
                            translate([0,size_of_mark/2-0.1,0]){
                                encoche_part_1(mark_z);
                            }
                        }
                    }
                }
            }
            rotate([0,0,-45]) {
                translate([part_1_x/2+0.1,-part_1_y/2+0.1,0,]) {
                    cube([part_1_x, part_1_y, 2*part_1_z],center=true);
                }
            }
        }
        translate([-part_1_x/4,-part_1_y/4,0]) {
            rotate([0,0,45]) {
                cube([joint_x, joint_y,joint_z],center=true);
            }
        }
    }
}

if ( do_part_2 == true ) {
    difference() {
        union() {
            translate([(part_1_x-part_2_x)/2,-(part_1_y-part_2_y)/2,part_2_z/2+part_1_z/2]) {
                part_2();
            }
        }
        mark_z = part_1_z + part_2_z + part_3_z ;
        translate([-part_1_x/2,-part_1_y/2,0]) {
            translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                encoche_part_1(mark_z);
            }
        }    
        translate([-part_1_x/2,-part_1_y/2,0]) {
            translate([0,part_1_x-pos_part_1_mark,0]) {
                rotate([0,0,-90]) {
                    translate([0,size_of_mark/2-0.1,0]){
                        encoche_part_1(mark_z);
                    }
                }
            }
        }
    }
}

if ( do_part_2_1 == true ) {
    difference() {
        difference() {
            difference() {
                union() {
                    translate([(part_1_x-part_2_x)/2,-(part_1_y-part_2_y)/2,part_2_z/2+part_1_z/2]) {
                        part_2();
                    }
                }
                mark_z = part_1_z + part_2_z + part_3_z ;
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                        encoche_part_1(mark_z);
                    }
                }    
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([0,part_1_x-pos_part_1_mark,0]) {
                        rotate([0,0,-90]) {
                            translate([0,size_of_mark/2-0.1,0]){
                                encoche_part_1(mark_z);
                            }
                        }
                    }
                }
            }
            rotate([0,0,-45]) {
                translate([part_2_x/2+35+0.1,-part_2_y/2+0.1,part_2_z]) {
                    cube([part_2_x, part_2_y, 2*part_2_z],center=true);
                }
            }
        }
        translate([(part_1_x-part_2_x)/2,-(part_1_y-part_2_y)/2,part_2_z/2+part_1_z/2]) {
            translate([-part_2_x/4,-part_2_y/4,0]) {
                rotate([0,0,45]) {
                    cube([joint_x, joint_y,joint_z],center=true);
                }
            }
        }
    }
}

if ( do_part_2_2 == true ) {
    difference() {
        intersection() {
            difference() {
                union() {
                    translate([(part_1_x-part_2_x)/2,-(part_1_y-part_2_y)/2,part_2_z/2+part_1_z/2]) {
                        part_2();
                    }
                }
                mark_z = part_1_z + part_2_z + part_3_z ;
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                        encoche_part_1(mark_z);
                    }
                }    
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([0,part_1_x-pos_part_1_mark,0]) {
                        rotate([0,0,-90]) {
                            translate([0,size_of_mark/2-0.1,0]){
                                encoche_part_1(mark_z);
                            }
                        }
                    }
                }
            }
            rotate([0,0,-45]) {
                translate([part_2_x/2+35+0.1,-part_2_y/2+0.1,part_2_z]) {
                    cube([part_2_x, part_2_y, 2*part_2_z],center=true);
                }
            }
        }
        translate([(part_1_x-part_2_x)/2,-(part_1_y-part_2_y)/2,part_2_z/2+part_1_z/2]) {
            translate([-part_2_x/4,-part_2_y/4,0]) {
                rotate([0,0,45]) {
                    cube([joint_x, joint_y,joint_z],center=true);
                }
            }
        }
    }
}

if ( do_part_3 == true ) {
    difference() {
        union() {
            translate([0,0,-(part_3_z/2+part_1_z/2)]) {
                part_3();
            }
        }
        mark_z = part_1_z + part_2_z + part_3_z ;
        translate([-part_1_x/2,-part_1_y/2,0]) {
            translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                encoche_part_1(mark_z);
            }
        }    
        translate([-part_1_x/2,-part_1_y/2,0]) {
            translate([0,part_1_x-pos_part_1_mark,0]) {
                rotate([0,0,-90]) {
                    translate([0,size_of_mark/2-0.1,0]){
                        encoche_part_1(mark_z);
                    }
                }
            }
        }
    }
}

if ( do_part_3_1 == true ) {
    difference() {
        difference() {
            difference() {
                union() {
                    translate([0,0,-(part_3_z/2+part_1_z/2)]) {
                        part_3();
                    }
                }
                mark_z = part_1_z + part_2_z + part_3_z ;
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                        encoche_part_1(mark_z);
                    }
                }    
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([0,part_1_x-pos_part_1_mark,0]) {
                        rotate([0,0,-90]) {
                            translate([0,size_of_mark/2-0.1,0]){
                                encoche_part_1(mark_z);
                            }
                        }
                    }
                }
            }
            rotate([0,0,-45]) {
                translate([part_3_x/2+0.1,-part_3_y/2+0.1,-part_3_z]) {
                    cube([part_3_x, part_3_y, 2*part_3_z],center=true);
                }
            }
        }    
        translate([-part_3_x/4,-part_3_y/4,-(part_3_z/2+part_1_z/2)]) {
            rotate([0,0,45]) {
                cube([joint_x, joint_y,joint_z],center=true);
            }
        }
    }
}

if ( do_part_3_2 == true ) {
    difference() {
        intersection() {
            difference() {
                union() {
                    translate([0,0,-(part_3_z/2+part_1_z/2)]) {
                        part_3();
                    }
                }
                mark_z = part_1_z + part_2_z + part_3_z ;
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([part_1_x-pos_part_1_mark,size_of_mark/2-0.1,0]) {
                        encoche_part_1(mark_z);
                    }
                }    
                translate([-part_1_x/2,-part_1_y/2,0]) {
                    translate([0,part_1_x-pos_part_1_mark,0]) {
                        rotate([0,0,-90]) {
                            translate([0,size_of_mark/2-0.1,0]){
                                encoche_part_1(mark_z);
                            }
                        }
                    }
                }
            }
            rotate([0,0,-45]) {
                translate([part_3_x/2+0.1,-part_3_y/2+0.1,-part_3_z]) {
                    cube([part_3_x, part_3_y, 2*part_3_z],center=true);
                }
            }
        }
        translate([-part_3_x/4,-part_3_y/4,-(part_3_z/2+part_1_z/2)]) {
            rotate([0,0,45]) {
                cube([joint_x, joint_y,joint_z],center=true);
            }
        }
    }
}



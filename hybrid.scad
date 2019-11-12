$fn = 60;
module tooth_pick() {
	total_len = 65;
	taper_len = 10;
	translate([0, 0, (total_len - taper_len*2)/2]) {
		cylinder(r1=1, r2=0, h=taper_len);
	}
	rotate([180, 0, 0])
	translate([0, 0, (total_len - taper_len*2)/2]) {
		cylinder(r1=1, r2=0, h=taper_len);
	}
	cylinder(r=1, h=total_len-2*taper_len, center=true);
}

module rim() {
	inner_rad = 23;
	outer_rad = inner_rad +3;
	thickness = 10;
	difference() {
		cylinder(r=outer_rad, h=thickness, center=true);
		cylinder(r=inner_rad, h=thickness+1, center=true);
	}
}


module base() {
	cylinder(r=18, h=10, center=true);
}

module picks() {
noof_picks = 20;
translate([0, 0, 30])
for(count = [0:noof_picks]) {
	rotate([0, 0, count * 360/noof_picks])
	translate([0, -20, 0])
	rotate([10, 0, 0])
	tooth_pick();
}
}

difference() {
base();
picks();
}

rotate([180, 0, 0])
translate([0, 0, -60])
difference() {
translate([0, 0, 60])
rim();
picks();
}

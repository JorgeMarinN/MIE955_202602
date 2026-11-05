v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 760 -490 760 -470 { lab=VDD}
N 760 -410 760 -390 { lab=GND}
N 1280 -620 1280 -600 { lab=VDD}
N 750 -160 750 -140 { lab=GND}
N 750 -240 750 -220 { lab=#net1}
N 750 -320 750 -300 { lab=INP}
N 750 -320 770 -320 { lab=INP}
N 1190 -140 1190 -120 { lab=GND}
N 1120 -520 1120 -500 { lab=VDD}
N 1000 -360 1020 -360 { lab=INP}
N 1000 -280 1020 -280 { lab=INM}
N 1710 -230 1710 -210 { lab=GND}
N 1710 -320 1710 -290 { lab=OUT}
N 1280 -540 1280 -500 { lab=V_IBIAS}
N 1440 -320 1440 -280 { lab=OUT}
N 1440 -120 1440 -100 { lab=INM}
N 1440 -40 1440 -20 { lab=GND}
N 1440 -120 1460 -120 { lab=INM}
N 1440 -220 1440 -200 { lab=#net2}
N 1360 -320 1440 -320 { lab=OUT}
N 1440 -320 1710 -320 { lab=OUT}
N 1440 -140 1440 -120 { lab=INM}
C {devices/code_shown.sym} 68.75 -841.875 0 0 {name=NGSPICE
only_toplevel=true
value="
.param CM_VOLTAGE = 0.6
.param OUTPUT_VOLTAGE = 0.6
.control
save all
ac dec 200 10 1000Meg
settype decibel out
plot vdb(out)
let phase_val = 180/PI*cph(out)
let phase_margin_val = 180 + 180/PI*cph(out)
settype phase phase_val
plot phase_val
meas ac phase_margin find phase_margin_val when vdb(out)=0
meas ac gain_bandwidth WHEN vdb(out)=0
op

let id1  = @n.x1.xm1.nsg13_lv_nmos[ids]
let id2  = @n.x1.xm2.nsg13_lv_nmos[ids]
let id3  = @n.x1.xm3.nsg13_lv_pmos[ids]
let id4  = @n.x1.xm4.nsg13_lv_pmos[ids]
let id5  = @n.x1.xm5.nsg13_lv_pmos[ids]
let id6  = @n.x1.xm6.nsg13_lv_nmos[ids]
let id7  = @n.x1.xm7.nsg13_lv_nmos[ids]
let id8  = @n.x1.xm8.nsg13_lv_nmos[ids]

let gm1  = @n.x1.xm1.nsg13_lv_nmos[gm]
let gm2  = @n.x1.xm2.nsg13_lv_nmos[gm]
let gm3  = @n.x1.xm3.nsg13_lv_pmos[gm]
let gm4  = @n.x1.xm4.nsg13_lv_pmos[gm]
let gm5  = @n.x1.xm5.nsg13_lv_pmos[gm]
let gm6  = @n.x1.xm6.nsg13_lv_nmos[gm]
let gm7  = @n.x1.xm7.nsg13_lv_nmos[gm]
let gm8  = @n.x1.xm8.nsg13_lv_nmos[gm]

let r01  = @n.x1.xm1.nsg13_lv_nmos[gds]
let r02  = @n.x1.xm2.nsg13_lv_nmos[gds]
let r04  = @n.x1.xm4.nsg13_lv_pmos[gds]
let r05  = @n.x1.xm5.nsg13_lv_pmos[gds]
let r06  = @n.x1.xm6.nsg13_lv_nmos[gds]

let cgs5  = @n.x1.xm5.nsg13_lv_pmos[cgg]

print v(inp)
print v(inm)
print v(out)

print cgs5
print id1
print id2
print id5
print gm1
print gm2
print gm5
.endc
"}
C {devices/vsource.sym} 760 -440 0 0 {name=V1 value=1.2}
C {devices/gnd.sym} 760 -390 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 760 -490 0 0 {name=l3 sig_type=std_logic lab=VDD
}
C {devices/isource.sym} 1280 -570 0 0 {name=I0 value=1u
}
C {devices/vsource.sym} 750 -190 0 0 {name=V2 value=\{CM_VOLTAGE\}}
C {devices/gnd.sym} 750 -140 0 0 {name=l16 lab=GND}
C {devices/vsource.sym} 750 -270 0 0 {name=V3 value="AC 1"}
C {devices/lab_pin.sym} 770 -320 2 0 {name=l18 sig_type=std_logic lab=INP
}
C {devices/lab_pin.sym} 1000 -360 0 0 {name=l19 sig_type=std_logic lab=INP
}
C {devices/lab_pin.sym} 1000 -280 0 0 {name=l20 sig_type=std_logic lab=INM
}
C {devices/lab_pin.sym} 1120 -520 0 0 {name=l21 sig_type=std_logic lab=VDD
}
C {devices/gnd.sym} 1190 -120 0 0 {name=l22 lab=GND}
C {devices/lab_pin.sym} 1710 -320 2 0 {name=l23 sig_type=std_logic lab=OUT
}
C {devices/capa.sym} 1710 -260 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1710 -210 0 0 {name=l24 lab=GND}
C {devices/res.sym} 1440 -170 0 0 {name=R1
value=10E6
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 1440 -250 0 0 {name=V4 value=\{OUTPUT_VOLTAGE-CM_VOLTAGE\}}
C {devices/capa.sym} 1440 -70 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1440 -20 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 1460 -120 0 1 {name=l6 sig_type=std_logic lab=INM
}
C {code.sym} 890 -810 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="

.lib cornerMOShv.lib mos_tt
.lib cornerMOSlv.lib mos_tt
*.lib cornerMOShv.lib mos_ff
*.lib cornerMOSlv.lib mos_ff
*.lib cornerMOShv.lib mos_ss
*.lib cornerMOSlv.lib mos_ss
*.lib cornerMOShv.lib mos_sf
*.lib cornerMOSlv.lib mos_sf
*.lib cornerMOShv.lib mos_fs
*.lib cornerMOSlv.lib mos_fs

.include /opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
*.lib $::SG13G2_MODELS/diodes.lib
"}
C {OTA3.sym} 1180 -320 0 0 {name=x1}
C {devices/lab_pin.sym} 1280 -620 0 0 {name=l1 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 1280 -520 0 0 {name=l5 sig_type=std_logic lab=V_IBIAS
}

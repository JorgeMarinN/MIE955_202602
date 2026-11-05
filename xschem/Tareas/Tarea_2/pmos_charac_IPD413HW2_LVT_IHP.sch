v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1090 -360 1140 -360 {
lab=g1}
N 1180 -360 1260 -360 {
lab=vsup}
N 1180 -430 1180 -390 {
lab=vsup}
N 1180 -530 1330 -530 {
lab=vsup}
N 1180 -330 1180 -230 {
lab=d1}
N 1260 -430 1260 -360 {lab=vsup}
N 1180 -430 1260 -430 {lab=vsup}
N 1180 -530 1180 -430 {
lab=vsup}
C {devices/code_shown.sym} 470 -580 0 0 {name=NGSPICE
only_toplevel=true
value="
vsup vsup 0 dc=1.2
vgs g1 vsup dc=0.6
vds d1 vsup dc=0.6

.control
save all

save @n.xm1.nsg13_lv_pmos[ids]
save @n.xm1.nsg13_lv_pmos[gm]


dc vgs 0 0.7 0.01

let idn = @n.xm1.nsg13_lv_pmos[ids]
let gmn = @n.xm1.nsg13_lv_pmos[gm]
let vthn = @n.xm1.nsg13_lv_pmos[vth]
let vgsn = @n.xm1.nsg13_lv_pmos[vgs]
*let vdsatn = @n.xm1.nsg13_lv_pmos[vdsat]
let vov1 = v(g1) - vthn
let vov2 = 2*idn/gmn

plot idn
plot gmn
*plot idn vs vov1 
*plot idn vs vov2 
*plot vov2
*plot gmn vs vov2
*plot idn vs vdsatn

let W = 1e-6
let a = gmn/idn
setscale a
plot idn/W
plot vov2



*wrdata /foss/designs/IPD413_2023/HW1/data_nmos_idvgs_VDSp9_testlalarcon.dat idn


.endc
" }
C {devices/ipin.sym} 1090 -360 0 0 {name=p1 lab=g1}
C {devices/iopin.sym} 1180 -230 0 0 {name=p2 lab=d1}
C {devices/iopin.sym} 1330 -530 0 0 {name=p3 lab=vsup}
C {sg13g2_pr/sg13_lv_pmos.sym} 1160 -360 0 0 {name=M1
l=0.5u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {code.sym} 1160 -110 0 0 {name=MODEL only_toplevel=true
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

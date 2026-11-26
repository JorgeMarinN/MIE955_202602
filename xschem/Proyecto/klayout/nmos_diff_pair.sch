v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 330 -370 330 -360 {
lab=S_COM}
N 330 -360 410 -360 {
lab=S_COM}
N 270 -400 290 -400 {
lab=IN_N}
N 410 -360 410 -320 {
lab=S_COM}
N 330 -480 330 -430 {
lab=D_N}
N 370 -400 370 -260 {lab=#net1}
N 330 -400 370 -400 {
lab=#net1}
C {sg13g2_pr/sg13_lv_nmos.sym} 310 -400 0 0 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 330 -480 3 0 {name=p6 lab=D_N}
C {iopin.sym} 410 -320 0 0 {name=p8 lab=S_COM}
C {iopin.sym} 370 -260 0 0 {name=p5 lab=B_COM}
C {iopin.sym} 270 -400 0 1 {name=p11 lab=IN_N}

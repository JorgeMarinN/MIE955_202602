v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 330 -370 330 -360 {
lab=S_COM}
N 490 -370 490 -360 {
lab=S_COM}
N 330 -510 330 -430 {
lab=D_N}
N 490 -480 490 -430 {
lab=D_P}
N 270 -400 290 -400 {
lab=IN_P}
N 530 -400 550 -400 {
lab=IN_P}
N 380 -400 490 -400 {
lab=B_COM}
N 420 -360 490 -360 {lab=S_COM}
N 420 -360 420 -290 {lab=S_COM}
N 330 -360 420 -360 {lab=S_COM}
N 380 -400 380 -250 {lab=B_COM}
N 330 -400 380 -400 {
lab=B_COM}
C {sg13g2_pr/sg13_lv_nmos.sym} 310 -400 0 0 {name=M1
l=0.5u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 510 -400 0 1 {name=M2
l=0.5u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 330 -510 0 0 {name=p6 lab=D_N}
C {iopin.sym} 490 -480 0 0 {name=p1 lab=D_P}
C {iopin.sym} 420 -290 0 0 {name=p2 lab=S_COM}
C {iopin.sym} 380 -250 0 0 {name=p3 lab=B_COM}
C {iopin.sym} 550 -400 0 0 {name=p4 lab=IN_P}
C {iopin.sym} 270 -400 0 1 {name=p5 lab=IN_P}

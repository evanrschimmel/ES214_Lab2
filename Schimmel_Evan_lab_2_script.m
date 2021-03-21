clear all
close all
clc

load('swing_time_data');

mp = 68.5e-3; %kg
mw = 88e-3; %kg
lp = 43.2e-2; %m
dw = 5e-2; %m
ds = 2.5e-2; %m
g = 9.81; %m/s^2

tf = 20; %s
maxstep = 0.01;
tol = 1e-6;

theta0 = (-pi/2)-0.0425; %rad
omega0 = 0; %rad/s

lpcg = (lp-ds)/2; %m

i=0;
swingtime=0;
weightoffset=0;

for pos=4:0.1:34
    t=0;
    i=i+1;
    lwcg=pos*(10^-2);
    J = ((mp*lp^2)/12)+mp*(lpcg^2)+(1/2)*mw*((dw/2)^2)+mw*(lwcg^2);
    k = g*(mp*lpcg+mw*lwcg);
    sim('Schimmel_Evan_lab_2_model')
    weightoffset(i)=pos;
    swingtime(i)=t(end)-t_cross;
end

figure
plot(weightoffset, swingtime,'b-',Lwcg_exp,swing_time_exp,'ro')
legend('Simulation','Experiment');
xlabel('Moveable weight offset (cm)')
ylabel('Swing time (s)')
axis([0 35 0.22 0.34]);
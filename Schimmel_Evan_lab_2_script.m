clear all
close all
clc

mp = 68.5e-3; %kg
mw = 88e-3; %kg
lp = 43.2e-3; %m
dw = 5e-3; %m
ds = 2.5e-3; %m
g = 9.81; %m/s^2

tf = 2; %s
maxstep = 0.01;
tol = 1e-6;

theta0 = -Pi/2; %rad
omega0 = 0; %rad/s

lpcg = (lp-ds)/2; %m
lwcg = 20e-3; %m

J = (mp*lp^2)/12+mp*lpcg^2+(1/2)*mw*(dw/2)^2+mw*lwcg^2;

k = g*(mp*lpcg+mw*lwcg);

sim('Schimmel_Evan_lab_2_model')

figure
plot(t, v)
xlabel('Time (s)')
ylabel('Angular displacement (rad)')
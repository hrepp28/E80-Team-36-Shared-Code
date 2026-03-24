% partial_derivative.m E80
%
% Angela Zheng
% 2/2/2026
%
% This program finds the partial derivative of the voltage divider equation
% from lab 2.

% Define the variables
syms Zp Zs Zm Vin

% Voltage divider equation
Vout = Zp/(Zp+Zs)*Vin;

% Find the partial deriviatives with respect to Z1, Z2, and Vin in terms of
% Vout
Dvin = diff(Vout,Vin)/Vout
Dzp = diff(Vout,Zp)/Vout
Dzs = diff(Vout,Zs)/Vout

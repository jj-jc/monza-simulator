function [x,y,t] = Impact(x0, y0, dx0, dy0, theta, t0, piso)

syms tfinal
x_fall = x0+dx0*(tfinal-t0)+4.905*sin(theta)*(tfinal-t0)^2;
y_fall = y0+dy0*(tfinal-t0)-4.905*cos(theta)*(tfinal-t0)^2;

paux = piso+1;
switch paux
    case 1
        y_parab= -0.54*x_fall^2 + 0.1143;
    case 2
        y_parab= -0.54*x_fall^2 + 0.0686;
    case 3
        y_parab= -0.54*x_fall^2 + 0.03;
    case 4
        y_parab= -0.54*x_fall^2 - 0.03;
    case 5
        y_parab= -0.54*x_fall^2 - 0.0686; 
    case 6
        y_parab= -0.54*x_fall^2 - 0.1143;
    case 7
        y_parab= -0.54*x_fall^2 - 0.16;
    otherwise
        y_parab = 0;
end

t_solve = double(solve(y_fall-y_parab, tfinal));
t_positive = (t_solve - t0) > 0;
t = double(min(t_solve(t_positive)));
x = x0+dx0*(t-t0)+4.905*sin(theta)*(t-t0)^2;
y = y0+dy0*(t-t0)-4.905*cos(theta)*(t-t0)^2;

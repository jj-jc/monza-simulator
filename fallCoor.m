
function x_out = fallCoor(Nivel)
%Puntos x, y de caída fuera de las parábolas:

syms x

%Ecuacion de la circunferencia
r = 0.20572;
eq_circ = sqrt(r^2 - x^2);

%Ecuaciones de las parábolas
eq_parab1 = -0.54*x^2 + 0.1143;
eq_parab2 = -0.54*x^2 + 0.0686;
eq_parab3 = -0.54*x^2 + 0.03;
eq_parab4 = -0.54*x^2 - 0.03;
eq_parab5 = -0.54*x^2 - 0.0686;
eq_parab6 = -0.54*x^2 - 0.1143;
eq_parab7 = -0.54*x^2 -0.16;

%Inicializacion de los puntos limite
x1d = 0; x1i = 0;
x2d = 0; x2i = 0;
x3d = 0; x3i = 0;
x4d = 0; x4i = 0;
x5d = 0; x5i = 0;
x6d = 0; x6i = 0;
x7d = 0; x7i = 0;

switch Nivel
    case 1
        %Nivel 1
        %Puntos de caída correctos
        x1d = 0;
        x2i = 0;
        x3d = 0;
        x4i = 0;
        x5d = 0;
        x6i = 0;
        x7d = -0.02554;
    case 2
        %Nivel 2
        %Puntos de caída correctos
        x1d = 0.06211;
        x2i = -0.04758;
        x3d = 0.04969;
        x4i = -0.04847;
        x5d = 0.04406;
        x6i = -0.05409;
        x7d = -0.02554;
    case 3
        %Nivel 3
        %Puntos de caída correctos
        x1d = 0.12394;
        x2i = -0.09503;
        x3d = 0.09924;
        x4i = -0.0968;
        x5d = 0.08803;
        x6i = -0.1080;
        x7d = -0.02554;
    case 4
        %Nivel 4
        %Puntos de caída correctos
        x1d = 0.12394;
        x2i = -0.14224;
        x3d = 0.14851;
        x4i = -0.14488;
        x5d = 0.1318;
        x6i = -0.108;
        x7d = -0.02554;
end
        %Piso 1
        x1 = double(solve(eq_parab1 == eq_circ));
        x1i = x1(real(x1)<0 & imag(x1)==0);
        %Piso 2
        x2 = double(solve(eq_parab2 == eq_circ));
        x2d = x2(real(x2)>0 & imag(x2)==0);
        %Piso 3
        x3 = double(solve(eq_parab3 == eq_circ));
        x3i = x3(real(x3)<0 & imag(x3)==0);
        %Piso 4
        x4 = double(solve(eq_parab4 == -eq_circ));
        x4d = x4(real(x4)>0 & imag(x4)==0);
        %Piso 5
        x5 = double(solve(eq_parab5 == -eq_circ));
        x5i = x5(real(x5)<0 & imag(x5)==0);
        %Piso 6
        x6 = double(solve(eq_parab6 == -eq_circ));
        x6d = x6(real(x6)>0 & imag(x6)==0);
        %Piso 7
        x7 = double(solve(eq_parab7 == -eq_circ));
        x7i = x7(real(x7)<0 & imag(x7)==0);

x_out = [x1d x1i;
    x2d x2i;
    x3d x3i;
    x4d x4i;
    x5d x5i;
    x6d x6i;
    x7d x7i];


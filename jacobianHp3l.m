function Jm = jacobianHp3l(t)
    % calcula o Jacobiano a partir das express�es abaixo e usando os
    % angulos em t, angulos em graus.

    % obs: singularidade quando t5 = 0.

    % par�metros espec�ficos do manipulador.
    a2 = 100; a3 = 370; a4 = 85;
    d1 = 300; d2 = 170; d4 = 191.5; d5 = 380-d4; d6 = 90;

    t1 = deg2rad(t(1)); t2 = deg2rad(t(2)); t3 = deg2rad(t(3));
    t4 = deg2rad(t(1)); t5 = deg2rad(t(5)); % t6 = (t(6)*pi)/180;
    J = zeros(3, 5);

    J(1,1) = round(d6*cos(t2)*cos(t4)*sin(t1)*sin(t3)*sin(t5) - a3*sin(t1)*sin(t2) ...
           - d4*cos(t2 - t3)*sin(t1) - d5*cos(t2 - t3)*sin(t1) ...
           - a4*sin(t2 - t3)*sin(t1) - d6*cos(t1)*sin(t4)*sin(t5) ...
           - d6*cos(t2 - t3)*cos(t5)*sin(t1) - a2*sin(t1) ...
           - d6*cos(t3)*cos(t4)*sin(t1)*sin(t2)*sin(t5));

    J(1,2) = round(a4*(cos(t1)*sin(t2)*sin(t3) + cos(t1)*cos(t2)*cos(t3)) ...
           + d6*(cos(t5)*(cos(t1)*cos(t2)*sin(t3) - cos(t1)*cos(t3)*sin(t2)) ...
           + cos(t4)*sin(t5)*(cos(t1)*sin(t2)*sin(t3) ...
           + cos(t1)*cos(t2)*cos(t3))) + d4*(cos(t1)*cos(t2)*sin(t3) ...
           - cos(t1)*cos(t3)*sin(t2)) + d5*(cos(t1)*cos(t2)*sin(t3) ...
           - cos(t1)*cos(t3)*sin(t2)) + a3*cos(t1)*cos(t2));

    J(1,3) = round(cos(t1)*(d4*sin(t2 - t3) - a4*cos(t2 - t3) + d5*sin(t2 - t3) ...
           + d6*sin(t2 - t3)*cos(t5) - d6*cos(t2 - t3)*cos(t4)*sin(t5)));

    J(1,4) = round(-d6*sin(t5)*(cos(t4)*sin(t1) - sin(t4)*(cos(t1)*cos(t2)*sin(t3) ...
           - cos(t1)*cos(t3)*sin(t2))));

    J(1,5) = round(-d6*(cos(t5)*(sin(t1)*sin(t4) + cos(t4)*(cos(t1)*cos(t2)*sin(t3) ...
           - cos(t1)*cos(t3)*sin(t2))) + sin(t5)*(cos(t1)*sin(t2)*sin(t3) ...
           + cos(t1)*cos(t2)*cos(t3))));

    % J(1,6) = 0;

    J(2,1) = round(d4*(cos(t1)*sin(t2)*sin(t3) + cos(t1)*cos(t2)*cos(t3)) ...
           - a4*(cos(t1)*cos(t2)*sin(t3) - cos(t1)*cos(t3)*sin(t2)) ...
           + d5*(cos(t1)*sin(t2)*sin(t3) + cos(t1)*cos(t2)*cos(t3)) ...
           + a2*cos(t1) - d6*(sin(t5)*(sin(t1)*sin(t4) ...
           + cos(t4)*(cos(t1)*cos(t2)*sin(t3) - cos(t1)*cos(t3)*sin(t2))) ...
           - cos(t5)*(cos(t1)*sin(t2)*sin(t3) + cos(t1)*cos(t2)*cos(t3))) ...
           + a3*cos(t1)*sin(t2));

    J(2,2) = round(a4*(sin(t1)*sin(t2)*sin(t3) + cos(t2)*cos(t3)*sin(t1)) ...
           + d4*(cos(t2)*sin(t1)*sin(t3) - cos(t3)*sin(t1)*sin(t2)) ...
           + d5*(cos(t2)*sin(t1)*sin(t3) - cos(t3)*sin(t1)*sin(t2)) ...
           + d6*(cos(t5)*(cos(t2)*sin(t1)*sin(t3) - cos(t3)*sin(t1)*sin(t2)) ...
           + cos(t4)*sin(t5)*(sin(t1)*sin(t2)*sin(t3) ...
           + cos(t2)*cos(t3)*sin(t1))) + a3*cos(t2)*sin(t1));

    J(2,3) = round(sin(t1)*(d4*sin(t2 - t3) - a4*cos(t2 - t3) + d5*sin(t2 - t3) ...
           + d6*sin(t2 - t3)*cos(t5) - d6*cos(t2 - t3)*cos(t4)*sin(t5)));

    J(2,4) = round(d6*sin(t5)*(cos(t1)*cos(t4) + sin(t4)*(cos(t2)*sin(t1)*sin(t3) ...
           - cos(t3)*sin(t1)*sin(t2))));

    J(2,5) = round(d6*(cos(t5)*(cos(t1)*sin(t4) - cos(t4)*(cos(t2)*sin(t1)*sin(t3) ...
           - cos(t3)*sin(t1)*sin(t2))) - sin(t5)*(sin(t1)*sin(t2)*sin(t3) ...
           + cos(t2)*cos(t3)*sin(t1))));

    % J(2,6) = 0;

    J(3,1) = 0;

    J(3,2) = round((d6*sin(t2 - t3)*sin(t4 - t5))/2 - d4*cos(t2 - t3) ...
           - d5*cos(t2 - t3) - a4*sin(t2 - t3) ...
           - (d6*sin(t2 - t3)*sin(t4 + t5))/2 - d6*cos(t2 - t3)*cos(t5) ...
           - a3*sin(t2));

    J(3,3) = round(d4*cos(t2 - t3) + d5*cos(t2 - t3) + a4*sin(t2 - t3) ...
           + d6*cos(t2 - t3)*cos(t5) + d6*sin(t2 - t3)*cos(t4)*sin(t5));

    J(3,4) = round(-d6*cos(t2 - t3)*sin(t4)*sin(t5));

    J(3,5) = round(d6*sin(t2 - t3)*sin(t5) + d6*cos(t2 - t3)*cos(t4)*cos(t5));

    % J(3,6) = 0;
    Jm = pinv(J);
    % Jm = inv((J')*J)*(J');
end

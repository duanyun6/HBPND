function [t,y] = rossler(tspan,reltol,abstol,x0)

options = odeset('RelTol',reltol,'AbsTol',abstol);
[t,y] = ode45(@rosslerFunction,tspan,x0,options);

    function k = rosslerFunction(t,y)
        a=36;b=2.8;c=28.6;d=9.6;kk=0.0001;
        k=zeros(6,1);
        k(1)=a*(y(2)-y(1));
        k(2)=c*y(2)-y(1)*y(3)+y(5);
        k(3)=y(1)*y(2)-b*y(3);
        k(4)=y(2)*y(3)-y(4);
        k(5)=-kk*y(2);
        k(6)=y(1)*y(5)-d*y(6);
    end
end


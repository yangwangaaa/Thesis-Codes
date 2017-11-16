
function [Wt,HullMat] = WtHull(HullDes)
    
    global rho_seawater ;
    
    Do = HullDes(1); %m, inner dia
    Lo = HullDes(2); %m
    LDo = HullDes(3);
    CB = HullDes(4); % block coefficient
    thick = HullDes(5); % Safety Factor
    
    Di = (Do - 2*thick); %m   
    Li = (Lo - 2*thick); %m
    LDi = round(Li./Di,3);
    Wt = rho_seawater*CB*0.25*pi*(Lo*Do^2 - Li*Di^2); % kg
    Volo = CB*0.25*pi*Lo*Do^2 ;% m^3
    Voli = CB*0.25*pi*Li*Di^2 ; % m^3
    
    HullMat = [Di,Li,LDi,Voli,thick,Do,Lo,LDo,Volo];
    
end
classdef T_domain < handle
% construct T-shaped tube domain 
% build FD system matrix 
    properties
        diam %: tube diameter
        L1,L2,L3 %: part lengths according to Fig.1
        Lx,Ly %: length in x,y
        G  %: nxm-matrix of domain points
        h  %: space discretization parameter
        N,Nx,Ny,N1,N2,N3 %: system size ~1/h
            % nOfpoints along diam,x,y,L1,L2,L3
    end
    
    methods
        function obj=T_domain(l1,l2,l3,diam,N)
            obj.L1=l1; obj.L2=l2; obj.L3=l3; obj.diam=diam; obj.N=N;
            obj.build;
        end
        function build(obj)
            obj.Lx = obj.L1+obj.L2+obj.diam;
            obj.Ly = obj.L3+obj.diam;
            obj.Nx = obj.Lx/obj.diam*obj.N;
            obj.Ny = obj.Ly/obj.diam*obj.N;
            obj.N1 = obj.L1/obj.diam*obj.N;
            obj.h = 1./obj.N;
        end
    end
    
end


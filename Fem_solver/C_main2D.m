function [uh, femregion, errors, solutions]=C_main2D(TestName,nRef, diff_coeff, post_proc)
%==========================================================================
% Solution of the Poisson's problem with linear finite elements
% (non homogeneous Dirichlet boundary conditions)
%==========================================================================
%
%    INPUT:
%          Dati        : (struct)  see C_dati.m
%          nRef        : (int)     refinement level
%
%    OUTPUT:
%          errors      : (struct) contains the computed errors
%          solutions   : (sparse) nodal values of the computed and exact
%                        solution
%          femregion   : (struct) infos about finite elements
%                        discretization
%          Dati        : (struct)  see C_dati.m
%          
% Usage: 
%    [errors,solutions,femregion,Dati] = C_main2D('Test1',3)
 


addpath Assembly
addpath BoundaryConditions
addpath Errors
addpath MeshGeneration
addpath FESpace
addpath Postprocessing


%==========================================================================
% LOAD DATA FOR TEST CASE
%==========================================================================

Dati = C_dati(TestName);
Dati.nRefinement = nRef;
Dati.diff_coeff = diff_coeff;

%==========================================================================
% MESH GENERATION
%==========================================================================

[Region] = C_create_mesh(Dati);

%==========================================================================
% FINITE ELEMENT REGION
%==========================================================================

[femregion] = C_create_femregion(Dati,Region); 

%==========================================================================
% BUILD FINITE ELEMENT MATRICES and RIGHT-HAND SIDE
%==========================================================================

[A_no_bc,b_no_bc] = C_matrix2D(Dati,femregion);

%==========================================================================
% COMPUTE BOUNDARY CONDITIONS -- MODIFICATION OF A an b
%==========================================================================

[A,b,u_g] = C_bound_cond2D(A_no_bc,b_no_bc,femregion,Dati);

%==========================================================================
% SOLVE THE LINEAR SYSTEM
%==========================================================================

uh = A\b;

%==========================================================================
% ASSIGN DIRICHLET BOUNDARY CONDITIONS -- through the lifting ug
%==========================================================================

uh = uh + u_g;

if post_proc == true
    %==========================================================================
    % POST-PROCESSING OF THE SOLUTION
    %==========================================================================
    
    [solutions] = C_postprocessing(Dati,femregion,uh);
    
    %==========================================================================
    % ERROR ANALYSIS
    %==========================================================================
    errors = [];
    if (Dati.plot_errors)
        [errors] = C_compute_errors(Dati,femregion,solutions);
    end
else
    solutions=0;
    errors=0;
end


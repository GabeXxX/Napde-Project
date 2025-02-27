%=======================================================================================================
% This contain all the information for running main
% TEMPLATE OF THE STRUCT DATI
%=======================================================================================================
%
%  DATI= struct( 'name',              % set the name of the test 
%                'Domain',            % set the domain [x1,x2;y1,y2]
%                'exact_sol',         % set the exact solution
%                'force',             % set the forcing term
%                'diff_coeff'         % set the diffusion coefficient
%                'grad_exact_1',      % set the first componenet of the gradient of the exact solution
%                'grad_exact_2',      % set the second componenet of the gradient of the exact solution
%                'fem',               % set finite element space
%                'nqn_1D',            % number of quadrature nodes for integrals over lines
%                'nqn_2D',            % number of quadrature nodes for integrals over elements
%                'MeshType',          % set the elements of the mesh  'TS'
%                'refinement_vector', % set the level of refinement for the grid
%                'visual_graph',      % if you want to display the graphical results ['Y','N']
%                'print_out',         % if you want to print out the results ['Y','N']
%                'plot_errors'        % you want to plot the computed errors ['Y','N']
% 
%========================================================================================================

function [Dati]=C_dati(test)

if test=="Test1"
Dati = struct( 'name',             test,...
               ... % Test name
               'domain',           [0,1;0,1],...                          
               ... % Domain bounds     
               'mu',               1,...                          
               ... % Domain bounds     
               'sigma',            0,...                          
               ... % Domain bounds       
               'exact_sol',        '0.*x.*y',...      
               ... % Definition of exact solution
               'force',            'exp(x+y).*(y.*(1-y).*(1+2*x)+x.*(1-x).*(1+2*y))',...  
               ... % Forcing term
               'grad_exact_1',     '0.*x.*y',...    
               ... % Definition of exact gradient (x comp) 
               'grad_exact_2',     '0.*x.*y',...     
               ... % Definition of exact gradient (y comp)
               'fem',              'P1',...         
               ... % P1-fe
               'nqn_1D',            4,...           
               ... % Number of quad. points per edge
               'nqn_2D',            3,...           
               ... % Number of quad. points per triangle
               'MeshType',         'TS', ...        
               ... % Triangular Structured mesh
               'refinement_vector', [2,3,4,5],...   
               ... % Refinement levels for  the error analysis
               'visual_graph',      'Y',...
               ... % Visualization of the solution
               'plot_errors',       'Y' ...
               ...% Compute Errors 
               );
end

if test=="Test2"
Dati = struct( 'name',             test,...
               ... % Test name
               'domain',           [-2,2;-2,2],...                          
               ... % Domain bounds     
               'mu',               1,...                          
               ... % Domain bounds     
               'sigma',            0,...                          
               ... % Domain bounds       
               'exact_sol',        '0.*x.*y',...      
               ... % Definition of exact solution
               'force',            '10*sin(0.5*pi*x).*sin(0.5*pi*y)',...  
               ... % Forcing term
               'grad_exact_1',     '0.*x.*y',...    
               ... % Definition of exact gradient (x comp) 
               'grad_exact_2',     '0.*x.*y',...     
               ... % Definition of exact gradient (y comp)
               'fem',              'P1',...         
               ... % P1-fe
               'nqn_1D',            4,...           
               ... % Number of quad. points per edge
               'nqn_2D',            3,...           
               ... % Number of quad. points per triangle
               'MeshType',         'TS', ...        
               ... % Triangular Structured mesh
               'refinement_vector', [2,3,4,5],...   
               ... % Refinement levels for  the error analysis
               'visual_graph',      'Y',...
               ... % Visualization of the solution
               'plot_errors',       'Y' ...
               ...% Compute Errors 
               );
end


if test=="ConvergenceTest"
        Dati = struct( 'name',             test,...
               ... % Test name
               'domain',           [0,1;0,1],...                          
               ... % Domain bounds     
               'mu',               1,...                          
               ... % Domain bounds     
               'sigma',            0,...                          
               ... % Domain bounds       
               'exact_sol',        'x.*y.*(1-x).*(1-y)',...      
               ... % Definition of exact solution
               'force',            'exp(x+y).*(y.*(1-y).*(1+2*x)+x.*(1-x).*(1+2*y))',...  
               ... % Forcing term
               'grad_exact_1',     'y.*(1-y).*(1-2*x)',...    
               ... % Definition of exact gradient (x comp) 
               'grad_exact_2',     'x.*(1-x).*(1-2*y)',...     
               ... % Definition of exact gradient (y comp)
               'fem',              'P1',...         
               ... % P1-fe
               'nqn_1D',            4,...           
               ... % Number of quad. points per edge
               'nqn_2D',            3,...           
               ... % Number of quad. points per triangle
               'MeshType',         'TS', ...        
               ... % Triangular Structured mesh
               'refinement_vector', [2,3,4,5],...   
               ... % Refinement levels for  the error analysis
               'visual_graph',      'Y',...
               ... % Visualization of the solution
               'plot_errors',       'Y' ...
               ...% Compute Errors 
               );
end

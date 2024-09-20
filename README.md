# Variational Autoencoders to solve Diffusion Inverse Problems

In this project we use Variational Autoencoders in order to solve a Bayesian Inverse Problem. We consider a steady-state diffusion problem with a known force, and try to estimate the non-constant diffusion coefficient only by observing the solution in some points of the domain. 

Our work reproduces some of the results obtained in  [[1]](#1). We implement a framework for training neural networks capable
of modelling the posterior distribution representing the unknown Parameter of Interest. This
model is able to take advantage of all the information that are usually given in scientific Bayesian Inverse Problems.


## Project Structure 
- `./fem_solver`: contains the finite element solver to generate the solutions to the diffusion equation
- `./tests`: contains the code developed to define the tests performed
- `./past_versions`: contains the actual tests, performed using the lastest version of the code

## Prerequisite
- Matlab
- Python 
- Jupyter notebook

## Usage
To reproduce the results:
- run `Fem_solver/sol_trainingset.m` in *Matlab* to generate the solutions to the diffusion problem
- put the generated `uh.txt` in the `.test/data` folder
- follow the workflow defined in the test's python notebook to run the desired test


## References
<a id="1">[1]</a>  
H. Goh, S. Sheriffdeen, J. Wittmer, and T. Bui-Thanh. Solving bayesian inverse problems
via variational autoencoders. Proceedings of Machine Learning Research, 2021.

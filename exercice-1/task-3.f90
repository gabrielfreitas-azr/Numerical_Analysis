program task3
implicit none

! ----------------------------------------------------------
! Código compilado com GNU Fortran 11.3.0
! ~> gfortran task-3.f90 -o task-3
! 
! Gerando 'task-3' como executável.
! ----------------------------------------------------------

! Declaração de variáveis

real(8):: x
real(8):: num_a, num_b, num_c

! a) É possível perceber que perdeu-se a propriedade associativa 
! da adição, visto que na primeira ordem de operações o número é 
! grande o suficiente para o compilador já considerá-lo como Inf 
! (ou seja, perdeu a precisão) e na segunda ordem de operações
! o valor dá aproximadamente 1.099D308, portanto os valores são claramente
! diferentes.

num_a = 1.0D308
num_b = 1.1D308
num_c = -1.001D308

print *, "(a + b) + c =", (num_a + num_b) + num_c
print *, "a + (b + c) =", num_a + (num_b + num_c)

! b) O resultado dá aproximadamente 1.11 que é diferente de 1.

x = 1D-15

print *, "((1+x)-1)/x: =", ((1+x)-1)/x

end program
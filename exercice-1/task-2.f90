program task2
implicit none

! ----------------------------------------------------------
! Código compilado com GNU Fortran 11.3.0
! ~> gfortran task-2.f90 -o task-2
!
! Gerando 'task-2' como executável.
! ----------------------------------------------------------
! 
! Para resolver o problema foi definida uma margem de erro
! e a comparação, ao invés de usar ==, usou o módulo da diferença 
! entre o resultado esperado e o obtido com o erro aceito. Esse 
! erro pode variar de problema para problema, aqui foi definido 
! como 1E-5 apenas para exemplificar.
!

! Declaração de variáveis

integer :: i
real :: x = 0 
real, parameter :: error = 1D-5 ! definição do erro tolerado

! Loop com a soma

do i=1,30,1

    x = x + 1.0/5

    if (abs(x - 3.6) < error) then

        print *, "x =", x 

    end if

end do

end program
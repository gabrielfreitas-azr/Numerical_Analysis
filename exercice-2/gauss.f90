program gauss
implicit none

! ----------------------------------------------------------
! Código compilado com GNU Fortran 11.3.0
! ~> gfortran gauss.f90 -o gauss
! 
! Gerando 'gauss' como executável.
! ----------------------------------------------------------
!
!   O código foi feito para calcular qualquer sistema linear,
!   mas para o envio foi feita uma particularização para o 
!   sistema pedido. Por isso algumas coisas podem parecer 
!   estranhas, por exemplo, a alocação das matrizes sendo
!   em tempo de execução.
!
!   A) Utilizando o código de 'gauss.f90' é possível obter as seguintes 
!   soluções para o sistema pedido:

!   0.64814814814814814        2.2037037037037037        2.3888888888888893, 

!   esse resultado é condizente para esse sistema. Para conferir utilizei a 
!   linguagem Julia com o pacote padrão "LinearAlgebra" e o script contido 
!   em 'prova-real-gauss.jl'. Caso a professora queira rodar também, o inter-
!   pretador julia está na versão 1.8.4 e o comando ~> julia prova-real-gauss.jl,
!   obtendo [0.6481481481481481, 2.2037037037037037, 2.3888888888888893].

!   B) Infelizmente não foi completo em tempo hábil para o envio.

!   C) Utilizando o comando 'time' do linux é possível medir o tempo de 
!   execução: 2.34 ms. ~> time ./gauss

!   D) O programa 'prova_real_octave.m' foi escrito para medir o tempo de
!   execução. Novamente utilizando o comando 'time' do linux 
!   ~> time octave prova_real_octave.m, que resultou em 212.91 ms.

integer :: i, j, k, max_ele_row
integer, parameter :: m = 3
real(8), allocatable :: A(:,:), x(:), b(:)
real(8) :: pivot, aux

allocate(A(m,m))
allocate(B(m))
allocate(x(m))

A(1,1) = 8
A(1,2) = 1
A(1,3) = -1

A(2,1) = 2
A(2,2) = 1
A(2,3) = 9

A(3,1) = 1
A(3,2) = -7
A(3,3) = 2

b(1) = 5
b(2) = 25
b(3) = -10

! Pivoteamento

do k = 1, m

    ! Primeiro: procura a linha com maior valor absoluto
    ! e salva a coluna

    max_ele_row = k
    
    do i = k+1, m
        if(abs(A(max_ele_row,k)) < abs(A(i,k))) then

            max_ele_row = i
        
        end if
    end do

    ! Segundo: troca a linha k com a linha do maior valor
    ! absoluto

    do j = k, m

        aux = A(k,j)

        A(k,j) = A(max_ele_row,j)
        A(max_ele_row,j) = aux

    end do

    aux = b(k)
    b(k) = b(max_ele_row)
    b(max_ele_row) = aux

    ! Aplica o método de Gauss para fazer uma matriz triangular

    do i = k+1, m
        pivot = -A(i,k)/A(k,k)

        do j = k, m
            A(i,j) = A(i,j) + pivot*A(k,j)
        end do

        b(i) = b(i) + pivot*b(k)

    end do

end do

! Substitui de baixo para cima e salva o resultado

x(m) = b(m)/A(m,m)

do i = m-1, 1, -1

    x(i) = b(i)

    do j = i+1, m

        x(i) = x(i) - A(i,j)*x(j)

    end do

    x(i) = x(i)/A(i,i)

end do

! Mostra o array com as soluções

write(*,*) "Soluções:"
write(*,*) x(:)

! Desaloca a memória

deallocate(A)
deallocate(b)
deallocate(x)

end program gauss
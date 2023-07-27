program gauss
implicit none

! ----------------------------------------------------------
! Código compilado com GNU Fortran 11.3.0
! ~> gfortran gauss.f90 -o gauss
! 
! Gerando 'gauss' como executável.
! ----------------------------------------------------------
!
!   A) Obtemos como solução:
!
!   0.64814814814814814        2.2037037037037037        2.3888888888888893
!
!   que bate com o esperado para esse sistema.
!
!
!   C) usando o comando 'time' do linux para rodar o código obtemos:
!
!   D)

integer :: i, j, k
integer :: m, max_ele_row
real(8), allocatable :: A(:,:), x(:), b(:)
real(8) :: pivot, aux

! Leitura da matriz

write(*,*) "Digite o tamanho (m) da matriz quadrada:"
read(*,*) m

allocate(A(m,m))
allocate(B(m))
allocate(x(m))

write(*,*) "Entre com os elementos da matriz A (sistema)"
write(*,*) "por colunas. Ex: a11 a21 a31 ..."

read(*,*) A

write(*,*) "Entre com a matriz b:"

read(*,*) b

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

write(*,*)
write(*,*) x(:)

! Desaloca a memória

deallocate(A)
deallocate(b)
deallocate(x)

end program gauss
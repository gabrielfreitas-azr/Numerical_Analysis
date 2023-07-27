program task1
implicit none

! ----------------------------------------------------------
! Código compilado com GNU Fortran 11.3.0
! ~> gfortran task-1.f90 -o task-1
! 
! Gerando os arquivos 'data-binary.bin' e 'data-ascii.txt'
! como saída. E 'task-1' como executável.
! ----------------------------------------------------------
!
! a) O arquivo 'data-binary.bin' gerado pelo algoritmo tem
! 8000 bytes de tamanho. Como 1 byte = 8 bits => 8 x 8000 
! = 64000 bits. Os números gerado pelo algoritmo são do tipo
! double = 64 bits, como são 1000 => 64000 bits. Como o esperado.
!
! b) Para serem interpretados, caracteres salvos em ascii seguem 
! uma tabela de códigos que representam cada um deles, inclusive números,
! por isso gastam mais armazenamento que salvar diretamente no aquivo binário. 
! É possível ver que o arquivo 'data-ascii.txt' tem 26000 bytes => aproximada-
! mente 3 vezes maior do que 'data-binary.bin'.
!

! Declaração de variáveis e criação de arquivos

integer :: i
real(8) :: array_numbers(1000)

open(10, file="data-binary.bin", action="write", form="unformatted", access='stream')
open(11, file="data-ascii.txt", action="write", form="formatted")

! Geração de números aleatórios no array
! com a subrotina random_number do fortran

call random_number(array_numbers)

! Escrita dos números nos arquivos

write (10) array_numbers
write (11,*) array_numbers

! Fechamento dos arquivos

close(10)
close(11)

end program

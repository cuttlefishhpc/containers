# info

For releases, see: https://github.com/fengyanshi/FUNWAVE-TVD

These lines were changed in the Makefile.
mpiifort normally call ifort, however, ifort was deprecated in 2024. So we use ifx
DEF_FC      = mpiifort
DEF_FC_FLAG = -fc=ifx


CC=gcc
SMLSHARP=smlsharp
SMLSHARP_LIB=/usr/local/lib/smlsharp
SOURCES=printf.sml printf.smi
TARGETS=printf

.PHONY : all clean

all : ${SOURCES}
	${SMLSHARP} printf.sml -o ${TARGETS}

clean :
	rm -f ${TARGETS}

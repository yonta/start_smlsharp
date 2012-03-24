CC=gcc
SMLSHARP=smlsharp
SMLSHARP_LIB=/usr/local/lib/smlsharp
TARGETS=hello

.PHONY : all clean

all : hello.sml hello.smi
	${SMLSHARP} hello.sml -o ${TARGETS}

clean :
	rm -f ${TARGETS}

CC=gcc
SMLSHARP=smlsharp
SMLSHARP_LIB=/usr/local/lib/smlsharp
SOURCES=hello.sml hello.smi
TARGETS=hello

.PHONY : all clean

all : ${SOURCES}
	${SMLSHARP} hello.sml -o ${TARGETS}

clean :
	rm -f ${TARGETS}

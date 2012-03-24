CC=gcc
SMLSHARP=smlsharp-0.90
SMLSHARP_LIB=/home/kei/hg/smlsharp-0.90/smlsharp/SMLSharp/local/lib/smlsharp/
TARGETS=hello

.PHONY : all clean

all : hello.sml hello.smi
	${SMLSHARP} hello.sml -o ${TARGETS}

clean :
	rm -f ${TARGETS}

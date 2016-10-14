
LIBDIR=./lib

OS_NAME=$(shell uname -s)
MH_NAME=$(shell uname -m)

ifeq (${OS_NAME}, Darwin)
LPEG_BUILD=macosx
else
LPEG_BUILD=linux
endif


all: ${LIBDIR}/lpeg.so

${LIBDIR}/lpeg.so:
	make -C ${LIBDIR}/lpeg ${LPEG_BUILD}
	cp ${LIBDIR}/lpeg/lpeg.so ${LIBDIR}

clean:
	make -C ${LIBDIR}/lpeg clean
	rm -f ${LIBDIR}/lpeg.so

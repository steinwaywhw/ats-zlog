

all: zlog.dats zlog.sats test.dats
	atscc -o zlog zlog.dats zlog.sats test.dats -lzlog -lpthread
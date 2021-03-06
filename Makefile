CXX := g++
CXX_FLAGS := -Wall -g -std=c++0x
SRCS := millionaire.cpp
OBJS := $(SRCS:.cpp=.o)

all: main

main: main.o millionaire.o
	${CXX} $(CXX_FLAGS) -o $@ main.o ${OBJS}

%.o : %.cpp
	$(CXX) $(CXX_FLAGS) -MD -o $@ -c $<
	@cp $*.d $*.P; \
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $*.P >> $*.d; \
	rm -f $*.P

clean:
	-rm *.o *.d *~

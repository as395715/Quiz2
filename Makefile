all : college doc

build : college
	
college : collegemain.o course.o college.o
	g++ collegemain.o course.o college.o
collegemain.o : collegemain.cc college.h course.h
	g++ -c collegemain.cc
course.o : course.cc course.h node.h tarray.h
	g++ -c course.cc
college.o : college.cc college.h
	g++ -c college.cc
clean :
	rm -rf *.o *.out *.core *~ core *.tar.gz html latex
doc : *.cc *.h
	doxygen

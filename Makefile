all: build doczip

build: college.o course.o collegemain.o
	g++ college.o course.o collegemain.o -o build

college.o: college.cc college.h
	g++ -c college.cc

course.o: course.cc course.h
	g++ -c course.cc

collegemain.o: collegemain.cc course.h college.h node.h
	g++ -c collegemain.cc

clean:
	-rm *.o build
	-rm -rf html latex

myexe:

doc: college.cc course.cc collegemain.cc college.h course.h tarray.h node.h
	doxygen -g doc.conf
	doxygen doc.conf

doczip:
	tar -cvzf archive.tar.gz college.cc course.cc collegemain.cc college.h course.h tarray.h node.h Makefile


CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ ! -f student-submission/ListExamples.java ]]
then
	echo "file ListExamples.java not found :("
	exit 0
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

cp -R TestListExamples.java student-submission/ListExamples.java lib grading-area

# Then, add here code to compile and run, and do any post-processing of the
# tests

cd grading-area

javac ListExamples.java
javac -cp $CPATH TestListExamples.java

if [[ ! $? -eq 0 ]]
then
	echo "Didn't compile :("
	exit 0
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples


if [[ $? -eq 0 ]]
then
	echo "Passed all test cases :)"
else
	echo "Failed some test cases :("
fi

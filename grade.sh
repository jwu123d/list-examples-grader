
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -f ListExamples.java ]]
then
  echo 'File detected'
else
  echo 'You submitted the wrong file'
  exit
fi

cd ..
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar TestListExamples.java student-submission/ListExamples.java >error-output.txt 
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples >test-output.txt 
cat test-output.txt

S=`grep 'Failures:'  test-output.txt`
SC=${S:25:1}
echo -n "Number of error your program got: "
echo $SC

if [[ $SC -eq 0 ]]
then
  echo "Good Job! you got 100%!"
elif [[ $SC -eq 1 ]]
then
  echo "You got 80%!"
elif [[ $SC -eq 2 ]]
then
  echo "You got 60%!"
elif [[ $SC -gt 2 ]]
then
  echo "Keep trying! your code didn't pass the test!"
else
  echo "Something wrong with the file!"
fi





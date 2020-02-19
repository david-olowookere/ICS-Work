/* SELF ASSESSMENT 
   1.  createSequence:
Did I use the correct method definition?
Mark out of 5: 5.
Comment: Yes.
Did I create an array of size n (passed as the parameter) and initialise it?
Mark out of 5: 5
Comment: Yes.
Did I return the correct item?
Mark out of 5: 5
Comment: Yes.
   2.  crossOutMultiples
Did I use the correct method definition?
Mark out of 5: 5
Comment: Yes.
Did I ensure the parameters are not null and one of them is a valid index into the array
Mark out of 2: 2
Comment: Yes.
Did I loop through the array using the correct multiple?
Mark out of 5: 5
Comment: Yes.
Did I cross out correct items in the array that were not already crossed out?
Mark out of 3: 3
Comment: Yes, and I made sure to include an if statement so the function doesn't check for multiples if the current item is already crossed out.  
   3.  sieve   
Did I have the correct function definition?
Mark out of 5: 5
Comment: Yes.
Did I make calls to other methods?
Mark out of 5: 5
Comment: Yes.
Did I return an array with all non-prime numbers are crossed out?
Mark out of 2: 2
Comment: I returned it as a boolean array, but the program uses the index numbers plus 2 as the numbers, and a boolean array is the simplest way to
track which numbers are cossed out or not. 
   4.  sequenceTostring  
Did I have the correct function definition?
Mark out of 5: 5
Comment: Yes.
Did I ensure the parameter to be used is not null?
Mark out of 3: 3
Comment: Yes.
Did I Loop through the array updating the String variable with the non-crossed out numbers and the crossed numbers in brackets? 
Mark out of 10: 10
Comment: Yes. I included a check in sieve() so the function is only called when the array actually updates, so it doesn't print duplicate lines.  
   5.  nonCrossedOutSubseqToString  
Did I have the correct function definition
Mark out of 5: 5
Comment: Yes.
Did I ensure the parameter to be used is not null?  
Mark out of 3: 3
Comment: Yes.
Did I loop through the array updating the String variable with just the non-crossed out numbers? 
Mark out of 5: 5
Comment: Yes.
   6.  main  
Did I ask the user for input n and handles input errors?  
Mark out of 5: 5
Comments: Yes.
Did I make calls to other methods (at least one)?
Mark out of 5: 5
Comment: I made calls to the sieve() and nonCrossedOutSubseqToString() methods.
Did I print the output as shown in the question?  
Mark out of 5: 5
Comment: Yes
   7.  Overall
Is my code indented correctly?
Mark out of 4: 4
Comments: Yes.
Do my variable names make sense?
Mark out of 4: 4
Comments: Yes.
Do my variable names, method names and class name follow the Java coding standard
Mark out of 4: 4
Comments: Yes.
      Total Mark out of 100 (Add all the previous marks): 100 
*/

import java.util.Scanner;

public class Colander {
	public static Scanner input = new Scanner(System.in);
	public static final int TWO = 2;
	public static boolean arrayUpdated;
	
	public static boolean[] createSequence(int num) {
		boolean[] sequence = new boolean[num];
		for (int index = 0; index < num; index++) {
			sequence[index] = true;
		}
		return sequence;
	}
	
	public static void crossOutHigherMultiples(boolean[] sequence, int currentNum) {
		if (sequence != null && currentNum >= 2 && currentNum <= sequence.length+2) {
			for (int index = 0; index < sequence.length; index++) {
				if ((sequence[index]) && (index+TWO != currentNum) && ((index+TWO)%currentNum == 0)) {
					sequence[index] = false;
					arrayUpdated = true;
				}
			}
		}
	}
	
	public static boolean[] sieve(int num) {
		boolean[] fullSequence = createSequence(num-1);
		System.out.println(sequenceToString(fullSequence));
		for (int index = 0; index < fullSequence.length; index++) {
			
		}
		for (int index = 0; index <= Math.sqrt(fullSequence.length); index++) {
			arrayUpdated = false;
			crossOutHigherMultiples(fullSequence, index+2);
			if (arrayUpdated) System.out.println(sequenceToString(fullSequence));
		}
		return fullSequence;
	}
	
	public static String sequenceToString(boolean[] sequence) {
		if (sequence == null) return null;
		String string = "2";
		if (sequence.length > 1) {
			for (int index = 1; index < sequence.length; index++) {
				string += ", " + ((sequence[index]) ? "" + (index+TWO) : "[" + (index+TWO) + "]");
			}
		}
		return string;
	}
	
	public static String nonCrossedOutSubseqToString(boolean[] sequence) {
		if (sequence == null) return null;
		String string = "2";
		if (sequence.length > 1) {
			for (int index = 1; index < sequence.length; index++) {
				if (sequence[index]) string += ", " + (index+TWO);
			}
		}
		return string;
	}
	
	public static void main(String[] args) {
		boolean isNumberEntered = false;
		int userNumber = TWO;
		while (!isNumberEntered) {
			System.out.print("Enter an integer larger than or equal to 2: ");
			if (input.hasNextInt())
			{
				int possibleNumber = input.nextInt();
				if (possibleNumber>=TWO)
				{
					userNumber = possibleNumber;
					isNumberEntered = true;
				}
				else
				{
					System.out.print("Invalid input. ");
					input.next();
				}
			}
			else
			{
				System.out.print("Invalid input. ");
				input.next();
			}
		}
		boolean[] sievedSequence = sieve(userNumber);
		System.out.print(nonCrossedOutSubseqToString(sievedSequence));
	}
}

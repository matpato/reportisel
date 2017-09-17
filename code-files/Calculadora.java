public class Calculadora{
	public static void main(String[] args) {
		float f1 = 1f, f2 = 0.5f;
		short n1 = 2, n2 = 9;
		char c1 = 'c', c2 = 'f';

		System.out.println("The sum is " + (f1+f2));
		System.out.println("The difference is " + (n1-n2));
		System.out.println("The division is " + (f1/f2) + " e " + (c1/c2));
		System.out.println("The mod is " + (n1%n2));
		System.out.println("The increment is " + (f1+ ++f2) + " e " + (++n1));	
	}}
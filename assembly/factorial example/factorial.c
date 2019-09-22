/**
 * Organizacion de computadoras (6620).
 * Facultad de Ingenieria. Universidad de Buenos Aires.
 */

unsigned int  factorial (unsigned int n){

	if (n < 2)
		return 1;
	else 
		return n*factorial(n-1);
}


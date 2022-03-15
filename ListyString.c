// Eric Irani
// er342145
// COP 3502
// Spring 2022
// its like a string, but worse 

#include <stdio.h>
#include <stdlib.h>
#include "ListyString.h"

int main(int argc, char **argv)
{
	// Description: You have to write a main() function for this program. It should only do the following three 
	// things: (1) capture the name of an input file (passed as a command line argument), (2) call the 
	// processInputFile() function (passing it the name of the input file to be processed), and (3) return zero.
	// Returns: Your main() function must return zero (0).
	processInputFile(argv[1]);

	return 0;
}

int processInputFile(char *filename)
{

	// Description: Read and process the input file (whose name is specified by the string filename) according 
	// to the description above in Section 2, “Input Files.” To perform the string manipulations described in 
	// that section, you should call the corresponding required functions listed below. In the event that a bad 
	// filename is passed to this function (i.e., the specified file does not exist), this function should simply 
	// return 1 without producing any output.
	
	// Output: This function should only produce output if the input file has “#”, “?”, and/or “!” commands. 
	// For details, see Section 2 (“Input Files”), or refer to the input/output files included with this assignment. 
	// Note that this function should not produce any output if the input file does not exist.
	
	// Special Considerations: You should only pass through the input file once. Do not open the input file 
	// multiple times, read its contents multiple times, or use the rewind() function (or any similar functions) to
	// move backward in the file.
	
	// Returns: If the specified input file does not exist, return 1. Otherwise, return 0.
	
	ListyString *workin;
	char liq[1023]; //line in question
	int crete = 0, opr = 0;
	FILE *file = fopen(*filename, "rt");
	
	if (file == NULL)
		return 1;
	while(fgets(liq, sizeof(liq), file))
	{
		if ( crete == 0)
		{
			workin = createListyString(liq);
			crete++;
		}
		if(opr == 1)
		{
			replaceChar(workin, char key, char *str);
			opr = 0;
		}
		if(opr == 2)
		{
			*listyCat(workin, char *str);
			opr = 0;
		}
		if(opr == 3)
		{
			*listyPrepend(workin, char *str);
			opr = 0;
		}
		if(opr == 4)
		{
			reverseListyString(workin);
			opr = 0;
		}
		if(opr == 5)
		{
			listyCensor(workin, char *badChars);
			opr = 0;
		}
		if(opr == 6)
		{
			//Delete all instances of key (if any) from your working string.
			opr = 0;
		}
		if(opr == 7)
		{
			*stringWeave(workin, char *str); 
			opr = 0;
		}
		if(opr == 8)
		{
			charCount(workin, char key);
			opr = 0;
		}
		if(opr == 9)
		{
			listyLength(workin);
			opr = 0;
		}
		if(opr == 10)
		{
			printListyString(workin);
			opr = 0;
		}
		if(liq[0] == '@')
			opr = 1;			
		if(liq[0] == '>')
			opr = 2;			
		if(liq[0] == '<')
			opr = 3;			
		if(liq[0] == '~')
			opr = 4;			
		if(liq[0] == '*')
			opr = 5;			
		if(liq[0] == '-') 
			opr = 6;
		if(liq[0] == '&')
			opr = 7;			
		if(liq[0] == '#')
			opr = 8;			
		if(liq[0] == '?')
			opr = 9;			
		if(liq[0] == '!')
			opr = 10;	
	}
	fclose(file);
	return 0;
}

ListyString *createListyString(char *str)
{
	ListyString *lstring;
	ListyNode nhead;
	int i;
	// Description: Convert str to a ListyString by first dynamically allocating a new ListyString struct, and 
	// then converting str to a linked list string whose head node will be stored inside that ListyString struct. 
	// Be sure to update the length member of your new ListyString, as well.
	// Special Considerations: str may contain any number of characters, and it may contain nonalphanumeric characters. If str is NULL or an empty string (“”), simply return a new ListyString whose 
	// head is initialized to NULL and whose length is initialized to zero.
	
	// Runtime Requirement: This should be an O(k) function, where k is the length of str.
	
	// Returns: A pointer to the new ListyString. Ideally, this function would return NULL if any calls to 
	// malloc() failed, but I do not intend to test your code in an environment where malloc() would fail, so you
	// are not required to check whether malloc() returns NULL.
	
	nhaed = lstring->head = malloc(sizeof(ListyNode));

	if (str == NULL || str = "")
	{
		lstring->length = 0;
		lstring->head = NULL;
	}
	lstring->length = sizeof(*str) / sizeof(char);
	for(i=0;i<lstring->length;i++)
	{
		nhead->next = malloc(sizeof(ListyNode));
		nhead->data = str[i];
		nhead = nhead->next;
	}

	nhead->next = NULL;
	return lstring;
}

ListyString *destroyListyString(ListyString *listy)
{
	// Description: Free any dynamically allocated memory associated with the ListyString and return NULL. 
	// Be sure to avoid segmentation faults in the event that listy or listy→head are NULL.
	
	// Returns: NULL.
	if(listy == NULL || listy->head == NULL)
		return NULL;
	poopifyer(listy->head);
	free(listy);

	return NULL;
}

poopifyer(ListyNode *node)
{
	ListyNode tbp;
	if(node == NULL)
		return;
	tbp = node->next;
	poopifyer(node->next);
	free(tbp);
	return;
}


ListyString *cloneListyString(ListyString *listy)
{
	// Description: Using dynamic memory allocation, create and return a new copy of listy. Note that you 
	// should create an entirely new copy of the linked list contained within listy. (That is, you should not just 
	// set your new ListyString’s head pointer equal to listy→head.) The exception here is that if listy→head is
	// equal to NULL, you should indeed create a new ListyStruct whose head member is initialized to NULL 
	// and whose length member is initialized to zero. If listy is NULL, this function should simply return 
	// NULL.
	
	// Runtime Requirement: The runtime of this function must be no worse than O(n), where n is the length 
	// of the ListyString.
	
	// Returns: A pointer to the new ListyString. If the listy pointer passed to this function is NULL, simply 
	// return NULL.
	if (listy == NULL)
		return NULL;
}

ListyString *listyCat(ListyString *listy, char *str)
{
	// Description: Concatenate str to the end of the linked list string inside listy. If str is either NULL or the 
	// empty string (“”), then listy should remain unchanged. Be sure to update the length member of listy as 
	// appropriate.

	// Special Considerations: If listy is NULL and str is a non-empty string, then this function should create 
	// a new ListyString that represents the string str. If listy is NULL and str is NULL, this function should 
	// simply return NULL. If listy is NULL and str is a non-NULL empty string (“”), then this function should
	// return a ListyString whose head member has been initialized to NULL and whose length member has 
	// been initialized to zero.

	// Runtime Requirement: The runtime of this function must be no worse than O(n+m), where n is the 
	// length of listy and m is the length of str.

	// Returns: If this function caused the creation of a new ListyString, return a pointer to that new 
	// ListyString. If one of the special considerations above requires that a NULL pointer be returned, then do 
	// so. Otherwise, return listy.
}

ListyString *listyPrepend(ListyString *listy, char *str)
{
	// Description: Prepend str to the beginning of the linked list string inside listy. If str is either NULL or 
	// the empty string (“”), then listy should remain unchanged. Be sure to update the length member of listy
	// as appropriate.

	// Special Considerations: If listy is NULL and str is a non-empty string, then this function should create 
	// a new ListyString that represents the string str. If listy is NULL and str is NULL, this function should 
	// simply return NULL. If listy is NULL and str is a non-NULL empty string (“”), then this function should
	// return a ListyString whose head member has been initialized to NULL and whose length member has 
	// been initialized to zero.

	// Runtime Requirement: The runtime of this function must be no worse than O(n+m), where n is the 
	// length of listy and m is the length of str.

	// Returns: If this function caused the creation of a new ListyString, return a pointer to that new 
	// ListyString. If one of the special considerations above requires that a NULL pointer be returned, then do 
	// so. Otherwise, return listy.
}

void replaceChar(ListyString *listy, char key, char *str)
{
	// Description: This function takes a ListyString (listy) and replaces all instances of a certain character 
	// (key) with the specified string (str). If str is NULL or the empty string (“”), this function simply removes
	// all instances of key from the linked list. If key does not occur anywhere in the linked list, the list remains 
	// unchanged. If listy is NULL, or if listy→head is NULL, simply return.

	// Important Note: Be sure to update the length member of the ListyString as appropriate.

	// Runtime Requirement: The runtime of this function must be no worse than O(n + km), where n is the 
	// length of listy, k is the number of times key occurs in the ListyString, and m is the length of str.

	// Returns: Nothing. This is a void function.
}

void listyCensor(ListyString *listy, char *badChars)
{
	// Description: Within listy, any character that occurs in the badChars string must be replaced with an 
	// asterisk (‘*’). For example, if listy is [d]→[w]→[i]→[n]→[d]→[l]→[e] and badChars is “elder”, 
	// then all instances of ‘e’, ‘l’, ‘d’, and ‘r’ will be replaced with asterisks in the ListyString, and the 
	// censored version of listy will be [*]→[w]→[i]→[n]→[*]→[*]→[*]. Note that the double occurrence 
	// of ‘e’ in “elder” has no special impact in this function. Note also that even though ‘d’ only occurred once
	// in “elder”, we censored both instances of that character in listy.
	// If badChars is either NULL or the empty string (“”), then listy should remain unchanged. If listy is 
	// NULL, or if listy→head is NULL, you should simply return from this function.
	// Note that badChars may contain non-alphabetic characters. In fact, it could contain any character that 
	// we can represent with a char in C. Recall that there are 256 distinct possible char values in C, with 
	// ASCII values 0 through 255. The length of badChars may exceed 256, though, because some characters 
	// may be repeated (as we saw above in “elder”). badChars will of course be terminated with a null 
	// sentinel (‘\0’) (unless badChars is NULL, in which case it contains no characters – not even a null 
	// sentinel). The first null sentinel you encounter in badChars should always be considered to mark the end
	// of that string; it should never be considered one of the characters to be censored in listy.

	// Runtime Requirement: The runtime of this function must be no worse than O(k + n), where k is the 
	// length of badChars and n is the length of the ListyString. This function should not make repeated calls 
	// to replaceChar(), as that would result in an O(kn) runtime (assuming replaceChar() is an O(n) function).

	// Hint: Highlight and/or copy and paste the following block of text into a text editor for a hint on how to 
	// meet the runtime restriction on this function. Challenge yourself to work on this one without peeking at 
	// the hint, though! If you look at the hint for this problem prematurely, you will rob yourself of the growth
	// that comes from struggling with a problem like this, which will in turn leave you ill-prepared for the 
	// exams in this class. If you’re truly ready for the hint, highlight the area beneath “Good luck!” on the 
	// final page of this PDF.

	// Returns: Nothing. This is a void function.

	int i;
	ListyNode nhead = listy->head;

	for(i = 0; i<listy->length; i++)
	{
		for(j = 0, numchar = sizeof(badchars)/sizeof(char); j < numchar; j++)
		{
			if(nhead->data == badchars[j])
			{
				nhead->data = '*';
			}
		}
		nhead = nhead->next;
	}



}

void reverseListyString(ListyString *listy)
{
	// Description: Reverse the linked list contained within listy. Be careful to guard against segfaults in the 
	// cases where listy is NULL or listy→head is NULL.
	
	// Runtime Consideration: Ideally, this function should be O(n), where n is the length of the ListyString. 
	// Note that if you repeatedly remove the tail of listy’s linked list and insert it at the tail of a new linked list 
	// using a slow tail insertion function, that could devolve into an O(n^2) approach to solving this problem.

	// Returns: Nothing. This is a void function.
	int *addys, *dattys;
	ListyNode *nhead;
	addys = malloc(sizeof(int*)*listy->length);
	dattys = malloc(sixeof(char)*listy->length);
	nhead = listy->head;
	for(i = 0;i < listy->length; i++)
	{
		addys[i] = nhead;
		dattys[i] = nhead->data
		nhead = nhead->next;
	}

	for(i = 0; i < listy->length; i++)
	{
		addys[i]->data = dattys[listy->length - i - 1];
	}
}

 ListyString *stringWeave(ListyString *listy, char *str)
{
	// Description: Interleave the characters of str into listy in such a way that each subsequent character from 
	// str appears after each subsequent character from listy. Be sure to update the length member of listy as 
	// appropriate.
	// For example, if listy is [d]→[w]→[i]→[n]→[d]→[l]→[e] and str is “elder”, this function should 
	// modify listy to become [d]→[e]→[w]→[l]→[i]→[d]→[n]→[e]→[d]→[r]→[l]→[e]. Notice that 
	// we start inserting characters from str after the first character in listy. Once we run out of characters in 
	// str, there is no impact on the rest of the ListyString. If we were instead to run out of characters in the 
	// ListyString before running out of characters in str, we would simply tack the remaining characters from 
	// str onto the end of the ListyString. For example, if listy is [x]→[y]→[z] and str is “elder”, listy
	// becomes [x]→[e]→[y]→[l]→[z]→[d]→[e]→[r].

	// Special Considerations: If str is NULL, then listy should remain unchanged, and you should simply 
	// return listy from this function. If listy is NULL and str is a non-NULL, non-empty string, then this 
	// function should create a new ListyString that represents the string str. If listy is NULL and str is a nonNULL empty string (“”), then this function should create a new ListyString whose head member has 
	// been initialized to NULL and whose length member has been initialized to zero. If listy and str are nonNULL but listy→head is NULL, you should simply update listy to contain str.

	// Special Consideration Related to Runtime: Do not destroy nodes or change the character within any 
	// of the original nodes in the ListyString. If you find yourself copying characters from one node to another
	// in the ListyString, you are probably producing an unnecessarily slow runtime for this function. The goal 
	// here is to create new nodes containing the characters from str and to link them up to the existing nodes 
	// in listy without moving listy’s nodes to new locations in memory or changing the contents of any of 
	// listy’s original nodes.

	// Runtime Requirement: The runtime of this function must be no worse than O(n + k), where n is the 
	// length of listy and k is the length of str. To achieve this, you must avoid repeatedly calling slow insertion
	// functions or repeatedly looping through listy and/or str. You should loop through listy and str exactly 
	// once each.

	// Returns: If this function caused the creation of a new ListyString, return a pointer to that new 
	// ListyString. Otherwise, return listy.
}

ListyString *listyWeave(ListyString *listy1, ListyString *listy2)
{
	// Description: This function is similar to stringWeave(), except that it operates on two ListyString 
	// arguments. Interleave the characters of listy2 into listy1 in such a way that each subsequent character 
	// from listy2 appears after each subsequent character from listy1. Be sure to update the length member of 
	// listy as appropriate. Note that this function ultimately modifies listy1, but listy2 remains unchanged, in 
	// the same way that stringWeave() modifies its listy argument but leaves the str argument unchanged.
	// Refer to stringWeave() for information about the expected behavior of this function, such as how to deal 
	// with NULL pointers and empty strings and what to do if one ListyString passed to this function is longer
	// than the other. Keep in mind that a non-NULL ListyString pointer with a NULL head pointer (and a 
	// length of zero) is equivalent to a non-NULL empty string (“”). If you require further clarification on the 
	// expected behaviors of this function, be sure to refer to the test cases included with this assignment.

	// Special Considerations: As with stringWeave(), you should not destroy nodes in listy1 or change the 
	// contents of any of listy1’s original nodes. You should simply be weaving new nodes into listy1 without 
	// moving its existing nodes around in memory or changing the characters those existing nodes contain. 
	// Furthermore, you should not make any nodes within listy1 point to actual nodes contained within listy2. 
	// Instead, you should create copies of listy2’s nodes and inject those new copies into listy1.

	// Runtime Requirement: The runtime of this function must be no worse than O(m + n), where m is the 
	// length of listy1 and n is the length of listy2. For further details, refer to the function description for 
	// stringWeave(), above.

	// Returns: If this function caused the creation of a new ListyString, return a pointer to that new 
	// ListyString. Otherwise, return listy.
}
int listyCmp(ListyString *listy1, ListyString *listy2)
{
	// Description: Compare the two ListyStrings. Return 0 (zero) if they represent equivalent strings. 
	// Otherwise, return any non-zero integer of your choosing. Note that the following are not considered 
	// equivalent: (1) a NULL ListyString pointer and (2) a non-NULL ListyString pointer in which the head
	// member is set to NULL (or, equivalently, the length member is set to zero). For the purposes of this 
	// particular function, (2) represents an empty string, but (1) does not. Two NULL pointers are considered 
	// equivalent, and two empty strings are considered equivalent, but a NULL pointer is not equivalent to an 
	// empty string.

	// Runtime Requirement: The runtime of this function must be no worse than O(n+m), where n is the 
	// length of listy1 and m is the length of listy2.

	// Returns: Zero (0) if the ListyStrings represent equivalent strings; otherwise, return any integer other 
	// than zero.
	int i, c = 0;
	ListyNode *nhead1, *nhead2;
	if(listy1 == NULL && listy2 == NULL)
		return 0;
	if(listy1 == NULL || listy2 == NULL)
		return 69420;
	if(listy1->head == NULL && listy2->head == NULL)
		return 0;
	if(listy1->length != listy2->length)
		return 69420;
	nhead1 = listy1->next;
	nhead2 = listy2->next;
	for(i = 0;i < listy1->length; i++)
	{
		if(nhead1->data != nhead2->data)
		{
			c = 1;
			break;
		}
		nhead1 = nhead1->next;
		nhead2 = nhead2->next;
	}
	if(c = 1)
		return 42069;
	if(c = 0)
		return 0;


}

int charCount(ListyString *listy, char key)
{
	// Description: Return the number of times key occurs in the ListyString.

	// Runtime Requirement: The runtime of this function must be O(n), where n is listy’s length.

	// Returns: The number of times key occurs in listy. If listy is NULL, return -1. If listy is non-NULL, but 
	// listy→head is NULL, return zero.
	int i,numkey = 0; 
	if(listy == NULL)
		return -1;
	if(listy->head == NULL)
		return 0;
	ListyNode *nhead = listy->head;

	for(i = 0; i < listy->length; i++)
	{
		if(nhead->data == key)
			numkey++;
		nhead = nhead->next;
	}
	return numkey;
}

int listyLength(ListyString *listy)
{
	// Description: Return the length of the ListyString (i.e., the length of listy’s linked list).
	
	// Runtime Requirement: The runtime of this function must be O(1).
	
	// Returns: The length of the string (i.e., the length of the linked list contained within listy). If listy is 
	// NULL, return -1. If listy is non-NULL, but listy→head is NULL, return zero.
	if (listy == NULL)
		return -1;
	if(listy->head == NULL)
		return 0;
	return listy->length;

}

void printListyString(ListyString *listy)
{
	// Description: Print the string stored in listy, followed by a newline character, ‘\n’. If listy is NULL, or if 
	// listy represents an empty string, simply print “(empty string)” (without the quotes), follow by a newline 
	// character, ‘\n’.
	
	// Returns: Nothing. This is a void function.
	int i, 
	ListyNode *nhead = listy->head;

	for(i = 0; i < listy->length; i++)
	{
		printf("%c", nhead->data);
		nhead = nhead->next;
	}
	printf("\n");
}

double difficultyRating(void)
{
	// Description: Return a double indicating how difficult you found this assignment on a scale of 1.0 
	// (ridiculously easy) through 5.0 (insanely difficult).
	return 0.0;
}

double hoursSpent(void)
{
	// Description: Return an estimate (greater than zero) of the number of hours you spent on this 
	// assignment. Your return value must be a realistic and reasonable estimate
	return 00;
}


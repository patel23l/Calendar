day(mon).
day(tue).
day(wed).
day(thu).
day(fri).
day(sat).
day(sun).

/* 
	writing to the text file 
	
	TODO: 
		need to check for valid time
		need to check for valid date
*/
writeCalendar(A, C, D, T):- open('calendar.txt', append, Stream),
			day(A),
			write(Stream, [A,C,D,T]), 
			nl(Stream),
			close(Stream).

/* 
	reading does not work 
	
	TODO:
		read line by line from text file
		it will get date as input => display all tasks of that date
*/
readCalendar:- open('calendar.txt', read, Stream),
			read_file(Str, Lines),
			close(Str),
			write(Lines),
			ml(Stream).

read_file(Stream, []):- at_end_of_stream(Stream).

read_file(Stream, [X|L]):- \+ at_end_of_stream(Stream),
			read(Stream, X),
			read_file(Stream, L).
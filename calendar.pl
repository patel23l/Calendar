day(mon).
day(tue).
day(wed).
day(thu).
day(fri).
day(sat).
day(sun).

writeCalendar(T):- open('calendar.txt', write, Stream),
			write(Stream, T), 
			nl(Stream),
			close(Stream).

readCalendar:- open('calendar.txt', read, Stream),
			read_file(Str, Lines),
			close(Str),
			write(Lines),
			ml(Stream).

read_file(Stream, []):- at_end_of_stream(Stream).

read_file(Stream, [X|L]):- \+ at_end_of_stream(Stream),
			read(Stream, X),
			read_file(Stream, L).


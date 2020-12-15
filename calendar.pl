/*
	writeCalendar => writes or adds a taks to text file for general purpose
		A: day of the week
		C: date 
		D: time 
		T: assigned task

	writeMonth => writes or add to a specific text file of the year

	displayAll => displays all tasks that exist in the calendar

	checkTask => shows how many tasks you have on that specific day

	checkAppoint => returns true if tasks exist on the given date & time 
*/

day(mon).
day(tue).
day(wed).
day(thu).
day(fri).
day(sat).
day(sun).

month(jan, 'january.txt').
month(feb, 'febraury.txt').
month(mar, 'march.txt').
month(apr, 'april.txt').
month(jun, 'june.txt').
month(jul, 'july.txt').
month(aug, 'august.txt').
month(sep, 'september.txt').
month(octo, 'october.txt').
month(nov, 'november.txt').
month(dec, 'november.txt').

/* 
	writeCalendar(A, C, D, T):- open('calendar.txt', append, Stream),
					day(A),
					D >= 1,x,
					D < 25,
					write(Stream, (A, C, D, T)), 
					nl(Stream),
					close(Stream). 
*/ 

writeCalendar(Str):- open('calendar.txt',append,Stream),
         			write(Stream,'('),
					write(Stream, Str),
					write(Stream,').'), 
					nl(Stream),
         			close(Stream).

writeMonth(N, Str):- month(N, Y),
					open(Y,append,Stream),
         			write(Stream,'('),
					write(Stream, Str),
					write(Stream,').'), 
					nl(Stream),
         			close(Stream).

checkTask(N):- open('calendar.txt',read,Str),
					readTasks(Str,Tasks),
					close(Str),	
					ismember((X,N,Y,Z),Tasks),
					write([X,Y,Z]).

checkAppoint(M, D, T):- month(M, Y),
					open(Y,read,Str),
					readTasks(Str,Tasks),
					close(Str),	
					ismember((X,D,T,Z),Tasks).

/*
	checkHours(N):- open('calendar.txt',read,Str),
					readTasks(Str,Tasks),
					close(Str),	
					ismember((X,N,Y,Z),Tasks),
					add([Y],0).

	add([Item], Item).
	add([Item1,Item2 | Tail], Total) :- add([Item1+Item2|Tail], Total).

	ismember(X,[X|_]).
	ismember(X,[_|T]):- ismember(X,T).

	displayAllAppJan:- open('January.txt',read,Str),
						readTasks(Str,Tasks),
						close(Str),
						write(Tasks),  	
						nl. 
*/

displayAll:-
    open('calendar.txt',read,Str),
    readTasks(Str,Tasks),
    close(Str),
    write(Tasks),  	
	nl.

displayMonth(M):- month(M, Y),
    open(Y,read,Str),
    readTasks(Str,Tasks),
    close(Str),
    write(Tasks),  	
	nl.
   
readTasks(Stream,[]):-
    at_end_of_stream(Stream).
   
readTasks(Stream,[X|L]):-
    \+  at_end_of_stream(Stream),
    read(Stream,X),
    readTasks(Stream,L).
/*
	writeCalendar => writes or adds a taks to text file
		A: day of the week
		C: date 
		D: time 
		T: assigned task

	displayAll => displays all tasks that exist in the calendar

	checkTask => shows how many tasks you have on that specific day

	available appointments, count hours of work, count number of national holidays
*/

day(mon).
day(tue).
day(wed).
day(thu).
day(fri).
day(sat).
day(sun).

writeCalendar(A, C, D, T):- open('calendar.txt', append, Stream),
	day(A),
	D >= 1,x
	D < 25,
	write(Stream, (A, C, D, T)), 
	nl(Stream),
	close(Stream). 

checkTask(N):- open('calendar.txt',read,Str),
    readTasks(Str,Tasks),
    close(Str),	
	ismember((X,N,Y,Z),Tasks),
	write([X,Y,Z]).

ismember(X,[X|_]).
ismember(X,[_|T]):- ismember(X,T).

displayAllAppJan:-
	open('January.txt',read,Str),
	readTasks(Str,Tasks),
	close(Str),
	write(Tasks),  	
	nl.

displayAll:-
    open('calendar.txt',read,Str),
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
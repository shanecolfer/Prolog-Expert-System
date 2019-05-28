/* Start of XPS */
start :-
	write('Please enter your name:'),
	read(Username),
	format('Hello ~w please answer the following questions and I will guess your instrument', [Username]),
	nl,
	hypothesize(Instrument),
	findall(B, yes(B), T),
	write('I guess that the instrument: '),
	write(Instrument),
	nl,
	write(T),
	nl,
	undo.


/*Hypotheses to be tested */
hypothesize(violin) :-
	string,
	classical,
	verify(has_4_strings),
	verify(uses_bow),
	verify(has_small_body),
	!.

hypothesize(cello) :-
	string,
	classical,
	verify(has_4_strings),
	verify(uses_bow),
	verify(has_large_body),
	!.

hypothesize(double_bass):-
	string,
	classical,
	verify(has_large_body),
	verify(has_4_strings),
	!.

hypothesize(flute):-
	woodwind,
	classical,
	verify(is_reedless),
	!.

hypothesize(timpani):-
	drums,
	classical,
	verify(is_one_large_drum),
	!.

hypothesize(classical_guitar) :-
	classical,
	string,
	verify(has_nylon_strings),
	verify(is_spanish),
	verify(has_6_strings),
	!.

hypothesize(acoustic_guitar) :-
	string,
	verify(has_steel_strings),
	verify(has_6_strings),
	!.

hypothesize(electricguitar) :-
	string,
	verify(is_electric),
	verify(has_6_strings),
	!.

hypothesize(clarinet) :-
	classical,
	woodwind,
	verify(uses_reed),
	!.

hypothesize(trumpet) :-
	classical,
	brass,
	verify(has_three_valves),
	verify(has_high_register),
	!.

hypothesize(trombone):-
	classical,
	brass,
	verify(has_no_valves),
	verify(has_slide),
	!.

hypothesize(tuba):-
	classical,
	brass,
	verify(has_3_to_6_valves),
	verify(has_low_register),
	!.

hypothesize(saxophone):-
	woodwind,
	verify(used_in_jazz),
	verify(uses_reed),
	verify(made_from_brass),
	!.

hypothesize(piano):-
	string,
	classical,
	verify(used_in_jazz),
	verify(has_keys),
	verify(is_acoustic),
	!.

hypothesize(drum_kit):-
	drums,
	verify(used_in_rock),
	verify(used_in_jazz),
	!.

hypothesize(electric_bass):-
	string,
	verify(has_four_strings),
	verify(is_electric),
	verify(used_in_rock),
	verify(used_in_jazz),
	!.

hypothesize(keyboard):-
	verify(is_electric),
	verify(has_keys),
	verify(used_in_rock),
	verify(used_in_jazz),
	!.

hypothesize(synth):-
	verify(is_electric),
	verify(has_keys),
	verify(used_in_rock),
	verify(used_in_electronic_music),
	!.

hypothesize(triangle):-
	classical,
	verify(is_triangular),
	!.

hypothesize(banjo):-
	string,
	verify(has_5_strings),
	verify(is_acoustic),
	!.

hypothesize(unknown).

/*ClassificationRules*/

string :-
	verify(has_strings).

classical:-
	verify(used_in_orchestra).
	
woodwind:-
	verify(is_made_from_wood).
	
drums:-
	verify(hit_with_a_stick).
	
brass:-
	verify(made_from_brass),
	verify(lip_vibrated).

/*HowToAskQuestin*/

ask(Question):-
write('Does the instrument have the following attribute: '),
write(Question),
write('? '),
read(Response),
nl,
(
	(Response == yes ; Response == y)
	->
		asserta(yes(Question))
	;
		asserta(no(Question)),
		fail
).

:-dynamic(yes/1,no/1).

/*HowtoVerifySomething*/
verify(S) :-
(
	yes(S)
	->
	true
	;
(
	no(S)
	->
	fail
	;
	ask(S)
)
).

/*undo all yes/no assertions*/
undo :-
	retract(yes(_)),
	fail.
undo :-
	retract(no(_)),
	fail.
undo.

/*instruments*/
instrument(violin).
instrument(cello).
instrument(flute).
instrument(timpani).
instrument(spanish_guitar).
instrument(acoustic_guitar).
instrument(electric_guitar).
instrument(clarinet).
instrument(trumpet).
instrument(trombone).
instrument(tuba).
instrument(saxophone).
instrument(piano).
instrument(drum_kit).
instrument(electric_bass).
instrument(keyboard).
instrument(synth).
instrument(triangle).
instrument(banjo).



/*Structs */
/*instrument(name,type,genre,features,string_no,size)*/

instrument(

	violin,
	string,
	classical,
	[uses_bow],
	4,
	small
	).
	
	instrument(

	cello,
	string,
	classical,
	[uses_bow],
	4,
	medium
	).
	
	instrument(

	double_bass,
	string,
	classical,
	[stand_up],
	4,
	medium
	).
	
	instrument(

	flute,
	woodwind,
	classical,
	[is_reedless],
	0,
	small
	).
	
	instrument(

	timpani,
	percussion,
	classical,
	[one_large_drum],
	0,
	large
	).
	
	instrument(

	classical_guitar,
	string,
	classical,
	[has_nylon_strings,
	is_spanish],
	6,
	medium
	).
	
	instrument(

	acoustic_guitar,
	string,
	folk,
	[has_steel_strings],
	6,
	medium
	).
	
	instrument(

	electric_guitar,
	string,
	rock,
	[is_electric],
	6,
	medium
	).
	
	instrument(

	clarinet,
	woodwind,
	classical,
	[uses_reed],
	0,
	small
	).
	
	instrument(

	trumpet,
	brass,
	classical,
	[has_three_valves,
	has_high_register],
	0,
	small
	).
	
	instrument(

	trombone,
	brass,
	classical,
	[has_no_valves,
	has_low_register],
	0,
	medium
	).
	
	instrument(

	tuba,
	brass,
	classical,
	[has_3_to_6_valves,
	has_low_register],
	0,
	medium
	).
	
	instrument(

	saxophone,
	woodwind,
	classical,
	[used_in_jazz,
	uses_reed,
	made_from_brass],
	0,
	medium
	).
	
	instrument(

	piano,
	string,
	classical,
	[has_keys,
	used_in_jazz,
	is_acoustic],
	230,
	large
	).
	
	instrument(

	drum_kit,
	percussion,
	rock,
	[made_up_of_multiple_drums],
	0,
	large
	).
	
	instrument(

	electric_bass,
	string,
	rock,
	[has_low_register,
	is_electric],
	4,
	medium
	).
	
	instrument(

	keyboard,
	keys,
	rock,
	[is_electric,
	has_keys],
	0,
	large
	).
	
	instrument(

	synth,
	keys,
	rock,
	[is_electric,
	has_keys,
	used_in_electronic_music],
	0,
	medium
	).
	
	instrument(

	triangle,
	percussion,
	classical,
	[is_triangular],
	0,
	small
	).
	
	instrument(

	banjo,
	string,
	folk,
	[is_acoustic],
	5,
	medium
	).
	

/* Predicates */
instrument_features(Name, [Features1| FeaturesN]):- 			/*Returns features of given instrument*/
	instrument(
		Name,
			_,
			_,
			[Features1|FeaturesN],
			_,
			_
			).

instrument_type(Name, Type):-									/*Return type of given instrument*/
	instrument(
		Name,
		Type,
		_,
		_,
		_,
		_
		).
		
instrument_genre(Name, Genre):-									/*Return genre of given instrument*/
	instrument(
		Name,
		_,
		Genre,
		_,
		_,
		_
		).
		
no_of_strings(Name, No_of_strings):-							/*Return no of strings of given instrument*/
	instrument(
		Name,
		_,
		_,
		_,
		No_of_strings,
		_
		).
		
more_strings(X, Y):- 										   /*Returns which instrument has more strings*/
	instrument(
		X,
		_,
		_,
		_,
		No_of_strings,
		_
		),
	instrument(
		Y,
		_,
		_,
		_,
		No_of_strings1,
		_
		),
		(
			(	
				No_of_strings>No_of_strings1,
				More_strings = X,
				Less_strings = Y,
				write('The '),
				write(X),
				write(' has more strings than the '),
				write(Y)
			);
			(
				No_of_strings1>No_of_strings,
				More_strings = Y,
				Less_strings = X,
				write('The '),
				write(X),
				write(' has less strings than the '),
				write(Y)
			);
			(
				No_of_strings==No_of_strings1,
				More_strings = 'The instruments have the same amount of strings!'
			)
		).
		
same_type(X, Y):-											/*Returns if instruments are of the same type*/
	instrument(
		X,
		Type1,
		_,
		_,
		_,
		_
	),
	instrument(
		Y,
		Type2,
		_,
		_,
		_,
		_
	),
	(
		(
			Type1 == Type2,
			write('These instruments are of the same type:'),
			write(Type1)
		);
		(
			write('These instruments are not of the same type!')
		)
	).
	
same_no_of_strings(X, Y):-									/*Returns if the instruments have the same number of strings*/
	instrument(
		X,
		_,
		_,
		_,
		Strings1,
		_
		),
		instrument(
		Y,
		_,
		_,
		_,
		Strings2,
		_
		),
		(
			(
				Strings1 == Strings2,
				write('These instruments have the same amount of strings: '),
				write(Strings1)
			);
			(
				write('These instruments do not have the same number of strings')
			)
		).
		
same_genre(X, Y):-
	instrument(
		X,
		_,
		Genre1,
		_,
		_,
		_
	),
	instrument(
		Y,
		_,
		Genre2,
		_,
		_,
		_
	),
	(
		(
			Genre1 == Genre2,
			write('These instruments are of the same genre:'),
			write(Genre1)
		);
		(
			write('These instruments are not of the same genre!')
		)
	).

instrument_size(Name, Size):-									/*Return type of given instrument*/
	instrument(
		Name,
		_,
		_,
		_,
		_,
		Size
		).
		
same_size(X, Y):-												/*Returns if two instruments are of the same size*/
	instrument(
		X,
		_,
		_,
		_,
		_,
		Size1
	),
	instrument(
		Y,
		_,
		_,
		_,
		_,
		Size2
	),
	(
		(
			Size1 == Size2,
			write('These instruments are of the same size:'),
			write(Size1)
		);
		(
			write('These instruments are not of the same size!')
		)
	).

		


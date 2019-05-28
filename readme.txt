Title: Instrument Expert System
Author: Shane Colfer
Language: Prolog Version 7.6.4
OS Version: Windows 10
Date: 28/02/2019
----------------------------------

1.How to Start the System: 
--------------------------

You can start the system by entering start into the console.
You are prompted to enter your name (this must be entered all lower case).

2.How to Interact with the System:
----------------------------------

After pressing start and entering your name, you are asked a series of yes and no questions
with which the system will guess an instrument that you are thinking of in your head.

After guessing your instrument it will also print a tree of derivation.

An example of this interaction would be : 

?- start.
Please enter your name:shane.
Hello shane please answer the following questions and I will guess your instrument
Does the instrument have the following attribute: has_strings? |    no.

Does the instrument have the following attribute: is_made_from_wood? |    yes.

Does the instrument have the following attribute: used_in_orchestra? |    yes.

Does the instrument have the following attribute: is_reedless? |    yes.

I guess that the instrument: flute
[is_reedless,used_in_orchestra,is_made_from_wood]
true.

There are 19 instruments in the system: (case sensitive when using predicates)

violin
cello
flute
timpani
classical_guitar
acoustic_guitar
electric_guitar
clarinet
trumpet
trombone
tuba
saxophone
piano
drum_kit
electric_bass
keyboard
synth
triangle
banjo

3.Using the functions of the system / where the components can be found:
------------------------------------------------------------------------

All components of the system can be found in the aipractical19_763097.pl

The start. component asks a series of yes and no questions
with which the system will guess an instrument that you are thinking of in your head.
The code for this component is from line 1 to line 213.

There are then 10 predicates which you can use as functions to return information about the system.
These are located starting 455 and are labelled by a comment. These are:

instrument_features:
-------------------
Here you can provide the function with an instrument and it will return it's features.
EG: 
?- instrument_features(synth, X).
X = [is_electric, has_keys, used_in_electronic_music].

instrument_type:
-------------------
Here you can provide the function with an instrument and it will return it's type.
EG:
?- instrument_type(violin,X).
X = string.

instrument_genre:
-------------------
Here you can provide the function with an instrument and it will return it's genre:
EG:
?- instrument_genre(drum_kit,X).
X = rock.

no_of_strings:
-------------------
Here you can provide the function with an instrument and it will return it's number of strings:
EG:
?- no_of_strings(violin, X).
X = 4.

more_strings:
-------------------
Here you can provide the function with two instruments and the program will tell you which has more strings:
EG:
?-more_strings(electric_guitar, violin).
The electric_guitar has more strings than the violin
true 

same_type:
-------------------
Here you can provide the function with two instruments and the program will tell you if they have the same type:
EG:
?- same_type(violin,cello).
These instruments are of the same type:string
true 

same_no_of_strings:
-------------------
Here you can provide the function with two instruments and the program will tell you if they have the same no. of strings
EG:
?- same_no_of_strings(violin,cello).
These instruments have the same amount of strings: 4
true 

same_genre:
-------------------
Here you can provide the function with two instruments and the program will tell you if they are of the same genre.
EG:
?- same_genre(electric_guitar,drum_kit).
These instruments are of the same genre:rock
true 

instrument_size:
-------------------
Here you can provide the function with one instrument and it will return it's size.
EG:
?- instrument_size(cello, X).
X = medium.

same_size:
-------------------
Here you can provide the function with two instruments and the function will return if they are the same size:
EG:
?-same_size(violin,trumpet).
These instruments are of the same size:small
true 

4.How the Logic is Modelled
---------------------------

All of the instruments are listed as facts starting from line 215.

The logic in the system is modelled using structs. These can be found starting at line 238.
The layout of the structs are as follows:

instrument(name,type,genre,features,string_no,size)

Features is a list, as some of the instruments have more than one feature.

5.How the Logic is Processed
----------------------------

I process the logic in my predicates by using the structs I have defined for my instruments.
By using this information and comparing it, I can provide results based on the input.








README
======

A program to parse and validate credit cards using the Luhn algorithm.

The input will be the number of cards T (where 0 <= T <= 10), followed by a card number for each line,
so that there will be additional T lines of input. Each card number consists of 16 digits of charactes,
where valid characters consists of `0-9` and `?`.

The `?` character can appear anywhere in the 16 digits, and each of `?` character must be replaced
with `0-9`. The number of `?` character each line is limited between 1 to 4.
  
Input:
```
Jumlah Kartu > 2
Kartu 1> 4111-1111-1111-1111
Kartu 2> 4111-1111-1111-11?2
```
 
Output:
```
Output Kartu 1> 1
Output Kartu 2> 1  
```
 
Explanation of Input / Output:

- 4111-1111-1111-1111 will generate 4111-1111-1111-1111 
  and this is a valid credit card based on the Luhn algorithm, so the program outputs 1.
- 4111-1111-1111-11?2 will generate:
  * 4111-1111-1111-1102 (invalid luhn)
  * 4111-1111-1111-1112 (invalid luhn)
  * 4111-1111-1111-1122 (invalid luhn)
  * 4111-1111-1111-1132 (invalid luhn)
  * 4111-1111-1111-1142 (invalid luhn)
  * 4111-1111-1111-1152 (valid luhn)
  * 4111-1111-1111-1162 (invalid luhn)
  * 4111-1111-1111-1172 (invalid luhn)
  * 4111-1111-1111-1182 (invalid luhn)
  * 4111-1111-1111-1192 (invalid luhn) 
  Only 4111-1111-1111-1152 is valid based on the Luhn algorithm, so the program outputs 1.


## Installation

Clone this repository:

```
git clone https://bitbucket.org/ismailfaruqi/luhn.git
```

## Running the program

Given that the cloned repository are saved into __luhn__ directory:

```
cd luhn
ruby luhn.rb
```

## Running the test

Given that the cloned repository are saved into __luhn__ directory:

```
cd luhn
rspec spec/*
```
### Motivation
As a dedicated scrabble player myself I decided to give the user the ability to score a word by the letter values and an actual Scrabble 15 x 15 grid like the one below.

![alt text](https://github.com/Confidenceman02/Scrabble-challenge/blob/master/assets/images/scrabble_grid.png)

This is represented visually using the tty toolkit.

<img src="./assets/images/scrabble_grid_IG.png" alt="Drawing" width="288"/>

### Functionality
Install Dependencies <br>
```gem install tty```
To initiate a game <br>
```> cd lib``` <br>
```> ruby gamePrompt``` <br>

The user is given two options <br>
```> Score word``` <br> 
and <br>
```> Score word with Scrabble grid``` <br>
<br>
```> Score Word``` will let the user input a word and a score will be returned based on scores for each letter in the word.
e.g.
```> cabbage => 14```

In ```> Score word with Scrabble grid``` the user inputs a word, a direction(ACROSS, DOWN) and a starting position(A1).
This will allow the word to be scored with any multipliers the word should accrue based on a official Scrabble grid.

```> hooroo ACROSS A1 => 30```
<br>
```> hooroo DOWN A2 => 30```


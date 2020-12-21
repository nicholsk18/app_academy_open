# Tic-Tac-Toe
Let's write a Tic-Tac-Toe game! Read the entire instructions before getting started. You'll be creating this entire project from scratch, no skeleton. We'll build three iterations of the game, each adding an interesting twist on the gameplay:

- Version 1 - Basic 3x3 grid game with 2 human players
- Version 2 - Dynamic sized grid with 2 or more human players
- Version 3 - Dynamic sized grid with 2 or more human or computer players

## Version 1: Make it work
Below we have recommendations on how to design your game. For simplicity, we'll give the grid the dimensions of classic tic-tac-toe, 3x3. This can later be refactored for a dynamic grid size. Let's establish some guidelines that will help our game take shape later.

Programmatically, we'll use a 2-dimensional array to present the grid. Our players will have unique symbols for gameplay. We'll refer to those as marks. An empty position on the grid will be represented with an underscore `'_'`. Below is an example of a grid:

```ruby
[
    [:X, :O, '_'],
    [:O, :X, '_'],
    ['_', '_', :X],
]
```

To refer to a position of the grid, we'll use an array containing the row and column indices. For example, the position of the first row, second column would be `[0, 1]`; this is the location of a `:O`.

## Directory structure

We'll be building 3 classes to construct our basic game. Begin by creating a `tic_tac_toe_v1` directory with the following structure:

```
tic_tac_toe_v1/
├── board.rb
├── human_player.rb
└── game.rb
```

Once we have the basic game down, we'll implement some fun additional features! Ready?

## Board

The `Board` class is responsible for adding a player's marks, checking for winners, and printing the game board. A board instance must have an attribute to represent the grid. For simplicity, give the grid the dimensions of classic tic-tac-toe, 3x3.

### Board#initialize

A `Board` instance must have an instance variable to represent the game grid. For now, `Board#initialize` does not need to accept any arguments. Initialize the grid so that all positions are empty; this means that every position should contain an underscore `('_')`.

### Board#valid?(position)

This method should return a boolean indicating whether or not the specified position is valid for the board, meaning the position is not "out of bounds."

### Board#empty?(position)

This method should return a boolean indicating whether or not the specified position does not contain a player's mark.

### Board#place_mark(position, mark)

This method should assign the given mark to the specified position of the grid. It should raise an error when the position is not `#valid?` or not `#empty?`.

### Checkpoint - Board yet?

At this point you've written a few Board methods that are critical to the gameplay. Now's a good opportunity to pause and test our code for correctness. A quick way to test is to use pry.

You should `cd` into the project folder and run `pry`. Then, use `load 'board.rb'` to load your code into the environment, this should return `true` if the file was successfully loaded. From there, play around with your class by creating an instance and calling some methods on it! If you edit the file you are going to have to load it into the environment again.

Here are a few lines that we executed to test our code, feel free to try your own scenarios:

```
[1] pry(main)> load 'board.rb'
=> true

[2] pry(main)> b = Board.new
=> #<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>

[3] pry(main)> b.place_mark([-1, 2], :X) # this should fail
RuntimeError: invalid mark
from board.rb:28:in 'place_mark'

[4] pry(main)> b.place_mark([1, 2], :X)
=> :X

[5] pry(main)> b
=> #<Board:0x @grid=[["_", "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

[6] pry(main)> b.place_mark([1, 3], :X) # this should fail
RuntimeError: invalid mark
from board.rb:28:in 'place_mark'

[7] pry(main)> b.place_mark([0, 0], :O)
=> :O

[8] pry(main)> b
=> #<Board:0x @grid=[[:O, "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

[9] pry(main)> b.place_mark([0, 0], :X) # this should fail
RuntimeError: invalid mark
from board.rb:28:in 'place_mark'
```

Once you feel confident with your code, move forward. As a programmer, you should test your code often as you write. If you continue to write code on top of broken code, you may accumulate a deficit of bugs that will be hard to isolate later on. Be methodical! You should be testing your code often, and not just when we tell you!

### Board#print

This method should simply print out the board and all of the marks that have been placed on it. Feel free to style the printing as much as you'd like, but be sure to print out each row of the board on a new line. This will help us visualize the board better as we debug or even play the game!

### Board#win_row?(mark)

This method should return a boolean indicating whether or not the given mark has completely filled up any row of the grid.

### Board#win_col?(mark)

This method should return a boolean indicating whether or not the given mark has completely filled up any column of the grid.

### Board#win_diagonal?(mark)

This method should return a boolean indicating whether or not the given mark has completely filled up either diagonal of the grid.

### Board#win?(mark)

This method should return a boolean indicating whether or not the given mark has filled any full row, column, or diagonal.

### Board#empty_positions?

This method should return a boolean indicating whether or not there is at least one empty position on the grid.

### Checkpoint - You're all winners

If you haven't already, take a moment to use pry to test your win-checking logic. Use your `#place_mark` to set the board up and `#print` to visually verify any winners. We'll leave it to you to decide reasonable test scenarios. As a rule of thumb for methods with boolean returns, be sure to test for "false-positives" and "false-negatives". In other words, verify that `#win?` and the related methods return true when they should and return false when they should. Don't forget to test your `#empty_positions?` method as well!

## HumanPlayer

The `HumanPlayer` class is responsible for holding information about the user and prompting them to enter a position for gameplay.

### HumanPlayer#initialize(mark_value)

We'll allow a player to use any mark they like, so an instance of `HumanPlayer` should have a instance variable to store their mark. The value of this mark should be provided as an argument when creating a new player. Consider adding a getter method for the player's mark, this may be useful later!

### HumanPlayer#get_position

This method should prompt and allow the user to enter a valid `row col` position. We recommend that you ask the user to enter the position as two numbers with a space between them. Your method should return their entered position as an array of the form `[row, col]` so that it is compatible with the design of our previous `Board` methods. For usability, raise an error when they fail to enter a position in the specified format, such as if they only enter a single number, use letters, or have too many spaces.

No need to verify if the position they entered is a valid position in this class. That validation requires knowledge of the board and we want to keep our concerns separated. Besides, you previously implemented that logic in `Board#valid?` and `Board#empty?`.

It's also helpful if you state the player's mark when asking them to enter a move, so we know whose turn it is.

### Checkpoint - Test often, we're only human after all

This is a great time to test your work! Load your `HumanPlayer` class into `pry` and test it. Here is how we tested our player:

```
[1] pry(main)> load 'human_player.rb'
=> true

[2] pry(main)> player_1 = HumanPlayer.new(:X)
=> #<HumanPlayer:0x @mark=:X>

[3] pry(main)> player_1.mark
=> :X

[4] pry(main)> player_1.get_position
Player X, enter two numbers representing a position in the format 'row col'
0 2
=> [0, 2]

[5] pry(main)> player_1.get_position
Player X, enter two numbers representing a position in the format 'row col'
12 4
=> [12, 4]

[6] pry(main)> player_1.get_position
Player X, enter two numbers representing a position in the format 'row col'
1 2 3
RuntimeError: sorry, that was invalid :(
```

Before you move on, double check that your Player#get_position returns an array of numbers, and not an array of strings. This will save you a ton of headaches later!

## Game

The `Game` class will be the main class that houses the instances of `Board` and `HumanPlayer` required for gameplay. It will be responsible for passing data between the board and players. It will also serve to contain the main game loop.

Be sure to require your `board.rb` and `human_player.rb` files into `game.rb`.

### Game#initialize(player_1_mark, player_2_mark)

An instance of `Game` should have instance variables for player one, player two, and the board. Design the `#initialize` method to accept the mark values to be used for the players.

You should also initialize an instance variable to contain the current player. By default, player one should begin as the current player.

### Game#switch_turn
This method should set the current player to the other player. Calling this method repeatedly should switch the current player back and forth between the two players.

This method is critical for gameplay so be sure to test it in pry. Here is how our switching mechanic performs:

```
[1] pry(main)> load 'game.rb'
=> true

[2] pry(main)> game = Game.new(:X, :O)
=> #<Game:0x0
 @current_player=#<HumanPlayer:0x @mark=:X>,
 @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
 @player_1=#<HumanPlayer:0x @mark=:X>,
 @player_2=#<HumanPlayer:0x @mark=:O>>

[3] pry(main)> game.switch_turn
=> #<HumanPlayer:0x @mark=:O>

[4] pry(main)> game
=> #<Game:0x00007f8b5ac725f8
 @current_player=#<HumanPlayer:0x @mark=:O>,
 @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
 @player_1=#<HumanPlayer:0x @mark=:X>,
 @player_2=#<HumanPlayer:0x @mark=:O>>

[5] pry(main)> game.switch_turn
=> #<HumanPlayer:0x @mark=:X>

[6] pry(main)> game
=> #<Game:0x00007f8b5ac725f8
 @current_player=#<HumanPlayer:0x @mark=:X>,
 @player_1=#<HumanPlayer:0x @mark=:X>,
 @player_2=#<HumanPlayer:0x @mark=:O>>
 @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
```

Notice how `@current_player` changes when we call `#switch_turn`. With that, we now have all the mechanics needed to put the game together!

### Game#play
This method will contain the main game loop. Here is some psuedocode for the loop:

- while there exists empty positions on the board
  - print the board
  - get a position from the current player
  - place their mark at that position of the board
  - check if that user has won
    - if they win, print out a 'victory' message saying who won and return to end the game
    - Otherwise they did not win, so switch turns
- if we finish the while loop without returning, that means there are no more empty positions on the board and noone has won, so print a 'draw' message

Test your game in pry. Play a few games by creating an instance of `Game` and invoking `#play` on it. After a game is over, be sure to create a new instance of `Game` to play again, this is the only way to get a fresh board. Some scenarios to test are: player one winning, player two winning, and a draw.

If any errors are raised during gameplay, your game loop and `#play` method will end immediately, so you'll have to start a new game and retry!

## Version 2: Make it scalable
Make a copy of your entire `tic_tac_toe_v1` directory and rename it `tic_tac_toe_v2`. Open the version 2 in your editor and terminal so we can refactor it to support more features. This will be our new working directory.

Our goal for this version is to make the game scale on two fronts:

1. support a dynamic board size
2. support more than two players

### Board size refactor
We need to change a few things to support any size board. We'll mention a few general todos, but you may need to change more if you hard-coded a 3x3 size in your first iteration.

### Board#initialize
Refactor this method to accept a number argument, <b>n</b>. The grid should be set to a 2-dimensional array with size 'n x n', instead of '3 x 3'. It's worth noting that the grid will always be a square (meaning its height is equal to its width). This will somewhat simplify things as we refactor our other methods.

Consider refactoring these critical board methods if they contain any hardcoded values:

- `#valid?`
- `#print`
- `#win_row?`
- `#win_col?`
- `#win_diagonal`
- `#win?`
- `#empty_positions?`

### Checkpoint - Test the fruits of your labor(ed)
Load `board.rb` using pry. Create different sized boards and invoke <b>all</b> board methods on them. Here are our initial tests, but you should be much more thorough:

```
[1] pry(main)> load 'board.rb'
=> true

[2] pry(main)> small = Board.new(4)
=> #<Board:0x
 @grid=[
   ["_", "_", "_", "_"],
   ["_", "_", "_", "_"],
   ["_", "_", "_", "_"],
   ["_", "_", "_", "_"]]
   >

[3] pry(main)> large = Board.new(6)
=> #<Board:0x
 @grid=
  [["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"]]>

[4] pry(main)> small.valid?([3, 3])
=> true

[5] pry(main)> small.valid?([5, 5])
=> false

[6] pry(main)> large.valid?([5, 5])
=> true
```

### Game#initialize
Refactor this method to also accept a number for the board size as the first argument.

That should be all we need to refactor, since we designed our version 1 to avoid as much coupling to `Board` as possible. However, take a moment to scan the rest of your `Game` and `HumanPlayer` class to be sure.

Use pry to play a few games of varying size to completion before continuing further.

## Number of players refactor
Adding support for any number of players should require a decent refactor of the `Game` class, but no major changes to `HumanPlayer`. The only logic that should change is how we decide which player should move, but the capabilities of any single player remains unchanged.

### Game#initialize
An instance of `Game` will now need to track an array of many players instead of just two. Make this an instance variable. Allow your `#initialize` to accept any number of mark values. The number of marks passed to `#initialize` will decide how many players are in the game.

### Game#switch_turn
For our switching logic, we'll use a "Round Robin" strategy. This means that players continually take turns in the same order. For example, if we had players A, B, and C, then the turns would be ABCABCABC... until the game is over.

For simplicity, we'll always designate whoever is at the front of the array as the current player. Consider using `Array#rotate!` to accomplish this.

Test the switching logic in isolation using pry. Here is how our class works:

```
[1] pry(main)> load 'game.rb'
=> true

[2] pry(main)> g = Game.new(4, 'A', 'B', 'C')
=> #<Game:0x
 @board=
  #<Board:0x
   @grid=[["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"]]>,
 @current_player=#<HumanPlayer:0x @mark="A">,
 @players=
  [#<HumanPlayer:0x @mark="A">,
   #<HumanPlayer:0x @mark="B">,
   #<HumanPlayer:0x @mark="C">]>

[3] pry(main)> g.switch_turn
=> #<HumanPlayer:0x @mark="B">

[4] pry(main)> g.switch_turn
=> #<HumanPlayer:0x @mark="C">

[5] pry(main)> g
=> #<Game:0x
 @board=
  #<Board:0x
   @grid=[["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"]]>,
 @current_player=#<HumanPlayer:0x @mark="C">,
 @players=
  [#<HumanPlayer:0x @mark="C">,
   #<HumanPlayer:0x @mark="A">,
   #<HumanPlayer:0x @mark="B">]>
```

After you see that the current player is switching properly, you should be able to play your game! Play a few rounds of varying size for good measure. Pretty neat, huh?

## Version 3: Rise of the machines

Make a copy of your entire `tic_tac_toe_v2` directory and rename it `tic_tac_toe_v3`. Open the version 3 in your editor and terminal so we can refactor it to support more features. This will be our new working directory.

Our goal for this version is to implement a simple `ComputerPlayer` class that will play randomly. We will also add some improved error handling for our existing `HumanPlayer`s.

Let's begin by adding a new file in our working directory to house `ComputerPlayer`:

```
tic_tac_toe_v3/
├── computer_player.rb
├── human_player.rb
├── board.rb
└── game.rb
```

### Refactoring for random positions
Our `ComputerPlayer` artificial intelligence will be naive. When it is their turn, a computer will play a random position on the board. However, we'll want ensure that the computers will choose a position that is legal according to `Board#empty?` and `Board#valid?`. To implement this we, could just continually "guess and check" random positions until a legal position is stumbled upon, but this is a rather wasteful strategy. Instead, it would be much more wise to provide a list of legal positions to the `ComputerPlayer` from which they may randomly select.

Here is where we must make a design decision founded on object oriented principles. We should try our best to keep all board and position related logic inside of `Board`. Although our new major feature is `ComputerPlayer`, it is apparent that the `Board` class also needs to provide additional information for a `ComputerPlayer` to consume.

### Board#legal_positions
This method should return an array containing all positions of the board that are legal to place a new mark on. That is, the returned positions should not already contain a mark and also be "in-bounds" on the grid.

### ComputerPlayer#initialize
An instance of `ComputerPlayer` should have the same interface as a `HumanPlayer`. This means that both classes should have the same method names, but may implement these methods using different logic. Having a consistent interface for all types of players will allow us to use computers and humans interchangeably in a game with no annoying side-effects. The `#initialize` for a computer should be identical to that of a human.

The programming paradigm we leverage here is known as duck typing. If an object walks like a duck and quacks like a duck, then we can use it as a duck for all intents and purposes. In our game, we have duck typed `HumanPlayer` and `ComputerPlayer`.

### ComputerPlayer#get_position(legal_positions)
Assume that this method takes in an array of positions as an argument. The method should return a random position from the array. To make gameplay clear, print a message saying the computer's mark along with the position they chose.

Unlike our new `ComputerPlayer#get_position`, you may recall that our old `HumanPlayer#get_position` did not accept any argument. This discrepancy in interface will cause issues. We'll reconcile this difference next.

### HumanPlayer#get_position(legal_positions)
Refactor this method to accept an array of positions as an argument. If the user enters a position that is not inside of the array argument, tell them that their choice was illegal and prompt them to enter another. This method should continue to prompt the user until they make a legal choice.

### Checkpoint - Turing's test†
Before we go any further, let's take a moment to verify the behavior of all of the methods we created or refactored. We'll test them in isolation of one another before we connect them together.

Here's is the pry workflow we used to test our board:

```
[1] pry(main)> load 'board.rb'
=> true

[2] pry(main)> my_board = Board.new(2)
=> #<Board:0x @grid=[["_", "_"], ["_", "_"]]>

[3] pry(main)> my_board.legal_positions
=> [[0, 0], [0, 1], [1, 0], [1, 1]]

[4] pry(main)> my_board.place_mark([0, 1], :Z)
=> :Z

[5] my_board.legal_positions
=> [[0, 0], [1, 0], [1, 1]]
```

Let's also test our humans. Since `#getPositions` simply expects an array as its argument, we can pass in some "mock" data that doesn't really come from any board. Don't forget that <b>abstraction</b> is a pillar of object oriented programming. Our `#getPositions` just cares about being given an array, it doesn't care exactly where that array comes from:

```
[1] pry(main)> load 'human_player.rb'
=> true

[2] pry(main)> dave = HumanPlayer.new(:X)
=> #<HumanPlayer:0x @mark=:X>

[3] pry(main)> positions = [[1, 2], [3, 4], [4, 3]]
=> [[1, 2], [3, 4], [4, 3]]

[4] pry(main)> dave.get_position(positions)
Player X, enter two numbers representing a position in the format `row col`
3 4
=> [3, 4]

[5] pry(main)> dave.get_position(positions)
Player X, enter two numbers representing a position in the format `row col`
2 5
[2, 5] is not a legal position
Player X, enter two numbers representing a position in the format `row col`
1 2
=> [1, 2]
```

Finally, let's verify our AI:

```
[1] pry(main)> load 'computer_player.rb'
=> true

[2] pry(main)> hal_9000 = ComputerPlayer.new(:Y)
=> #<ComputerPlayer:0x @mark=:Y>

[3] pry(main)> positions = [[1, 2], [3, 4], [4, 3]]
=> [[1, 2], [3, 4], [4, 3]]

[4] pry(main)> hal_9000.get_position(positions)
Computer Y chose position [1, 2]
=> [1, 2]

[5] pry(main)> hal_9000.get_position(positions)
Computer Y chose position [3, 4]
=> [3, 4]
```

Do any other testing that you see fit before moving on.

### Game#initialize
Refactor this method to accept an option hash instead of an arbitrary number of marks (we previously implemented that in version 2). A hash is a great choice here because we now need to communicate two details per player: their mark and whether they are human or computer. We also have the upshot of hash keys necessarily being unique. This is convenient because for proper gameplay we must have unique marks among the players!

Assume that the keys of the hash are the marks and the values are booleans. Interpret false as a human and true as a computer. The order of players in the hash should dictate the order that they take their turns. For example, the following game would entail three players of X (human), Y (computer), and Z (human) playing on a 4 by 4 board:

```
[1] pry(main)> load 'game.rb'
=> true

[2] pry(main)> Game.new(4, X: false, Y: true, Z: false)
=> #<Game:0x
 @players=
  [#<HumanPlayer:0x @mark=:X>,
   #<ComputerPlayer:0x @mark=:Y>,
   #<HumanPlayer:0x @mark=:Z>]>,
 @current_player=#<HumanPlayer:0x @mark=:X>,
 @board=
  #<Board:0x
   @grid=[["_", "_", "_", "_"], ["_", "_", "_", "_"], ["_", "_", "_", "_"], ["_", "_", "_", "_"]]>
```

### Game#play
Only one more refactor and we'll have our final product! Refactor this method slightly to account for our new argument required for `#get_position`. That is, be sure to pass in the board's legal positions for the player to choose from.

That's it. Play some diverse games with computers and humans to test your work. You've done some amazing object oriented programming if you've gotten to this point. Sit back, relax, and reward yourself by running this snippet in pry:

```ruby
load 'game.rb'
machine_civil_war = Game.new(10, h: true, u: true, e: true)
machine_civil_war.play
```
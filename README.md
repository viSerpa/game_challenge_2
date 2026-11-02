# Space Invaders - 20 Game Challenge - #2
Space Invaders — A clone of Space Invaders built using Godot & GDScript.

## Features
- 3 Lives
- Increasing Ball Speed
- Win screen
- Game over screen

## How to Play
Controls:
- A / D — Move Paddle / Player.

Objective: 
- Destroy all tiles without loosing all of your lives.

## Setup & Installation
- **Prerequisites**: Godot version 4.7 or later.
- **Clone the repo**: https://github.com/viSerpa/game_challenge_2.git 
- **Run the game**: Press F5 to play game.

## What I Learned
- **Procedural Level Generation:** Used nested `for` loops to programmatically instantiate and grid-align an array of brick scenes at runtime.
- **Decoupled Event Communication:** Implemented Godot's **Signals** to safely alert the main game manager when a brick was destroyed, avoiding tight coupling between the ball and the game loop.
- **Dynamic Collision Handling:** Managed real-time physics interactions using `CharacterBody2D`/`RigidBody2D` to detect specific collision partners, trigger individual tile destruction, and scale up ball velocity.
- **Global State Management:** Designed a robust tracking system for a finite number of player lives and implemented game-state transitions (Win/Game Over screens) based on remaining brick counts.

### Story if you care
This is the second game in the 20 Game Challenge. I had to decide between two games and I chose Breakout.

The process of making Breakout was similar to Pong: 
- make the paddle
- player moves left and right
- create a ball that bounces around

The only difference was making the bricks that the player breaks. Creating the bricks was relatively easy. I just used a nested for loop and instantiated each brick individually.

The difficult part for me was making the ball destroy the bricks and keeping track of how many lives the player has.

The final parts of recreating Breakout was adding the hud for the players lives, game over screen, and win screen.

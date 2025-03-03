//
// DiceGame.swift
//
// Created by Noah Smith
// Created on 2025-02-27
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The DiceGame program generates a random number between 1 and 6.
// It will then ask the user to guess the number.
// It will keep track of the number of guesses, until the user gets the right answer.
// If the guess is wrong, the program will tell the user if the guess was too high or too low.
// It will then tell the user how many guesses it took to get the right answer.

// Import foundation library
import Foundation

// Declare constants
// Minimum value of random number
let maxValue = 6

// Maximum value of random number
let minValue = 1

func diceGame() {

    // Initialize guesses to 1
    var guesses = 1

    // Initialize user guess to 0
    let userGuess = 0

    // Define the different possible error types
    enum InputError: Error {
        case invalidInput
    }

    // Greet the user
    print("Welcome to the dice game program!")

    // Generate random number between 1 and 6 inclusive
    // Source: stackoverflow.com/questions/24007129/how-to-generate-a-random-number-in-swift
    let randomInt = Int.random(in: minValue...maxValue)

    // Loop until user input is valid
    repeat {

        // Ask the user to guess a number between 1 and 6 inclusive
        print("Guess an integer between 1 and 6 inclusive:")

        do {
            // Get the user's guess from the user as an int, if possible
            if let userGuessString = readLine(), let userGuess = Int(userGuessString) {
                
                // Check if user guess is between 1 and 6 inclusive
                if userGuess <= maxValue && userGuess >= minValue {
                    // Check if user guess is equal to random number
                    if userGuess == randomInt {
                        // If user guess is correct
                        print(userGuess, " is the correct answer.")
                        print("It took you ", guesses, " guesses to get the right answer.")

                        // Break from loop because I was having problems with an infinite loop.
                        // This is the only way I could fix it.
                        break
                    } else {
                        // increment guesses by 1
                        guesses+=1

                        // Check if user guess is too high or too low
                        if userGuess < randomInt {
                            print("Your guess is incorrect.")
                            print("Guess higher next time.")
                        } else {
                            print("Your guess is incorrect.")
                            print("Guess lower next time.")
                        }
                    }
                } else {
                    // Catches the invalid input
                    print("Please enter an integer between 1 and 6 inclusive.")
                }
            } else {
                // Catches the invalid input
                throw InputError.invalidInput
            }
        } catch InputError.invalidInput {
            // If user does not enter a number
            print("Please enter a number.")
        } catch {
            // Catches any other errors
            print("Please enter a number.")
        }
    // Loop until user guess is equal to random number
    } while userGuess != randomInt
}

// Call function
diceGame()

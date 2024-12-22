# hangman.rb

# Word list
words = ["ruby", "developer", "programming", "hangman", "terminal"]

# Choose a random word
secret_word = words.sample

# Initialize game state
hidden_word = "_" * secret_word.length
attempts_left = 6
guessed_letters = []

puts "Welcome to Hangman!"
puts "Guess the word: #{hidden_word}"

while attempts_left > 0 && hidden_word.include?("_")
  puts "\nRemaining attempts: #{attempts_left}"
  puts "Guessed letters: #{guessed_letters.join(', ')}"
  print "Enter a letter: "
  guess = gets.chomp.downcase

  if guessed_letters.include?(guess)
    puts "You already guessed that letter."
  elsif secret_word.include?(guess)
    puts "Good job! '#{guess}' is in the word."
    guessed_letters << guess

    # Replace underscores with the guessed letter
    secret_word.chars.each_with_index do |char, index|
      hidden_word[index] = char if char == guess
    end
  else
    puts "Oops! '#{guess}' is not in the word."
    guessed_letters << guess
    attempts_left -= 1
  end

  puts "Word: #{hidden_word}"
end

if hidden_word == secret_word
  puts "\nCongratulations! You guessed the word: #{secret_word}"
else
  puts "\nGame over! The word was: #{secret_word}"
end

dictionary = open('raw.githubusercontent.com_first20hours_google-10000-english_master_google-10000-english-no-swears.txt').read

dictionary_words = dictionary.split("\n")

filtered_words = dictionary_words.select { |word| word.length >= 5 && word.length <= 12 }

secret_word = filtered_words.sample


# Create an array to store the correctly guessed letters
correct_letters = Array.new(secret_word.length, "_")

hangman_length = secret_word.length
attempts = 12  # Number of attempts allowed

until attempts == 0 || correct_letters.join == secret_word
  puts "Attempts remaining: #{attempts}"
  puts correct_letters.join(" ")

  print "Enter a letter: "
  guess = gets.chomp.downcase

  if guess.length == 1 && guess.match?(/[a-z]/)
    if secret_word.include?(guess)
      secret_word.chars.each_with_index do |letter, index|
        correct_letters[index] = guess if letter == guess
      end
    else
      puts "Incorrect guess! Try again."
      attempts -= 1
    end
  else
    puts "Invalid input. Please enter a single letter."
  end
end

if correct_letters.join == secret_word
  puts "Congratulations! You guessed the word: #{secret_word}"
else
  puts "Sorry, you're out of attempts. The word was: #{secret_word}"
end
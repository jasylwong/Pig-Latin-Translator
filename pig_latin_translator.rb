# Pig Latin Translator

def sentenceTo(sentence)
    words = sentence.split(" ")
    new_sentence = []
    for word in words
        new_sentence.push(singleWordTo(word))
    end
    puts "----------------------------"
    puts "\"#{sentence}\" in pig latin is: "
    puts new_sentence.join(" ")
    puts "----------------------------"
    translateMore
end

def singleWordTo(word)
    if %w(a e i o u).include?(word[0].downcase)
        word == word.upcase ? word + "WAY" : word + "way"
    elsif "qu".include?(word[0..1].downcase)
        word_temp = word[2..-1] + word[0..1]
        word = (word == word.capitalize ? word_temp.capitalize : word_temp)
        word == word.upcase ? word + "AY" : word + "ay"
    else
        word_temp = word[1..-1] + word[0]
        until %w(a e i o u y).include?(word_temp[0].downcase)
            word_temp = word_temp[1..-1] + word_temp[0]
        end
        word = (word == word.capitalize ? word_temp.capitalize : word_temp)
        word == word.upcase ? word + "AY" : word + "ay"
    end
end

def translateMore
    puts "What else would you like translated into Pig Latin? (Or type \"ESCAPE\" to exit)"
    input = $stdin.gets.chomp
    if input.downcase == "escape"
        puts "Thanks for visiting!" 
        exit(0)
    else
        sentenceTo(input)        
    end
end

puts "Elloway. What would you like translated into Pig Latin?"
input = $stdin.gets.chomp
sentenceTo(input)

# To add:
    # Punctuation marks - multiple sentences
    # Correctly translates contractions
    # Hyphenated words are treated as two words
    # All punctuation, numerals, symbols and whitespace are not modified

# Assumptions:
    # Words may consist of alphabetic characters only (A-Z and a-z)
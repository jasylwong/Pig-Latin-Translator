# Pig Latin Translator

require 'pry'
# Assumptions:
    # Words may consist of alphabetic characters only (A-Z and a-z)

def sentenceTo(sentence)
    words = words = sentence.split(%r{(\b[^\s]+\b)}).reject{|s| s==""}.reject{|s| s==" " }

    new_sentence = []
    for word in words
        new_sentence.push(singleWordTo(word))
    end
    puts "----------------------------"
    puts "\"#{sentence}\" in pig latin is: "

    final_sentence = ""

    new_sentence.each_with_index do |word, index|
        if (['!', '?', '.', ','].include?(word))
            final_sentence << word
        elsif index == 0
            final_sentence << word
        else
            final_sentence << " #{word}"
        end
    end
    puts final_sentence
    puts "----------------------------"
    translateMore
end

def singleWordTo(word)

    if %w(a e i o u).include?(word[0].downcase)

        word == word.upcase ? word + "WAY" : word + "way"
    elsif "qu".include?(word[0..1].downcase)

        word_temp =  takes_first_shoves_in_back(word)
        word = (word == word.capitalize ? word_temp.capitalize : word_temp)
        word == word.upcase ? word + "AY" : word + "ay"
    else

        word_temp = word[1..-1] + word[0]

        if !(['!', '?', '.', ','].include?(word_temp))
            until %w(a e i o u y).include?(word_temp[0].downcase)
                word_temp = word_temp[1..-1] + word_temp[0]
            end
            word = (word == word.capitalize ? word_temp.capitalize : word_temp)
            word == word.upcase ? word + "AY" : word + "ay"
        else
            word_temp
        end
    end
end

def takes_first_shoves_in_back(word)
    word[2..-1] + word[0..1]
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

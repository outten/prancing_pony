#!/usr/bin/env ruby

SONG  = "Hey, ho, to the bottle I go, To heal my heart and drown my woe, Rain may fall and wind may blow. But there still be many miles to go…"
names = %w(Gimli Fili Ilif Ilmig Mark)

def check_if_existing(palindromes,combination)
	combination_split = combination.split(/(?=[A-Z])/).sort
	palindromes.each do |palindrome|
		palindrome_split = palindrome.split(/(?=[A-Z])/).sort
		return true if combination_split.join('-') == palindrome_split.join('-')
	end
	false
end

def check(names,palindromes)
	2.upto(names.length) do |i|
		combinations = names.combination(i).map(&:join)
		combinations.each do |combination|
			next if palindromes.include?combination
			next if check_if_existing(palindromes,combination) == true
			if combination.downcase == combination.reverse.downcase
				puts "#{combination} is a palindrome! #{combination.split(/(?=[A-Z])/).join(' & ')} names form a palindrome! #{SONG}"
				palindromes << combination
			end
		end
	end
	palindromes
end

palindromes = []

names.each_with_index do |name1,index|
	names_to_check 			= names.dup
	names_to_check[0] 		= names[index]
	names_to_check[index] 	= names[0]
	palindromes 			= check(names_to_check, palindromes)
end

def converttoenglish(n)
	#Converts digits into words.
	newstring = " "
	if n==1 then newstring = "one"
	elsif n==2 then newstring = "two"
	elsif n==3 then newstring = "three"
	elsif n==4 then newstring = "four"
	elsif n==5 then newstring = "five"
	elsif n==6 then newstring = "six"
	elsif n==7 then newstring = "seven"
	elsif n==8 then newstring = "eight"
	elsif n==9 then newstring = "nine"
	end
	return newstring
end

def converttotens(n)
	#Converts digits in the tens columns into words.
	newstring = " "
	if n==1 then newstring = "one"
	elsif n==2 then newstring = "twenty-"
	elsif n==3 then newstring = "thirty-"
	elsif n==4 then newstring = "forty-"
	elsif n==5 then newstring = "fifty-"
	elsif n==6 then newstring = "sixty-"
	elsif n==7 then newstring = "seventy-"
	elsif n==8 then newstring = "eighty-"
	elsif n==9 then newstring = "ninety-"
	end
	return newstring
end

def converttoteens(n)
	#Only when preceded by a one, converts digits into teens.
	newstring = " "
	if n==0 then newstring = "ten"
	elsif n==1 then newstring = "eleven"
	elsif n==2 then newstring = "twelve"
	elsif n==3 then newstring = "thirteen"
	elsif n==4 then newstring = "fourteen"
	elsif n==5 then newstring = "fifteen"
	elsif n==6 then newstring = "sixteen"
	elsif n==7 then newstring = "seventeen"
	elsif n==8 then newstring = "eighteen"
	elsif n==9 then newstring = "nineteen"
	end
	return newstring
end

def numbertophrase(n)
	#Only allow numbers under one trillion.
	while 0 > n.to_i && n.to_i > 999999999999
		puts "That number is invalid. Choose a positive number under one trillion."
		n = gets.chomp
	end

	#If the number is 0, return zero and skip everything.
	if n.to_i == 0 then return "zero"

	#Set the final answer to englishstring, convert n to a string, set a counter, and a boolean that
	#states whether the previous number was a one in a tens column. 	
	else
		englishstring = ""
		number = n.to_s
		count = number.length
		teen = false
		number.each_char do |i|
			#For each character, determine its position and value.
			if i.to_i == 0 && teen == false then 
				if count == 10 then englishstring.concat("billion ") end
				if count == 7 then englishstring.concat("million ") end
				if count == 4 then englishstring.concat("thousand ") end
				count -= 1
			else
				if i.to_i == 0 && teen == true then
					englishstring = englishstring + converttoteens(i.to_i) + " "
					teen = false
				elsif i.to_i != 0 && teen == true
					englishstring = englishstring + converttoteens(i.to_i) + " "
					teen = false
				elsif (count+1) % 3 == 0 && i.to_i!=1 then englishstring = englishstring + converttotens(i.to_i)
				elsif (count+1) % 3 == 0 && i.to_i==1 then teen = true
				else 
					englishstring = englishstring + converttoenglish(i.to_i).to_s + " "
				end
				if count % 3 == 0 then englishstring.concat("hundred ") end
				if count == 10 then englishstring.concat("billion ") end
				if count == 7 then englishstring.concat("million ") end
				if count == 4 then englishstring.concat("thousand ") end
				count -= 1
			end
		end
	end
	return englishstring.strip().chomp("-")
end

puts "Enter a positive number that has 12 digits or fewer."
value = gets.chomp
puts numbertophrase(value.to_i)
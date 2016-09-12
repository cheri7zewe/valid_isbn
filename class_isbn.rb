def valid_isbn?(isbn_string)
	#main entry function. Takes any string and returns true if it's a valid ISBN, otherwise false.
	isbn_no_spaces_or_dashes = remove_spaces_and_dashes(isbn_string)
	valid_isbn10?(isbn_no_spaces_or_dashes) || isbn_no_spaces_or_dashes.length == 13
end

def valid_isbn10?(isbn_no_spaces_or_dashes)
	#takes a string (initial input, no spaces or dashes) & returns true if valid ISBN-10
	correct_length = length_10?(isbn_no_spaces_or_dashes)
	no_non_digits = no_non_digits?(isbn_no_spaces_or_dashes.chop) #.chop removes last digit
	correct_length && isbn_no_spaces_or_dashes[9] == calculate_isbn10_sumcheck(isbn_no_spaces_or_dashes)
end

def valid_isbn13?(isbn_no_spaces_or_dashes)
	correct_length = length_13?(isbn_no_spaces_or_dashes)
	no_non_digits = no_non_digits?(isbn_no_spaces_or_dashes.chop)
	correct_length && isbn_no_spaces_or_dashes[12] == calculate_isbn13_sumcheck(isbn_no_spaces_or_dashes)
end

def length_10?(isbn_no_spaces_or_dashes)
	isbn_no_spaces_or_dashes.length == 10
end

def length_13?(isbn_no_spaces_or_dashes)
	isbn_no_spaces_or_dashes.length == 13
end

def no_non_digits?(string)
	if string =~/\D/ #this looks for non-numeric symbols
		false
	else
		true
	end
end

def correct_isbn10_sumcheck(isbn_no_spaces_or_dashes)
	first_nine_digits = isbn_no_spaces_or_dashes.chop
	last_digit = isbn_no_spaces_or_dashes[9]
	isbn_no_spaces_or_dashes[9] == calculate_isbn10_sumcheck(isbn_no_spaces_or_dashes)
end

def calculate_isbn10_sumcheck(isbn_no_spaces_or_dashes)
	#take a 10 digit string and calculate the sumcheck. Return a string of the sumcheck.
	first_nine_digits = isbn_no_spaces_or_dashes.chop
	isbn_array = convert_string_to_array_of_characters(first_nine_digits)
	sumcheck = generate_raw_isbn10_sumcheck(isbn_array)
	#if 
		sumcheck == "10" ? "x" : sumcheck
	# 	"x"
	# else
	# 	sumcheck 
	# end
end

def generate_raw_isbn10_sumcheck(isbn_array)
	sum_digits_multiplied_by_position = 0
	isbn_array.each_with_index do |value, index|
		# if index < 9
			sum_digits_multiplied_by_position += value.to_i * (index + 1)
		# end
	end
	sumcheck = sum_digits_multiplied_by_position % 11
	sumcheck = sumcheck.to_s
end

def convert_string_to_array_of_characters(string)
	string.split("")
end

def remove_spaces_and_dashes(isbn_string)
	#takes a string & returns a string with spaces & dashes removed
	isbn_string.gsub!(" ", "")
	isbn_string.gsub!("-", "")
	isbn_string
end
def valid_isbn?(num)
	if num.length == 10 #|| num.length == 13
		true
	else
		false
	end
end

def string_to_array(string)
	string.split("")
end

def string_remove_space_or_dash(string)
	remove = [" ", "-"]

	remove.each do |symbol|
		string.delete! symbol #if string.include? symbol
	end
	string
end

def update_check_digit_containing_X(isbn_number_array)
	if isbn_number_array[9] == "x" || isbn_number_array[9] == "X"
		isbn_number_array[9] = "10"
	end
	isbn_number_array
end

def valid_10_digit_isbn?(array_of_nums)
	array = []
		array_of_nums.each do |value|
			array.push(value.to_i)
		end

		sum = 0

		array.each.with_index do |value, index|
			if index < 9
				sum += (value * (index + 1))
			end
		end

		check_digit = sum % 11
		if check_digit == array[9]
			true
		else
			false
		end
end
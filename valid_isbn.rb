def valid_isbn?(num)
	if num.length == 10
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

def multiply_digit_by_position(array_of_numbers)

	empty_array = []

	array_of_numbers.each_with_index do |value, index|
		if index < 9
			return_value = (index + 1) * value.to_i
			empty_array.push(return_value)
		end
	end
	empty_array
end

def add(array)
	array.inject(:+)
end

def modulos_of_sum(sum)
	sum % 11
end
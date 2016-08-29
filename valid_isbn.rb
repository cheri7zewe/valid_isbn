def valid_isbn?(num)
	if num.length == 10
		true
	else
		false
	end
end

def string_to_array(string)
	string.split
end
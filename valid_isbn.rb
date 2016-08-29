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
		string.delete! symbol if string.include? symbol
	end
	string
end

# def string_remove_space_or_dash(string)
# 	if string.include? (" ") && ("-")
# 		string.delete (" ") && ("-")
# 	elsif string.include? (" ")
# 		string.delete (" ")
# 	elsif string.include? ("-")
# 		string.delete ("-")
# 	else
# 		string 
# 	end
# end
def read_write
	file = File.open("input_isbn_file.csv", "r")
	contents = file.read
	name_of_output_file = "new_output_file.csv"
	write_to_file = File.open(name_of_output_file, "w")
		write_to_file.puts contents
		write_to_file.close
end

read_write
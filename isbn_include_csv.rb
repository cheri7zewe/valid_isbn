require_relative "isbn.rb"
require "csv"

def validating_isbn_numbers
	input_file = "input_isbn_file.csv"
	output_with_results = "output_with_results_isbn_file.csv"
	file_new = File.open(output_with_results, "w")

		CSV.foreach(input_file) do |row|

			if row[1] == " ISBN"
				result = "CHECK"
			elsif valid_isbn_10_or_13(row[1]) == true
				result = "VALID"
			else
				result = "INVALID"
			end

		file_new << row[0] + ", " + row[1] + ", " + result + "\n"
	end

	file_new.close
end

validating_isbn_numbers
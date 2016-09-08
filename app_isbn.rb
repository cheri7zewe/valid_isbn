require "sinatra"
require_relative "isbn.rb"

get "/" do
	erb :ask_isbn	
end

post "/ask_isbn" do 
	input_number = params[:isbn]
	return_result = valid_isbn_10_or_13(input_number)
	if return_result == true
		return_result = "valid"
	else return_result == false
		return_result = "invalid"
	end

	"This ISBN is #{return_result}"
end

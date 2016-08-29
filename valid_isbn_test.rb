require_relative "valid_isbn"
require "minitest/autorun"

class TestValidIsbn < Minitest::Test

	def test_empty_string_return_false()
		assert_equal(false, valid_isbn?(""))
	end

	def test_valid_10_digit_isbn_string_returns_true()
		assert_equal(true, valid_isbn?("0471958697"))
	end

	def test_an_invalad_10_digit_isbn()
		skip("not yet") 
		assert_equal(false, valid_isbn?("0471958699"))
	end

end

class TestConvertStringToArry < Minitest::Test 

	def test_empty_string_returns_empty_array
		assert_equal([], string_to_array(""))
	end

	def test_string_returns_array
		assert_equal(["1", "2", "3", "4", "5"], string_to_array("12345"))
	end

end

class TestDashesSpaces < Minitest::Test

	def test_string_with_space_deletes_space
		assert_equal("12345", string_remove_space_or_dash("123 45"))
	end

	def test_string_with_dash_deletes_dash
		assert_equal("12345", string_remove_space_or_dash("123-45"))
	end

	def test_string_with_dash_and_space
		assert_equal("0123456789", string_remove_space_or_dash(" -01-2 3  4-- -56789"))
	end

end

class IsbnSumcheck < Minitest::Test 

	def test_to_multiply_digit_by_position
		assert_equal([7, 8, 6, 4, 15, 54, 28, 56, 54], multiply_digit_by_position(["7", "4", "2", "1", "3", "9", "4", "7", "6", "1"]))
	end

end
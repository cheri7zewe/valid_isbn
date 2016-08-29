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
		assert_equal(["12345"], string_to_array("12345"))
	end

end

class TestDashesSpaces < Minitest::Test

	def test_string_with_space_deletes_dash
		assert_equal("12345", string_remove_space_or_dash("123 45"))
	end

	def test_string_with_dash_deletes_dash
		assert_equal("12345", string_remove_space_or_dash("123-45"))
	end

end
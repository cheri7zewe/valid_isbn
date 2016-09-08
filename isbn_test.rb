require_relative "isbn.rb"
require "minitest/autorun"

class TestValidIsbn < Minitest::Test

	def test_empty_string_return_false()
		assert_equal(false, valid_isbn?(""))
	end

	def test_valid_10_digit_isbn_string_returns_true()
		assert_equal(true, valid_isbn?("0471958697"))
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

class TestForX < Minitest::Test

	def test_for_x_to_be_replaced_with_10
		assert_equal(["0", "8", "0", "4", "4", "2", "9", "5", "7", "10"], update_check_digit_containing_X(["0", "8", "0", "4", "4", "2", "9", "5", "7", "x"]))
		assert_equal(["0","8","0","4","4","2","9","5","7","8"], update_check_digit_containing_X(["0","8","0","4","4","2","9","5","7","8"]))
        assert_equal(["0","8","0","4","x","2","9","5","7","8"], update_check_digit_containing_X(["0","8","0","4","x","2","9","5","7","8"]))
    end

end

class TestIsbn10MathFunction < Minitest::Test

	def test_for_10_digit_math
		assert_equal(true, valid_10_digit_isbn?(["0","4","7","1","9","5","8","6","9","7"]))
        assert_equal(false, valid_10_digit_isbn?(["1", "4", "7", "1", "9", "5", "8", "6", "9","7"]))
        assert_equal(true, valid_10_digit_isbn?(["8","7","7","1","9","5","8","6","9","10"]))
    end


	def test_for_non_numeric_characters_in_my_array?
    	# true if anything other than digit/can i include this in disallowed function??
     	assert_equal(nil, only_numbers_in_my_array?(["1","2","3","4","5","6","7","8","9","0"]))
      	assert_equal(true, only_numbers_in_my_array?(["1","2","3","?","5","6","7","8","9","0"]))
      	assert_equal(true, only_numbers_in_my_array?(["n","2","3","x","5","p","7","8","9","0"]))
    end

end

class TestIsbn13MathFunction < Minitest::Test

	def test_for_thirteen_character_math
       assert_equal(true, valid_13_digit_isbn?(["9","7","8","0","1","5","6","0","2","7","3","2","8"]))
       assert_equal(false, valid_13_digit_isbn?(["9","8","5","0","2","4","1","4","3","0","4","6","3"]))
   end

end
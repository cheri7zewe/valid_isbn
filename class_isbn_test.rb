require_relative "class_isbn.rb"
require "minitest/autorun"

class TestIsbn <Minitest::Test

	def test_valid_isbn_10_returns_true
		assert_equal(true, valid_isbn?("0471958697"))
	end

	def test_valid_isbn_13_returns_true
		assert_equal(true, valid_isbn?("9780156027328"))
	end

	def test_empty_array_returns_false
		assert_equal(false, valid_isbn?(""))
	end

	def test_an_isbn10_with_invalid_character_returns_false
		assert_equal(false, valid_isbn? ("047!958697"))
	end

	def test_a_nonvalid_isbn13_returns_false
		assert_equal(fasle, valid_isbn?("97801;6027328"))

end

class TestStringDash <Minitest::Test

	def test_valid_isbn10_with_spaces_returns_true
		assert_equal(true, valid_isbn?("047 19 586  97"))
	end

	def test_valid_isbn10_with_dashes_returns_true
		assert_equal(true, valid_isbn?("04-71-958--697"))
	end

end

class TestIsbn10Sumcheck <Minitest::Test

	def test_sumcheck_for_0471958697_is_7
		assert_equal("7", calculate_isbn10_sumcheck("0471958697"))
	end

	def test_sumcheck_for_3471958690_is_x
		assert_equal("x", calculate_isbn10_sumcheck("3471958697"))
	end

end

class TestCheckAllDigits <Minitest::Test

	def test_all_digits_returns_true
		assert_equal(true, no_non_digits?("0471958697"))
	end

	def test_contains_nondigit_returns_false
		assert_equal(false, no_non_digits?("0471!58697"))
	end

end
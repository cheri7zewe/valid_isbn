require_relative "valid_isbn"
require "minitest/autorun"

class ValidIsbn < Minitest::Test

	def test_empty_string_return_false()
		assert_equal(false, valid_isbn?(""))
	end

end
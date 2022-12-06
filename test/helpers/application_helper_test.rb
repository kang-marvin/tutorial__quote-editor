require File.dirname(__FILE__) + '/../test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "#submit_button_label for a new modal object" do
    assert_equal "Create quote", submit_button_label(Quote.new)
  end

  test "#submit_button_label for an existing modal object" do
    obj = quotes(:first)
    assert_equal "Update quote", submit_button_label(obj)
  end

  test "#submit_button_label for non model instance" do
    assert_nil submit_button_label([])
  end

  test "#submit_button_label for nil" do
    assert_nil submit_button_label(nil)
  end

end

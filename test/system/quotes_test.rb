require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @quote = quotes(:first)
  end

  test "listing qoutes" do
    visit quotes_path

    assert_selector "h1", text: "Quotes"
  end

  test "creating a new quote" do
    visit quotes_path

    click_on "New Quote"
    assert_selector "h1", text: "New quote"

    fill_in "Name", with: "Capybara Quote"
    click_on "Create quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Capybara Quote"
  end

  test "showing a quote" do
    visit quotes_path

    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "updating a quote" do
    visit quotes_path

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "#{@quote.name} Updated!"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "#{@quote.name} Updated!"
  end


  test "destroying a quote" do
    visit quotes_path

    assert_text @quote.name
    click_on "Delete", match: :first

    assert_no_text @quote.name
  end
end
require "application_system_test_case"

class CategoryquotesTest < ApplicationSystemTestCase
  setup do
    @categoryquote = categoryquotes(:one)
  end

  test "visiting the index" do
    visit categoryquotes_url
    assert_selector "h1", text: "Categoryquotes"
  end

  test "should create categoryquote" do
    visit categoryquotes_url
    click_on "New categoryquote"

    fill_in "Category", with: @categoryquote.category_id
    fill_in "Quote", with: @categoryquote.quote_id
    click_on "Create Categoryquote"

    assert_text "Categoryquote was successfully created"
    click_on "Back"
  end

  test "should update Categoryquote" do
    visit categoryquote_url(@categoryquote)
    click_on "Edit this categoryquote", match: :first

    fill_in "Category", with: @categoryquote.category_id
    fill_in "Quote", with: @categoryquote.quote_id
    click_on "Update Categoryquote"

    assert_text "Categoryquote was successfully updated"
    click_on "Back"
  end

  test "should destroy Categoryquote" do
    visit categoryquote_url(@categoryquote)
    click_on "Destroy this categoryquote", match: :first

    assert_text "Categoryquote was successfully destroyed"
  end
end

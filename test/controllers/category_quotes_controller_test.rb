require "test_helper"

class CategoryQuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoryquote = categoryquotes(:one)
  end

  test "should get index" do
    get categoryquotes_url
    assert_response :success
  end

  test "should get new" do
    get new_categoryquote_url
    assert_response :success
  end

  test "should create categoryquote" do
    assert_difference("CategoryQuote.count") do
      post categoryquotes_url, params: { categoryquote: { category_id: @categoryquote.category_id, quote_id: @categoryquote.quote_id } }
    end

    assert_redirected_to categoryquote_url(CategoryQuote.last)
  end

  test "should show categoryquote" do
    get categoryquote_url(@categoryquote)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoryquote_url(@categoryquote)
    assert_response :success
  end

  test "should update categoryquote" do
    patch categoryquote_url(@categoryquote), params: { categoryquote: { category_id: @categoryquote.category_id, quote_id: @categoryquote.quote_id } }
    assert_redirected_to categoryquote_url(@categoryquote)
  end

  test "should destroy categoryquote" do
    assert_difference("CategoryQuote.count", -1) do
      delete categoryquote_url(@categoryquote)
    end

    assert_redirected_to categoryquotes_url
  end
end

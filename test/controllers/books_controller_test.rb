require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/books.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Book.count, data.length
  end
  # test "the truth" do
  #   assert true
  # end

end

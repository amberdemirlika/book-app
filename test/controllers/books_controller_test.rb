require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/books.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Book.count, data.length
  end

  test "create" do
    assert_difference "Book.count", 1 do
      post "/books.json", params: { name: "Harry Potter", author: "JK Rowling", genre: "fantasy", year_published: 1996 }
      assert_response 200
    end
  end

  test "show" do
    get "/books/#{Book.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "author", "genre", "year_published", "created_at", "updated_at"], data.keys
  end
end

#  test "show" do
#     get "/books/#{Book.first.id}.json"
#     assert_response 200
#     data = JSON.parse(response.body)
#     assert_equal ["id", "name", "width", "height", "created_at", "updated_at"], data.keys
#     end
#     end
#   end
# end

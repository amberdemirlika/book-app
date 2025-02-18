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

  test "update" do
    book = Book.first
    patch "/books/#{book.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Book.count", -1 do
      delete "/books/#{Book.first.id}.json"
      assert_response 200
    end
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

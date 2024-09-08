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
      post "/books.json", params: { name: "Harry Potter the Sorcerer's Stone", author: "JK Rowling", genre: "fantasy", year_published: 1997 }
      assert_response :created

      data = JSON.parse(response.body)
      assert_equal "New Book", data["title"]
      assert_equal "Author Name", data["author"]
    end
  end
  # test "the truth" do
  #   assert true
  # end

end

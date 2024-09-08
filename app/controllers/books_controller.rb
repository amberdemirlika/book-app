class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def create
    @books = Book.new(
      name: params[:name],
      author: params[:author],
      genre: params[:genre],
      year_published: params[year_published],
    )
    render :show
  end
end

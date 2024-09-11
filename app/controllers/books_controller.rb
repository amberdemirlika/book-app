class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def create
    @book = Book.new(
      name: params[:name],
      author: params[:author],
      genre: params[:genre],
      year_published: params[:year_published],
    )
    @book.save
    render :show
  end

  def show
    @book = Book.find_by(id: params[:id])
    render :show
  end
end

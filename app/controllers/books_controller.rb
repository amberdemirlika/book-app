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

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(
      name: params[:name] || @book.name,
      author: params[:author] || @book.author,
      genre: params[:genre] || @book.genre,
      year_published: params[:year_published] || @book.year_published,
    )
    render :show
  end
end

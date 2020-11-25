class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      render action: :index
    end
  end
  
  def new
    @book = Book.new
  end


  def edit
    @book = Book.find(params[:id])
  end
  
# 編集中
  def update
    @book = Book.find(params[:id])
    if @book.update (book_params)
    redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      render action: :edit
  end
end
# ここまで

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book), notice: "Book was successfully destroyed."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

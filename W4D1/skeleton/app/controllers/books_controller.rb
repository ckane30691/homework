class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    render :new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Created #{@book.title}"
      redirect_to books_url
    else
      redirect_to new_book_url
      render json: @book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Deleted #{book.title}"
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end

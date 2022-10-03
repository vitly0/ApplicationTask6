class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
  end
  
  def destroy
    book_comment = BookComment.find(params[:id])
    book_comment.destroy
    book = book_comment.book
  end
  
  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  def set_book
   @book = Book.find(params[:book_id])
  end
end
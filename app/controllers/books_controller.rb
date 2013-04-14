class BooksController < ApplicationController

  def index
    @book_search_form = BookSearchForm.new params[:book_search_form]
    @book_names = BookName.order(:id)

    respond_to do |format|
      format.html # search.html.erb
      format.json { render json: @book }
    end
  end

  def search
    @book_search_form = BookSearchForm.new params[:book_search_form]
    @books = @book_search_form.search
  end
end

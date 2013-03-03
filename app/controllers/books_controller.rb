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

    # フォームからの入力があればDBを検索する
    if @book_search_form.n.present?
      @books = @book_search_form.search
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end
end

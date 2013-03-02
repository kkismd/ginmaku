class BooksController < ApplicationController

  def index
    @book_search_form = BookSearchForm.new params[:book_search_form]
    @book_names = BookName.order(:id)

    # フォームからの入力があればDBを検索する
    if @book_search_form.n.present?
      @books = @book_search_form.search
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  def show

  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end
end

class BookSearchForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :n, :c, :vf, :vt, :lang

  LANG_BOTH = 1
  LANG_JAPANESE = 2
  LANG_ENGLISH = 3

  def initialize(params)
    self.n = params[:n] if params
    self.c = params[:c] if params
    self.vf = params[:vf] if params
    self.vt = params[:vt] if params
    self.lang = params[:lang] if params
  end

  def search
    t = Book.arel_table
    books =  Book.where(:book_name_id => n, :chapter => c)
    case lang
      when LANG_BOTH
        books = books.where(t[:version].eq(1).or(t[:version]).eq(2))
      when LANG_JAPANESE
        books = books.where(:version => 1)
      when LANG_ENGLISH
        books = books.where(:version => 2)
    end
    if vf.present?
      books = books.where(t[:verse].gteq(vf))
    end
    if vt.present?
      books = books.where(t[:verse].lteq(vt))
    end
    books.order(t[:chapter].asc, t[:verse].asc)
  end

  def persisted?
    false
  end
end
# coding: utf-8
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
    # パラメータが与えられていない場合は空を返す
    return []  if n.blank?

    t = Book.arel_table
    books =  Book.where(:book_name_id => n, :chapter => c)
    case lang.to_i
      when LANG_BOTH
        books = books.where(t[:version].eq(1).or(t[:version].eq(2)))
      when LANG_JAPANESE
        books = books.where(:version => 1)
      when LANG_ENGLISH
        books = books.where(:version => 2)
      else
        # do nothing
    end
    if vf.present?
      books = books.where(t[:verse].gteq(vf))
    end
    if vt.present?
      books = books.where(t[:verse].lteq(vt))
    end
    books.order(t[:chapter].asc, t[:verse].asc, t[:version].asc).tap {|rel| Rails.logger.warn rel.to_sql }
  end

  def title
    result = ''
    if self.n.present?
      book_name = BookName.where(id: self.n.to_i).first
      result << book_name.japanese + '/' + book_name.english
    end
    if self.c.present?
      result << ' ' << self.c
    end
    if self.vf.present?
      result << ':' << self.vf
    end
    if self.vt.present?
      result << '-' << self.vt
    end

    result.present? ? result : '聖句検索'
  end

  private
  def persisted?; false; end
end
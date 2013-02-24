class BookSearchForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :n, :c, :vf, :vt, :lang

  def initialize(params)
    self.n = params[:n] if params
    self.c = params[:c] if params
    self.vf = params[:vf] if params
    self.vt = params[:vt] if params
    self.lang = params[:lang] if params
  end

  def persisted?
    false
  end
end
class SlideSearchForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :q

  def initialize(params)
    if params && params.has_key?(:q)
      self.q = params[:q]
    end
  end

  def search
    slides = Slide.arel_table
    Slide.where(slides[:body].matches("%#{q}%"))
  end

  private
  def persisted?; false end
end
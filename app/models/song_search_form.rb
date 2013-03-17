class SongSearchForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :q

  def initialize(params)
    if params && params.has_key?(:q)
      self.q = params[:q]
    end
  end

  def search
    songs = Song.arel_table
    Song.where(songs[:words].matches("%#{q}%"))
  end

  private
  def persisted?; false; end
end
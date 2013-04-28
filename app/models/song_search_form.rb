class SongSearchForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :q, :code

  def initialize(params)
    if params && params.has_key?(:q)
      self.q = params[:q]
    end
    if params && params.has_key?(:code)
      self.code = params[:code]
    end
  end

  def search
    # 数字のみの場合は id とみなす
    return Song.where(id: q.to_i) if q =~ /^[1-9][0-9]*$/

    songs = Song.arel_table
    result = Song.where(songs[:words_for_search].matches("%#{q}%"))
    if code.present?
      result = result.where(songs[:code].eq(code))
    end
    result
  end

  private
  def persisted?; false end
end
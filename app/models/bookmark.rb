class Bookmark < ActiveRecord::Base
  attr_accessible :actioni, :controller, :name, :params

  def raw_params
    ActiveSupport::JSON.decode(params).merge({'controller' => controller, 'action' => action})
  end
end

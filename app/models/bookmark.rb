class Bookmark < ActiveRecord::Base
  attr_accessible :action_name, :controller_name, :title, :params_value
  has_many :bookmarks_folders

  def self.recents
    self.order('updated_at DESC').limit(30)
  end

  def raw_params
    ActiveSupport::JSON.decode(params_value).merge({'controller' => controller_name, 'action' => action_name})
  end
end

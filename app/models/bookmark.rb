class Bookmark < ActiveRecord::Base
  attr_accessible :action_name, :controller_name, :title, :params_value

  def raw_params
    ActiveSupport::JSON.decode(params_value).merge({'controller' => controller_name, 'action' => action_name})
  end
end

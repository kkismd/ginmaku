class Slide < ActiveRecord::Base
  attr_accessible :author, :body, :deleted_at, :title
end

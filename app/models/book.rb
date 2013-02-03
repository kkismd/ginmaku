class Book < ActiveRecord::Base
  attr_accessible :chapter, :verse, :version, :word
end

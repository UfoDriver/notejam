class Note < ActiveRecord::Base
  attr_accessible :name, :text, :created_at, :updated_at

  belongs_to :pad
  belongs_to :user

#   validates :name, :presence => true, :length => { :maximum => 100 }
#   validates :pad_id, :presence => true
#   validates :user_id, :presense => true
end

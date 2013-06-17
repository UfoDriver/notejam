class Pad < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :notes, :dependent => :destroy
  validates :name, :presence => true, :length => { :maximum => 100 }
end

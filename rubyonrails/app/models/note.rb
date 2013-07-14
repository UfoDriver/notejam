class Note < ActiveRecord::Base
  attr_accessible :name, :text, :created_at, :updated_at, :pad_id

  belongs_to :pad
  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }
  validates :text, presence: true
  validates :user_id, :presence => true
  # validates :pad_id, :presence => true

  before_save :check_pad_id

  private

  def check_pad_id
    if self.pad_id
      !!user.pads.find_by_id(self.pad_id)
    else
      true
    end
  end
end

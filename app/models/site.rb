class Site < ActiveRecord::Base
  has_many :events
  belongs_to :user
  validates :name, presence: true
end

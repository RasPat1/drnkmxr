class Menu < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :drinks
end
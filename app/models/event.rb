class Event < ActiveRecord::Base
  belongs_to :order
  has_one :menu
end

class Drink < ActiveRecord::Base
  has_and_belongs_to_many :menus
end
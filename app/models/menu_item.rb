class MenuItem < ActiveRecord::Base
has_many :recipe
has_many :ingredients, through: :recipes
validates :name, :price, presence: true
end

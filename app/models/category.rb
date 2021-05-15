class Category < ApplicationRecord
  has_many :products, dependent: :destroy # TODO: test if this the best one for categories/subcategories/product
end

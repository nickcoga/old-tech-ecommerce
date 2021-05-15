class Category < ApplicationRecord
  has_many :products, dependent: :destroy # TODO: test if this the best one for categories/subcategories/product

  belongs_to :parent_category, class_name: 'Category', optional: true
end

class Store < ApplicationRecord
  has_many :product_stores, dependent: :destroy
end

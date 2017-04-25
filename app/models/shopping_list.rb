class ShoppingList < ApplicationRecord
  has_many :shopping_items, -> {order(position: :asc) }
end

class AddPositionToShoppingItem < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_items, :position, :integer
  end
end

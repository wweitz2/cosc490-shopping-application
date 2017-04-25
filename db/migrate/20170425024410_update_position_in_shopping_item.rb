class UpdatePositionInShoppingItem < ActiveRecord::Migration[5.0]
  def change
    ShoppingItem.order(:updated_at).each.with_index(1) do |shopping_item, index|
      shopping_item.update_column :position, index
    end
  end
end

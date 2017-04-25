class ShoppingItem < ApplicationRecord
  belongs_to :shopping_list
  acts_as_list scope: :shopping_list
  def completed?
    !completed_at.blank?
  end

end

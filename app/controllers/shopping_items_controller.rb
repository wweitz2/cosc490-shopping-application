class ShoppingItemsController < ApplicationController

  before_action :set_shopping_list
  before_action :set_shopping_item, except: [:create]

  def create
    @shopping_item = @shopping_list.shopping_items.create(shopping_item_params)
    redirect_to @shopping_list
  end

  def destroy
    if @shopping_item.destroy
      flash[:success] = "Shopping List item was deleted."
    else
      flash[:error] = "Shopping List item could not be deleted."
    end
    redirect_to @shopping_list
  end

  def complete
    @shopping_item.update_attribute(:completed_at, Time.now)
    redirect_to @shopping_list, notice: "Shopping item completed"
  end

  private

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
  end

  def set_shopping_item
    @shopping_item = @shopping_list.shopping_items.find(params[:id])
  end

  def shopping_item_params
    params[:shopping_item].permit(:content)
  end

end

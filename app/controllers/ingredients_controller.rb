class IngredientsController < ApplicationController

  def create
    @menu_item = MenuItem.find(params[:menu_item_id])
    @ingredient = @menu_item.ingredients.new(ingredient_params)
      
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @menu_item, notice: 'Ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @menu_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
    @menu_item.ingredients << @ingredient
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
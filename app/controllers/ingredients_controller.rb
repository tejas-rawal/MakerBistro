class IngredientsController < ApplicationController

  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient.menu_item, notice: 'Ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ingredient.menu_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
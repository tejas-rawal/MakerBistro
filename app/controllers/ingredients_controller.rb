class IngredientsController < ApplicationController

  def create
    @menu_item = MenuItem.find(params[:menu_item_id])
    ingredient = Ingredient.find_by_name(params[:ingredient][:name])
    
    if ingredient
      @ingredient = ingredient
      respond_to do |format|
        @menu_item.ingredients << @ingredient
        format.html { redirect_to @menu_item, notice: 'Ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @menu_item }
      end 
    else
      @ingredient = @menu_item.ingredients.new(ingredient_params)
      respond_to do |format|
        if @ingredient.save
          @menu_item.ingredients << @ingredient
          format.html { redirect_to @menu_item, notice: 'Ingredient was successfully created.' }
          format.json { render action: 'show', status: :created, location: @menu_item }
        else
          format.html { render action: 'new' }
          format.json { render json: @ingredient.errors, status: :unprocessable_entity }
        end
      end 
    end
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
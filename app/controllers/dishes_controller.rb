class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[id])
  end

  private
  def dish_params
    params.require(:dish).permit(:name,:cost, :receipt)
  end
end

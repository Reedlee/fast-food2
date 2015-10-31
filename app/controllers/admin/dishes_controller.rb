class Admin::DishesController < AdminController

  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[id])
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save

      redirect_to [:admin, @dish]
    else
      render 'new'
    end
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.save

      redirect_to [:admin, @dish]
    else
      render 'edit'
    end
  end

  def destroy
    Dish.destroy(params[:id])
    redirect_to admin_dishes_path
  end

  private
  def dish_params
    params.require(:dish).permit(:name,:price, :description)
  end
end

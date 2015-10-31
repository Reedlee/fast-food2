class Admin::RestaurantsController < AdminController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      upload_picture(@restaurant)
      redirect_to [:admin, @restaurant]
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.save
      upload_picture(@restaurant)
      redirect_to [:admin, @restaurant]
    else
      render 'edit'
    end
  end

  def destroy
    Restaurant.destroy(params[:id])
    redirect_to admin_restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :image, :image_name, :review)
  end


  def upload_picture(restaurant)
    uploaded_file = params[:restaurant][:image_name]

    if !uploaded_file.nil?
      file_name = restaurant.name.to_s + File.extname(uploaded_file.original_filename)
      new_file_path = Rails.root.join('public', 'restaurants', file_name)

      File.open(new_file_path, 'wb') do |file|
        file.write uploaded_file.read
      end

      restaurant.update_attribute(:image_name, file_name)
    end
  end

end

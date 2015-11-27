class RestaurantsController < RankingController
  before_action :authenticate_user!, only: :search
  def index
    @restaurants = Restaurant.order('id ASC').limit(30)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @hash = Gmaps4rails.build_markers(@restaurant) do |cicada, marker|
            marker.lat cicada.latitude
            marker.lng cicada.longtitude
            marker.infowindow cicada.detail
            marker.json({ title: cicada.name })
        end
  end

  def search
    @restaurants = Restaurant.where('name LIKE(?)',"%#{params[:keyword]}%").limit(20)
  end

  def new
  end

  def create
    Restaurant.create(name: restaurant_params[:name],image_url: restaurant_params[:image_url],web_url: restaurant_params[:web_url],detail: restaurant_params[:detail])
    redirect_to controller: :restaurants, action: :index
  end


  private
  def restaurant_params
    params.permit(:name, :image_url ,:web_url ,:detail)
  end

end

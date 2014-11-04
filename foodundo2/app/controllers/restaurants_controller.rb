class RestaurantsController < ApplicationController
  def index
  	
  	@search = Sunspot.search(Restaurant) do 
  		fulltext params[:search]

  	end

  	@hotels= @search.results
    if @hotels.empty?
       @hotels= Restaurant.all

     end

  end
  def edit
    @hotels = Restaurant.find(params[:id])
  end

  def new
  	@hotels = Restaurant.new
  end

  def update
    @hotels = Restaurant.find(params[:id])
    if @hotels.update_attributes(hotel_params)
      flash[:success] = "Profile updated"
      render 'new'
    else
      render 'edit'
    end
  end

  def create
  	@hotels = Restaurant.new(hotel_params)
  	if @hotels.save
  		flash[:sucess]="Success"
  		redirect_to root_path
  		
  	else
  		render 'new'
  		flash[:notice]= "Try again"
  	end 
  end

  def show
    if Restaurant.find(params[:id]).present? 
      redirect_to restaurants_path
    end
     @hotels = Restaurant.find(params[:id])
    
     
    

  end
  private

   	def hotel_params
   		params.require(:restaurant).permit(:name,:address)
   	end
end

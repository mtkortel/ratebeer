class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    @rating = Rating.create params.require(:rating).permit(:score, :beer_id)
    #session[:last_rating] = "#{rating.beer.name} #{rating.score} points"
    #redirect_to ratings_path
    #redirect_to "http://www.cs.helsinki.fi"
    if current_user.nil?
      redirect_to signin_path, notice: 'you should be signed in'
    elsif @rating.save
      current_user.ratings << @rating
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end

  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete
    redirect_to :back
  end
end
class SessionsController < ApplicationController
  def new
    # kirjautumissivu
  end

  def create
    #haetaan username tietokannasta
    user = User.find_by username: params[:username]
    #tallennetaan sessioon kirjautuneen käyttäjän id (jos on olemassa)
    if user.nil?
      redirect_to :back, notice: "User #{params[:username]} does not exist!"
    else
      session[:user_id] = user.id
      #redirect_to :user
      redirect_to user, notice: "Welcome back!"
    end
  end

  def destroy
    #byebug
    # nollattaan sessio
    session[:user_id] = nil
    #uudelleenohjaus
    redirect_to :root
  end
end

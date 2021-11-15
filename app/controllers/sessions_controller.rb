class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
    #save the user id inside browser cookie 
    session[:user_id] = user.id
    redirect_to '/'
    else 
      redirect_to '/login'
    end

  end

  ##Created for testing RSpec
  # def create
  #   # If the user exists AND the password entered is correct.
  #   if user = User.authenticate_with_credentials(params[:email], params[:password])
  
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
   
  #   redirect_to '/login', :notice => "Login error occured. Please try again"
  #   end
  # end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end

class LoginsController < ApplicationController
 
 def new
    
 end
 
 def create
   chef = Chef.find_by(email: params[:email])
   if chef && chef.authenticate(params[:password])
     session[:chef_id] = chef.id
     flash[:success] = "You're logged in!"
     redirect_to recipes_path
   else
     flash.now[:danger] = "There seems to be something wrong with your Email or Password."
     render "new"
     
   end
 end
 
 def destroy
   session[:chef_id] = nil
   flash[:success] = "You're logged out, see you again next time"
   redirect_to root_path
 end
 
end

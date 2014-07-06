class SessionsController < ApplicationController

   def create
      user=User.find_by_email(params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
         sign_in user # defined in SessionsHelper, made available via ApplicationController
         # redirect_back_or_user is defined in sessions_helper.
         # We redirect to user only if signin was successful. Otherwise we go to the page
         # where the user came from.
         redirect_back_or user
      else
         # error
         # Use flash, when we do a redirect.
         # Use flash.now, when we render
         flash.now[:error]='Email / Password incorrect'
         render 'new'
      end
   end

   def destroy
      sign_out
      redirect_to root_url
   end

end

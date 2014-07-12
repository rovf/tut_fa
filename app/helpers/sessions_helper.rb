module SessionsHelper

   def sign_in(user)
      remember_token=User.new_remember_token
      # Set as a cookie, not just in the session, because we want to automatically login
      cookies[:remember_token]={ value: remember_token, expires: 20.years.from_now.utc }
      # We could also say:
      #    cookies.permanent[:remember_token]=remember_token
      user.update_attribute(:remember_token,User.digest_token(remember_token))
      self.current_user=user
   end

   def current_user=(u)
      @current_user=u
   end

   def current_user
      @current_user||=User.find_by(remember_token: User.digest_token(cookies[:remember_token]))
   end

   def current_user?(u)
      u==current_user
   end

   def signed_in?
      !current_user.nil?
   end

   def sign_out
      current_user.update_attribute(:remember_token, User.digest_token(User.new_remember_token))
      cookies.delete(:remember_token)
      self.current_user=nil
   end

   def signed_in_user
     unless signed_in?
        store_location
        # notice: parameter sets flash[:notice]
        # (but we don't have error: or success:)
        redirect_to signin_url, notice: "Please sign in!"
     end
   end

   def store_location
      # We can only remember get request, because redirect_to is also via 'get'
      session[:return_to]=request.url if request.get?
   end

   def redirect_back_or(default)
      redirect_to(session[:return_to]||default)
      session.delete(:return_to)
   end
end

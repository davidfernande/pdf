class ApplicationController < ActionController::Base
  protect_from_forgery
  #protect_from_forgery secret: "123456789012345678901234567890"

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


  def someonesigned! 
      if user_signed_in?
        return true
      else
          if params[:signed_request]
            #podria ser de facebook
            #lo intento logar en facebook
            #redirect_to  emitter_omniauth_authorize_path(:facebook)
          elsif params[:facebook]
            #podria ser de facebook
            #lo intento logar en facebook
            #redirect_to  emitter_omniauth_authorize_path(:facebook)
          else
            redirect_to "/users/sign_in"
          return false
          end
          
      end 
  end

  def finduser
      @user = User.find(current_user.id) # OJO CORREGIR QUE ESTO ES TEMPORAL
  end
  
  def admin_signed_in?
    false
  end
  # def after_sign_in_path_for(resource_or_scope)
  #   session[:cups] = @huerto
  # end

end

class ApplicationController < ActionController::Base

  protect_from_forgery  with: :exception
  skip_before_action :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }

  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params| 
          user_params.permit(:first_name, :last_name , :date_of_birth , :phone_number ,
          :gender , :address  , :email, :password , :password_confirmation , :photo)
        end


    end

    # Update user without password for Admin 
    def update_resource(resource, params)
      resource.update_without_password(params)
    end
  

end

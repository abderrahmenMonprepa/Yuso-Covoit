class RegistrationsController < Devise::RegistrationsController

  # before_action :one_user_registered?, only: [:new, :create]

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Vous recevrez un e-mail avec les instructions pour confirmer votre adresse e-mail dans quelques minutes.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name , :date_of_birth , :phone_number , 
      :gender , :address  , :email, :password , :password_confirmation , :photo)
    end
  
  protected

  #  Only one user can sign in with same login
  def one_user_registered?
    if User.count == 1
      if user_signed_in?
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end
    end  
  end



end
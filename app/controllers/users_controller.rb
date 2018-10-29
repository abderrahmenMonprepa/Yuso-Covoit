class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

   respond_to :html, :js

  # GET /document_favoris
  # GET /document_favoris.json
  def index
    @users = User.all
  end

  # GET /document_favoris/1
  # GET /document_favoris/1.json
  def show
  end

  # GET /document_favoris/new
  def new
    @user = User.new
  end

  # GET /document_favoris/1/edit
  def edit
  end

  # POST /document_favoris
  # POST /document_favoris.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Utilisateur ajouté avec succès.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_favoris/1
  # PATCH/PUT /document_favoris/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'Utilisateur modifié avec succès.' }
        format.json { render :show, status: :ok, location: @user }
        # redirect_to het_el_kazi_path
         flash[:notice] = "Updated user"
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_favoris/1
  # DELETE /document_favoris/1.json
  def destroy
    @user.destroy
    redirect_to root_path
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name , :date_of_birth , :phone_number , 
      :gender , :address  , :email, :password , :password_confirmation, :photo)
    end
end
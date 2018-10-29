class UserCommentsController < ApplicationController
  before_action :set_user_comment, only: [:show, :edit, :update, :destroy]

  # GET /user_comments
  # GET /user_comments.json
  def index
    @user_comments = UserComment.all
  end

  # GET /user_comments/1
  # GET /user_comments/1.json
  def show
  end

  # GET /user_comments/new
  def new
    @user_comment = UserComment.new
  end

  # GET /user_comments/1/edit
  def edit
  end

  # POST /user_comments
  # POST /user_comments.json
  def create
    @user_comment = UserComment.new(user_comment_params)
    @route = Route.find_by_id(params[:route_id])
    @user_comment = @route.user_comments.create(user_comment_params)
    @user_comment.user_id = current_user.id
    @user_comment.route_id = @route.id


      if @user_comment.save
        flash[:success] = "Votre commentaire est ajouté avec succès !!"
        redirect_back(fallback_location: root_path)
      else
      end
    # end
  end

  # PATCH/PUT /user_comments/1
  # PATCH/PUT /user_comments/1.json
  def update
    respond_to do |format|
      if @user_comment.update(user_comment_params)
        format.html { redirect_to @user_comment, notice: 'User comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_comment }
      else
        format.html { render :edit }
        format.json { render json: @user_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_comments/1
  # DELETE /user_comments/1.json
  def destroy
    @user_comment.destroy
    respond_to do |format|
      format.html { redirect_to user_comments_url, notice: 'User comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_comment
      @user_comment = UserComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_comment_params
      params.require(:user_comment).permit(:content, :comment_validation, :user_id , :route_id)
    end
end

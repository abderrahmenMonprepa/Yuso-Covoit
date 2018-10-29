class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy ]

  # GET /routes
  # GET /routes.json
  def index
    if user_signed_in?
      @user= current_user
      @routes = @user.routes
      @reservations = @user.reservations
    end
  end

  def all_routes

    # Search routes by departure_point, arrival_oint and date
    if params[:search_departure].present? and params[:search_arrival].present? and params[:search_date].present?

      @routes = Route.where("routes.departure_point LIKE ? and routes.arrival_point LIKE ?
       and routes.departure_time LIKE ?  ", "#{params[:search_departure]}" , "#{params[:search_arrival]}" , "#{params[:search_date]}" )  

    elsif params[:search_departure].present? and params[:search_arrival].present? 

      @routes = Route.where("routes.departure_point LIKE ? and routes.arrival_point LIKE ? ", "#{params[:search_departure]}" , "#{params[:search_arrival]}"  ) 

    elsif params[:search_departure].present? and params[:search_date].present?
      
      @routes = Route.where("routes.arrival_point LIKE ? and routes.departure_time LIKE ?  " , "#{params[:search_departure]}" , "#{params[:search_date]}" )  
    elsif params[:search_arrival].present?  and params[:search_date].present?

      @routes = Route.where("routes.departure_point LIKE ?  and routes.departure_time LIKE ?  ", "#{params[:search_arrival]}" , "#{params[:search_date]}" ) 

    elsif params[:search_departure].present? 

      @routes = Route.where("routes.departure_point LIKE ?  ", "#{params[:search_departure]}"  ) 


    elsif params[:search_date].present?

      @routes = Route.where(" routes.departure_time LIKE ?  ",  "#{params[:search_date]}" ) 

    elsif params[:search_arrival].present?  

      @routes = Route.where("routes.arrival_point LIKE ?   ", "#{params[:search_arrival]}"  )   
    else 
      @routes = Route.all
    end

  end

  # GET /routes/1
  # GET /routes/1.json
  def show
    @user_comment = UserComment.new
    @comments = @route.user_comments
    @message = Message.new
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes
  # POST /routes.json
  def create

    if (user_signed_in?)
      @route = Route.new(route_params)
      @route.user_id = current_user.id

      respond_to do |format|
        if @route.save
          format.html { redirect_to trajets_path, notice: 'Votre trajet est bien enregistré!' }
          format.json { render :show, status: :created, location: @route }
        else
          format.html { render :new }
          format.json { render json: @route.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /routes/1
  # PATCH/PUT /routes/1.json
  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to routes_url, notice: 'Route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:departure_point, :arrival_point, :departure_time, :estimated_arrival_time, :place_number, :price, 
      :animal_permission, :smoker_permission, :luggage, :user_id , :passenger_or_conducter)
    end
end

class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]


  def index
    @reservations = Reservation.all
  end


  def show
  end


  def new
    @reservation = Reservation.new
    @route_reservated = params[:route_res]
    @route = Route.find_by_id(@route_reservated)
  end


  def edit
  end

  def create
  	@route_reservated = params[:reservation][:route_id]
  	puts "-------------------#{@route_reservated}------------------"
    @route = Route.find_by_id(@route_reservated)
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.route_id = @route.id

    if (@reservation.place_nbr > @route.place_number )
      redirect_back(fallback_location: root_path)
      flash[:danger] = "Nombre de places réservées indisponibles !!"
    else
    @route.update_attributes(place_number: @route.place_number - @reservation.place_nbr)    

      if @reservation.save
        redirect_to trajets_path
        flash[:success] = "Votre réservation est bien enregistrée !"
      else

      end
    end
  end

  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :route_id , :place_nbr)
    end
end

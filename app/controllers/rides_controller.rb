class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite, :upvote, :downvote ]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :can_post?, only: [:new]
  before_action :is_owner?, only: [:edit, :update, :destroy]


  
  # GET /rides
  # GET /rides.json
  def index
    @rides = Ride.all

    @rides = @rides.all.search(params[:search])if params[:search]

    @rides = @rides.sort_by(&:seats) if params[:sorting] == "seats"
    @rides = @rides.sort_by(&:time) if params[:sorting] == "time"
    @rides = @rides.sort_by(&:role) if params[:sorting] == "role"
    @rides = Ride.tomorrow if params[:sorting] == "test"

  end

  # GET /rides/1
  # GET /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    # can_post?
  end

  # GET /rides/1/edit
  def edit
    if owner?(@ride.user_id)
      @ride
    else
      flash[:danger] = "Sorry, you can't edit someone else's stuff"
      redirect_to @ride
    end
  end

  # POST /rides
  # POST /rides.json
  def create
    @ride = current_user.rides.build(ride_params)
    respond_to do |format|
      if @ride.save
        flash[:success] = "Ride created!"
        format.html { redirect_to '/'}
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride.destroy
    flash[:success] = "Ride was successfully destroyed "
    respond_to do |format|
      format.html { redirect_to rides_url}
      format.json { head :no_content }
    end
  end

  def upvote 
    # @event = Event.find(params[:id])
    @ride.upvote_by current_user
    redirect_to :back
  end  

  def downvote
    # @event = Event.find(params[:id])
    @ride.downvote_by current_user
    redirect_to :back
  end

  def favorite 
    @ride.upsaved_by current_user
    current_user.save
    redirect_to :back
    flash[:success] = "favorited"
  end

  def unfavorite
    @ride.unsave_by current_user
    current_user.save
    redirect_to :back
    flash[:success] = "unfavorited"
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:destination, :title, :origin, :time, :role, :notes, :seats)
    end


    def can_post?
      if logged_in?
        @ride = Ride.new
      else
        flash[:danger] = "Nice try. You can't post unless you are logged in."
        redirect_to root_url
      end
    end


    def is_owner?
      @ride = Ride.find(params[:id])
      if !((current_user && @ride.id == current_user.id) || current_user.admin == true)
        flash[:danger] = "You don't own this post! Don't go changing it!"
        redirect_to rides_path
      end
    end

end

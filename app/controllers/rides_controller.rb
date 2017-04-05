class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :can_post?, only: [:new]


  
  # GET /rides
  # GET /rides.json
  def index
    @rides = Ride.all

    if params[:search]
      @rides = @rides.all.search(params[:search])
    else
      @rides
    end
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
        format.html { redirect_to '/', notice: 'Ride was successfully created.' }
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
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:destination, :title, :origin, :when, :role, :notes)
    end


    def can_post?
      if logged_in?
        @ride = Ride.new
      else
        flash[:danger] = "Nice try. You can't post unless you are logged in."
        redirect_to root_url
      end
    end

end

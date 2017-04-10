class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :can_post?, only: [:new]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    if params[:search]
      @events = (@events.all.search(params[:search])).sort {|a,b| b.startdate <=> a.startdate }
    else
      @events = @events.sort {|a,b| b.startdate <=> a.startdate }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
  end

  # GET /events/1/edit
  def edit
    if owner?(@event.user_id)
      @event
    else
      flash[:danger] = "Sorry, you can't edit someone else's stuff"
      redirect_to @event
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)
    flash[:success] = 'Event was successfully created.'
    respond_to do |format|
      if @event.save
        format.html { redirect_to '/' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    flash[:sucess] = 'Event was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :location, :description, :startdate, :enddate, :link)
    end

    def can_post?
      if logged_in?
        @event = Event.new
      else
        flash[:danger] = "Nice try. You can't post unless you are logged in."
        redirect_to root_url
      end
    end

end

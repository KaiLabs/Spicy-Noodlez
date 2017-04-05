class LostandfoundsController < ApplicationController
  before_action :set_lostandfound, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :can_post?, only: [:new]


  # GET /lostandfounds
  # GET /lostandfounds.json
  def index
    @lostandfounds = Lostandfound.all

		if params[:search]
			@lostandfounds = @lostandfounds.all.search(params[:search])
		else
			@lostandfounds
		end
  end

  # GET /lostandfounds/1
  # GET /lostandfounds/1.json
  def show
  end

  # GET /lostandfounds/new
  def new
    # can_post?
  end

  # GET /lostandfounds/1/edit
  def edit
    if owner?(@lostandfound.user_id)
      @lostandfound
    else
      flash[:danger] = "Sorry, you can't edit someone else's stuff"
      redirect_to @lostandfound
    end
  end

  # POST /lostandfounds
  # POST /lostandfounds.json
  def create
    @lostandfound = current_user.lostandfounds.build(lostandfound_params)

    respond_to do |format|
      if @lostandfound.save
        format.html { redirect_to '/', notice: 'Lostandfound was successfully created.' }
        format.json { render :show, status: :created, location: @lostandfound }
      else
        format.html { render :new }
        format.json { render json: @lostandfound.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lostandfounds/1
  # PATCH/PUT /lostandfounds/1.json
  def update
    respond_to do |format|
      if @lostandfound.update(lostandfound_params)
        format.html { redirect_to root_path, notice: 'Your post was successfully updated.' }
        format.json { render :show, status: :ok, location: @lostandfound }
      else
        format.html { render :edit }
        format.json { render json: @lostandfound.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to root_path
  end

  # DELETE /lostandfounds/1
  # DELETE /lostandfounds/1.json
  def destroy
    @lostandfound.destroy
    respond_to do |format|
      format.html { redirect_to lostandfounds_url, notice: 'Lostandfound was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lostandfound
      @lostandfound = Lostandfound.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lostandfound_params
      params.require(:lostandfound).permit(:title, :item, :foundlocation, :foundtime, :notes)
    end



    def can_post?
      if logged_in?
        @lostandfound = Lostandfound.new
      else
        flash[:danger] = "Nice try. You can't post unless you are logged in."
        redirect_to root_url
      end
    end

end

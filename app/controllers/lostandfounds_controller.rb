class LostandfoundsController < ApplicationController
  before_action :set_lostandfound, only: [:show, :edit, :update, :destroy]

  # GET /lostandfounds
  # GET /lostandfounds.json
  def index
    @lostandfounds = Lostandfound.all
  end

  # GET /lostandfounds/1
  # GET /lostandfounds/1.json
  def show
  end

  # GET /lostandfounds/new
  def new
    @lostandfound = Lostandfound.new
  end

  # GET /lostandfounds/1/edit
  def edit
  end

  # POST /lostandfounds
  # POST /lostandfounds.json
  def create
    @lostandfound = Lostandfound.new(lostandfound_params)

    respond_to do |format|
      if @lostandfound.save
        format.html { redirect_to @lostandfound, notice: 'Lostandfound was successfully created.' }
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
end

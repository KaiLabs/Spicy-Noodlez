class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :logged_in?, except: [:new]
  before_action :logged_in_user, only: [:update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  # before_action :admin_user,     only: [:destroy]
  before_action :destroy_all_owned_posts, only: [:destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @events = @user.events
    @rides = @user.rides
    @lostandfounds = @user.lostandfounds
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    flash[:success] = params
  end

  # POST /users
  # POST /users.json
  # def create
  #   @user = User.new(user_params)
  #   respond_to do |format|
  #     if @user.save
  #       # log_in @user
  #       flash[:success] = 'User was successfully created.'
  #       format.html { redirect_to root_url}
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       flash[:error] = "Something went wrong"
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    log_out
    @user.destroy
    flash[:success] = "User was successfully deleted"
    respond_to do |format|
      format.html { redirect_to users_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:uid, :username, :oauth_token, :email, :oauth_expires_at, :avatar)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in first."
        redirect_to root_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      if current_user != @user
        flash[:danger] = "You don't have permission for that"
        redirect_to(root_url) unless current_user?(@user)
      end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def destroy_all_owned_posts
      current_user.rides.delete_all
      current_user.events.delete_all
      current_user.lostandfounds.delete_all
      current_user.trading_posts.delete_all
      current_user.save
    end

end

class TradingPostsController < ApplicationController
  before_action :set_trading_post, only: [:show, :edit, :update, :destroy]
  before_action :can_post?, only: [:new]
  before_action :is_owner?, only: [:edit, :update, :destroy]

  # GET /trading_posts
  # GET /trading_posts.json
  def index
    @trading_posts = TradingPost.all

    #searching
    if params[:search]
      @trading_posts = @trading_posts.all.search(params[:search])
    end

    #filtering
    @trading_posts = @trading_posts.sort_by(&:price) if params[:sorting] == "price"
    @trading_posts = @trading_posts.sort_by(&:role) if params[:sorting] == "role"

  end

  # GET /trading_posts/1
  # GET /trading_posts/1.json
  def show
  end

  # GET /trading_posts/new
  def new
  end

  # GET /trading_posts/1/edit
  def edit
  end

  # POST /trading_posts
  # POST /trading_posts.json
  def create
    @trading_post = current_user.trading_posts.build(trading_post_params)

    respond_to do |format|
      if @trading_post.save
        format.html { redirect_to @trading_post, notice: 'Trading post was successfully created.' }
        format.json { render :show, status: :created, location: @trading_post }
      else
        format.html { render :new }
        format.json { render json: @trading_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trading_posts/1
  # PATCH/PUT /trading_posts/1.json
  def update
    respond_to do |format|
      if @trading_post.update(trading_post_params)
        format.html { redirect_to @trading_post, notice: 'Trading post was successfully updated.' }
        format.json { render :show, status: :ok, location: @trading_post }
      else
        format.html { render :edit }
        format.json { render json: @trading_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trading_posts/1
  # DELETE /trading_posts/1.json
  def destroy
    @trading_post.destroy
    respond_to do |format|
      format.html { redirect_to trading_posts_url, notice: 'Trading post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trading_post
      @trading_post = TradingPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trading_post_params
      params.require(:trading_post).permit(:title, :notes, :price, :avatar, :role, :user_id)
    end

    def can_post?
      if logged_in?
        @trading_post = TradingPost.new
      else
        flash[:danger] = "Nice try. You can't post unless you are logged in."
        redirect_to root_url
      end
    end

    def is_owner?
      @trade = TradingPost.find(params[:id])
      if !((current_user && @trade.id == current_user.id) || current_user.admin == true)
        flash[:danger] = "You don't own this post! Don't go changing it!"
        redirect_to trading_posts_path
      end
    end
end

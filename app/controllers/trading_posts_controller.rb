class TradingPostsController < ApplicationController
  before_action :set_trading_post, only: [:show, :edit, :update, :destroy]

  # GET /trading_posts
  # GET /trading_posts.json
  def index
    @trading_posts = TradingPost.all
  end

  # GET /trading_posts/1
  # GET /trading_posts/1.json
  def show
  end

  # GET /trading_posts/new
  def new
    @trading_post = TradingPost.new
  end

  # GET /trading_posts/1/edit
  def edit
  end

  # POST /trading_posts
  # POST /trading_posts.json
  def create
    @trading_post = TradingPost.new(trading_post_params)

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
      params.require(:trading_post).permit(:title, :notes, :price, :avatar, :role)
    end
end

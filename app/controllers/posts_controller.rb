class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.all
    @events = Event.all
    @rides = Ride.all
    @lostandfounds = Lostandfound.all

    # @posts = (@events + @rides + @lostandfound).sort_by(:update_at).reverse
    # @posts = (@events + @rides + @lostandfound)(:order => "created_at DESC")
    posts_unsorted = @events + @rides + @lostandfounds
    @posts = posts_unsorted.sort {|a,b| b.updated_at <=> a.updated_at }

    # http://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/
    # Try calling each controller's Controller.serach function and then adding those up? that allows diff keys?
    if params[:search]
      posts_unsorted = @events.all.search(params[:search]) + @rides.all.search(params[:search]) + @lostandfounds.all.search(params[:search])
      @posts = posts_unsorted.sort {|a,b| b.updated_at <=> a.updated_at }
      # @posts = @posts.all.search(params[:search]).order("created_at DESC")
    else
      @posts
    end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :startdate, :enddate, :link, :location, :description, :search)
    end
end

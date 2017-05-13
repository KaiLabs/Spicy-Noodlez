class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  # GET /emails/new
  def new
    @email = Email.new
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)
    @user = current_user
    @owner_id = params[:owner].to_i
    @post_id = params[:post_id].to_i
    @type = params[:type]
    if @email.save
      UserMailer.contact_user(@user, @email, @owner_id, @post_id, @type).deliver_now
      @email.destroy
      # redirect_to post_path_helper(@type, @post_id)
      redirect_to root_url
      flash[:success] = "Your email was sent!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:body)
    end
end

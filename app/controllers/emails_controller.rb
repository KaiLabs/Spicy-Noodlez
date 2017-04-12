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

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  # def update
  #   respond_to do |format|
  #     if @email.update(email_params)
  #       format.html { redirect_to @email, notice: 'Email was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @email }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @email.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /emails/1
  # DELETE /emails/1.json
  # def destroy
  #   @email.destroy
  #   respond_to do |format|
  #     format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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

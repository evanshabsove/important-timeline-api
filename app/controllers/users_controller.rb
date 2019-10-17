class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_request, only: [:show, :index, :create]

  # GET /users
  # GET /users.json
  def index
    @q = User.ransack(given_name_cont: params[:q])
    @users = @q.result
    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    options = {include: [:questions]}
    render json: serializer.new(@user, options), include: ['questions']
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    if @user.save
      options = {include: [:questions]}
      render json: serializer.new(@user, options), include: ['questions'], auth_token: JsonWebToken.encode(user_id: @user.id)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def find
    @user = User.find_by(email: params[:user][:email])
    if @user
      render json: @user
    else
      @errors = @user.errors.full_messages
      render json: @errors
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @current_user.update(user_params)
      options = {include: [:questions]}
      render json: serializer.new(@user, options), include: ['questions']
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
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
    params.require(:user).permit(:given_name, :family_name, :email, :password, questions_attributes: [:question, :answer, :date, :id])
  end

  def serializer
    UserSerializer
  end

end

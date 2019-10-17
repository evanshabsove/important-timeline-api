class ScanController < ApplicationController

  def index
    @user = User.find(User.pluck(:id).sample)
    while @user.id == @current_user.id
      @user = User.find(User.pluck(:id).sample)
    end
    options = {include: [:questions]}
    render json: serializer.new(@user, options), include: ['questions']
  end

  private

  def serializer
    UserSerializer
  end

end

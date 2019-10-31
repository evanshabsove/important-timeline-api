class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 def authenticate
   command = AuthenticateUser.call(params[:email], params[:password])

   if command.success?
     user = User.find_by_email(params[:email])
     has_questions = user.questions.length > 0
     render json: { auth_token: command.result, user: User.find_by_email(params[:email]), has_questions: has_questions }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end
end

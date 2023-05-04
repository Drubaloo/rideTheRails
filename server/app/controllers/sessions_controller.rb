class SessionsController < ApplicationController
    def create
      user = User.authenticate(params[:email], params[:password])
      if user
        # encode user ID to stop session freaking out JSON::GeneratorError (source sequence is illegal/malformed utf-8):
        # decode Base64.decode64(session[:user_id]).to_i
        session[:user_id] = user.id.to_s
        render plain: "success"
      else
        render plain: "fail"
      end
    end
  
    def destroy
      session[:user_id] = nil
      render plain: "logged out"
    #   redirect_to root_path, notice: "You have been logged out."
    end
  end
  
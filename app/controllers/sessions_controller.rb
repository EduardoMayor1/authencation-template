class SessionsController < ApplicationController
  def def new
  end

  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      login user
      redirect_to root_path, notice: "You have signed in sucessfully."
    else
      flash[:alert] = "Invalid Email or Password."
      render :new, status: :unprocessable_entity

    end
  end

  def destroy
    logout current_user
    redirect_to root_path, notice: "you have been logged out."
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path , notice: 'Ви ввійшли на сайт'
    else
      flash.now[:alert] = 'Неправильні дані'

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path , notice: 'Ви вийшли з аккаунту'
  end
end

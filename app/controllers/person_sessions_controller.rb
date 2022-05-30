class PersonSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @person = login(params[:email], params[:password])

    if @person
      redirect_back_or_to foods_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to foods_path, notice: 'Logged out!'
  end
end

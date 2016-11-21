class TempEmailsControllerController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
  end

  def create
    raise
    TempEmail.create(temp_email_params)
  end

  private

  def temp_email_params
    params.require(:temp_email).permit(:f_name, :l_name, :email)
  end
end

class TempEmailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @temp_email = TempEmail.new
  end

  def create
    @temp_email = TempEmail.new(temp_email_params)

    if @temp_email.save
      redirect_to method_path, notice: "Su bla bla...."
    else
      render :new
    end
  end

  private

  def temp_email_params
    params.require(:temp_email).permit(:f_name, :l_name, :email)
  end
end

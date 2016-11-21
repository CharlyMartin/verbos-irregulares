class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :method ]

  def home
    @verbs = Verb.all
  end

  def method
  end
end

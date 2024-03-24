class HomeController < ApplicationController
  def index
    @random_records = Restaurant.all()
  end

  def about
  end
end

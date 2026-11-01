class HomeController < ApplicationController
  def index
    @quotes = Quote.includes(:categories).limit(5)
  end
end
 
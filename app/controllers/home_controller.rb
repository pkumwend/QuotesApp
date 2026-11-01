class HomeController < ApplicationController
  def index
  @quotes = Quote.where(is_public: true).order(created_at: :desc).limit(10)
  end
  def uquotes
    @quotes = Quote.includes(:categories).where(user_id: session[:user_id])
  end

end
 
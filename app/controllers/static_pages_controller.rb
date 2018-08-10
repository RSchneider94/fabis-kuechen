class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    @products = Product.limit(2)
  end

  def danke
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@name, @email, @message).deliver_now
  end
end

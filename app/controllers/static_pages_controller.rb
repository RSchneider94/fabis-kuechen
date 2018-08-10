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
    ActionMailer::Base.mail(
      from: @email,
      to: 'rodrigoschneider94@gmail.com',
      subject: "Neue Nachricht von #{ @name }",
      body: @message
    ).deliver_now
  end
end

class PaymentsController < ApplicationController
  def create do
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100).to_i, # amount in cents, again
        currency: "eur",
        source: token,
        description: params[:stripeEmail]
      )
      if charge.paid
        Order.create!(product_id: @product.id, user_id: @user.id, total: @product.price)
      end
    rescue Stripe::CardError => e
      # The card has been declined
    end
    redirect_to product_path(@product)
  end
end

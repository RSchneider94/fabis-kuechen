if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_mzWKjusAwhJDKPzrx3i8yzw0',
    secret_key: 'sk_test_7sA8kjD4q3LfpF7KL1kdGoHj'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
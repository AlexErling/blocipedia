 Rails.configuration.stripe = {
   # publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
   # secret_key: ENV['STRIPE_SECRET_KEY']
   :publishable_key => 'pk_test_M2lgcfgcrqSqJg1xFDibtiui',
   :secret_key => 'sk_test_jpzIHgClI79ZtgJSz5KcQJwO'  
 }
 
 # Set our app-stored secret key with Stripe
 # Stripe.api_key = Rails.configuration.stripe[:secret_key]
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
 

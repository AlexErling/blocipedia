 # Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_M2lgcfgcrqSqJg1xFDibtiui'],
   secret_key: ENV['sk_test_jpzIHgClI79ZtgJSz5KcQJwO']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]
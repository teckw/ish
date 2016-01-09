Rails.configuration.stripe = {
  :publishable_key => 'pk_test_JmX7KHVt8ujPQ95wgunCH6Wv',
  :secret_key      => 'sk_test_uknklxV4d8erucr3WQhXS4gl'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
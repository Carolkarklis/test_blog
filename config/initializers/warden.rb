require './app/strategies/api_token_strategy'

Warden::Strategies.add(:api_token, ApiTokenStrategy)

# frozen_string_literal: true

class ApiTokenStrategy < Warden::Strategies::Base
  def valid?
    user_token.present?
  end

  def authenticate!
    if actor
      success!(actor)
    else
      fail!('Invalid token')
    end
  end

  private

  def actor
    User.find_by(api_token: user_token)
  end

  def user_token
    request.headers['X-User-Token']
  end
end

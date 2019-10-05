# frozen_string_literal: true

class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env['omniauth.auth'], request.env['omniauth.params'])
    sign_in_and_redirect(@user)
  end
end

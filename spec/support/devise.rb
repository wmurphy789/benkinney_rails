module ControllerHelpers
  extend ActiveSupport::Concern

  included do
    before :each do
      signed_in
    end
  end

  def login_user 
    included do
      before :each do
        signed_in
      end
    end
  end

  def signed_user 
    @signed_user = @signed_user ? @signed_user : create(:user)
  end

  def signed_in
    sign_in signed_user
  end  

  alias :log_in :signed_in

  def sign_out
    sign_in(nil)
  end
  alias :log_out :sign_out

  def sign_in(user = nil)
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
      request.params.except! 'access-token', 'token-type', 'client', 'expiry', 'uid'
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
      # request.headers.merge!(user.create_new_auth_token)
    end
  end
end

module DeviseRequestSpecHelpers
  extend ActiveSupport::Concern
  include Warden::Test::Helpers

  included do
    before :each do
      sign_in signed_user
    end
  end

  def signed_user 
    @signed_user = @signed_user ? @signed_user : create(:user)
  end

  def sign_in(resource_or_scope, resource = nil)
    resource ||= resource_or_scope
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    login_as(resource, scope: scope)
  end

  def sign_out(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    logout(scope)
  end

end

module DeviseRouteSpecHelpers
  extend ActiveSupport::Concern
  include Warden::Test::Helpers

  included do
    before :each do
      sign_in signed_user
    end
  end

  def signed_user 
    @signed_user = @signed_user ? @signed_user : create(:user)
  end

  def sign_in(id)
    allow_any_instance_of(ActionDispatch::Request).to receive_message_chain('request.session["warden.user.user.key"]').and_return([[id]])
  end

  def sign_out()
    sign_in(nil)
  end

end

RSpec.configure do |config|

  config.include Devise::TestHelpers, type: :controller
  config.include ControllerHelpers, type: :controller

  config.include DeviseRequestSpecHelpers, type: :request
  config.include DeviseRouteSpecHelpers, type: :route

end
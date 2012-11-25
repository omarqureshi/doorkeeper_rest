module Doorkeeper
  class AccessGrant < ActiveResource::Base
    include DoorkeeperRest::ActiveResourceFillers
    
    self.site = Doorkeeper.configuration.api_endpoint
    
    define_model_callbacks :save, :validation, :create

    schema do
      string 'token', 'refresh_token', 'scopes', 'redirect_uri'
      integer 'resource_owner_id', 'application_id', 'expires_in'
      attribute 'created_at', 'string'
    end

  end
end

module Doorkeeper
  class AccessToken < ActiveResource::Base
    include DoorkeeperRest::ActiveResourceFillers

    self.site = Doorkeeper.configuration.api_endpoint

    define_model_callbacks :save, :validation
    
    schema do
      string 'token', 'refresh_token', 'scopes'
      integer 'resource_owner_id', 'application_id', 'expires_in'
      attribute 'created_at', 'string'
      attribute 'revoked_at', 'string'
    end

    def self.last_authorized_token_for(application, resource_owner_id)
      get(:last_authorized, :application_id => application.id, :resource_owner_id => resource_owner_id)
    end
    
  end
end

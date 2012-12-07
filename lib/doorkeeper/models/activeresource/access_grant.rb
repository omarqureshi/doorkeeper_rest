module Doorkeeper
  class AccessGrant < ActiveResource::Base
    include DoorkeeperRest::ActiveResourceFillers
    
    self.site = Doorkeeper.configuration.api_endpoint
    
    schema do
      string 'token', 'refresh_token', 'scopes', 'redirect_uri'
      integer 'resource_owner_id', 'application_id', 'expires_in'
      attribute 'created_at', 'string'
    end

    def self.create!(*args)
      obj = self.new(*args)
      obj.token = obj.send(:generate_token)
      obj.save
      obj
    end
  end
end

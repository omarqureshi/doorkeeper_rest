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
      begin
        find(:first, :from => :last_authorized, :params => {:application_id => application.id, :resource_owner_id => resource_owner_id})
      rescue ActiveResource::ResourceNotFound
        nil
      end
    end

    def application
      Doorkeeper::Application.find(application_id)
    end

    def self.create!(*args)
      obj = self.new(*args)
      obj.token = UniqueToken.generate
      obj.refresh_token = UniqueToken.generate if obj.use_refresh_token?
      obj.save
      obj
    end
    
  end
end

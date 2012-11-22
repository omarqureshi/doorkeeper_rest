module Doorkeeper
  class Application < ActiveResource::Base
    include DoorkeeperRest::ActiveResourceFillers
    define_model_callbacks :save, :validation
    
    self.site = Doorkeeper.configuration.api_endpoint
    schema do
      string 'name', 'uid', 'secret', 'redirect_uri', 'owner_type'
      integer 'owner_id'
    end

    def self.model_name
      ActiveModel::Name.new(self, nil, "Application")
    end

    def save
      result = super
      ::Rails.logger.error errors.inspect
      result
    end

  end
end

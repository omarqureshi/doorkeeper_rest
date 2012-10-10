module Doorkeeper
  class Application < ActiveResource::Base
    include DoorkeeperRest::ActiveResourceFillers
    self.site = Doorkeeper.configuration.api_endpoint
    schema do
      string 'name', 'uid', 'secret', 'redirect_uri', 'owner_type'
      integer 'owner_id'
    end
  end
end

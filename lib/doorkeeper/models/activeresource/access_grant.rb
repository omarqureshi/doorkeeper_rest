module Doorkeeper
  class AccessGrant < ActiveResource::Base
    self.site = Doorkeeper.configuration.api_endpoint
    include DoorkeeperRest::ActiveResourceFillers
  end
end

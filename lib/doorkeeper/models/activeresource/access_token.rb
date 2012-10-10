module Doorkeeper
  class AccessToken < ActiveResource::Base
    self.site = Doorkeeper.configuration.api_endpoint
    include DoorkeeperRest::ActiveResourceFillers
  end
end

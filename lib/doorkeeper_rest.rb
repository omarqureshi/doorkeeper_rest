require "doorkeeper_rest/version"

module DoorkeeperRest
  require 'doorkeeper_rest/activeresource/validations/uniqueness'
  require 'doorkeeper_rest/concerns/activeresource_fillers'
end

module Doorkeeper
  class Config
    option :api_endpoint, :default => nil
  end
end

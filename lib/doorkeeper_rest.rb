require "doorkeeper_rest/version"

module DoorkeeperRest
  require 'doorkeeper_rest/activeresource/validations/uniqueness'
  require 'doorkeeper_rest/concerns/activeresource_fillers'
end

module Doorkeeper
  class Config
    option :api_endpoint, :default => nil
  end


  def self.enable_orm
    require "doorkeeper/models/#{@config.orm}/access_grant"
    require "doorkeeper/models/#{@config.orm}/access_token"
    require "doorkeeper/models/#{@config.orm}/application"
    require 'doorkeeper/models/access_grant'
    require 'doorkeeper/models/access_token'
    require 'doorkeeper_rest/models/application'
  end
end

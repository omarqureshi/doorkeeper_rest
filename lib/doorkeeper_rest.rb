require "doorkeeper_rest/version"
require 'doorkeeper_rest/activeresource/validations/uniqueness'

module DoorkeeperRest
  require 'doorkeeper_rest/activeresource/validations'
  require 'doorkeeper_rest/activeresource/base'
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
    require "doorkeeper/models/application"
    require 'doorkeeper_rest/models/application'
    require 'doorkeeper_rest/models/access_grant'
  end
end

module Doorkeeper
  class AccessGrant
    def self.authenticate(token)
      all(:conditions => {:token  => token).first
    end
  end
end

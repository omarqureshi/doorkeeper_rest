module Doorkeeper
  class AccessGrant
    def self.authenticate(token)
      all(:parameters {:token  => token).first
    end
  end
end

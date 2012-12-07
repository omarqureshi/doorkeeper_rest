module Doorkeeper
  class AccessGrant
    def self.authenticate(token)
      first(:params => {:token  => token})
    end
  end
end

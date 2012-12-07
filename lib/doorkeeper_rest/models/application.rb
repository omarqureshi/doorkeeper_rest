module Doorkeeper
  class Application
    def self.by_uid(uid)
      first(:params => {:uid => uid})
    end

    def self.authenticate(uid, secret)
      first(:params => {:uid => uid, :secret => secret})
    end
  end
end

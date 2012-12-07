module Doorkeeper
  class Application
    def self.by_uid(uid)
      first(:conditions => {:uid => uid})
    end

    def self.authenticate(uid, secret)
      all({:uid => uid, :secret => secret}).first
    end
  end
end

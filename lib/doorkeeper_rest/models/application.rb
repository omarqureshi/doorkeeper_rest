module Doorkeeper
  class Application

    def self.by_uid(uid)
      first(:conditions => {:uid => uid})
    end
  end
  
end

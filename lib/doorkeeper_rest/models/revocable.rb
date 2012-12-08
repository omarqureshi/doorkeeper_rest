module Doorkeeper
  module Models
    module Revocable
      def revoke(clock = DateTime)
        update_attribute :revoked_at, clock.now
      end
    end
  end
end

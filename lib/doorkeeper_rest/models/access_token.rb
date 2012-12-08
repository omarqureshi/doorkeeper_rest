module Doorkeeper
  class AccessToken
    def as_json(options={})
      {
        :resource_owner_id => self.resource_owner_id,
        :scopes => self.scopes,
        :expires_in_seconds => self.expires_in_seconds,
        :token => self.token,
        :refresh_token => self.refresh_token,
        :application => { :uid => self.application.uid }
      }
    end
  end
end

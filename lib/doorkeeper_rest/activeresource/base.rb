module ActiveResource
    class Base
    def self.create!(*args)
      obj = create(*args)
      raise(ResourceInvalid.new(obj)) unless obj.persisted?
      obj
    end
  end
end

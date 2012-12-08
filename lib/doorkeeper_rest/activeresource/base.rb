require 'active_support/core_ext/array/wrap'

module ActiveResource
  module Callbacks
    extend ActiveSupport::Concern

    CALLBACKS = [
      :before_validation, :after_validation, :before_save, :around_save, :after_save,
      :before_create, :around_create, :after_create, :before_update, :around_update,
      :after_update, :before_destroy, :around_destroy, :after_destroy
    ]

    included do
      extend ActiveModel::Callbacks
      include ActiveModel::Validations::Callbacks

      define_model_callbacks :save, :create, :update, :destroy
    end
  end
end

module ActiveResource
  class Base
    include Callbacks

    def [](attr)
      attributes[attr]
    end

    def created_at
      if attributes[:created_at]
        Time.parse(attributes[:created_at])
      else
        Time.now
      end
    end

    def updated_at
      if attributes[:updated_at]
        Time.parse(attributes[:updated_at])
      else
        Time.now
      end
    end
    
    def self.create!(*args)
      obj = create(*args)
      raise(ResourceInvalid.new(obj)) unless obj.persisted?
      obj
    end

    def save_with_callbacks
      run_callbacks :save do
        save_without_callbacks
      end
    end
    alias_method_chain :save, :callbacks

    def destroy_with_callbacks
      run_callbacks :destroy do
        destroy_without_callbacks
      end
    end
    alias_method_chain :destroy, :callbacks

    def update_with_callbacks
      run_callbacks :update do
        update_without_callbacks
      end
    end
    alias_method_chain :update, :callbacks

    def create_with_callbacks
      run_callbacks :create do
        create_without_callbacks
      end
    end


  end
end

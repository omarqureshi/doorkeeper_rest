module ActiveResource
  module Validations
    class UniquenessValidator < ActiveModel::EachValidator
      def initialize(options)
        super(options.reverse_merge(:case_sensitive => true))
      end

      def setup(klass)
        @klass = klass
      end

      def validate_each(rec, attr, val)
        
      end
      
    end
  end
end

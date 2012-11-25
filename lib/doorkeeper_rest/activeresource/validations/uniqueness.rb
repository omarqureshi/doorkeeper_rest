module ActiveResource
  module Validations
    module ClassMethods
      def validates_uniqueness_of(*attr_names)
        validates_with UniquenessValidator, _merge_attributes(attr_names)
      end
    end
      
    class UniquenessValidator < ActiveModel::EachValidator
      def setup(klass)
        @klass = klass
      end

      def validate_each(rec, attr, val)
        finder_class = rec.class
        results = finder_class.all(:params => {attr => val})
        if results
          results = results.reject {|res| res.id == rec.send(:id)} if rec.new_record?
          rec.errors.add(attr, :taken, options.merge(:value => val)) if results.any?
        end
      end
    end
  end
end

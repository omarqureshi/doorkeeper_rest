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
        results = finder_class.all(:conditions => {attr => val})
        results = results.reject {|res| res.id == rec.send(:id)} if rec.new_record?
        if results.any?
          record.errors.add(attribute, :taken, options.merge(:value => value))
        end
      end
      
    end
  end
end

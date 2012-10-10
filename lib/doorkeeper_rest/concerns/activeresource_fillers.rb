module DoorkeeperRest::ActiveResourceFillers
  def self.included(base)
    base.class_eval do
      
      def self.belongs_to(name, options)
      end

      def self.has_many(name, options)
      end

      def self.attr_accessible(*args)
      end

      def self.before_validation(*args)
      end

    end
  end

end

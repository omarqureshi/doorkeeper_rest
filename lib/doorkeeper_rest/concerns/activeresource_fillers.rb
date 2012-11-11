module DoorkeeperRest::ActiveResourceFillers
  def self.included(base)
    base.class_eval do
      extend ActiveModel::Callbacks
      include ActiveModel::Validations::Callbacks
      
      def self.belongs_to(name, options)
      end

      def self.has_many(name, options)
      end

      def self.attr_accessible(*args)
      end
      
    end

    def valid?
      run_callbacks :validate do
        super
        load_remote_errors(@remote_errors, true) if defined?(@remote_errors) && @remote_errors.present?
        errors.empty?
      end
    end
  end
end

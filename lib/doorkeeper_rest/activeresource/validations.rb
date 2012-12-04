module ActiveResource
  
  class Errors < ActiveModel::Errors

    def from_array(messages, save_cache = false)
      clear unless save_cache
      humanized_attributes = Hash[@base.attributes.keys.map { |attr_name| [attr_name.humanize, attr_name] }]
      messages.each do |message|
        attr_message = humanized_attributes.keys.sort_by { |a| -a.length }.detect do |attr_name|
          if message.keys.first[0, attr_name.size + 1] == "#{attr_name} "
            add humanized_attributes[attr_name], message[(attr_name.size + 1)..-1]
          end
        end
        self[:base] << message if attr_message.nil?
      end
    end
    
  end

  module Validations
    alias_method :valid_without_callbacks, :valid?
    def valid?
      run_callbacks :validate do
        valid_without_callbacks
      end
    end
  end
  
end

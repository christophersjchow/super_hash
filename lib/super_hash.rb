require 'delegate'
require 'active_support/core_ext'

class SuperHash < Delegator
  attr_accessor :attributes

  def initialize(attributes = {})
    self.attributes = ActiveSupport::HashWithIndifferentAccess.new attributes
    self.coerce!
    self.define_key_methods!
  end

  def coerce!
    self.attributes.each do |key, value|
      case value
      when Hash
        self.attributes[key] = SuperHash.new value
      when Array
        value.each_with_index do |array_value, index|
          value[index] = SuperHash.new(array_value) if array_value.is_a?(Hash)
        end
      end
    end
  end

  def define_key_methods!
    self.attributes.each do |key, value|
      self.class.send(:define_method, key.to_sym) do
        self.attributes[key]
      end
    end
  end

  def __getobj__
    @attributes
  end

  def to_json(options={})
    @attributes.to_json options
  end
end

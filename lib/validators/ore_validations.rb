module OreHanami
  module Validations
    def self.included(base)
      base.class_eval do
        extend ClassMethods
      end
    end
    module ClassMethods
      # validates :body, presence: true
      def validates name, options
        @validation_set ||= {}
        @validation_set[name] ||= {}
        @validation_set[name].merge!(options)
      end

      def validations
        @validation_set
      end
    end

    def valid?
      validate
    end

    def invalid?
      !valid?
    end

    def validate
      class_validations_set = self.class.__send__(:validations)
      read_attributes = {}.tap do |attributes|
        class_validations_set.each_key{ |attr| attributes[attr] = public_send(attr) }
      end
      validator = Validator.new(class_validations_set, read_attributes)
      validator.validate
    end

    class Validator
      def initialize(validation_set, attributes)
        @validation_set = validation_set
        @attributes = attributes
      end
      def validate
        @validation_set.all? do |name, validations|
          value = @attributes[name]
          attribute = Attribute.new(name, validations, value)
          attribute.validate
        end
      end
    end

    class Attribute
      def initialize(name, validations, value)
        @value = value
        @validations = validations
      end
      def validate
        presence
      end
      def presence
        _validate(__method__) { !BlankValueChecker.new(@value).blank_value? }
      end
      private
      def _validate(validation)
        validator = @validations[validation]
        return yield validator if validator
        true
      end
    end

    class BlankValueChecker
      BLANK_STRING_MATCHER = /\A[[:space:]]*\z/.freeze
      def initialize(value)
        @value = value
      end
      def blank_value?
        _nil_value? || _blank_string? || _empty_value?
      end

      private
      def _nil_value?
        @value.nil?
      end
      def _blank_string?
        (@value.respond_to?(:match) and @value.match(BLANK_STRING_MATCHER))
      end
      def _empty_value?
        (@value.respond_to?(:empty?) and @value.empty?)
      end
    end
  end
end

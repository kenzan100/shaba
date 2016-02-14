require 'validators/ore_validations'
require 'byebug'
module Shaba
  class Memo
    include OreHanami::Validations
    validates :body, presence: true
    attr_accessor :body

    def initialize(body_text)
      self.body = body_text
    end

    def body=(body_text)
      organized_text = organize(body_text)
      @body = organized_text
    end

    private

    def organize(text)
      return text unless text.kind_of?(String)
      text.chomp.strip
    end
  end
end

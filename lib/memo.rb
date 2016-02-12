class Memo
  class BodyMustBePresentError < ::StandardError; end
  attr_accessor :body
  def initialize(body_text)
    self.body = body_text
  end

  def body=(body_text)
    organized_text = organize(body_text)
    raise BodyMustBePresentError if organized_text.empty?
    @body = organized_text
  end

  private

  def organize(text)
    text.chomp.strip
  end
end

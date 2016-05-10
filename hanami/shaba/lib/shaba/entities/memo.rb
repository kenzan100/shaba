class Memo
  include Hanami::Entity

  attributes :body

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

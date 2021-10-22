class Text
  attr_reader :body, :expected_time

  def initialize(body, expected_time)
    @body = body
    @expected_time = expected_time
  end

  def message
    "#{body} #{expected_time}"
  end
end

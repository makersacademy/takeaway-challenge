class TextMessage

  attr_reader :client
  
  def initialize(client: nil)
    @client = client
  end

  def deliver
  end

end

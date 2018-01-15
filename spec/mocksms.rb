
class MockSmS

  def initialize	
  @messages = []
  end 

  def self.confirmation
    @messages << "Order sent"
  end

  def self.messages
    @messages
  end
end
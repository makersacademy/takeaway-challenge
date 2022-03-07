require 'entry_point'

describe ".take_order" do

  def with_captured_stdout
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string   
  ensure
    $stdout = original_stdout
  end

  it "should test successful order placing" do
    allow(TwilioClient).to receive(:send_message).and_return nil
    allow($stdin).to receive(:gets).and_return("7404", "1", "2", "2", "1", "done", "yes")
    str = with_captured_stdout { take_order }
    expect(str).to include "total = 45"
    expect(str).to include "Your order has been accepted"
  end

  it "should test unsuccessful order placing" do
    allow($stdin).to receive(:gets).and_return("7404", "1", "2", "2", "1", "done", "no")
    str = with_captured_stdout { take_order }
    expect(str).to include "Your order was not placed. See you soon!"
  end
  
end

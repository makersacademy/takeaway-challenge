require 'messenger'

describe Messenger do

  it "should respond to confirm_order method" do
    expect(subject).to respond_to(:send_confirmation)
  end

end

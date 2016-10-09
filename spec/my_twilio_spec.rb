require "my_twilio"

describe MyTwilio do
  class DummyClass
  end

  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(MyTwilio)
  end

  it "responds to account.messages.create" do
    expect(@dummy_class.client).to respond_to(:account)
  end

end

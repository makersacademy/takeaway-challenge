require 'takeaway'

describe Takeaway do
  it "should exist" do
    expect(subject).to be_instance of Takaway
  end
  it 'should respond to menu' do
    expect(subject).to respond_to(:menu)
  end
end

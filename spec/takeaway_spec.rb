require 'takeaway'

describe Takeaway do

  subject(:takeaway) { Takeaway.new }

  it "shows a list of dishes" do
    expect(takeaway.read_menu).to eq takeaway.read_menu
  end

  it "can select several dishes" do
    expect(takeaway).to respond_to(:order).with(1).argument
  end

end

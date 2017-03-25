require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new}

  describe "#initialize" do
  it "so that I can see a list of dishes with prices, initialize takeaway with menu" do
    menu_items = {"Pizza"=>8.00, "Nachos"=>6.00, "Beer"=>3.00}
    expect(takeaway.menu).to eq menu_items
    end
  end
end

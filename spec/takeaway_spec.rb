require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it "has a default empty order" do
    expect(takeaway.order).to be_empty
  end

  it "displays menu" do
    expect(takeaway.print_menu).to eq "Menu"
  end

end

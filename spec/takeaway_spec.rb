require 'takeaway'

describe Takeaway do
  subject(:takeaway){described_class.new}

  it "prints a welcome message" do
    expect(takeaway.enter).to eq("Welcome to our takeaway. To check out our menu, type in takeaway.display_menu")
  end

  it 'has a menu' do
    expect(takeaway.menu).to be_a_kind_of Menu
  end

  it "displays a menu" do
    expect(takeaway.menu).to receive(:show)
    takeaway.display_menu
  end

  it "creates an order" do
    takeaway.create_order
    expect(takeaway.order).not_to be nil
  end

end

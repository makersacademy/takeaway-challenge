require 'takeaway'

describe Takeaway do
  subject(:takeaway){described_class.new}
  let(:the_menu){double("menu", :display_menu => true)}

  it "prints a welcome message" do
    expect(takeaway.enter).to eq("Welcome to our takeaway. To check out our menu, type in takeaway.display_menu")
  end

  it "displays a menu" do
    expect(takeaway.menu).to receive(:display)
    takeaway.display_menu
  end

  it "creates an order" do
    takeaway.create_order
    expect(takeaway.order).not_to be nil
  end

end

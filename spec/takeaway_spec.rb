require 'takeaway'

describe TakeAway do
  let(:takeaway) { TakeAway.new }
  before do
    takeaway.order("Pasta")
    takeaway.order("Pizza")
    takeaway.order("Burger")
  end

  it "shows the list of dishes with prices" do
    expect(takeaway.menu).to be_an_instance_of(Array)
  end

  it "can add a menu item to the order" do
    expect(takeaway.order("Pizza")).to include ({ dish: "Pizza", price: 7.49 })
  end

  it "shows the total amount of items" do
    expect(takeaway.total_quantity).to eq 3
  end

  it "shows the total price of the order" do
    expect(takeaway.total_amount).to eq 15.67
  end

  it "gives an order confirmation" do
    expect(takeaway.confirmation).to be_an_instance_of(String)
  end

  it "sends a confirmation text" do
    takeaway.confirmation
    expect { takeaway.confirmation_text }.to_not raise_error
  end
end
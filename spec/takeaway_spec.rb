require 'takeaway'

describe TakeAway do
  let(:takeaway) { TakeAway.new }
  let(:menu) { Menu.new }
  let(:order) { TakeAway.new.order("soup") }

  it 'should have a user scrutable menu' do
    expect(subject.menu).not_to be nil
  end

  it "shows the user the menu" do
    expect(subject.seemenu).to eq [{ "dimsum" => 3 }, { "soup" => 4 }, { "noodles" => 6 }, { "rice" => 7 }]
  end

  it "responds to order with any args" do
    expect(takeaway).to respond_to(:order).with_unlimited_arguments
  end

  it "stores the customer order" do
    expect(order).to eq [["soup"]]
  end

  it "returns the customers order" do
    expect(takeaway.see_order).to eq([["soup"]])
  end
end

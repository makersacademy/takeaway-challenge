require 'takeaway'

describe TakeAway do
  let(:menu) { Menu.new }
  let(:food) { :food }
  let(:order) { Order.new }

  it 'should have a user scrutable menu' do
    expect(subject.menu).not_to be nil
  end

  it "shows the user the menu" do
    expect(subject.seemenu).to eq [{ :food => "dimsum", :price => 3 }, { :food => "soup", :price => 4 }, { :food => "rice", :price => 7 }]
  end

  it "responds to order with any args" do
    expect(subject.order("food", 2)).to eq(order.input_order("food", 2))
  end

  it "returns the order" do
    expect(subject.see_order).to eq(order.summary)
  end

end

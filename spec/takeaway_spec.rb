require 'takeaway'

describe TakeAway do
  let(:menu) { Menu.new }
  let(:food) { :food }
  let(:order) { Order.new }

  it 'should have a user scrutable menu' do
    expect(subject.menu).not_to be nil
  end

  it "shows the user the menu" do
    expect(subject.seemenu).to eq({ 'dimsum' => 3, 'soup' => 4, 'rice' => 7 })
  end

  it "responds to order with any args" do
    expect(subject.orders("food")).to eq(order.sum_cost("food"))
  end

  it "returns the order" do
    expect(subject.see_order).to eq(order.summary)
  end

end

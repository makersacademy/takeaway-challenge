require "order"

describe Order do 

  let(:dish) { double(price: 450) }
  subject(:order) { described_class.new([dish]) }

  it "contains list of dishes" do
    expect(subject.dishes).not_to be_empty
  end

  it "has a total price" do
    expect(order.total_price).to eq 450
  end

end

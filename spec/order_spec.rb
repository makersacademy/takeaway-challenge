require "order"

describe Order do

  let(:item) {double :item}
  let(:quantity) {double :quantity}

  it "selects the item and quantity desired" do
    expect(subject).to respond_to(:add_item).with(2).arguments
  end

  it "increase the basket value by the selected items" do
    allow(subject).to receive(:to_basket).and_return(10)
  end

end

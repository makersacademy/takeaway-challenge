require "order"

describe Order do

  let(:item) {double :item}
  let(:quantity) {double :quantity}
  let(:basket_total) {double :basket_total}

  it "selects the item and quantity desired" do
    expect(subject).to respond_to(:add_item).with(2).arguments
  end

  it "increase the basket value by the selected items" do
    allow(subject).to receive(:to_basket).and_return(10)
  end

  it "adds the total of all items in the basket" do
  expect(subject.order_total).to eq (0)
  end

end

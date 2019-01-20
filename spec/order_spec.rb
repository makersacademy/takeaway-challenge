require 'order'

describe Order do
  let(:item) { double(:item, to_sym: :item) }
  let(:price) { double(:price) }

  it "should by default return an empty basket" do
    expect(subject.basket).to eq []
  end

  it "should store an item which has been added to the basket" do
    subject.add_to_order(:item, 1)
    expect(subject.basket).to eq [:item]
  end

  it "should add the item the quantity number of times" do
    expect(subject.add_to_order(item, 2)).to eq [item, item]
  end

  it "should return the full price of the order" do
    subject.add_to_order(item, 1)
    expect { subject.total_price }.to change { subject.price }
  end

  it "should return the price once calcualted" do
    subject.add_to_order(item, 1)
    expect(subject.total_price).to be_an_instance_of Float
  end
end

require 'order'

describe Order do
  let(:item) { double{:item} }

  it "should by default return an empty order" do
    expect(subject.return_order).to eq []
  end

  it "should store an item which has been added to the order" do
    subject.add_to_order(:item)
    expect(subject.return_order).to eq [:item]
  end 

end

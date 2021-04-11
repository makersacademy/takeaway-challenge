require 'order'
require 'menu'

describe Order do

  it { is_expected.to be_an_instance_of Order }

  it "allows user to make an order" do
    expect(subject).to respond_to(:add_to_basket).with(2).arguments
  end

  it "can keep a record of the user's order" do
    subject.add_to_basket("miso", 3)
    expect(subject.order).to eq(["miso", "miso", "miso"])
  end

  it "can store more orders of more than one dish variety" do
    subject.add_to_basket("miso", 3)
    subject.add_to_basket("tonkotsu", 4)
    expect(subject.order).to eq(["miso", "miso", "miso", "tonkotsu", "tonkotsu", "tonkotsu", "tonkotsu"])
  end

  it "can show the total" do
    expect(subject).to respond_to(:checkout)
  end

  it "can show user's order total" do
    subject.add_to_basket("miso", 3)
    expect(subject.checkout).to eq(24)
  end

  it "can show the basket total when more than one variety of dish is added" do
    subject.add_to_basket("miso", 3)
    subject.add_to_basket("tonkotsu", 4)
    expect(subject.checkout).to eq(56)
  end
  
end

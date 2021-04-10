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
    expect(subject.order).to eq(["miso", "miso", "miso", "tonkotsu","tonkotsu","tonkotsu","tonkotsu"])
  end

end

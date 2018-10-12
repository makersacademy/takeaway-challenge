require "menu"

describe Menu do

  subject(:menu) {Menu.new}

  let(:dish){double :dish, :publish_dish => "dish DDDDD"}

  it "displays the menu when asked by the customer" do
    expect(subject.publish).to eq ""
  end

  it "adds an item to the menu as the chefs get more creative" do
    no_of_dish = subject.dishlist.size
    subject.add_dish("drink", dish)
    expect(subject.dishlist.size - no_of_dish).to eq 1
  end

end

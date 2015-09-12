require 'customer'

describe Customer do

  it { is_expected.to respond_to(:place_order).with(2).argument }

  it "can view menu" do
    expect(subject.display_menu).to eq ({ "crispy chilli beef" => 5,
      "sweet and sour chicken" => 4,
      "egg fried rice" => 2 })
  end

  it "raises an error if chosen dish is not on menu" do
   expect{ subject.place_order("spring rolls", 3) }.to raise_error
   "This dish is not on the menu"
  end

  it "can chose a dish and quantity" do
    subject.place_order("crispy chilli beef", 2)
    expect( subject.order["crispy chilli beef"] ).to eq(2)
  end

  it "add up total of dishes" do
    subject.place_order("crispy chilli beef", 1)
    subject.place_order("sweet and sour chicken", 2)
    expect(subject.total).to eq(13)
  end

end

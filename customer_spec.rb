require 'customer'

describe Customer do

  it "can see a list of dishes and price" do
    expect(subject.display_menu).to eq ( { "crispy chilli beef" => 5.99,
          "sweet and sour chicken" => 4.99,
          "egg fried rice" => 2.99 } )
  end

  it "can choose dish from menu" do
    expect(subject).to respond_to(:choose_dish).with(1).argument
  end

  it "raises an error if chosen dish is not on menu" do
   expect{ subject.choose_dish "spring rolls" }.to raise_error "This item is not available on the menu"
  end

end

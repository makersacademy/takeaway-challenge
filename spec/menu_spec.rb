require 'menu'

describe Menu do
  let(:mockLasagne) { double :lasagne, name: "Lasagne", price: 9 }
  
  it "has an array of dishes" do
    expect(subject.dishes).to eq Menu::DEFAULT_MENU
  end
  
end

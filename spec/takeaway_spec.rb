require 'takeaway'

describe Takeaway do

  subject(:takeaway) {Takeaway.new}
  subject(:dish) {Menu.new}
  let(:seafood) {double :seafood_pizza}

describe "#takes order" do
  it 'there is a menu' do
  expect(takeaway.display_menu).to eq Menu::DEFAULT_MENU
  end

  #it 'takes 1 seafood pizza' do
  #  string = '1x seafood added'
  #  expect(takeaway.order(seafood,1)).to eq string
  #end
end

end

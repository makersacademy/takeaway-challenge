require 'takeaway'

describe Takeaway do
  it {is_expected.to respond_to :order}
  it {is_expected.to respond_to :display_menu}
  
  subject(:takeaway) {Takeaway.new}
  subject(:dish) {Menu.new}

describe "#takes order" do
  it 'there is a menu' do
  expect(takeaway.menu).to eq Menu::DEFAULT_MENU
  end
end

end

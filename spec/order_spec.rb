require 'order'
require 'menu'

describe Order do

  it 'allows the user to create an instance of Order' do
    expect(subject).to be_instance_of Order
  end

  describe '#display_menu' do
    it 'displays a list of dishes' do
      expect(subject.display_menu).to have_key("Calamari")
    end
  end
end
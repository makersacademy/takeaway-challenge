require 'restaurant'

describe Restaurant do
  #let(:restaurant) {double :restaurant}
  restaurant = Restaurant.new
  it { is_expected.to respond_to :view_menu}
  it { is_expected.to respond_to :welcome}


describe '#welcome' do
  context 'when a customers comes to restaurant application' do
    it 'welcomes them' do
      expect{restaurant.welcome}.to output("Welcome to the Thai Cottage\n").to_stdout
    end
  end
end

describe '#menu' do
  context 'when customer asks for a menu' do
    it 'creates a menu for the customer to view' do
      subject.view_menu
      expect(subject.menu).to be_instance_of(Menu)
    end
  end
end

end

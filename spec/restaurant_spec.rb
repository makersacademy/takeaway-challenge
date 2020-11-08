require 'restaurant'

describe Restaurant do
  let(:menu) { Menu.new }

  it 'creates a Restaurant instance' do
    expect(subject).to be_instance_of(Restaurant)
  end

  describe '#see_menu' do
    it 'responds to the method' do
      expect(subject).to respond_to(:see_menu)
    end

    it 'shows the customer the menu' do
      expect(subject.see_menu).to eq(menu.dishes)
    end
  end
end

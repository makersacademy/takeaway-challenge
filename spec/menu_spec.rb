require 'menu'

describe Menu do

  let(:dish) { double :dish, name: 'Red curry', price: 5.95 }

  context 'Creating the menu' do

    it 'Populates the menu with dishes' do
      subject.add_dish dish
      expect(subject.dishes).to include dish
    end

    it 'Displays the current dishes on the menu' do
      subject.add_dish dish
      expect(subject.show_menu).to be_a_kind_of(Array)
    end

  end

end
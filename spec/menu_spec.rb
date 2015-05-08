require 'menu'

describe Menu do

  let(:dish) { double :dish, name: 'red_curry', price: 5.95 }

  context 'Creating the menu' do

    it 'Populates the menu with dishes' do
      subject.add_dish dish
      expect(subject.dishes).to_not be_empty
    end

    it 'Displays the current dishes on the menu' do
      subject.add_dish dish
      expect(subject.show_menu).to be_a_kind_of(Array)
    end

  end

end
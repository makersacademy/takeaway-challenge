require 'Menu'

describe Menu do

# let(:dish_example) { {dish_number: 1, dish_name: 'avocado_maki', price: 4} }

  describe '#show_menu' do

    it 'should show the menu' do
    expect(subject.show_menu).to eq items
    end
  end
end
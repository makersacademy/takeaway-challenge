require 'menu'

describe Menu do
  let(:dish1) { double :dish1, name: "Dish 1", price: 5 }
  let(:dish2) { double :dish2, name: "Dish 2", price: 10 }

  it { is_expected.to respond_to(:menu_list) }
  
  it 'stores dishes to the menu' do
    subject.add_dish(dish1)

    expect(subject.menu_list).to include(dish1)
  end

  context 'given a list of dishes' do
    before do
      subject.add_dish(dish1)
      subject.add_dish(dish2)
    end

    it 'shows me a list of all the dishes' do
      expect(subject.show_menu).to include(dish1, dish2)
    end

    # it 'shows me the name and price of each dish' do
    #   expect(subject.show_menu).to eq("#{dish1.name} - #{dish1.price}\n#{dish2.name} - #{dish2.price}")
    # end

    it 'creates a new order' do
      expect(subject.create_order(dish1, dish2)).to be_an Order
    end
  end
end

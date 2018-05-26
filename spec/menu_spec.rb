require 'menu'

describe Menu do
  let(:menu) { Menu.new("sushi", 5) }

  context 'menu set-up' do
    it 'can create a new food item' do
      expect(menu.name).to eq "sushi"
    end

    it 'can have a price for an item' do
      expect(menu.price).to eq 5
    end
  end
  
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'displays the menu' do
    expect(menu.display_menu).to eq @items
  end

end

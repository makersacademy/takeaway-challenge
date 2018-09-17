require 'menu'

describe Menu do

  it 'should contain a list of items with their prices' do
    expect(subject.items.length).to eq(4)
  end

    it 'should display the list of menu items and prices' do
      expect(subject.display_items).to eq("Burger"=>10, "Fries"=>4, "Nugs"=>6, "Drink"=>3)
    end



end

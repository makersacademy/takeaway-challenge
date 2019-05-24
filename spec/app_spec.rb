require 'app'

describe App do 
  subject(:app) { described_class.new(list_class) }
  let(:list_class) {double(:list_class, :new => list)}
  let(:list) { double(:list, :items => {item: "Margherita", price: 10 })}

  it 'asks the dishlist to display list' do 
    expect(list).to receive(:display)
    app.display_dishes
  end 

  it 'asks the dish_list to select the item and quantity' do 
    expect(list).to receive(:select)
    app.select_dish("Item", 2)
  end
end 
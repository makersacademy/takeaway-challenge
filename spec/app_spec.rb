require 'app'

describe App do 
  let(:app) { App.new }
  let(:list_class) {double(:list_class, new => list)}
  let(:list) { double(:list, :items => {item: "Margherita", price: 10 })}

  it 'asks the dishlist to display list' do 
    expect(list).to receive(:display)
    app.display_dishes(list)
  end 

  it 'asks the dish_list to select the item and quantity' do 
    expect(list).to receive(:select)
    app.select_dish(list, "Item", 2)
  end
end 
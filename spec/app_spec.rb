require 'app'

describe App do 
  subject(:app) { described_class.new(list_class, order_class) }
  let(:list_class) {double(:list_class, :new => list)}
  let(:list) { double(:list, :items => {item: "Margherita", price: 10 })}
  let(:order_class) { double(:order_class, :new => order)}
  let(:order) {double(:order)}

  it 'asks the dishlist to display list' do 
    expect(list).to receive(:display)
    app.display_menu
  end 

  it 'starts a new order' do 
    expect(app.new_order).to be(order)
  end

  it 'asks the dish_list to select the item and quantity' do 
    expect(list).to receive(:select)
    app.select_dish("Item", 2)
  end
end 
require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double() }
  our_menu = [{ :dish => "Chicken Curry", :price => 6.50 }, { :dish => "Lamb Curry", :price => 7 }]

  it 'can show menu (list of dishes with prices)' do
    allow(takeaway).to receive(:show_menu=)
    message = "Chicken Curry £6.5\nLamb Curry £7\nVegetable Curry £6\n"
    expect{ takeaway.show_menu }.to output(message).to_stdout
  end

  it 'stores name of the dish and quantity' do
    takeaway.select_dish("Chicken Curry", 2)
    expect(takeaway.dishes).to eq([{:name => "Chicken Curry", :quantity => 2}])
  end

  it 'allows select dishes and quantities' do
    takeaway.select_dish("Chicken Curry", 2)
    expect(takeaway.dishes).to eq([{:name => "Chicken Curry", :quantity => 2}])
  end

end

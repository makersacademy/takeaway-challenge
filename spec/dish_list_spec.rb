require 'dish_list'

describe DishList do 
  let(:dish_list) {DishList.new}
  it 'initializes with a list of dishes and prices' do 
    expect(dish_list.items).to include({item: "Margherita", price: 10})
  end 
  
  it 'displays the list of dishes' do
    expect{dish_list.display}.to output("Margherita £10\nHawaiin £12\n").to_stdout
  end 

  it 'returns a specific dish and quantity' do 
    expect(dish_list.select("Margherita", 2)).to eq([{item: "Margherita", price: 10}, {item: "Margherita", price: 10}])
  end 
end
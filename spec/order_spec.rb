require 'order'
require 'pry'

describe Order do
  it 'responds to list_dishes' do
    expect(subject).to respond_to(:list_dishes)
  end

  it 'lists dish name(s)' do
    expect(Order.new.list_dishes).to eq(
      [
        "1: Chicken Korma", 
        "2: Beef Lasagna", 
        "3: Spaghetti Bolognese", 
        "4: Mac n Cheese", 
        "5: Fish & Chips", 
        "6: Truffle Gnocchi"
      ]
    )
  end

  it 'selects dishes chosen by a customer' do 

  end
end
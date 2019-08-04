require 'order'
require 'pry'

describe Order do
  it 'responds to list_dishes' do
    expect(subject).to respond_to(:list_dishes)
  end

  it 'lists dish name(s)' do
    expect(Order.new.list_dishes).to eq(
      [
        "Chicken Korma", 
        "Beef Lasagna", 
        "Spaghetti Bolognese", 
        "Mac n Cheese", 
        "Fish & Chips", 
        "Truffle Gnocchi"
      ]
    )
  end

  it 'selects dishes chosen by a customer' do 
    
  end
end
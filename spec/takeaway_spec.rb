require './lib/takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
# I wouid like to see a list of dishes with prices
  it 'instructs a the takeaway to receive a menu' do
    expect(takeaway).to respond_to(:retrieve_menu).with(1).argument
  end 

  it 'it expects the menu retrieve method to create a menu ' do
    expect(takeaway.retrieve_menu).to be_a_kind_of(Hash) 
  end

  it 'it expects the retieve method to update the list of dishes ' do
    expect(takeaway.retrieve_menu).not_to eq nil
  end 

  it 'it expects be able to create and ordered list of each item consisting of dish, price and quantity ' do
    expect(takeaway).to respond_to(:add_order_item).with(2).argument
  end 

  it 'expects to select some of several available dishes ' do 
    array_data = [{ :dish => "Chicken Tikka", :price => 8.45, :quantity => 1 }] 
    takeaway.retrieve_menu
    expect(takeaway.add_order_item("Chicken Tikka")).to match_array(array_data)
  # allow(takeaway).to receive(:add_order_item).and_return ({"Chicken Tikka"=>8.45, "Butter Chicken"=>7.25})
  end

  it 'expects to create a total of all the items in an order ' do
    takeaway.retrieve_menu
    takeaway.add_order_item("Chicken Tikka", 5)
    takeaway.add_order_item("Butter Chicken")
    expect(takeaway.order_total).to eq 49.50
  end

  it 'expects to create a total of all the items in an order ' do
    takeaway.retrieve_menu
    takeaway.add_order_item("Chicken Tikka", 5)
    takeaway.add_order_item("Butter Chicken")
    expect(takeaway.order_total).to eq 49.50
  end 

  it 'to receive a text with the order confirmation ' do 
    data = Time.now + 3600
    data.strftime("%H:%M")
    expect(takeaway.checkout).to eq "Thank you! Your order was placed and will be delivered before #{data.strftime("%H:%M")}"
  end 
end 

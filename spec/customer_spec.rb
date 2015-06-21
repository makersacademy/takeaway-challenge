require 'customer'

describe Customer do

  # let(:shop) { double :shop }
  # let(:customer) { Customer.new(shop) }


  #ADD DOUBLES
  it 'can see a list of dishes with prices' do
    shop = Shop.new
    customer = Customer.new shop
    expect(customer.ask_for_menu shop).to eq (shop.show_menu)
  end #ADD DOUBLES

  #ADD DOUBLES
  it 'can be able to select some number of several available dishes' do
    shop = Shop.new
    customer = Customer.new shop
    customer.ask_for_menu shop
    customer.select_dish('linguine')
    expect(customer.basket).to eq [12]
  end

  #ADD DOUBLES
  it 'can ask for the total to pay' do
    shop = Shop.new
    customer = Customer.new shop
    customer.select_dish('linguine')
    customer.select_dish('beer')
    expect(customer.ask_total).to be 16.5
  end



end

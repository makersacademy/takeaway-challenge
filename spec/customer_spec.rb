require 'customer'

describe Customer do

  let(:shop) { shop = Shop.new }
  let(:texsender) { textsender = Shop.new }
  let(:customer) { Customer.new(shop, textsender) }

  before(:each) do
    customer.select_dish('linguine')
    customer.select_dish('beer')
  end


  it 'can see a list of dishes with prices' do
    expect(customer.ask_for_menu shop).to eq (shop.show_menu)
  end

  it 'can be able to select some number of several available dishes' do
    expect(customer.basket).to eq [12, 4.5]
  end

  it 'can ask for the total to pay' do
    expect(customer.ask_total).to be 16.5
  end

  it 'can pay for the exact amount' do
    expect(customer.pay(16.5)).to eq("Thanks for pay")
  end

  it 'get an error if tries to pay a amount different from the total' do
    expect{customer.pay(3)}.to raise_error 'Sorry, you need to pay the exact total'
  end

end

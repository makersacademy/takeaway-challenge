require 'customer'

describe Customer do
  let(:menu){ double :menu }


  it 'can view the menu' do
    customer = Customer.new("name")
    expect(customer).to respond_to(:view_menu).with(1).argument
  end

  it 'can place and order' do
    customer = Customer.new("name")
    expect(customer).to respond_to(:choose_dishes).with(1).argument
  end

  it 'can choose a number of dishes' do
    customer = Customer.new("name")
    customer.choose_dishes("Lobster", "Caviar")
    expect(customer.choose_amount(2, 2)).to eq ["Lobster", "Lobster", "Caviar", "Caviar"]
  end

  xit 'cannot choose an item that is not on the menu' do
    customer = Customer.new("name")
    expect{customer.choose_dishes("Pizza")}.to raise_error "Not on the menu"
  end


  it 'can review placed order' do
    customer = Customer.new("name")
    customer.choose_dishes("Lobster")
    customer.choose_amount(2)
    expect(customer).to respond_to(:view_order).with(1).argument
  end

end
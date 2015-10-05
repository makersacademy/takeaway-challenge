require './lib/customer.rb'
require './lib/menu.rb'

describe Customer do

  let(:customer) { Customer.new }

  it {is_expected.to respond_to(:basket)}

  it 'can check the menu' do
    expect(customer.display_menu).to include(
    pepperoni_pizza: 5.00,
    spaghetti_pomodoro: 6.00,
    spaghetti_carbonara: 7.50)
  end

  it 'responds to add_item with atleast 1 argument' do
    expect(customer).to respond_to(:add_item).with(1).argument
  end

  it 'raises error if customer adds item not on menu' do
    expect{customer.add_item(:bread)}.to raise_error 'Item not on menu'
  end

  it 'adds items to basket' do
    customer.add_item(:pepperoni_pizza, 2)
    expect(customer.basket).to include(:pepperoni_pizza, 2)
  end

  describe '#checkout' do

    let(:text_provider) {double :text_provider, send_text: nil}

    before do
      allow(text_provider).to receive(:send_text).and_return('Thank you, '\
      'payment has been accepted. You will shortly receive a confirmation '\
      'text message.')
    end

    it 'returns correct order total' do
      customer.add_item(:spaghetti_pomodoro)
      expect(customer.order_total).to eq 'Your order total is: £6.00'
    end

    it 'can verify and complete order if payment is correct' do
      customer.add_item(:spaghetti_pomodoro)
      expect(customer.verify_and_pay(6.00)).to eq 'Thank you, payment has been accepted. You will shortly receive a confirmation text message.'
    end

    it 'raises an error if payment is incorrect' do
      customer.add_item(:spaghetti_pomodoro)
      expect{customer.verify_and_pay(4.00)}.to raise_error 'Payment failed, please pay correct total.'
    end

    it 'notifies customer that their order has been confirmed' do
      customer = Customer.new(text_provider)
      customer.add_item(:spaghetti_pomodoro)
      expect(customer.verify_and_pay(6.00)).to eq('Thank you, '\
      'payment has been accepted. You will shortly receive a confirmation '\
      'text message.')
    end
  end

end

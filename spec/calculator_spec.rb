require 'calculator'

describe Calculator do 

  it 'responds to order total' do 
    expect(subject).to respond_to(:order_total).with(1).argument
  end





end

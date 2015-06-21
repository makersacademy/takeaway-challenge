require 'customer'

describe Customer do
  
  it 'can see a list of dishes with prices' do
    expect(subject.view_dishes).to eq 'Noodles: £3.00, Rice: £2.50'
  end
end
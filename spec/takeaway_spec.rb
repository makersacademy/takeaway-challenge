require 'takeaway'

describe Takeaway do
  let(:takeaway){Takeaway.new}

  it 'lists takeaway options and prices' do
    expect(takeaway.menu).to eq(:Chips => 2.50, :Burger => 5.00, :Coke => 1.50, :Chilli => 3.00) 
  end

  # describe 'lets the customer choose several dishes'
  # it 'records one choice' do
  #   takeaway.stub(:gets).and_return("Burger\n")
  #   takeaway.selection
  #   expect(takeaway.basket).to eq("Burger - £5.00")
  # end
  
  #   expect(takeaway.basket).to eq(:Burger => 5.00, :Coke => 1.50)
  # end
end
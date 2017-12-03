require 'calculator'
require 'menu'
require 'takeaway'

describe Calculator do

  let(:items) do { 'Pepperoni' => 9,
                   'Meat feast' => 10
                 }
               end

  it 'should calculate the total cost of the order' do
    expect(subject.order_total(items)).to eq(19)
  end

end

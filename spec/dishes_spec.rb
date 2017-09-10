require 'dishes'

describe Dishes do
  let(:dishes) { double :dishes }
  subject(:cust){described_class.new}
  it 'initializes with a list of dishes' do
    expect(subject.dishes).to eq('Fish&Chips' => 3, 'Burger&Chips' => 5)
  end
end

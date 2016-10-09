require 'customer'

describe Customer do

  subject(:customer) { described_class.new }

  describe 'initialization' do
 #
  end
  it 'will display a list of dishes with prices' do
    expect(subject.menu). to eq(puts "Here are the menu items.")

  end
  it 'will allow customer to order their meal' do
    expect(subject.new_order).to eq 1
  end
end

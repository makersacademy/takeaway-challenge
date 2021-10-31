require './lib/order.rb'

describe Order do
  let(:menu) { Menu.new }
  let(:dish) { { name: "Chips", price: 2} }

  describe 'intialize' do
    it 'initializes an empty order' do
    expect(subject.basket).to be_empty
    end
  end
end




# Note I would like to be able to
# select some number of several available dishes
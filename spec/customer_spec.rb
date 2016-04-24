require 'customer'
require 'menu'

describe Customer do
  subject(:customer) { described_class.new }

  describe '#initialize' do

    it 'has a menu on initialize' do
      expect(customer.menu).to be_a_kind_of(Menu)
    end
  end

  describe '#read_menu' do

    it 'can read the menu' do
      expect(customer.read_menu).to be_an_instance_of(Hash)
    end
  end

  describe '#order' do

    it 'can add items from the menu to the customer\'s basket' do
      customer.order(item: :a, quantity: 1)
      expect(customer.basket).to eq [{:a=>10}]
    end
  end

end
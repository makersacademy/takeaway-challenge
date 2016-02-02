require 'spec_helper'
require 'menu'

describe Menu do
  subject(:menu) { Menu.new }
  let(:items) { { :'Pizza' => 9.25, :'Chips' => 2.00 } }

  it 'is empty by default' do
    expect(menu).to be_empty
  end

  it 'can have items added' do
    menu.add 'Lasagne', 12.95
    expect(menu).to include 'Lasagne'
  end

  it 'knows the price of an item' do
    menu.add 'Lasagne', 12.95
    expect(menu.price_of('Lasagne')).to eq 12.95
  end

  describe '::from_hash' do

    subject(:menu) { Menu.from_hash(items) }

    it 'contains all of the items' do
      items.keys.each { |name| expect(menu).to include name }
    end
  end

  it 'is enumerable' do
    menu = Menu.from_hash(items)
    menu.each do |name, price|
      expect(items).to include name => price
    end
  end
end

require 'takeaway'

describe Takeaway do

  let(:menu) do
    menu = []
    CSV.foreach("menu.csv") do |row|
      name, price = row
      menu << { name: name, price: price.to_i }
    end
    menu
  end

  describe '#menu.menu' do
    it 'returns list of food items with prices' do
      expect(subject.menu.menu).to eq menu
    end
  end

  describe '#print_menu' do
    it 'prints menu' do
      
    end
  end

  describe "#choose" do
    it 'adds 3 pizza to order instance variable' do
      subject.parse_order('3 pizza')
      expect(subject.order).to include({ name: 'Pizza', price: 8, quantity: 3 })
    end
    it 'parses text correctly' do
      subject.parse_order('3 pizza, 4 burger, 2 nuggets')
      expect(subject.order).to eq([{ total: 46 }, { name: 'Pizza', price: 8, quantity: 3 }, { name: 'Hamburger', price: 4, quantity: 4 }, { name: 'Nuggets', price: 3, quantity: 2 }])
    end
    it 'raises error when trying to choose non existent item' do
      expect { subject.parse_order('2 grapes') }.to raise_error 'Please choose something from the menu'
    end
  end

end

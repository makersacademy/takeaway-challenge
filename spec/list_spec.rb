require 'list'

describe List do
  context 'dish listing' do
    list = List.new
    it 'can add dishes' do
      expect(list).to respond_to(:add_dish)
    end
    it 'prints the list' do
      expect(list).to respond_to(:print)
    end
    it 'prints a list with prices' do
      dish = double("dish", :price => 1)
      list.add_dish(dish)
      expect(list.print).to include(dish)
    end
  end
  context 'order testing' do
    list = List.new
    it 'can select dishes' do
      expect(list).to respond_to(:select)
    end
    it 'selects something' do
      dish = double("dish", :price => 1)
      dish2 = double("dish2", :price => 2)
      list.add_dish(dish)
      list.add_dish(dish2)
      expect(list.select(dish)).to include(dish)
    end
  end
end

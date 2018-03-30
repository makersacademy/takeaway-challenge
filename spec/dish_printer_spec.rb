require 'dish_printer'

describe DishPrinter do

  before(:each) do
    class DummyClass
      include DishPrinter
    end
    @dummy_var = DummyClass.new
  end

  describe '#pretty_print' do
    it 'pretty prints given info' do
      expect(@dummy_var.pretty_print(name: 'Meatballs', id: 1, price: 3.49)).to eq 'Dish#1: Meatballs (£3.49)'
    end
  end
end

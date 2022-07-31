require 'food_order'

describe FoodOrder do

  let(:menu_item_doesnt_exist) { "toast" }
  let(:menu_item_exists) { { "meat feast pizza" => 7.00 } }
  let(:number_of_pizzas) { 5 }

  describe 'ininitialization of object instantiation' do
    it 'has ah empty food_order array' do
      expect(subject.food_order).to eq([])
    end
  end

  describe '#add_item' do
    it 'raises error if menu item does not exist' do
      message = "This menu item does not exist"
      expect { subject.add_item(menu_item_doesnt_exist, number_of_pizzas) }.to raise_error(message)
    end

    it 'stores menu item(s) to food_order array' do
      subject.add_item("meat feast pizza", number_of_pizzas)
      expect(subject.food_order).to include(menu_item_exists)
    end
  end

  describe '#sum_order' do
    it 'checks price sum of take away order' do
      subject.add_item("meat feast pizza", 2)
      subject.add_item("vegetarian pizza", 3)
      subject.add_item("pepperoni pizza", 6)
      subject.add_item("bbq chicken pizza", 4)
      expect { subject.order_sum }.to output { "The cost of your order is £124.00" }.to_stdout
    end
  end

end

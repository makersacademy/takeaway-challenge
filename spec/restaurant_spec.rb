require 'restaurant' 

RSpec.describe Restaurant do
  
  describe '#show_menu' do
    it 'shows the menu of the restaurant' do
      example_menu = get_example_menu
      expect(subject.show_menu).to eq(example_menu)
    end
  end

  describe '#create_order' do
    it 'creates a new Order-Object and returns it' do
      expect(subject.create_order).to be_a(Order)
    end
  end

  describe '#add_dish_to_order' do
    it 'adds dishes to an order' do
      subject.create_order()
      subject.add_dish_to_order('Chips')
      subject.add_dish_to_order('Chips')
      subject.add_dish_to_order('I am not the the menu')
      subject.add_dish_to_order('Beer')
      expect(subject.show_order).to eq(get_example_order)
    end
  end

end

def get_example_menu
  {
    'Chips' => 6.40,
    'Fish' => 8.0,
    'Beer' => 3.20,
    'Milk' => 1.00
  }
end

def get_example_order
  [
    {'Chips' => 6.40},
    {'Chips' => 6.40},
    {'Beer' => 3.20},
    {'Sum' => 16}
  ]
end
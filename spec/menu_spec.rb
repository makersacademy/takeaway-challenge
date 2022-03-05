require 'menu'

describe Menu do 
  let(:my_menu) { Menu.new } 

  let(:meal_1) do
    meal_1 = double("meal_1", name: 'beans', price: 3)
  end

  let(:meal_2) do
    meal_2 = double("meal_2", name: 'sausages', price: 5)
  end
  
  it 'initializes with an empty menu array' do
    expect(my_menu.menu).to eq []
  end

  describe '#add_meal' do
    it "adds a Meal instance to the menu" do
      my_menu.add_meal(meal_1)
      expect(my_menu.menu).to include(meal_1)
    end
  end

  describe "#see_menu" do
    it 'shows a list of dishes and prices of all meals' do
      my_menu.add_meal(meal_1)
      my_menu.add_meal(meal_2)
      expect { my_menu.see_menu }.to output("beans: 3\nsausages: 5\n").to_stdout
    end
  end
end
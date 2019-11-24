require 'my_order'

describe MyOrder do

  let(:dish_example_1) { {number: 1, dish: 'Chicken Biryani', price: 8.99} }

  describe '#show_order' do
    it "should print out my current order" do
      allow(subject).to receive(:my_order) { [dish_example_1] }
      expect(subject.show_order).to include { dish_example_1 }
    end
  end

  describe '#select_dish' do
    it "should select a dish from the menu and add it to my order" do
      subject.select_dish(3)
      expect(subject.my_order).to include {{number: 9, dish: 'Vegetable Dansak', price: 7.99}}
    end
  end
end

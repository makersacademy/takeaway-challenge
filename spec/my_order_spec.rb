require 'my_order'

describe MyOrder do

  describe '#show_order' do
    it "should print out my current order" do
      subject.select_dish(2)
      expect(subject.show_order).to include { {number: 2, dish: 'Vegetable Dansak', price: 7.99} }
    end
  end

  describe '#select_dish' do
    it "should select a dish from the menu and add it to my order" do
      subject.select_dish(3)
      expect(subject.my_order).to include { {number: 3, dish: 'Vegetable Dansak', price: 7.99} }
    end
  end

  describe '#print_total' do
    it "prints the total of the current order" do
      subject.select_dish(3)
      subject.select_dish(4)
      expect(subject.print_total).to eq 19.48
    end
  end


end

require 'interface'
describe Interface do
  let(:order) { double :order }
  describe '#show_dishes' do
    it 'shows you a list of available dishes' do
      expect { subject.show_dishes }.to output("1. Margherita pizza - £10\n2. Pepperoni pizza - £13\n3. Meat Feast pizza - £13\n4. Classic pizza - £13\n5. BBQ Chicken pizza - £13\n6. Chinese Chicken pizza - £10\n7. Spicy Chicken pizza - £15\n8. Tandoori Chicken pizza - £13\n9. Seafood pizza - £10\n10. Vegetarian pizza - £10\n").to_stdout
    end
  end

  describe '#selection_input' do
    it 'allows you to select item' do
      subject.stub(:gets).and_return('3', '4', '5', '6', 'q')
      expect(subject.selection_input).to eq(['3', '4', '5', '6'])
    end
  end

  describe '#generate_order' do
    it 'generates an order based on a passed array of user selections' do
      expect(subject.generate_order([1, 2])).to eq [["Margherita pizza", "10"], ["Pepperoni pizza", "13"]]
    end
  end

  describe '#order_add' do
    it 'can add to the current order' do
      subject.stub(:gets).and_return('5', 'q')
      allow(order).to receive_messages(:add => true)
      expect(subject.order_add(order)).to eq true
    end
  end
end

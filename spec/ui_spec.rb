require 'ui'

describe UI do

  subject(:ui) {UI.new(order)}
  let(:fake_menu) { double print: ["Salad: 20"] }
  # let(:order) { Order.new(fake_menu) }
  let(:order) { double(:order, menu: fake_menu, add: 'success', items: ['Salad'], total: 20) }

  describe '#print_options' do
    it "should print the options" do
      expect(subject.print_options).to eq (['1. Print menu', '2. Add items to basket', '3. See order',
      '4. Checkout', '5. Exit'])
    end
  end

  describe '#print_order' do
    it "should print the order" do
      expect(subject.print_order).to eq("Order subtotal: 20")
    end
  end

  describe '#process(1)' do
    it "should print the menu" do
      expect(subject.process('1')).to eq (["Salad: 20"])
    end
  end

  describe '#process(2)' do
    it "should print the order" do
      expect(subject.process('2')).to eq("Order subtotal: 20")
    end
  end

  describe '#process(3)' do
    it "should print the order" do
      expect(subject.process('3')).to eq("Order subtotal: 20")
    end
  end

  # describe '#interactive_menu' do
  #   it "should print the options" do
  #     expect(subject.process('3')).to eq("Order subtotal: 20")
  #   end
  # end


end

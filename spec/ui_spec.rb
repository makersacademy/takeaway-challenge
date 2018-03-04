require 'ui'

describe UI do

  subject(:ui) {UI.new(order)}
  let(:fake_menu) { double print: ["Salad: 20"] }
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
      expect(fake_menu).to receive(:print)

      subject.process("1")
    end
  end

  describe '#process(2)' do
    it "should print the order" do
      expect(subject).to receive(:print_order)
      expect(order).to receive(:add)

      subject.process('2')
    end
  end

  describe '#process(3)' do
    it "should print the order" do
      expect(subject).to receive(:print_order)

      subject.process('3')
    end
  end

  describe '#interactive_menu' do
    it "should call print options" do
      expect(subject).to receive(:print_options)

      allow(subject).to receive(:user_input).and_return("5")

      subject.interactive_menu
    end
  end


end

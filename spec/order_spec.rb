require 'order'

describe Order do

  # describe '#view_menu' do
  #   let(:menu) { double :menu }
  #   let(:menu_class) { double :menu_class, new: menu }
  #   subject { described_class.new(menu_class) }
  #
  #   it 'displays the menu' do
  #     expect(menu_class).to receive(:view_menu)
  #     subject.view_menu
  #   end
  # end

  describe '#add_dish' do
    let(:dish) {double :dish}
    let(:quantity) {double :quantity}

    it 'raises an error when adding a dish not available' do
      message = 'This dish is not available'
      expect{subject.add_dish(:dish, :quantity)}.to raise_error message
    end

    it 'adds a dish and ordered quantity to the basket' do
      subject.add_dish(:pancake, 2)
      expect(subject.basket).to include(:pancake => 2)
    end

    it 'modifies the quantity on the basket if more is added' do
      subject.add_dish(:pancake, 2)
      subject.add_dish(:pancake, 1)
      expect(subject.basket).to include(:pancake => 3)
    end

    it 'informs customer that item has been added to the basket' do
      expect do
        subject.add_dish(:pancake, 2)
      end.to output("You have added 2x pancake(s) to your basket.").to_stdout
    end
  end

  describe '#check_total' do
    it 'returns the total sum of order' do
      subject.add_dish(:pancake, 2)
      expect(subject.check_total).to eq 10
    end
  end

  describe '#confirm_order' do
    let(:messenger) { double :messenger }
    let(:messenger_class) { double :messenger_class, new: messenger }
    subject { described_class.new(messenger_class) }

    it 'raises an error when the customer calculation does not match the total' do
      message = 'Price error'
      expect{subject.compare_price(:customer_price)}.to raise_error message
    end

    it 'lets the Messenger send a message confirming the order' do
      expect(messenger_class).to receive(:confirm_order)
      subject.add_dish(:pancake, 2)
      subject.compare_price(10)
    end
  end
end

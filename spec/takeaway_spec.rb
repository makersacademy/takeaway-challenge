require 'takeaway'

describe Takeaway do

  subject {described_class.new}
  let(:menu){double :menu, new: dish, list: dish}
  let(:dish){double :dish}

  describe '.initialize' do
    it 'creates a new instance of the Menu class' do
      expect(Menu).to receive(:new)
      Takeaway.new
    end

    it 'creates a new instance of the Menu class' do
      expect(Basket).to receive(:new)
      Takeaway.new
    end
  end

  describe '.read_menu' do
    it 'should print out the list of dishes' do
      expect(STDOUT).to receive(:puts).with("10 Hot Wings: £4")
      expect(STDOUT).to receive(:puts).with("Fried Rice: £3")
      expect(STDOUT).to receive(:puts).with("Lemon Chicken: £5")
      expect(STDOUT).to receive(:puts).with("Chilli Beef: £6")
      subject.read_menu
    end
  end

  describe '.order' do
    it 'should fail if order is less than 1' do
      message = "Order value must be more than 0"
      expect{subject.order("Fried Rice", 0)}.to raise_error message
    end

    it 'should fail if dish is not on the menu' do
      message = "Carbonara is not on the menu. Sorry!"
      expect{subject.order("Carbonara", 1)}.to raise_error message
    end

    it 'prints a success message if added to basket' do
      message = "1 x Fried Rice added to your order!"
      expect(STDOUT).to receive(:puts).with(message)
      subject.order("Fried Rice", 1)
    end
  end

  describe '.check_order' do
    it 'prints out a list of dishes and prices' do
      subject.order("Fried Rice", 2)
      subject.order("Chilli Beef", 1)
      expect(STDOUT).to receive(:puts).with("Fried Rice x 2 : £6")
      expect(STDOUT).to receive(:puts).with("Chilli Beef x 1 : £6")
      expect(STDOUT).to receive(:puts).with("TOTAL : £12")
      subject.check_order
    end
  end

  describe '.checkout' do
    it 'should fail if payment is not equal to basket total' do
      subject.order("Fried Rice", 1)
      message = 'Please enter the correct total to checkout'
      expect{subject.checkout(5)}.to raise_error message
    end

    it 'should fail if the order is less than 1' do
      message = 'Please order before checking out..'
      expect{subject.checkout(0)}.to raise_error message
    end

    it 'should successfully checkout when total is correct' do
      subject.order("Fried Rice", 1)
      message = "Order complete. Confirmation on its way!"
      expect(STDOUT).to receive(:puts).with(message)
      subject.checkout(3)
    end
  end

end

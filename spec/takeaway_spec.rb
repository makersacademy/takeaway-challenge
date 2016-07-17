require 'takeaway'

describe Takeaway do

  subject {described_class.new}
  let(:menu){double :menu, new: dish, list: dish}
  let(:dish){double :dish}

  describe '.initialize' do
    it 'creates the takeaway with an empty basket' do
      expect(subject.basket).to eq({})
    end
  end

  describe '.menu' do
    it 'prints out the list of dishes' do
      takeaway = Takeaway.new(menu)
      expect(menu).to receive(:list)
      takeaway.read_menu
    end
  end

  describe '.order' do
    it 'adds the dish to the order' do
      subject.order("Fried Rice", 1)
      expect(subject.basket).to include "Fried Rice"
    end

    it 'should fail if order is less than 1' do
      message = "Order value must be more than 0"
      expect{subject.order("Fried Rice", 0)}.to raise_error message
    end

    it 'should fail if dish is not on the menu' do
      message = "Carbonara is not on the menu. Sorry!"
      expect{subject.order("Carbonara", 1)}.to raise_error message
    end

    it 'should update quantity if dish already ordered' do
      subject.order('Chilli Beef', 1)
      subject.order('Chilli Beef', 1)
      expect(subject.basket).to include "Chilli Beef"=>2
    end

    it 'prints a success message if added to basket' do
      expect(STDOUT).to receive(:puts).with("1 x Fried Rice added to your order!")
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

  describe '.total' do
    it 'calculates the correct total' do
      subject.order("Fried Rice", 2)
      subject.order("Chilli Beef", 1)
      expect(subject.total).to eq(12)
    end
  end

  describe '.checkout' do
    it 'should fail if the order is less than 1' do
      subject.order("Fried Rice", 1)
      message = 'Please enter the correct total to checkout'
      expect{subject.checkout(5)}.to raise_error message
    end
    it 'should successfully checkout when total is correct' do
      subject.order("Fried Rice", 1)
      expect(STDOUT).to receive(:puts).with("Your order has been received!")
      subject.checkout(3)
    end
  end

end

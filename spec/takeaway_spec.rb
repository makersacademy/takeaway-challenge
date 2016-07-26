require 'takeaway'

describe Takeaway do

  subject {described_class.new(Menu.new, confirmation)}
  let(:menu){double :menu, new: dish, list: dish}
  let(:dish){double :dish}
  let(:confirmation){double :confirmation}

  before do
    allow($stdout).to receive(:write)
    allow(confirmation).to receive(:send_sms)
  end

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
      expect(STDOUT).to receive(:puts).with("Pepperoni Passion Pizza: £6.75")
      expect(STDOUT).to receive(:puts).with("Mighty Meaty Pizza: £7.25")
      expect(STDOUT).to receive(:puts).with("Chips n' Cheese: £3.00")
      expect(STDOUT).to receive(:puts).with("10 Hot Wings: £4.00")
      expect(STDOUT).to receive(:puts).with("Deep-fried Mars bar: £2.50")
      subject.read_menu
    end
  end

  describe '.order' do
    it 'should fail if order is less than 1' do
      message = "Order value must be more than 0"
      expect{subject.order("Mighty Meaty Pizza", 0)}.to raise_error message
    end

    it 'should fail if dish is not on the menu' do
      message = "Not on the menu. Sorry!"
      expect{subject.order("Carbonara", 1)}.to raise_error message
    end

    it 'prints a success message if added to basket' do
      message = "1 x Mighty Meaty Pizza added to your order!"
      expect(STDOUT).to receive(:puts).with(message)
      subject.order("Mighty Meaty Pizza", 1)
    end
  end

  describe '.check_order' do
    it 'prints out a list of dishes and prices' do
      subject.order("Mighty Meaty Pizza", 1)
      subject.order("Chips n' Cheese", 1)
      expect(STDOUT).to receive(:puts).with("Mighty Meaty Pizza x 1 : £7.25")
      expect(STDOUT).to receive(:puts).with("Chips n' Cheese x 1 : £3.00")
      expect(STDOUT).to receive(:puts).with("TOTAL : £10.25")
      subject.check_order
    end
  end

  describe '.checkout' do
    it 'should fail if payment is not equal to basket total' do
      subject.order('Deep-fried Mars bar', 1)
      message = 'Please enter the correct payment total'
      expect{subject.checkout(1)}.to raise_error message
    end

    it 'should fail if the order is less than 1' do
      message = 'Please order before checking out..'
      expect{subject.checkout(0)}.to raise_error message
    end

    it 'should successfully checkout when total is correct' do
      subject.order("Mighty Meaty Pizza", 1)
      message = "Order complete. Confirmation on its way!"
      expect(STDOUT).to receive(:puts).with(message)
      subject.checkout(7.25)
    end

    it 'sends a payment confirmation text message' do
      t = Time.new + 3600
      delivery_time = t.strftime("%I:%M%p")
      subject.order("Mighty Meaty Pizza", 1)
      expect(confirmation).to receive(:send_sms)
      subject.checkout(7.25)
    end
  end

end

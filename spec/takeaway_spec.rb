require 'takeaway'
require 'dish'

describe Takeaway do
  let(:dish) { double :dish }
  let(:dish1) { double :dish, name: "Chicken Wings", price: 1.49 }
  let(:dish2) { double :dish, name: "2 piece box of Fried Chicken", price: 2.99 }
  let(:dish3) { double :dish, name: "Small Hamburger", price: 2.99 }
  subject { Takeaway.new([dish1, dish2, dish3]) }

  def two_chick_wings
    2.times do
      subject.order("chicken wings")
    end
  end

  before(:example) do
    subject.display_menu
  end

  describe '#display_menu' do
    it 'displays a menu of dishes and their prices' do
      expect(subject.menu).to include dish1, dish2, dish3
    end
  end

  describe '#order' do
    it 'records the customer order of multiple orders of one item' do
      two_chick_wings
      expect(subject.basket_subtotal[dish1]).to eq 2
    end
  end

  describe '#show_basket' do
    it 'displays a subtotal of each type of dish ordered' do
      two_chick_wings
      expect { subject.show_basket }.to \
      output("Your basket contains:\n2 x Chicken Wings = £2.98\n").to_stdout
    end
  end

  describe '#total' do
    it 'displays the total of the order' do
      two_chick_wings
      subject.order("small hamburger")
      expect { subject.total }.to output("Total: £5.97\n").to_stdout
    end
  end

  describe '#checkout' do
    it 'prints a message if an order exists but no phone number' do
      two_chick_wings
      expect { subject.checkout }.to output(/Thank you! Your order will be delivered before \d\d.\d\d\n/).to_stdout
    end
    it 'sends a text message if an order exists and given a phone number' do
      two_chick_wings
      expect (subject.checkout("07341928374")).to eq true
    end
  end
end

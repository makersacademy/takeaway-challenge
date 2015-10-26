require 'takeaway'

describe Takeaway do

  it 'show_menu should display all items and prices' do
    subject.add_dish('chilli', 2.99)
    subject.add_dish('lasagne', 4.5)
    expect(subject.show_menu).to eq "{\"chilli\"=>2.99, \"lasagne\"=>4.5}"
  end

  before(:each) do
    subject.add_dish('chilli', 2.99)
    subject.add_dish('lasagne', 4.5)
    subject.order('chilli', 3)
    subject.order('lasagne')
  end

  describe 'ordering' do

    it 'order should display confirmation message' do
      expect{ subject.order("chilli", 3) }.to output("3x chilli(s) added to your basket.\n").to_stdout
    end

    it 'order should add to basket' do
      expect(subject.basket).to include("chilli"=>3)
    end

    it 'should not be able to order item not on menu' do
      expect{ subject.order('pizza') }.to raise_error "Sorry, we don't have that!"
    end

    it 'should be able to add more of the same item to the order' do
      subject.order("chilli", 3)
      expect(subject.basket).to include("chilli"=>6)
    end

    it 'should display total amount for order' do
      expect(subject.total).to eq (2.99 * 3 + 4.5)
    end

    it 'checkout should confirm order' do
      expect{ subject.checkout(13.47) }.to output("Your order is on its way!\n").to_stdout
    end

    it 'checkout should raise error if amount not matching total' do
      expect{ subject.checkout(10) }.to raise_error "You need to pay exactly 13.47!"
    end

  end

end

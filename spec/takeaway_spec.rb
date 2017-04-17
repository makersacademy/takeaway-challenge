require 'takeaway'

describe Takeaway do

  let(:menu_klass) { double :menu_klass, new: menu }
  let(:menu) { double :menu, show: "{\"chilli\"=>2.99, \"pizza\"=>4.5}"}

  subject { described_class.new(menu_klass)}

  it 'menu should display complete menu' do
    expect(subject.menu).to eq menu.show
  end

  before(:each) do
    subject.order("chilli", 3)
    subject.order("pizza")
    allow(menu).to receive(:price).with('chilli').and_return 2.99
    allow(menu).to receive(:price).with('pizza').and_return 4.5
  end

  describe 'ordering' do

    it 'order should display confirmation message' do
      expect{ subject.order("chilli", 3) }.to output("3x chilli(s) added to your basket.\n").to_stdout
    end

    it 'order should add to basket' do
      expect(subject.basket).to include("chilli"=>3)
    end

    it 'should not be able to order item not on menu' do
      expect{ subject.order('lasagne') }.to raise_error "Sorry, we don't have that!"
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

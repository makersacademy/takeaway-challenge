require 'takeaway'

describe Takeaway do

  let(:basket_class) { double(:basket_class, new: basket) }
  let(:basket) { double(:basket) }

  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu) }

  subject(:takeaway) { described_class.new(basket_class, menu_class) }

  describe '#initialize' do
    before(:each) do
      takeaway
    end
    it '0.0 initilizes with a new instance of basket' do
      expect(basket_class).to have_received(:new)
    end
    it '0.1 initilizes with a new instance of menu' do
      expect(menu_class).to have_received(:new)
    end
  end

  describe '#add' do
    it 'accepts dish and default qty=1' do

    end
  end
end

require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, display: details}
  let(:details) { double :details }
  let(:order) { double :order }

  it 'should initialize with a menu' do
    expect(takeaway.menu).to eq menu
  end

  describe '#menu' do

    it 'should respond to the menu method' do
      expect(takeaway).to respond_to(:menu)
    end

    it 'should print the menu for the customer' do
      expect(takeaway.dishes).to eq menu.display
    end

  end

  # describe '#order' do
  #
  #   it 'should respond to the order method' do
  #     expect(takeaway.order).to respond_to(:order)
  #   end
  #
  # end

end

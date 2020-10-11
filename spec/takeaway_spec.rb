require 'takeaway'

describe Takeaway do 
  describe '#print_menu' do
    subject(:takeaway)  { described_class.new(menu) }
    let(:menu)          { double('menu', print: printed_menu) }
    let(:printed_menu)  { { "chicken_curry" => 2.50 } }

    it 'Produces a menu of available dishes on request' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end

  describe '#order' do
    subject(:takeaway)  { described_class.new(menu) }
    let(:menu)          { double('menu', available?: true) }
    

    it 'accepts dish and quantity arguments and adds to customers order' do
      takeaway.order("chicken_curry", 1)
      # before do
      # allow(menu).to receive(:available?).and_return(true)
      # end
      expect(takeaway.current_order).to eq ["chicken_curry"]

    end
  end

end

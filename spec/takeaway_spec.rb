require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to(respond_to(:print_menu)) }
  it { is_expected.to(respond_to(:order)) }

  describe '#print_menu' do
    it 'displays a list of menu items' do
      expect(takeaway.print_menu).to(be_a(Hash))
    end
  end

  describe '#place_order' do
    #it 'creates an order hash' do
    #  expect(takeaway.order()).to(be_a(Hash))
    #end
    it 'accepts a dish name and adds it to the order hash' do
      takeaway.place_order("Omlette")
      expect(takeaway.order).to(eq("Omlette"))
    end
  end

end

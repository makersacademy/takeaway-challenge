require 'takeaway'
require 'order'

describe Takeaway do
  let(:menu) {double :menu}
  subject(:takeaway) {described_class.new(menu)}
  let(:order) {double :order}
  let(:dish) {double :dish}

  describe '#view_menu' do
    it 'view_menu method returns list of dishes' do
      allow(menu).to receive(:print_menu).and_return(@dishes)
      expect(takeaway.view_menu).to eq menu.print_menu
    end
  end

  describe '#creating_an_order' do
    it 'order is nil until create_order is called' do
      expect(takeaway.order).to eq nil
    end

    it 'calling create_order method creates new instance of order' do
      expect(takeaway.create_order).to be_instance_of(Order)
    end
  end

end

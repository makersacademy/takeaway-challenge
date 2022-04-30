describe Takeaway do
  let(:menu) { instance_double('Menu') }
  subject(:takeaway) { Takeaway.new(menu)}

  describe '#display_menu' do
    it 'should instruct Menu to return available dishes' do
      expect(menu).to receive(:display_available_dishes)
      takeaway.display_menu
    end
  end

  describe '#add_to_order' do
    it 'should create a new order' do
      expect { takeaway.add_to_order }.to change(takeaway, :current_order).from(nil).to(be_an_instance_of Order)
    end
  end
end
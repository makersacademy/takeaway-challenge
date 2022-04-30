describe Takeaway do
  let(:menu) { instance_double('Menu', :display_available_dishes) }
  let(:order) { instance_double('Order', :add_to_basket) }
  subject(:takeaway) { Takeaway.new(menu, order)}

  describe '#display_menu' do
    it 'should instruct Menu to return available dishes' do
      expect(menu).to receive(:display_available_dishes)
      takeaway.display_menu
    end
  end

  describe '#add_to_order' do
    it 'should instruct Order to add dishes to basket' do
      expect(order).to receive(:add_to_basket)
      dishes = ['pizza', 'pasta']
      takeaway.add_to_order(dishes)
    end
  end
end

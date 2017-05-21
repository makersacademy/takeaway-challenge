
require 'order'

 describe Order do

   subject(:order) { described_class.new(:selected_dish) }

   it { is_expected.to respond_to :current_order }

   it 'shows customers current order' do
     expect(order.current_order).to eq [:selected_dish]
   end

 end

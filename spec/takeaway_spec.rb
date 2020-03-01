require 'takeaway'

describe Takeaway do
  
  subject(:takeaway) { described_class.new(order: order) }
  let(:order) { instance_double('Order', view_menu: printed_menu, view_order: view_order_list, total_price: 25) }
  let(:printed_menu) { { Chicken: 3.50 } }
  let(:view_order_list) { { 'Chicken Biryani': 5 } }  
  it 'view menu' do 
    expect(subject.view_menu).to eq(printed_menu) 
  end
  it 'view order' do
    expect(subject.view_order).to eq(view_order_list)  
  end
  it 'test total order value' do
    expect(subject.view_total).to eq("Total amount to be paid is € 25")
  end
end

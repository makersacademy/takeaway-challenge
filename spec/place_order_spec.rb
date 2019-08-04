require 'place_order'

describe PlaceOrder do
  let(:menu_double){double('menu_double', :menu =>{a: 10, b: 20, c: 30})}

  let(:order_inst){double('order_inst_double', :order_items => {a: 1, b: 2})}
  let(:order_class_double){double('order_class_double', :new => order_inst)}

  subject{ described_class.new(order_class=order_class_double, menu=menu_double) }

  before(:each) do
    subject.create_order({a:1, b:2})
  end

  describe '#total_price' do
    it 'return the total cost' do
      expect(subject.total_price).to eq(50)
    end
  end




end

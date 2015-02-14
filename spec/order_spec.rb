require 'order'

  describe Order do

    let(:menu) { double :menu }

    xit "should allow 1 order of beer to placed" do
      order = Order.new
      allow(menu).to receive(:menu_items).with(:ite).and_return(2.0)
      order.place_order(:Beer, 1, 2.0)
      expect(order.customer_order).to eq [[:Beer, 1, 2.0]]
    end

    it 'should calcualate the total order' do
      expect()
    end

  end
require 'order'

  describe Order do

    let(:order) { Order.new }
    let(:menu) { double :menu }

    it "should allow 1 order of beer to placed" do
      allow(menu).to receive(:menu_items).and_return( {Beer: 2.0} )
      order.place_order(:Beer, 1, menu)
      p order.customer_order
      expect(order.customer_order).to eq [[:Beer, 1, 2.0]]
    end

    it "should allow 2 items of more than 1 quantity to be ordered" do

    end


    it "should rasie an error if 0 quantity it ordered" do
      expect { order.place_order(:Beer, 0, menu) }.to raise_error(RuntimeError, "Cannot have 0 quantity")
    end

    it 'should calcualate the sub_total of an ordered item' do
      expect(order.sub_total(2, 3)).to eq 6.0
    end

  end
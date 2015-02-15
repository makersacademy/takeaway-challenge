require 'order'

  describe Order do

    let(:order) { Order.new }
    let(:menu) { double :menu }



    it "should allow 1 order of beer to placed" do
      place_order_helper(:Beer, 1, { Beer: 2.0 } )
      expect(order.customer_order).to eq({ Beer: [1, 2.0] })
    end

    it "should allow 2 items of more than 1 quantity to be ordered" do
      place_order_helper(:Beer, 3, { Beer: 2.0 } )
      place_order_helper(:"Chicken Nuggets", 3, { :"Chicken Nuggets" => 3.0} )
      expect(order.customer_order).to eq({ Beer: [3, 6.0], :"Chicken Nuggets" => [3, 9.0] })

    end

    it "should rasie an error if 0 quantity it ordered" do
      expect { order.place_order(:Beer, 0, menu) }.to raise_error(RuntimeError, "Cannot have 0 quantity")
    end

    it "should accumulate orders for the same item" do
      place_order_helper(:Beer, 2, { Beer: 2.0 } )
      place_order_helper(:Beer, 1, { Beer: 2.0 } )
      expect(order.customer_order).to eq({ Beer: [3, 6.0] })
    end


    it 'should calcualate the sub_total of an ordered item' do
      expect(order.sub_total(:Beer, 2, 3)).to eq [2, 6.0]
    end


    def place_order_helper(item , quantity, hash_return)
      allow(menu).to receive(:menu_items).and_return( hash_return)
      order.place_order(item, quantity, menu)
    end

  end
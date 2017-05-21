require 'order'

  describe Order do
      subject(:order) {described_class.new}
      let (:add_order) {double :add}

      it { is_expected.to respond_to(:add).with(1).argument }
      it "Add order to new array" do
        expect(order.add(add_order)).to eq nil
      end

  end

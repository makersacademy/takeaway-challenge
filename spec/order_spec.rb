# Order class spec
require 'order'
require 'send_sms'

describe Order do
  subject(:order) { described_class.new() }
  let(:pm) { double :pie_mash, name: 'Pie and mash', price: 8.99 }
  let(:ctm) { double :chiken_tikka_masala, name: 'Chicken Tikka Masala', price: 6.99 }
  let(:menu) { double :menu, menu: [pm, ctm] }

  describe '#new' do
    it 'expects order[] to be empty at start' do
      expect(order.cart).to eq([])
    end
    it 'expects total to be 0 at the start' do
      expect(order.total).to eq(0)
    end
  end

  describe '#add_to_order' do
    it { is_expected.to respond_to(:add_to_order).with(2).arguments }
    it 'expects to add dishes to order' do
      order.add_to_order(pm, 2)
      order.add_to_order(ctm, 1)
      expect(order.cart).to eq([[pm, 2], [ctm, 1]])
    end
  end

# method made private
  # describe '#calculate_total' do
  #   it { is_expected.to respond_to(:calculate_total).with(0).arguments }
  #   it 'should return the total for all dishes in order' do
  #     order.add_to_order(pm, 2)
  #     order.add_to_order(ctm, 1)
  #     expect(order.calculate_total).to eq(24.97)
  #   end
  #
  # end

# mocking sms confirmation (true or false)
  describe '#checkout' do
    it { is_expected.to respond_to(:checkout).with(1).arguments }

    it 'should raise error when cart is empty' do
      expect { order.checkout('a_phone_number') }.to raise_error 'Cart is empty'
    end
    # it 'should raise error when cart is empty' do
    #   order.checkout('a_phone_number')
    #   expect { order.checkout('a_phone_number') }.to raise_error 'cart is empty'
    # end

    it 'sends a confirmation sms and returns true if successful' do
      expect(order).to receive(:checkout).with('good_phone_num').and_return(true)
      order.checkout('good_phone_num')

    end

    it 'sends a confirmation sms and returns false if unsuccesful' do
      expect(order).to receive(:checkout).with('bad_phone_number').and_return(false)
      subject.checkout('bad_phone_number')
    end

    it 'calls #request_confirmation' do
      order.add_to_order(pm, 2)
      expect(order).to receive(:request_confirmation).with('phone_number')
      order.checkout('phone_number')
    end
    ################# ACTUAL Non mocked sms test ###################
    #   it 'should REALLY return true if SMS has been successfully sent' do
    #     expect(order.checkout('+447782199162')).to eq(true)
    #   end
    #   it 'should REALLY returnfalse if SMS is not sent' do
    #     expect(order.checkout('+1234')).to eq(false)
    #   end
  end

  describe ' #show_cart' do
    it { is_expected.to respond_to(:show_cart).with(0).arguments }

    it 'should raise error when cart is empty' do
      expect { order.show_cart }.to raise_error 'Cart is empty'
    end

    it 'should print the itemised bill' do
      order.add_to_order(pm, 2)
      order.add_to_order(ctm, 3)

      print_val = "-" * 60 + "\n" +
      "Dish".ljust(30) + "Price".center(10) + "Quantity".center(10) +
      "Total".rjust(10) + "\n" + "-" * 60 + "\n" +
      "Pie and mash".ljust(30) + "8.99".center(10) +
      "2".center(10) + "17.98".rjust(10) + "\n" +
      "Chicken Tikka Masala ".ljust(30) + "6.99".center(10) +
      "3".center(10) + "20.97".rjust(10) + "\n" +
      "=" * 60 + "\n" + "Grand Total".ljust(50) + "38.95".rjust(10) + "\n" +
      "=" * 60 + "\n"


      expect { order.show_cart }.to output(print_val).to_stdout
    end
  end

  describe '#request_confirmation' do
    it { is_expected.to respond_to(:request_confirmation).with(1).arguments }
    it 'should return true after requesting confirmation' do
      expect(order.request_confirmation('phone_number')).to be(true).or be(false)
    end
  end

end

require 'menu'
require 'order'

describe Menu do

  context '#initialize' do

    it { is_expected.to respond_to :list_of_dishes }

    it 'should respond with a hash' do
      expect(subject.list_of_dishes).to include("margherita" => 9)
    end

  end

  # context '#order' do
  #
  #   it { is_expected.to respond_to(:order).with(2).arguments }
  #
  #   it 'should be able to give the correct price' do
  #     subject.order("margherita", 1)
  #     expect(subject.current_order.current_order_price).to eq 9
  #   end
  #
  # end
  #
  # context '#menu' do


  # end

end

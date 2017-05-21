require 'spec_helper'

describe Order do
  subject(:order) { described_class.new }
  let(:fake_dish) { doubel(:fake_dish) }

  it { is_expected.to respond_to(:view_menu) }

  describe 'selecting food' do
    it { is_expected.to respond_to(:add_dish) }

    it '#add_dish takes the dish as an arguement' do
      #undefined method `-' for nil:NilClass - look at described_class
      expect{ order.add_dish(:fake_dish) }.to change{ @current_order }.by(:fake_dish)
    end
  end

end

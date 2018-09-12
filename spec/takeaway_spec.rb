require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:dish) { double(:menu) }
  let(:quantity) { double(:menu) }
  it { is_expected.to respond_to :show_menu }
  #it { is_expected.to respond_to :menu}
  describe 'initialize' do
    it 'intializes the menu' do
      expect(takeaway.customer_order).to eq([])
    end
  end

  describe 'show_menu' do
    it 'shows the dishes with prices' do
      expect(takeaway.show_menu).to eq(takeaway.menu)
    end
  end

  describe 'select_dishes' do
    it 'allows customers to select one of the available dishes' do
    takeaway.show_menu
    expect(takeaway.select_dishes).to eq(takeaway.ordered_dishes)
    # expect(takeaway.ordered_dishes).not_include(takeaway.menu[:dish])
    # .to raise_err
    # if cust_order.not_include(takeaway.menu[:dish])
    end
  end

  # # describe 'order' do
  # #   it 'lets the customer select some number of several available dishes' do
  #     takeaway.show_menu
  #     takeaway.order(cust_order)
  #     expect { takeaway.order(cust_order)}.to raise_error
  #     if cust_order.not_include(takeaway.menu[:dish])
  #   end
  # end
end

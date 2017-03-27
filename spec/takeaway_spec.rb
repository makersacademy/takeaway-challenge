require 'takeaway'
require 'stringio'

describe TakeAway do
  before do
    $stdin = StringIO.new("n\n")
  end

  subject(:takeaway) {described_class.new}
  let(:some_food) {double :title}
  let(:menu_list) {double :menu_list}
  let(:example_food) {double ({:title => 'ROCK', :type => :main, :food => :fish, :price => 5.6})}
  let(:menu) {double :menu, :print_menu => menu_list, :get_title => some_food, :get_price => 1}
  let(:order) {double :order, :cancel_order => nil, :basket => [], :return_foods =>  example_food[:title]}



  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:order) }

  describe '#print_menu' do
    it 'prints menu' do
      expect(menu.print_menu).to eq menu_list
    end
  end

  describe '#request_order' do
    xit 'checks orders are bring added to the basket' do
      STDIN.stub(:gets) {2}
      takeaway.request_order
      expect(order.basket).to include ({title: some_food, price: 1})
    end
  end

  describe '#check_order' do
    xit '' do

    end
  end

  describe '#confirm_order' do
    xit 'checks n response' do
      allow(takeaway.order).to receive(:cancel_order) {}
      expect(takeaway.confirm_order).to eq 'Order canceled'
    end
  end
end

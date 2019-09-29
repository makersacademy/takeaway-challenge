require 'order'

describe Order do

    it 'can select a number of dishes' do
      subject.place("Chicken", 2)
      subject.place("Fish", 3)
      expect(subject.order_list).to eq [{dish_selection: "Chicken", quantity: 2}, {dish_selection: "Fish", quantity: 3}]
    end
end
  # subject(:order) { described_class.new }
  # let(:menu) { double :menu }

  # describe '#place' do
  #
  #   it 'displays list of dishes and their quantities' do
  #     # allow(:menu).to receive(:choose) { "Chicken" }
  #     menu.choose("Chicken", 2)
  #     expect(order.place).to eq :order
  #   end

    # it 'places a successful order' do
    #   expect(order.status).to eq true
    # end

    # it 'raises an error if total does not match sum' do
    #
    # end

    # describe '#check_total' do
    #   it 'compares the total given to the sum of the items' do
    #     expect(order.check_total).to eq true
    #   end
    # end
    #
    #

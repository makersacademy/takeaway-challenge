require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  subject(:takeaway) { described_class.new(menu) }
  
  it 'shows the list of dishes and prices' do 
    allow(menu).to receive(:display).and_return ("Garlic bread: £1.99")
    expect(takeaway.show_menu).to eq("Garlic bread: £1.99")
  end

  context '#select_dish' do
    let(:another_dish) { double :dish, pizza: 8.50 }

    it { is_expected.to respond_to(:select_dish).with(1).argument }

    # it 'raises an error if the selected dish is not in the menu' do

    #   expect { takeaway.select_dish(another_dish)}.to raise_error('The dish is not in the menu')
    # end
  end 
end
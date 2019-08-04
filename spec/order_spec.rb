require 'order'
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
# context 'select items' do

describe Order do
  context 'place order method is functional' do
  let(:order){ described_class.new({ 'A' => 1550, "B" => 1050 })}
  it 'takes method place order' do
    expect(order).to respond_to(:placeorder)
    end
  end


  context 'view_menu accepts array as argument' do
    let(:order){ described_class.new({ "A" => 1050 , "B" => 1130})}
    it 'iterates through an array to show menu' do
      # expect(order.view_menu).to eq("A:15.50/nB:10.50")
      STDOUT.should_receive(:puts).with('A:10.50')
      STDOUT.should_receive(:puts).with('B:11.30')
      order.view_menu
    end
  end



end


#  allow(takeout).to receieve(:order).and_return

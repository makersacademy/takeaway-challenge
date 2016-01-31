require 'order'

describe Order do
  let(:messager){double(:messager, send_sms: true)}
  let(:messager_klass){double(:messager_klass, :new => messager)}
  let(:menu_item){double(:menu_item, name: 'chicken satay', :price => 4.50)}
  subject(:order){described_class.new(messager_klass)}

  describe '#initialize' do

    it 'instantiates a new messager' do
      expect(order.messager_klass).to eq(messager)
    end

  end

 describe '#add_item' do

   it 'adds an item and quantity to the order history' do
     order.add_item(menu_item, 1)
     expect(order.history).to include(menu_item => 1)
   end

   it 'returns a string confirming the item added and the quantity' do
     expect{order.add_item(menu_item, 1)}.to output("1 #{menu_item.name} added to your order").to_stdout
   end

 end


 describe '#confirm_order' do

   it 'raises an error if the total given does not match the correct total' do
     order.add_item(menu_item, 1)
     expect{order.confirm_order(5)}.to raise_error("Total given does not match calculated total")
   end

   it 'calls send_order on messager' do
     order.add_item(menu_item, 1)
     expect(messager).to receive(:send_sms).with("Thank you! Your order was placed and will be delivered before #{(Time.now+3600).strftime('%H:%M')}")
     order.confirm_order(4.50)
   end

 end


end

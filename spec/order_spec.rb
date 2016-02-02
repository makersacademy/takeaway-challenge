require 'order'

describe Order do
  let(:small_order){1}
  let(:large_order){5}
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
     order.add_item(menu_item, small_order)
     expect(order.history).to include(menu_item => small_order)
   end

   it 'returns a string confirming the item added and the quantity' do
     expect(order.add_item(menu_item, small_order)).to eq("#{small_order} #{menu_item.name}, added to your order")
   end

 end

 describe '#show_order' do
   let(:menu_item_two){double(:menu_item, name: 'prawn summer rolls', :price => 5.60)}

   it 'returns the items ordered and the current total' do
     order.add_item(menu_item, small_order)
     expect(order.show_order).to eq("1 #{menu_item.name}, total #{menu_item.price * small_order}")
   end

   it 'returns the items ordered and the current total with multiple different items' do
     order.add_item(menu_item, small_order)
     order.add_item(menu_item_two, small_order)
     expect(order.show_order).to eq("#{small_order} #{menu_item.name}, #{small_order} #{menu_item_two.name}, total #{menu_item.price + menu_item_two.price}")
   end

 end


 describe '#confirm_order' do

   it 'raises an error if the total given does not match the correct total' do
     order.add_item(menu_item, small_order)
     expect{order.confirm_order(5)}.to raise_error("Total given does not match calculated total")
   end

   it 'calls send_order on messager' do
     order.add_item(menu_item, small_order)
     expect(messager).to receive(:send_sms).with("Thank you! Your order was placed and will be delivered before #{(Time.now+3600).strftime('%H:%M')}")
     order.confirm_order(menu_item.price * small_order)
   end

 end


end

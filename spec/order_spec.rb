require 'order'

describe Order do

let(:menu) {double (:menu) }

 describe '#menu' do
   it {is_expected.to respond_to :menu }

   it 'should print menu list' do
     allow(subject).to receive(:menu).and_return(menu)
     expect(subject.menu).to eq(menu)
   end
 end

 describe '#buy_item' do
   it { is_expected.to respond_to(:buy_item).with(2).arguments }
     it 'is expected to change basket after buy_item' do
       expect{ subject.buy_item("coffe", 4) }.to change{ subject.basket.length }.by 4
     end
     it 'is expected to change order_price after buy_item' do
       expect{ subject.buy_item("coffe", 2) }.to change{ subject.order_price.length }.by 2
     end
 end


end

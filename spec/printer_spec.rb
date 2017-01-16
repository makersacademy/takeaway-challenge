describe 'Printer' do
  let(:takeaway) {double :takeaway}

  describe '#show_price' do
    it 'should show a total price for the order' do
       allow(takeaway).to receive(:show_price)
       allow(takeaway).to receive(:order_meal)
       allow(takeaway).to receive(:total_price).and_return(10)
       takeaway.order_meal("Burger",2)
       takeaway.show_price
       expect(takeaway.total_price).to eq 10
    end
  end

   describe '#show_order_list' do
     it 'should print an itemised order list' do
       allow(takeaway).to receive(:show_price)
       allow(takeaway).to receive(:order_meal)
       allow(takeaway).to receive(:show_order_list).and_return("Total: 10")
       takeaway.order_meal("Burger",2)
       takeaway.show_price
       expect(takeaway.show_order_list).to eq "Total: 10"
     end
  end
end

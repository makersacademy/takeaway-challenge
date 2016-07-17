require 'takeaway'

describe Takeaway do
  let(:order){double :order}
  let(:menu){double :menu, :display => "#{:food} £#{:price}",
                           :dish_list => {"pizza"=>3.00}}
  let(:message){double :message}
  let(:takeaway){described_class.new(menu)}

  context '#menu' do
    it 'displays the menu' do
      expect(takeaway.display_menu).to eq "#{:food} £#{:price}"
    end
  end

  context '#order' do
    it 'raises an error when dish not on menu' do
      expect{takeaway.order("rubbish")}.to raise_error 'No such dish on menu'
    end
  end

  context '#basket summary' do
    it 'shows dishes in basket' do
      takeaway.order("pizza")
      expect(takeaway.basket_summary).to eq "pizza"=>1

    end
    it 'returns basket empty if empty' do
      expect(takeaway.basket_summary).to eq "Basket empty"
    end
  end
  context '#complete order' do
    it 'raises error if no orders added' do
      expect{takeaway.confirm_order}.to raise_error 'No orders have been added'
    end
  end

end

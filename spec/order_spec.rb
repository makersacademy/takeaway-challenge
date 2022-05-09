require 'order'
require 'takeaway'

describe Order do
  # context "add" do
  #   it 'adds menu item to order total' do
  #     expect(subject.current_order).to eq([{"Hoisin Duck"=>10}])
  #   end
  # end

  context "receipt" do
    it 'calculates the receipt for a given order' do
      expect(subject.receipt).to eq(10)
    end
  end
end
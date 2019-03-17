require 'order'

describe Order do
  let(:menu) { { "Chicken Curry": 1 } }
  it "#should have ability to add dishes to the order" do
    expect do 
      (subject.add("Chicken Curry", 2))
    end.to change { subject.the_order.count }.by(2)
  end

  
end

  
#   describe '#place order' do
#     it "Takes an argment and adds customers desired dish to order" do
#       japanese = Menu.new
#       expect(subject.add_to_order(3)).to eq [@items[3]]
#     end
#   end
# end

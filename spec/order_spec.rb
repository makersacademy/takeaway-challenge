require 'order'

describe Order do
  let(:penne) {Dish.new("Penne con la sabbia", 3)}

  it "should store the item in the order class" do

    allow(subject.add(penne)).to receive(:gets).and_return(1)
    expect(subject.order).to include({dish: "Penne con la sabbia", price: 3, quantity:1})
  end

end

require 'order'

describe Order do


 it "can add one dishes to the order" do
  subject.add("Water", 1)
  expect(subject.show_order).to eq([{"item"=>"Water", "price"=>3, "quantity"=>1}])

  end

  it "can add several dishes to the order" do
    subject.add("Water", 1)
    subject.add("Tea", 2)
    expect(subject.show_order).to eq([{"item"=>"Water", "price"=>3, "quantity"=>1},
       {"item"=>"Tea", "price"=>4, "quantity"=>2}])
  end


  it "can place the order by giving the list of dishes, their quantities and a number" do
    subject.add("Water", 1)
    subject.add("Tea", 2)
    expect(subject.place_order).to eq 1

  end


end

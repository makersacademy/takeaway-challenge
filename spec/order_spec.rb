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

  describe "#place_order" do
    #NEED TO ADD TOTAL

    it "can place the order by giving the list of dishes, their quantities and total cost" do
      subject.add("Water", 1)
      subject.add("Tea", 2)
      expect(subject.place_order).to eq "Here is your order [{\"item\"=>\"Water\", \"price\"=>3, \"quantity\"=>1}, {\"item\"=>\"Tea\", \"price\"=>4, \"quantity\"=>2}], the total is 11"

     end

  # it "can add up the total of the order" do
  #   subject.add("Water", 1)
  #   subject.add("Tea", 2)
  #   expect(subject.total).to eq 11

    end
  end
# end

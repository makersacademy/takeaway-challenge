require 'takeaway'

describe Takeaway do
  it "checks for existance of Takeaway class" do
  expect(subject).to be_instance_of(Takeaway)
  end
  it "creates the menu" do
    expect(subject.c_menu).not_to eq nil
  end
  it "calls the menu" do
    subject.c_menu
    expect(subject.l_menu).not_to eq nil
  end
  it "Dish selection" do
    subject.c_menu
    subject.l_menu
    item = "rice"
    subject.add_to_basket(item)
    expect(subject.basket_contents).to eq([{"item"=>"rice", "price"=>1.2, "qty"=>1, "sub total"=>1.2}])
  end
  it "check basket contents" do
    subject.c_menu
    subject.l_menu
    item = "rice"
    subject.add_to_basket(item)
    item = "rice"
    subject.add_to_basket(item)
    item = "chicken curry"
    subject.add_to_basket(item)
    item = "chicken curry"
    subject.add_to_basket(item)
    expect(subject.basket_contents).to eq([{"item"=>"rice", "price"=>1.2, "qty"=>2, "sub total"=>2.4}, {"item"=>"chicken curry", "price"=>4.1, "qty"=>2, "sub total"=>8.2}])
  end
end

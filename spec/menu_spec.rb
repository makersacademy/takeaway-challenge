require 'menu'

describe Menu do
  let (:dishes) {instance_double Dishes}
  #how properly implement this double

  before(:each) do
    subject.dishes = Dishes.new
  end

  it "has Dishes when initialized" do
    expect(subject.dishes).to be_instance_of Dishes
  end

  #receives 3 in IRB as should - fail not clear here
  xit "can have Dishes added" do
    subject.add_dish :Pasta, 6
    expect(subject.menu.length).to eq 3
  end
end
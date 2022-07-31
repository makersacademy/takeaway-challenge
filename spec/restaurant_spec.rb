require 'restaurant'
require 'menu'

describe Restaurant do 

  let(:dish) {"burger"}

  it {is_expected.to respond_to(:list_of_dishes)}
  it {is_expected.to respond_to(:check_total)}
  it {is_expected.to respond_to(:select_dish).with(1).argument}


  it "shows dishes" do 
    expect(subject.read_menu).to eq subject.list_of_dishes
  end 

  describe "#select_dishes" do 
    it "should select dishes" do 
    subject.select_dish(dish)
    expect(subject.order).to include(dish)
    end 
  end 

  it "should check total" do 
    subject.select_dish(dish)
    subject.select_dish(dish)
    expect(subject.check_total).to eq 20 
  end

  it "should be the correct price" do 
    subject.select_dish(dish)
    expect(subject).to be_finalised(10)
  end

  describe "#confirmation" do 
  it "should send confirmation text with price" do
  subject.select_dish(dish)
  subject.complete_order
  expect(subject.complete_order).to eq("Thank you for your order, your total is £10")
  end
  end
end
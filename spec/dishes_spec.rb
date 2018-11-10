require 'dishes'

describe Dishes do

  it "views a list of dishes with prices to allow an order ot be made" do
    expect(subject).to respond_to(:list).with(1).argument
  end
end

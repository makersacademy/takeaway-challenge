require './lib/menuhash'

describe Foodbuddy do

  #double allow to receive return from hash

  it "stores dishes with their prices in a hash" do
    expect(subject.list.fetch("1.Greek-style roast fish")).to eq(4.59.round(2))
  end

 context "dish changes"
  before(:each) do
    subject.add_dish("6.Turbo Tagliatelle", 5.59)
    end

    it "adds a dish and price to the hash" do
    expect{subject.add_dish("7.Pumping pumpkin pie", 5.59)}.to change{subject.list}
    end

    it "removes a dish and price to the hash" do
      expect{subject.remove_dish("6.Turbo Tagliatelle")}.to change{subject.list}
    end
end

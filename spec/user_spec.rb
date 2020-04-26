require './lib/user'
require "./lib/menu"
require "./lib/order"

describe User do
  let(:menu) { Menu.new }
  let(:unicorn) { Order.new }

  describe "#Call menu items" do 
    it "Returns the full menu" do
      expect(subject.request_full_menu(menu)).to eq(menu.full_menu)
    end
  end

  describe "#new_order" do 
    it "Returns a new Order class to instance varible" do
      subject.new_order(unicorn)
      expect(subject.order).to eq(unicorn)
    end 
  end 
end 
#require './lib/customer.rb'

#describe Customer do

#let(:takeaway) {double :takeaway}
#let(:takeaway) {class_double "takeaway", :new => :takeaway, :view_all_dishes => @dishes}
#subject(:customer) {described_class.new(takeaway)}

#  @dishes = {"Chicken Adobo" => 4.50,
#  "Pancit Bihon" => 4.50,
#  "Pancit Canton" => 4.50,
#  "Sizziling Pork Sisig" => 5.00,
#  "Pork Sinigang" => 5.00,
#  "Sizziling Beef Sisig" => 4.50,
#  "Stir Fried Vegetables" => 3.50,
#  "Rice and Lechon" => 5.50
#  }

#  context "Viewing dishes" do
#    it "should return a hash for the available dishes" do
#      #allow(takeaway).to receive(:view_all_dishes) {@dishes}
#      expect(customer.view_takeaway_dishes).to be_a(Hash)
#    end
#
#    it "should list out available dishes to order" do
#      expect(customer.view_takeaway_dishes).to eq @dishes
#    end
#  end

#  context "Selecting dishes" do
#    it "should be able to select a dish and a quantity" do
#      expect(customer).to respond_to(:select).with(2).arguments
#    end

#    it "should add selected dish and quantity to takeaway's selected dishes list" do
#      allow(takeaway).to receive(:selected_dishes) {["Chicken Adobo", 2]}
#      expect(customer.select("Chicken Adobo", 2)).to
#  end

#  context "Checking order" do
#    it "should have a way of checking order" do
#      expect(customer.check_order).to be_a(Array)
#    end
#  end

#end

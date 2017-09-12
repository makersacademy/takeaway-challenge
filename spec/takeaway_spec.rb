class Takeaway

  attr_reader :order, :a

  def initialize
    @order = []
  end

  def list_dishes
    @a = [{"Rob's Pasta" => 1},
     {"Rob's Piazza" => 3}]
    @a
  end

  def store_dishes(name, quantity)
    @order << {name => quantity}
  end

end


  RSpec.describe Takeaway do
    subject(:takeaway) { described_class.new }

    describe "#list_dishes" do
      it "lists dishes with prices" do
        # takeaway = Takeaway.new
        expect(takeaway.list_dishes).to eq (takeaway.a) # use the attr_reader to access the instance variable
      end
    end

    describe "#store_dishes" do
      it "stores a list of dishes in an array" do
        # takeaway = Takeaway.new
        takeaway.store_dishes("Rob's Pasta", 4)
        expect(takeaway.order).to include({"Rob's Pasta" => 4})
      end
    end



  end

require 'dish'

describe Dish do
  subject(:dish) { described_class.new(name, price)}
  let(:name) { "Testing Name" }
  let(:price) { (rand(100..1000)/10.0) }
  
  describe "#name" do
    it 'returns name' do
      expect(dish.name).to be(name)
    end
  end
  
  describe "#price" do
    it 'returns price' do
      expect(dish.price).to be(price)
    end
  end

  describe "#to_s" do
    it "is a string" do
      expect(dish.to_s).to be_a(String)
    end
    context "contains the following" do
      it "the dish name" do
        expect(dish.to_s).to include(name)
      end
      it "the dish price" do
        expect(dish.to_s).to include(price.to_s)
      end
    end
  end

  describe "#subtotal_line" do
    test_var = rand(5..10)
    it "is a string" do
      expect(dish.subtotal_line).to be_a(String)
    end
    context "contains the following:" do
      it "the dish name" do
        expect(dish.subtotal_line(test_var)).to include(name)
      end
      it "the quantity passed" do
        expect(dish.subtotal_line(test_var)).to include(test_var.to_s)
      end
      it "the subtotal_line amount" do
        expect(dish.subtotal_line(test_var)).to include((test_var*price).to_s)
      end
    end
  end

  describe "#subtotal" do
    test_var = rand(5..10)
    it "returns a subtotal" do
      expect(dish.subtotal(test_var)).to be(dish.price*test_var)
    end
  end
end

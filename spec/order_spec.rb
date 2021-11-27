require 'order'

describe Order do
  it { should be_an_instance_of Order }
  it { should have_attributes(:menu => [], :basket => [])}
  
  let (:order) { described_class.new } 

  before do
    @chicken, @fish, @veggies, @rice, @pie = Dish.new('chicken', 5), Dish.new('fish', 7.5), Dish.new('veggies', 4), Dish.new('rice', 3), Dish.new('pie', 3.5)
    order.menu.push(@chicken, @fish, @veggies, @rice, @pie)
  end

  describe "#add_item" do

    it "allows user to select a dish" do
      expect(order).to respond_to(:add_item).with(1).argument
    end

    it "adds selected dishes to basket" do
      order.add_item('chicken')
      expect(order.basket.last).to eq @chicken
    end

    it "the same dish is not added to basket more than once" do
      2.times { order.add_item('chicken') } 
      expect(order.basket.count(@chicken)).to eq 1
    end

    it "increases the quantity attribute of dish each time it is added" do
      expect{ 3.times { order.add_item('chicken') } }.to change { @chicken.qty }.from(0).to(3)
    end

    it "raises an error if user tries to add a dish not on the menu" do
      expect{ order.add_item('lamb') }.to raise_error "Cannot add lamb. Item not on menu!"
    end

  end

  describe "#remove_item" do

    it "allows user to remove a dish" do
      expect(order).to respond_to(:remove_item).with(1).argument
    end

    it "removes the dish from basket" do
      order.add_item('chicken')
      expect{ order.remove_item('chicken') }.to change{ order.basket.include?(@chicken) }.from(true).to(false)
    end

    it "does not remove the dish from basket if its qty is more than 1" do
      3.times { order.add_item('chicken') } 
      expect{ 2.times { order.remove_item('chicken') } }.not_to change{ order.basket.count(@chicken) }.from(1)
    end

    it "decreases the qty of dish each time it is removed" do
      5.times { order.add_item('chicken') }
      order.remove_item('chicken')
      order.remove_item('chicken')
      expect { 2.times { order.remove_item('chicken') } }.to change { @chicken.qty }.from(3).to(1)
    end

    it "raises an error if user tries to remove a dish not in basket" do
      expect { order.remove_item('chicken') }.to raise_error "Cannot remove chicken. Item not in basket!"
    end

  end

  describe "#get_summary" do

    it "prints an order summary to stdout" do
      3.times { order.add_item('chicken') }
      order.remove_item('chicken')
      3.times { order.add_item('veggies') }
      order.add_item('pie')
      order.add_item('fish')
      order.remove_item('fish')
      2.times { order.add_item('rice') }
      expect{order.get_summary}.to output{"
        Your order so far: 
        -------------------
        chicken(2): £10
        veggies(3): £12
        pie(1): £3.5
        rice(2): £6
        -------------------
        subtotal: £31.5
        -------------------"}.to_stdout
    end
    
  end
  
end
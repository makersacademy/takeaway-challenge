require 'menu'

describe Menu do

  context "is able to respond to" do
    it "#display_menu" do
      expect(subject).to respond_to(:display_menu)
    end
    it "#select_dish" do
      expect(subject).to respond_to(:select_dish).with(1).argument
    end
    it "#order_meal" do
      expect(subject).to respond_to(:order_meal)
    end
  end

  context "#display_menu" do
    it "returns @menu" do
      menu = subject.menu
      expect(subject.display_menu).to eq menu
    end
  end

  context "#select_dish" do
    it "should start with an empty meal array" do
      expect(subject.meal).to be_empty
    end

    let(:dish_no)    { double :dish_no }
    let(:dish_name)  { double :dish_name }
    let(:dish_price) { double :dish_price}
    let(:dish_info)  { { dish_no: dish_no, dish_name: dish_name, dish_price: dish_price} }
    let(:meal)       { [dish_info, dish_info, dish_info] }

    it "should display dish and price when user selects_dish" do
      expect(subject.select_dish(dish_no)).to eq dish_info
    end

    it "should add selected dish to meal" do
      expect{ subject.select_dish(dish_no) }.to change{ meal.length }.by(1)
    end

    it "should create an array of meal numbers" do
      subject.select_dish(dish_no)
      subject.select_dish(dish_no)
      subject.select_dish(dish_no)
      expect(subject.meal).to eq meal
    end
  end

  context "#order_meal" do
     #it "returns"
  end
end

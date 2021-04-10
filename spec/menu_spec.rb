require 'menu'

describe Menu do
  let(:dish_double_1) { double(:dish, :name => "pizza", :price => 4) }
  let(:dish_double_2) { double(:dish, :name => "fries", :price => 2) }

  let(:subject) { described_class.new(dish_double_1, dish_double_2)}

  it 'can store dishes' do
    expect(subject.dishes).to include(dish_double_1, dish_double_2)
  end

  context '#show' do
    it 'can has can respond_to show' do
      expect(subject).to respond_to(:show)
    end

    it 'displays dishes correctly' do
      expect {subject.show}.to output(/pizza/).to_stdout
      expect {subject.show}.to output(/fries/).to_stdout
    end
  end

  context "#pick_dish" do
    it 'can return item if it is on the menu' do
      expect(subject.pick_dish("pizza")).to eq( [dish_double_1] )
    end

    it 'can return an error if dish is not on menu' do
      expect { subject.pick_dish("piano") }.to raise_error "they don't serve this"
    end
  end
end
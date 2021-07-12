require 'menu'

describe Menu do
  describe '#show' do
    let(:dish) { double :dish, name: 'name', price: 0 }
    let(:dish_class) { double :dish_class, new: dish }
    subject { described_class.new(dish_class: dish_class) }

    it { is_expected.to respond_to(:show) }

    it "should return the list of dishes with prices" do
      expect { subject.show }.to output.to_stdout
    end
  end
end

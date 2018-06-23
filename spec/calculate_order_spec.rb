require 'calculate_order'
require 'order'

describe CalculateOrder do

  describe "#calculate" do

    it 'should calculate the order total' do
      subject.calculate([{ :name => "sushi festival", :price => 3 }, { :name => "sushi festival", :price => 3 }])
      expect(subject.order_total.to_i).to eq 6
    end
  end

end

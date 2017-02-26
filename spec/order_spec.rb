require 'order'

describe Order do

      it "should calculate the total amount" do
        expect(subject.calculate_total).to eq subject.total
      end

end

require 'app'

describe App do

  describe '.order' do
    context 'initializes with new order' do
      specify {
        expect(subject.order).not_to be(nil)
      }
    end

    context 'with type of Order' do
      specify {
        expect(subject.order).to be_a(Order)
      }
    end
  end
end

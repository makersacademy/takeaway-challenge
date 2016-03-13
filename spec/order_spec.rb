require 'order'

describe Order do

  it{is_expected.to respond_to (:now)}

  describe '#initialize' do
    it 'initializes with an empty current order array' do
      expect(subject.current_order).to be_empty
    end
  end

  describe '#now' do

    before do
      def get_action; "pasta" end
    end


    it 'asks the user what they want to order' do
      subject.now
      expect(subject.current_order).not_to be_empty
    end
  end

end

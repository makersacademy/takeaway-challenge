require 'list'

describe List do

  # it 'contains dishes' do
  #   expect(subject).to contain_exactly(@dishes)
  # end

  describe '#see_list' do

    it { is_expected.to respond_to(:see_list) }

  #   it 'prints list of dishes and their prices' do
  #   end
  end

  describe '#select_dish' do

    it 'selects dish from list' do
      expect(subject).to respond_to(:select_dish).with(1).argument
    end

  #  it 'stores selected dishes in an order'
  end

end

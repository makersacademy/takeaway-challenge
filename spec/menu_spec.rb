require 'menu'

describe Menu do

  context 'new menu contains empty list' do

    it 'menu has empty list(array)' do
      expect(subject.list).to eq []
    end
  end
end

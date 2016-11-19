require 'menu'

describe TakeawayMenu do

  subject(:menu) { described_class.new}

    it { is_expected.to respond_to(:menu)}

  describe '#menu' do
    it 'should be a hash' do
      expect(subject.menu).not_to be nil
    end
    # it 'should test that has food' do
    #   expect(subject.menu).to include (:dish)
    # end
    #
    # it 'should test that has price' do
    #   expect(subject.menu).to include {:price}
    # end
  end

  # describe '#selection' do
  #   it 'can select 2 equal dishes' do
  #     subject.menu[:dish]
  #     expect()
  #   end
  # end
end

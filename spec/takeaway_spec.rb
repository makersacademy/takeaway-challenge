require 'takeaway'

describe Takeaway do
  let(:subject) { described_class.new }
  let(:restaurant) { double(:restaurant) }
  let(:checkout) { double(:checkout) }

  before do
    allow($stdout).to receive(:write)
    subject.instance_variable_set('@restaurant', restaurant)
    subject.instance_variable_set('@checkout', checkout)
  end

  describe '#order' do
    it 'tell restaurant to make a new order' do
      expect(restaurant).to receieve(:new_order)
      subject.order
    end
  end
end

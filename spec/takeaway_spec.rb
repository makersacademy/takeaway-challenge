require 'takeaway'

describe TakeAway do
  let(:menu) {(double :menu, dishes: { "jamón ibérico": 14.99, "croquetas bacalao": 7.99 })}
  let(:courier) {double :courier}
  subject(:takeaway) { described_class.new(:menu, :messager) }

  context 'on initializing' do
    it 'takes a menu object' do
      expect(takeaway).to respond_to(:menu)
    end

    it 'takes a messager object' do
      expect(takeaway).to respond_to(:courier)
    end
  end

  # context 'takes orders' do
  #   it 'orden contains jamón ibérico when ordered' do
  #     takeaway.order("jamón ibérico")
  #     expect()
  #   end
  # end

end
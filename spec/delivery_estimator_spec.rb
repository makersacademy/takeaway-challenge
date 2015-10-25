require 'delivery_estimator'

describe DeliveryEstimator do
  let(:now) {Time.new(2015, 10, 25, 0, 0, 0, "+00:00") }
  subject(:delivery_estimator) {described_class.new}

  context 'Estimate time of delivery' do
    it {is_expected.to respond_to(:eta)}

    it 'Returns a time an hour into the future' do
      allow(Time).to receive(:now).and_return now
      expect(delivery_estimator.eta).to eq (now + 60 * 60)
    end
  end
end

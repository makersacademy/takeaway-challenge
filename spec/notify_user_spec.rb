require 'notify_user'

describe NotifyUser do
  describe 'self.delivery_time' do
    it 'creates a delivery time string' do
      Time.stub(:now) { Time.new(2001, 1, 1) }
      expect(NotifyUser.delivery_time).to eq "01:00"
    end
  end
end

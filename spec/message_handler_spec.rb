describe Message_handler do

  describe '#initialize' do

    it 'gets the environment variables' do
      expect(subject.instance_variable.get(:@account_sid)).not_to be_nil
      expect(subject.instance_variable.get(:@auth_token)).not_to be_nil
    end

  end

  describe '#send_message' do

    it ''

  end

end

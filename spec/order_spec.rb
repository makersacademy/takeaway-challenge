require 'order'

  describe Order do

      subject(:order) {described_class.new}

        describe '#initialize' do
          it 'creates empty customer order' do
          expect(subject.cust_order).to be_empty
        end
          it 'creates empty order' do
            expect(subject.order).to eq nil
        end
          it 'creates an empty telephone number' do
            expect(subject.phone_number).to eq nil
        end

      end

  end

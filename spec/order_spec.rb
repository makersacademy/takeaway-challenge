# require 'sendtext'
#
# describe TwilioControllerdo
#
#   subject { described_class.new(journey_c) }
#
#
#   context '#send_text_message' do
#     it 'sends a text message' do
#       subject.start(station1)
#       expect(subject.journeys.last.in).to eq station1
#     end
#   end
#
#   context '#current_journey' do
#     before do
#       subject.start(station1)
#     end
#     it 'knows my current incomplete journey' do
#       allow(journey).to receive(:complete?).and_return(false)
#       expect(subject.current_journey).to eq journey
#     end
#   end
#
#   context '#finish' do
#     before do
#       allow(journey).to receive(:out=).with(station2).and_return(station2)
#       allow(journey).to receive(:out).and_return(station2)
#     end
#     it 'applies an exit station to the most recent journey' do
#       allow(journey).to receive(:complete?).and_return(false)
#       subject.start(station1)
#       subject.finish(station2)
#       expect(subject.journeys.last.out).to eq station2
#     end
#   end
#
#   context '#journeys' do
#
#     it 'is empty when initialized' do
#       expect(subject.journeys).to be_empty
#     end
#
#     it 'shows a logged journey' do
#       allow(journey).to receive(:out=).and_return(station2)
#       allow(journey).to receive(:out).and_return(station2)
#       allow(journey).to receive(:complete?).and_return(false)
#       subject.start(station1)
#       subject.finish(station2)
#       expect(subject.journeys).to include(journey)
#     end
#   end
#
#   context '#latest_journey' do
#     it 'shows nothing by default' do
#       expect(subject.latest_journey).to be_nil
#     end
#
#     it 'shows the latest journey' do
#       allow(journey).to receive(:complete?).and_return(true)
#       allow(journey).to receive(:out).and_return(station2)
#       allow(journey).to receive(:out=).and_return(station2)
#       subject.start(station1)
#       subject.finish(station2)
#       expect(subject.latest_journey).to eq(journey)
#     end
#   end
# end

require 'spine/hub'

module Spine
  module Hub
    module Subscriptions
      describe Global do
        subject { described_class }
        before(:each) { subject.clear }
        after(:each) { subject.clear }

        let(:subscriber) { double }
        let(:publisher) { double.extend(Publisher) }

        it 'adds global subscribers' do
          subject.subscribe(subscriber)
          expect(subject.subscribers.count).to eq(1)
        end

        it 'notifies global subscribers' do
          expect(subscriber).to receive(:notify).with(:test, 1)

          subject.subscribe(subscriber)
          publisher.publish(:test, 1)
        end

        it 'clears subscribers' do
          subject.subscribe(double)
          subject.subscribe(double)
          subject.clear
          expect(subject.subscribers.count).to eq(0)
        end
      end
    end
  end
end

#uninitialized constant Spine::Hub::Subscriptions::Global
#       Did you mean?   Spine::Hub::Subscriptions::Global

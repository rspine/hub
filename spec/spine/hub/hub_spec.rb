require 'spine/hub'

module Spine
  module Hub
    describe Hub do
      subject { Hub }
      before(:each) { subject.unsubscribe_all }
      after(:each) { subject.unsubscribe_all }

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
        subject.unsubscribe_all
        expect(subject.subscribers.count).to eq(0)
      end
    end
  end
end

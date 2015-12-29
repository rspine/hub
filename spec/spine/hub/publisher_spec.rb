require 'spine/hub'

module Spine
  module Hub
    describe Publisher do
      subject { double.extend(Publisher) }

      let(:subscriber) { double }

      it 'has subscribers' do
        expect(subject.subscribers).to eq(Set.new)
      end

      it 'adds subscriber' do
        subject.subscribe(subscriber)
        expect(subject.subscribers).to include(subscriber)
      end

      it 'publishes event to subscriber' do
        expect(subscriber).to receive(:notify).with(:test, 1)

        subject.subscribe(subscriber)
        subject.publish(:test, 1)
      end

      it 'published event without subscribers' do
        subject.publish(:test, 1)
      end

      context 'when subscribing to event with closure' do
        it 'adds closure subscription' do
          subject.on(:test) do
          end
          expect(subject.subscribers.size).to eq(1)
        end

        it 'skips adding empty closure subscription' do
          subject.on(:test)
          expect(subject.subscribers.size).to eq(0)
        end

        it 'publishes event to closure subscription' do
          published_value = nil
          subject.on(:test) do |value|
            published_value = value
          end

          subject.publish(:test, 1)
          expect(published_value).to eq(1)
        end
      end
    end
  end
end

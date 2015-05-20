require 'spine/hub'

module Spine
  module Hub
    describe Subscriber do
      subject { double.extend(Subscriber) }

      it 'delegates notification to event handler' do
        expect(subject).to receive(:on_test).with(1)
        subject.notify(:test, 1)
      end
    end
  end
end

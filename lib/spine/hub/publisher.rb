module Spine
  module Hub
    module Publisher
      def subscribers
        @subscribers ||= []
      end

      # Adds subscribers.
      #
      # ==== Attributes
      # * +subscribers+ - List of addable subscribers.
      def subscribe(*subscribers)
        @subscribers ||= []
        @subscribers += subscribers
      end

      # Publishes event to subscribers.
      #
      # ==== Attributes
      # * +event+ - Name of event.
      # * +arguments+ - List of event arguments.
      def publish(event, *arguments)
        subscribers.each do |subscriber|
          if subscriber.respond_to?(:notify)
            subscriber.notify(event, *arguments)
          end
        end
      end

      # Adds block subscriber.
      #
      # ==== Arguments
      # * +event+ - Subscriber triggering event.
      def on(event, &block)
        if block_given?
          subscribe(Subscriptions::Closure.new(event, block))
        end
        self
      end
    end
  end
end

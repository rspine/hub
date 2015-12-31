module Spine
  module Hub
    module Publisher
      include Subscriptions::Registry

      def subscribers
        super + Hub.subscribers
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
    end
  end
end

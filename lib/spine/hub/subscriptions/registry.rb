require 'set'

module Spine
  module Hub
    module Subscriptions
      module Registry
        def subscribers
          @subscribers ||= Set.new
        end

        # Removes all subscribers.
        def unsubscribe_all
          @subscribers = Set.new
        end

        # Adds subscribers.
        #
        # ==== Attributes
        # * +subscribers+ - List of addable subscribers.
        def subscribe(*subscribers)
          @subscribers ||= Set.new
          @subscribers += subscribers
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
end

module Spine
  module Hub
    module Subscriptions
      # Subscriber for blocks.
      #
      # == Requirements
      # * +event+ - Subscriber triggering event.
      # * +action+ - Block to execute.
      class Closure
        attr_reader :trigger, :action

        def initialize(event, action)
          @trigger = event
          @action = action
        end

        # Notifies subscriber about event. When event matches with triggering
        # event it executes action.
        #
        # ==== Attributes
        # * +event+ - Name of event.
        # * +arguments+ - Arguments for event.
        def notify(event, *arguments)
          action.call(*arguments) if trigger?(event)
        end

        # Returns true when subscriber is triggered by specified event.
        #
        # ==== Attributes
        # * +event+ - Name of event.
        def trigger?(event)
          trigger == event
        end
      end
    end
  end
end

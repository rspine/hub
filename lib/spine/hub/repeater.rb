module Spine
  module Hub
    module Repeater
      include Publisher

      # Republishes the event.
      #
      # ==== Attributes
      # * +event+ - Name of event.
      # * +arguments+ - Arguments for event.
      def notify(event, *arguments)
        publish(event, *arguments)
      end
    end
  end
end

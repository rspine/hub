module Spine
  module Hub
    module Subscriber
      # Notifies subscriber about event. It delegates processing that event
      # to on_<event> method with specified arguments.
      #
      # ==== Attributes
      # * +event+ - Name of event.
      # * +arguments+ - Arguments for event.
      def notify(event, *arguments)
        method_name = "on_#{ event }".to_sym
        send(method_name, *arguments) if respond_to?(method_name)
      end
    end
  end
end

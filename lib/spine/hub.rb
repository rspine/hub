module Spine
  module Hub
    autoload :Publisher, 'spine/hub/publisher'
    autoload :Subscriber, 'spine/hub/subscriber'
    autoload :Repeater, 'spine/hub/repeater'

    module Subscriptions
      autoload :Closure, 'spine/hub/subscriptions/closure'
      autoload :Registry, 'spine/hub/subscriptions/registry'
      autoload :Global, 'spine/hub/subscriptions/global'
    end

    extend Subscriptions::Registry
  end
end

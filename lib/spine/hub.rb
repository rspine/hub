module Spine
  module Hub
    autoload :Publisher, 'spine/hub/publisher'
    autoload :Subscriber, 'spine/hub/subscriber'
    autoload :Repeater, 'spine/hub/repeater'

    module Subscriptions
      autoload :Closure, 'spine/hub/subscriptions/closure'
      autoload :Global, 'spine/hub/subscriptions/global'
    end
  end
end

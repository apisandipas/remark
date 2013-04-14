module BP
  module Sinatra
    module CoreHelpers

      def self.registered(app)
        app.helpers CoreHelpers
      end

      def h(text)
        Rack::Utils.escape_html(text)
      end

      def partial(part, options={})
        erb part, options.merge!(:layout => false)
      end

    end
    ::Sinatra.register CoreHelpers
  end
end
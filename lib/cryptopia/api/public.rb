module Cryptopia
  module Api
    module Public
      def currencies
        handle_response(self.class.get('/GetCurrencies'))
      end

      def trade_pairs
        handle_response(self.class.get('/GetTradePairs'))
      end

      def markets(options = {})
        handle_response(Market.new(self.class.base_uri).all(options))
      end

      def market(market, options = {})
        handle_response(Market.new(self.class.base_uri).find(market, options))
      end

      def market_history(market, options = {})
        handle_response(Market.new(self.class.base_uri).history(market, options))
      end

      def market_orders(market, options = {})
        handle_response(Market.new(self.class.base_uri).orders(market, options))
      end

      def market_order_groups(markets = [], options = {})
        handle_response(Market.new(self.class.base_uri).order_groups(markets, options))
      end

      private

      def handle_response(response)
        response.code == 200 ? response.to_h : {}
      end
    end
  end
end

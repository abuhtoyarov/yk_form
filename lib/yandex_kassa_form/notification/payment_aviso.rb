module YandexKassaForm
  module Notification
    class PaymentAviso < Base
      def initialize(params, &block)
        @confirm_block = block
        raise ArgumentError unless @confirm_block.respond_to?(:call)
        super
        apply! if @code == 0
      end
      
      private
      
      def apply!
        @confirm_block.call(@params)
      rescue
        @code = 200
      end
    end
  end
end

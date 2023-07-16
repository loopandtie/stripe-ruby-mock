module StripeMock
  module RequestHandlers
    module TaxCalculations
      def TaxCalculations.included(klass)
        klass.add_handler 'post /v1/tax/calculations', :tax_calculations
      end

      def tax_calculations(route, method_url, params, headers)
        params[:id] ||= new_id('taxcalc')
        tax_rates[ params[:id] ] = Data.mock_tax_calculation(params)
        tax_rates[ params[:id] ]
      end
    end
  end
end


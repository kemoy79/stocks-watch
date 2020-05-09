class Stock < ApplicationRecord

  def self.new_lookup(symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:access_token],
      secret_token: Rails.application.credentials.iex_client[:secret_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    begin
      new(name: client.company(symbol).company_name, symbol: symbol, last_price: client.price(symbol) )
    rescue => exception
     return nil
    end
    
  end

end

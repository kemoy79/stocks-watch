class Stock < ApplicationRecord

  def self.new_lookup(symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:access_token],
      secret_token: Rails.application.credentials.iex_client[:secret_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    client.price(symbol)
  end
end

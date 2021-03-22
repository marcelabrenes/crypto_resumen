class PetitionsController < ApplicationController
  require "uri"
  require "net/http"
  require "json"
  def crypto
    # Busca las tendencias!
    trends = do_request("https://api.coingecko.com/api/v3/search/trending")

    altocoin_ids = trends["coins"].map {|coin| coin['item']['id']}
    puts coin_ids


    # Aqui busca el detalle solo de bitcoin. Adapte esta línea para hacer esta request
    # para las 7 altcoins encontradas y guardadas en la variable trends.
    
    result = altcoin_ids.map do |alcoin_id| 
    altcoin = do_request("https://api.coingecko.com/api/v3/coins/#{altcoin_id}"){id: altcoin["id"], symbol: altcoin["symbol"],value:  alcoin["market_data"]["current_price"]["usd"]}
    end



    # Devuelve las tendencias y la data de bitcoin. Pero debe cambiar el render json: para que le
    # muestre el listado de las 7 altcoins en tendencia en coingecko, y el precio respectivo de cada una
    # en USD. Si encuentra el precio en su moneda local, póngalo también. O mejor aún: busque el precio
    # del dólar en su moneda local en alguna api, y calcule el valor de estos criptoactivos en
    # su moneda local.
    # Visite su sitio: http://localhost:3000/petitions/crypto para ver como esto funciona.
    #render json: { trends: trends, data_crypto: data_altcoin}
    render json: {result: result}
  end

  private
    def do_request(url)
      # ¿Le parece este codigo familiar?
      url = URI("#{url}")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(url)
      response = https.request(request)
      JSON.parse(response.read_body)
    end
end

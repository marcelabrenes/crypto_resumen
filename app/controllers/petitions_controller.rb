class PetitionsController < ApplicationController
  require "uri"
  require "net/http"
  require "json"
  def crypto
=begin
    # Busca
    url = 'https://api.coingecko.com/api/v3/search/trending'

    altcoin_id = 'bitcoin'
    url = "https://api.coingecko.com/api/v3/coins/#{altcoin_id}"
    url = URI("#{url}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)

    data_crypto = JSON.parse(response.read_body)
=end
    # Busca las tendencias!
    trends = do_request("https://api.coingecko.com/api/v3/search/trending")


    # Aqui busca el detalle solo de bitcoin. Adapte esta línea para hacer esta request
    # para las 7 altcoins encontradas y guardadas en la variable trends.
    altcoin_id = 'bitcoin'
    data_altcoin = do_request("https://api.coingecko.com/api/v3/coins/#{altcoin_id}")



    # Devuelve las tendencias y la data de bitcoin. Pero debe cambiar el render json: para que le
    # muestre el listado de las 7 altcoins en tendencia en coingecko, y el precio respectivo de cada una
    # en USD. Si encuentra el precio en su moneda local, póngalo también. O mejor aún: busque el precio
    # del dólar en su moneda local en alguna api, y calcule el valor de estos criptoactivos en
    # su moneda local.
    # Visite su sitio: http://localhost:3000/petitions/crypto para ver como esto funciona.
    render json: { trends: trends, data_crypto: data_altcoin}

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

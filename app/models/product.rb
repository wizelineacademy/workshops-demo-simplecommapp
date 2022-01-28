# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }

  # BAD BAD BAD!!!!
  def read_products_from_api
    endpoint = "https://fakestoreapi.com/products"
    url = URI(endpoint)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/json"
    request["Content-Type"] = "application/json"
    api_result = http.request(request) 

    case api_result.code.to_i
    when 200
      result = JSON.parse(api_result.read_body, object_class: OpenStruct)

      OpenStruct.new({ success?: true, error: nil, body: result })
    else
      OpenStruct.new({ success?: false, error: "Ocurrio error al leer la api!", body: api_result })
    end      
  end

end

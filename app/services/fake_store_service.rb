# https://fakestoreapi.com/products

require 'uri'
require 'net/http'
require 'json'
require 'ostruct'

# GOOD!
class FakeStoreService < ApplicationService
  def initialize
    @endpoint = "https://fakestoreapi.com/products"
  end

  def read
    api_response = get(@endpoint)
  rescue StandardError => e 
    OpenStruct.new({ success?: false, error: e, body: api_response })
  else
    result = JSON.parse(api_response.read_body, object_class: OpenStruct)

    OpenStruct.new({ success?: true, error: nil, body: result })
  end

  private

  def get(endpoint)
    url = URI(endpoint)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/json"
    request["Content-Type"] = "application/json"
    http.request(request)
  end
end
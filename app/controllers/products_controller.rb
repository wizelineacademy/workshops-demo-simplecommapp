# frozen_string_literal: true

class ProductsController < ApplicationController
  include ReadOnlyController

  before_action :add_more_stuff, only: :index

  private

    def add_more_stuff
      @api_products = FakeStoreService.new.read
    end

    def resource_params
      params.require(:product).permit(:title, :price)
    end
end

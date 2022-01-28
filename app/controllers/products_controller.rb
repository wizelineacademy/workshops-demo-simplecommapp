# frozen_string_literal: true

class ProductsController < ApplicationController
  include ReadOnlyController

  after_action :add_more_stuff, only: :show

  private

    def add_more_stuff
      # @@categories = @resource.categories(enabled: true)
      # @categories = @resource.categories.recent
    end

    def resource_params
      params.require(:product).permit(:title, :price)
    end
end

# frozen_string_literal: true

module Backoffice
  class ProductsController < BackofficeController
    include DryController

    private

      def resource_params
        params.require(:product).permit(:title, :price, :description, :quantity, :category, :category_id)
      end
  end
end

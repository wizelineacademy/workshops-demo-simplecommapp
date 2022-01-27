class ProductsController < ApplicationController
  include ReadOnlyController

  private

  def resource_params
    params.require(:product).permit(:title, :price)
  end
end

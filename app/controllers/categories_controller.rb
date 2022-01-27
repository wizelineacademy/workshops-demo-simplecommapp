class CategoriesController < ApplicationController
  include ReadOnlyController

  private

  def resource_params
    params.require(:category).permit(:title)
  end
end

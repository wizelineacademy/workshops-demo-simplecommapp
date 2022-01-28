module Backoffice
  class CategoriesController < BackofficeController
    include DryController

    private
    
    def resource_params
      params.require(:category).permit(:title)
    end    
  end
end

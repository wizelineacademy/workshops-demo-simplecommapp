module ReadOnlyController
  extend ActiveSupport::Concern

  included do
    before_action :set_resource_class
    before_action :set_show, only: :show
  end

  def index
    @resources = @resource_class.all
    # @products = Product.all
    # @categories = Category.all
  end

  def show; end

  private

  def resource_class
    controller_path.classify.constantize
  end

  def set_show
    @resource = @resource_class.find(params[:id])
  end

  def set_resource_class
    @resource_class = resource_class
  end
end

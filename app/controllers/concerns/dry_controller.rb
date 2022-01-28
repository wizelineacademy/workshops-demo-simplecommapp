# frozen_string_literal: true

module DryController
  extend ActiveSupport::Concern

  included do
    before_action :set_resource_class
    before_action :set_show, only: %i[show edit update destroy]
  end

  def index
    @resources = @resource_class.all
  end

  def show; end

  def new
    @resource = @resource_class.new
  end

  def create
    @resource = @resource_class.new(resource_params)

    respond_to do |format|
      if @resource.save
        flash[:notice] =
          I18n.t('views.common.created.success',
                 name: @resource_class.model_name.human)

        format.html { redirect_to ['/', controller_path].join }
        format.json { render :json }
        # format.turbo_stream
      else
        flash[:alert] =
          I18n.t('views.common.created.error',
                 name: @resource_class.model_name.human)
        render :new
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @resource_class.update(resource_params)
        format.html { redirect_to ['/', controller_path].join }
        format.json { render :json }
        # format.turbo_stream
      else
        render :edit
      end
    end
  end

  def destroy
    respond_to do |format|
      if @resource.destroy
        format.html { redirect_to ['/', controller_path].join }
        format.json { render :json }
        # format.turbo_stream
      else
        redirect_to :back
      end
    end
  end

  private

    def resource_class
      controller_path.classify.delete_prefix('Backoffice::').constantize
    end

    def set_show
      @resource = @resource_class.find(params[:id])
    end

    def set_resource_class
      @resource_class = resource_class
    end
end

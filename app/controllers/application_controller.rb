# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    if current_admin.present?
      backoffice_root_path
    else
      root_path
    end

    # case current_user.role
    # when "admin" then backoffice_root_path
    # when "manager" then "some_other_path"
    # else
    #   root_path
    # end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
                                        keys: %i[first_name last_name])
      devise_parameter_sanitizer.permit(:account_update,
                                        keys: %i[first_name last_name])
    end
end

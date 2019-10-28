class Admin::AdminApplicationsController < ApplicationController
    layout "admin_application"
	before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :authenticate_admin!
	# def after_sign_in_path_for(resource)
	# 	admin_path(resource)
	# end

	# def after_sign_out_path_for(resource)
	# 	new_admin_session_path
	# end

	# protected
	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_kana_name, :last_kana_name])
	# end
end
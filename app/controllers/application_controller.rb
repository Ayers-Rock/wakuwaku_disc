class ApplicationController < ActionController::Base
    before_action :set_search

    def set_search
      @search = Item.ransack(params[:q])
      @search_items = @search.result.page(params[:page])
    end
    before_action :configure_permitted_parameters, if: :devise_controller?

	# def after_sign_in_path_for(resource)
	# 	admin_path(resource)
	# end

	# def after_sign_out_path_for(resource)
	# 	root_path
	# end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_kana_name, :last_kana_name,:postal_code])
	end
end

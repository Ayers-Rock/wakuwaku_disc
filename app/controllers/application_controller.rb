class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :current_cart

	def current_cart
		if session[:cart_id]
			@cart = Cart.find(session[:cart_id])
		else
			@cart = Cart.create
			session[:cart_id] = @cart.id
		end
	end

    # def set_search
    # 	@search = Item.ransack(params[:q])
    # 	@search_items = @search.result.page(params[:page])
	# end

    before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		#ログイン後のパス
		case resource
		when Admin
			admin_path
		when User
			user_path(resource)
		end
	end

	def after_sign_up_path_for(resource)
			user_path(resource)
	end


	def after_sign_out_path_for(resource)
		case resource
		when :admin
			new_admin_session_path
		when :user
			root_path
		end
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_kana_name, :last_kana_name,:postal_code,:tel_number,:prefecture,:city_address,:building])
	end
end

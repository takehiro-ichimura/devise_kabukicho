class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def manforbid_unregist
        if current_user.usertype == 2
            unless Manpropaty.find_by(user_id: current_user.id)
                redirect_to("/users/manregist")
            end
        end
    end

    def womanforbid_unregist
        if current_user.usertype == 1
            unless Womanpropaty.find_by(user_id: current_user.id)
                redirect_to("/users/regist")
            end
        end
    end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :usertype])
            devise_parameter_sanitizer.permit(:account_update, keys: [:username])
        end
end

class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:account, :subdomain)
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :find_current_tenant
  #before_action :filter_tenant
  #def after_sign_in_path_for(resource)
   # if current_user.role == false
   #   motorista_path
    #else
    #  root_path
   # end

  #end

#before_action do
 # binding.irb
#end

def find_current_tenant
   #set to Account.first 'for now, you ll change this later'
   if current_user.present?
    current_account = Account.find(current_user.account_id)
    set_current_tenant(current_account)
  end
end

 # Filter Tenant
 #@teste = false
#def filter_tenant
 # if ActsAsTenant.current_tenant.nil?
 #   p ">>>>>>>>>>>>>>> http://admin.lvh.me:3000"
 # end
#end


 # Devise Configuration

  before_action :configure_permitted_parameters, if: :devise_controller?


  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :email, :password])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :email, :password])
  end
end

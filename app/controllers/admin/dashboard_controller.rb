class Admin::DashboardController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!

end

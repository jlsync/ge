class ReferrersController < ApplicationController

  before_action :load_business

  def show
    # params :id  is expected to be an email address
    @referrer = @business.referrers.find_or_create_by!(email: params[:id])
  end

  private

  def load_business
    @business = Business.find(params[:business_id])
  end

end

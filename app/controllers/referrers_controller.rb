class ReferrersController < ApplicationController

  def show
    # params :id  is expected to be an email address
    @business = Business.find(params[:business_id])
    @referrer = @business.referrers.find_or_create_by!(email: params[:id])
  end

  def redirect
    @referrer = Referrer.find params[:id]
    unless session[params[:id]]  # if no key in session for this referrer id
      @referrer.increment!(:click_count)  # then increment as we haven't seen it before
      session[params[:id]] = 1  # and now set key so that we don't record duplicate clicks
    end
    redirect_to ( @referrer.business.destination_url || 'http://www.google.com' )
  end

end

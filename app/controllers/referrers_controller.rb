class ReferrersController < ApplicationController

  def show
    # params :id  is expected to be an email address
    @business = Business.find(params[:business_id])
    @referrer = @business.referrers.find_or_create_by!(email: params[:email])
  end

  def redirect
    @business = Business.find(params[:business_id])
    @referrer = @business.referrers.find(params[:id])
    unless cookies.signed[params[:id]]     # if no cookie for this referrer id
      @referrer.increment!(:click_count)  # then increment as we haven't seen it before
      # and now set cookie so that we don't record duplicate clicks
      cookies.signed[params[:id]] = { value: 'r' , path: "/#{@business.id}/" } 
      # and record the last referrer to credit an conversion to....
      cookies.signed[:last] = { value: params[:id], path: "/#{@business.id}/" } 
    end
    if @referrer.business.destination_url =~ /\Ahttp/
      url = @referrer.business.destination_url
    else
      url = "http://#{@referrer.business.destination_url}"
    end
    redirect_to "#{url}?ge=#{params[:id]}" # include referrer id as 'ge' param for conversion tracking on business site.
  end

  def track
    @business = Business.find(params[:business_id])
    if rid = cookies.signed[:last] and cookies.signed[rid] == 'r' and @referrer = @business.referrers.find(rid)
      @referrer.increment!(:conversion_count)
      # now record the conversion in the cookie so we dont later double count 
      # (double counting will probably still occur in safari and other 
      # browsers that don't allow 3rd parties to set cookies.
      cookies.signed[params[:id]] = { value: 'c' , path: "/#{@business.id}/" } 
    end
    expires_now
    send_file Rails.root.join("public", "track.gif"), type: "image/gif", disposition: "inline"
  end

end

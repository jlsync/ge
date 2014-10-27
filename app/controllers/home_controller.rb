class HomeController < ApplicationController

	def index

    if current_business
      render 'loggedin'
    else
      render 'index'
    end
	end
end

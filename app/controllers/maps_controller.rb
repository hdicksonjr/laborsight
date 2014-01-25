class MapsController < ApplicationController
  include Dol 
  def index
  	# if cookies[:disclaimer]
  	# else
  	# 	flash[:notice] = "DISCLAIMER"
  	# end
  	# cookies[:disclaimer] = true
  	context = GOV::DataContext.new(SECRETS['gov']['api_host'], SECRETS['gov']['api_key'], SECRETS['gov']['api_secret'], SECRETS['gov']['api_data'], SECRETS['gov']['api_uri'])
  	request = GOV::DataRequest.new context
    @results = test_call_two(request)
    puts @results
  end


end

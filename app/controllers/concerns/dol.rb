module Dol
 extend ActiveSupport::Concern

 def save_company(n)
 	puts n
 	company = Company.new(
	:case_id => n['activity_nr'],
	:name  =>  n['estab_name'],
	:address => n['site_address'], 
	:city =>  n['site_city'],
	:state => n['site_state'],
	:zip =>   n['site_zip'])
	# :naics => n['naics_code'],
	# :inspection_type => n['insp_type'], 
	# :open_date => n['open_date'],
	# :total_current_penalty => n['total_current_penalty'],
	# :osha_violation_indicator => n['osha_violation_indicator'],
	# :serious_violations => n['serious_violations'],
	# :total_violations => n['total_violations'],
	# :load_date => n['load_dt'])
	company.save
 end


 def call_by_location(request, location)
 	request.call_api 'Compliance/OSHA/full', :select => 'estab_name,site_city', :filter => '(site_city eq 'New York')' do |results, error|
		  if error
		   puts error 
		   @error = error
		  else
		  	results.each do |result|
		  	kchamp << result #save_all(results)
		  	end
 			end
   end
 end

 def save_all(results)
 	results.each do |result|
 		puts result['site_city']
 		save_company(result)
 	end
 end

 def test_call_two(request)
 	## This code is copied straight from 
 	request.call_api 'Compliance/OSHA/full', :select => 'activity_nr,estab_name,site_address,site_city,site_state,site_zip', :filter => "(site_city eq 'New York')", :orderby => 'estab_name' do |results, error|
	  if error
	   puts error
	  else
	  	print "\nattempting to print the results\n"
		#if the JSON is parsed
	    results.each do |n|
	      save_company(n)
	    end
	    #end if the JSON is parsed
	    
	    #if the JSON is not parsed
	    print results
	    #end if the JSON is not parsed
	  end
	end
	request.wait_until_finished

 end

end

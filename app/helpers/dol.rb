module Dol
  def save_company(company)
 	  company = Company.new(:case_id 									=> company['activity_nr'],
 													:name  										=> company['estab_name'],
 													:address 									=> company['site_address'],
 													:city 										=> company['site_city'],
 													:state 										=> company['site_state'],
 													:zip 											=> company['site_zip'],
 													:naics 										=> company['naics_code'],
 													:inspection_type 					=> company['insp_type'],
 													:open_date 								=> company['open_date'],
 													:total_current_penalty 		=> company['total_current_penalty'],
 													:osha_violation_indicator => company['osha_violation_indicator'],
 													:serious_violations 			=> company['serious_violations'],
 													:total_violations 				=> company['total_violations'],
 													:load_date 								=> company['load_dt'])
	  company.save
  end

  def by_zipcode request
  	temp = []
	 	request.call_api 'Compliance/OSHA/full', :select => 'activity_nr,estab_name,site_address,site_city,site_state,site_zip', :filter => "site_zip eq '61701'", :orderby => 'estab_name' do |results, error|
		  if error
		    p error
		  else
		    results.each { |n| save_company(n) }
		  end
		  temp << results
		end
	  request.wait_until_finished

	  temp
  end
end
class CreateCompanies < ActiveRecord::Migration

# activity_nr	Unique identifier for the inspection	integer
# estab_name	Establishment being inspected	varchar(300)
# site_address	Street address of site inspected	varchar(300)
# site_city	City of site inspected	varchar(180)
# site_state	State postal abbreviation of site inspected	varchar(20)
# site_zip	Postal zip code of site inspected	varchar(40)
# naics_code	NAICS Code	varchar(10)
# insp_type	Inspection Type - A=Accident. B=Complaint. C=Referral. D=Monitoring. E=Variance. F=FollowUp. G=Unprog Rel. H=Planned. I=Prog Related. J=Unprog Other. K=Prog Other. L=Other-L	varchar(10)
# open_date	Indicates when the inspection was started	date
# total_current_penalty	Total current penalty	decimal(24,2)
# osha_violation_indicator	OSHA Violation indicator	boolean
# serious_violations	Number of serious violations	integer
# total_violations	Total violations	integer
# load_dt	The date the load was completed	date


  def up
    create_table :companies do |t|
      t.integer    :case_id
      t.string     :name
      t.string     :address
      t.string     :city
      t.string     :state
      t.string	   :zip
      t.string     :naics 
      t.string     :inspection_type
      t.date       :open_date 
      t.decimal    :total_current_penalty
      t.boolean    :osha_violation_indicator
      t.integer    :serious_violations
      t.integer    :total_violations
      t.date       :load_date
      
      t.timestamps
    end
  end

  def down
    drop_table :companies
  end
end
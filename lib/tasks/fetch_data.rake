require 'json'
require 'open-uri'

namespace :data do
  desc 'Fetches recent food inspection data from the Chicago Data Portal'
  task :fetch => :environment do
    puts 'Fetching inspections...'

    Inspection.delete_all

    inspections.each do |inspection|
      Inspection.create!(inspection_params(inspection))
    end

    puts 'Done!'
  end

  def inspections
    JSON.parse(open(resource_url).read)
  end

  def resource_url
    'http://data.cityofchicago.org/resource/4ijn-s7e5.json'
  end

  def inspection_params(params)
    ActionController::Parameters.new(params).permit(*inspection_attributes)
  end

  def inspection_attributes
    [:id, :inspection_id, :inspection_date, :facility_type, :license, :address, :city, :zip, :longitude, :latitude, :coordinates_needs_recoding, :state, :dba_name, :aka_name, :result, :risk, :violations]
  end
end

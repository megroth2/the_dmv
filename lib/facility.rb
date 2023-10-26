require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details)
      @name = facility_details[:name]
      @address = facility_details[:address]
      @phone = facility_details[:phone]
      @services = []
      @registered_vehicles = []
      @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle

      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
    end
  end 

  def administer_written_test(registrant)
    registrant.license_data[:written] = true if @services.include?('Written Test') && registrant.permit? && registrant.age >= 16

    registrant.license_data[:written]
  end

  def administer_road_test(registrant)
    registrant.license_data[:license] = true if @services.include?('Road Test') && registrant.license_data[:written] == true
    
    registrant.license_data[:license]
  end

  def renew_drivers_license(registrant)
    registrant.license_data[:renewed] = true if @services.include?('Renew License') && registrant.license_data[:license] == true
    
    registrant.license_data[:renewed]
  end

end

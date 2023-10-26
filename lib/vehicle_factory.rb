class VehicleFactory

  def create_vehicles(registrations)
    vehicles = []

    registrations.each do |registration|
      vin = registration[:vin_1_10]
      year = registration[:model_year]
      make = registration[:make]
      model = registration[:model]

      new_vehicle = Vehicle.new({vin: vin, year: year, make: make, model: model, engine: :ev})

      vehicles << new_vehicle
    end
    vehicles
  end
  
end
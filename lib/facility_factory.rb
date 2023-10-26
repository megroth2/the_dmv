class FacilityFactory

  def create_co_facilities(locations)
    facilities = []

    locations.each do |location|
      name = location[:dmv_office]
      address = location[:address_li] << ", " << location[:address__1] << ", " << location[:city] << ", " << location[:state] << " " << location[:zip] if location[:address__1] != nil
      address = location[:address_li] << ", " << location[:city] << ", " << location[:state] << " " << location[:zip] if location[:address__1] == nil
      phone = location[:phone]

      new_facility = Facility.new({name: name, address: address, phone: phone})

      facilities << new_facility
    end
    facilities
  end

  def create_ny_facilities(locations)
    facilities = []

    locations.each do |location|
      name = location[:office_name]
      address = location[:street_address_line_1] << ", " << location[:city] << ", " << location[:state] << " " << location[:zip_code]
      phone = location[:public_phone_number]

      new_facility = Facility.new({name: name, address: address, phone: phone})

      facilities << new_facility
    end
    facilities
  end

  def create_mo_facilities(locations)
    facilities = []

    locations.each do |location|
      name = location[:name]
      address = location[:address1] << ", " << location[:city] << ", " << location[:state] << " " << location[:zipcode] 
      phone = location[:phone]

      new_facility = Facility.new({name: name, address: address, phone: phone})

      facilities << new_facility
    end
    facilities
  end
  
end
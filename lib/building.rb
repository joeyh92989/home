class Building
  attr_reader :units

  def initialize
    @units = []
    @renters = []
    @rented_units = []
    @annual_breakdown
  end

  def add_unit(unit)
    @units.push(unit)
  end

  def renters
    @renters = []
    not_vacant = @units.find_all do |unit|
      !unit.renter.nil?
    end

    not_vacant.each do |unit|
      @renters << unit.renter
    end
    @renters
  end

  def average_rent
    total_units = @units.count
    total_rent = @units.sum do |unit|
      unit.monthly_rent
    end
    average_rent = total_rent.to_f / total_units.to_f
  end

  def rented_units
    @rented_units = []

    not_vacant = @units.find_all do |unit|
      !unit.renter.nil?
    end

    not_vacant.each do |unit|
      @rented_units << unit
    end
    @rented_units
  end

  def renter_with_highest_rent
    rents = []
    @rented_units.each do |units|
      rents << units.monthly_rent
    end
    rents
    highest_rent = rents.max

    apartment_with_highest_rent = @rented_units.find do |unit|
      unit.monthly_rent == highest_rent
    end

    apartment_with_highest_rent.renter
  end

  def units_by_number_of_bedrooms
    units_by_number_of_bedrooms = {
      3 => [],
      2 => [],
      1 => []
    }

    units_with_3_bedrooms = @units.find_all do |unit|
      unit.bedrooms == 3
    end

    units_with_2_bedrooms = @units.find_all do |unit|
      unit.bedrooms == 2
    end

    units_with_1_bedrooms = @units.find_all do |unit|
      unit.bedrooms == 1
    end

    units_with_3_bedrooms.each do |unit|
      units_by_number_of_bedrooms[3] << unit.number
    end

    units_with_2_bedrooms.each do |unit|
      units_by_number_of_bedrooms[2] << unit.number
    end

    units_with_1_bedrooms.each do |unit|
      units_by_number_of_bedrooms[1] << unit.number
    end
    units_by_number_of_bedrooms
  end

  def annual_breakdown
    @annual_breakdown ={}
    
  end
end

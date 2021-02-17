class Building
  attr_reader :units
  def initialize
    @units =[]
    @renters = []
  end

  def add_unit(unit)
    @units.push(unit)
  end

  def renters
    @renters = []
    not_vacant = @units.find_all do |unit|
    unit.renter != nil
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
end

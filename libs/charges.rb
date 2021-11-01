class Charge
  def self.fare_calculator(end_time, start_time)
    total = (end_time).to_i - (start_time).to_i
    result = ""
    if total < 10
      result = "Rupees 50/- you have to pay"
    elsif total > 10
      result = " You have to pay", total + 5
    end
    return result
  end
end

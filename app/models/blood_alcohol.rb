class BloodAlcohol

  class << self

    def content(loz_alcohol_by_time, cust_id)
      return 0 if cust_id.nil? || loz_alcohol_by_time.empty?
      set_customer_stats(cust_id)
      calculate_bac(loz_alcohol_by_time)
    end

    def set_customer_stats(cust_id)
      cust = Customer.find(cust_id)
      @weight = cust.weight
      @adr = alcohol_distribution_ratio(cust.sex)
    end

    def calculate_bac(loz_alcohol_by_time)
      loz_alcohol_by_time.inject(0) { |bac, drink| bac + bac_per(drink) }
    end

  # BAC% = (A x 5.14/W x r) - .15 x H
  # A = liquid oz of alcohol
  # W = weight of person
  # r = alcohol distribution ratio (.73 men, .66 women)
  # H = period in hours which alcohol is eliminated
    def bac_per(drink)
      hours = calculate_hours(drink[:time])
      alcohol = drink[:loz]
      bac = ((alcohol * 5.14 / @weight * @adr) - (0.015 * hours)).round(3)
      bac < 0 ? 0 : bac
    end

    def calculate_hours(time)
      hours = (DateTime.now.to_i - time.to_i) * 0.000277777777778
    end

    def alcohol_distribution_ratio(sex)
      case sex
      when "male"    then 0.73
      when "female"  then 0.66
      end
    end

  # TO DO

  # changes to model:
  # Order - method to return OrderItems customer is drinking

  #changes to view:
  # in the navbar, need to have button to "calculate BAC" when logged in.
  # if weight and sex are empty, we need it to calculate
  # show new bac every refresh (or can it auto refresh?)

  #consider adding categories of drunkness to warn them not to drive
  #or make some jokes...

  end

end

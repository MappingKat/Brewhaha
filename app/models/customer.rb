class Customer < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password,
                            messaage: "Password should match confirmation",
                            if: password
  
  validates :first_name, presence: true, 
            :length => {
              minimum: 2,
              maximum: 32,
              too_short: "must have at least %{count} words",
              too_long: "must have at most %{count} words"
            }
            
  validates :last_name, presence: true,
            :length => {
             minimum: 2,
             maximum: 32,
             too_short: "must have at least %{count} words",
             too_long: "must have at most %{count} words"
              }

  validates :display_name, uniqueness: true,
            :length => {
              minimum: 2,
              maximum: 32,
              too_short: "must have at least %{count} words",
              too_long: "must have at most %{count} words"
              }

  validates :email, uniqueness: true
            
  has_one   :cart
  has_one   :shipping_address
  has_many  :orders
 
  before_validation :normalize_name, on :create

  before_validation :ensure_display_name_has_a_value

  after_initialize do |user|
    puts "You have initialized a user"
  end

  after_find do |user|
    puts "You have found a user"
  end

  # after_validation :set_location, on [ :create, :update ]

  protected
    def ensure_display_name_has_a_value
      if display_name.nil?
        self.display_name = email unless email.blank?
      end
    end

    def normalize_first_name
      self.first_name = self.downcase.titleize
    end

    def normalize_last_name
      self.last_name = self.downcase.titleize
    end

    # def set_location
    #   self.location = LocationService.query(self)
    # end
  end


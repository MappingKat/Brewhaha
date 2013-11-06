class Customer < ActiveRecord::Base
  # authenticates_with_sorcery!

  validates :admin, default: false
  
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

  validates :email, presence: true, uniqueness: true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  validates :password, :confirmation => true, presence: true,
            :length => { minimum: 8 }, :format => { :with => /\A(.|\d){8,12}\z/, :on => :create }
            
  has_one   :cart
  has_one   :shipping_address
  has_many  :orders
 
  before_validation :normalize_first_name
  before_validation :normalize_first_name

  before_validation :ensure_display_name_has_a_value

  validates_confirmation_of :password,
                            message: "Password should match confirmation"

  # after_validation :set_location, on [ :create, :update ]
  private

    def ensure_display_name_has_a_value
      if display_name.nil?
        self.display_name = email unless email.blank?
      end
    end

    def normalize_first_name
      self.first_name = self.first_name.downcase.titleize unless self.first_name.nil?

    end

    def normalize_last_name
      self.last_name = self.last_name.downcase.titleize unless self.last_name.nil?
    end

    # def set_location
    #   self.location = LocationService.query(self)
    # end
  end



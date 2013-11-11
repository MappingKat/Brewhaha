class Customer < ActiveRecord::Base

  has_many  :orderes
  has_many  :addresses

  before_validation :ensure_display_name_has_a_value

  validates :admin, default: false

  validates :name, presence: true,
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

  # validates :email, presence: true, uniqueness: true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  # after_validation :set_location, on [ :create, :update ]

  def self.from_omniauth(auth_hash)
    where(auth_hash.slice("provider", "uid")).first || create_from_omniauth(auth_hash)
  end

  def self.create_from_omniauth(auth_hash)
    create! do |cust|
      cust.provider = auth_hash["provider"]
      cust.uid = auth_hash["uid"]
      cust.display_name = auth_hash["info"]["nickname"]
      cust.name = auth_hash["info"]["name"]
      cust.image = auth_hash["info"]["image"]
    end
  end

  private

    def ensure_display_name_has_a_value
      if display_name.nil?
        self.display_name = email unless email.blank?
      end
    end

    # def normalize_name
    #   self.first_name = self.first_name.downcase.titleize unless self.first_name.nil?
    # end

  end

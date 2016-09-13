class User < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :password, uniqueness: true
  # validates :email, format: { with: /\bgmail\b/}
  validates :password, length: { is: 6 }

  has_many :urls

  def self.authenticate(email, password)
    if self.find_by({email: email}) == nil
      return nil
    elsif self.find_by({email: email}).password == password
      self.find_by({email: email})
    else
      nil
    end
    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil
  end
end

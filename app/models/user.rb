class User < ApplicationRecord
  def self.search(str)
   where('first_name ILIKE? OR last_name ILIKE?  OR email ILIKE? ',"%#{str}%", "%#{str}%", "%#{str}%")
  #  SELECT FROM products WHERE title or Description = str
 end
end

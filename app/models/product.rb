class Product < ApplicationRecord
  belongs_to :category
  
  has_many :reviews, dependent: :destroy

   validates(:title, { presence: { message: 'must be present!' },
                     uniqueness: { case_sensitive: false } })
  validates(:Description,{ presence: true, length: { minimum: 10 } })
  validates(:price, { presence: true,
                         numericality: { greater_than_or_equal_to: 0 }})

   def self.search(str)
    where('title ILIKE? OR "Description" ILIKE ?',"%#{str}%", "%#{str}%").order("title")
    #  SELECT FROM products WHERE title or Description = str
  end
 #   A callback method to set the default price to 1
 # A callback method to capitalize the product title before saving
before_save :capitalize_title



private

def capitalize_title
    self.title = title.capitalize if title.present?
  end

 def set_defualt
     self.price ||= 1
 end
end

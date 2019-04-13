class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 4, maximum: 40}

end

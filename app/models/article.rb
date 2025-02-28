class Article < ApplicationRecord
  validates :title, length: {maximum:40}
end

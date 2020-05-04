class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 3..25 }, uniqueness: { case_sensitive: false }
  before_save { 
    self.name = self.name.strip.split.map(&:capitalize).join(' ')
  }
end
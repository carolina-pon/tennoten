# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  site       :string           not null
#  sns        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authors_on_name  (name) UNIQUE
#
class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :site, presence: true
end

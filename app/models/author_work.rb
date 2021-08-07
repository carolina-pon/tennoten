# == Schema Information
#
# Table name: author_works
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint
#  work_id    :bigint
#
# Indexes
#
#  index_author_works_on_author_id  (author_id)
#  index_author_works_on_work_id    (work_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (work_id => works.id)
#
class AuthorWork < ApplicationRecord
  belongs_to :work
  belongs_to :author
end

# == Schema Information
#
# Table name: work_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  work_id     :bigint
#
# Indexes
#
#  index_work_categories_on_category_id  (category_id)
#  index_work_categories_on_work_id      (work_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (work_id => works.id)
#
class WorkCategory < ApplicationRecord
  belongs_to :work
  belongs_to :category
end

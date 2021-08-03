# == Schema Information
#
# Table name: works
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  images      :string           not null
#  material    :string           not null
#  size        :string
#  title       :string           not null
#  weight      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Work < ApplicationRecord
  mount_uploaders :images, ImageUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :material, presence: true

  # rubyのオブジェクトをJSONでシリアライズしてDBに保存
  serialize :images, JSON
  validates :images, presence: true
end

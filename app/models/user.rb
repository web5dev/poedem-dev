# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  login      :string(255)
#  pass       :string(255)
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
end

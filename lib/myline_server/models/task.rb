require 'active_record'
class Task < ActiveRecord::Base
  validates :remind_datetime, :format => /\A(20\d\d-(0?[1-9]|1[0-2])-((0?[1-9]|1?[0-9]|2[0-9]|3[01])))\s(([01]?[0-9]|2[0-3]):([0-5][0-9]))\z/
  validates :task_text, :length => {maximum: 30}
end

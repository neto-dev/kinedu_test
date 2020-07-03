class BabySerializer < ActiveModel::Serializer
  attributes :id, :name, :months_old, :birthday, :mother_name, :father_name, :address, :phone

  def months_old
    birthday_date = self.object.birthday
    actual_date = Date.today
    months = (actual_date.year * 12 + actual_date.month) - (birthday_date.year * 12 + birthday_date.month)
    months_old = months
  end
end

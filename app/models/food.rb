class Food < ApplicationRecord
  belongs_to :kind

  def get_kind_color
    if kind_id == 1
      'primary'
    elsif kind_id == 2
      'secondary'
    else
      'accent'
    end
  end
end

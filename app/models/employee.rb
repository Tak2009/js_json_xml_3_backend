class Employee < ApplicationRecord
  belongs_to :department

  # def self.structure
  #   @report_line = self.all.max_by(10) {|qr| qr.answers }.length
  #   if @record_number1 < 10
  #       self.all.max_by(@record_number1) {|qr| qr.answers }
  #   else
  #       self.all.max_by(10) {|qr| qr.answers }
  #   end
  # end

end

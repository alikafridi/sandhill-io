class LinkedinCount < ApplicationRecord
	belongs_to :company

	validates :uid, presence: true
	validates :uid, uniqueness: true

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			begin
				r_hash = row.to_hash
				u_uid = row["uid"].to_s

				d = Date.strptime(row["date"].to_s, '%m/%d/%Y')

	  		l = LinkedinCount.find_by(uid: u_uid) || new

				l.attributes = r_hash
				l.date = d
				l.save!
			rescue
			end

		end
	end

end
module BansHelper
	def check_ban
		@is_ban ? "Unblock User" : "Ban User"
	end

	def check_if_banned(role)
		role == "Regular" ? "Ban User" : "Unblock User" 
	end
end

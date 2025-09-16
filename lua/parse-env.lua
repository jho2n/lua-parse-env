local function parse_env_file(filepath)
	local env = {}
	for line in io.lines(filepath) do
		-- ignore comments and empty lines
		if not line:match("^%s*#") and not line:match("^%s*$") then
			local key, val = line:match("^%s*([%w_%.%-]+)%s*=%s*(.-)%s*$")
			if key and val then
				-- remove surrounding quotes if present
				val = val:gsub("^['\"](.-)['\"]$", "%1")
				env[key] = val
			end
		end
	end
	return env
end

return { parse_env_file = parse_env_file }

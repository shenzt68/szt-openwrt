--[[
 ArDnspod shell script for luci controller page
 Copyright (C) 2018 plutoghost <plutoghost@gmail.com>
]]--

module("luci.controller.ardnspod", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/ardnspod") then
		return
	end
	entry({"admin", "network", "ardnspod"}, cbi("ardnspod"), _("ArDnspod"), 45).dependent = true
end

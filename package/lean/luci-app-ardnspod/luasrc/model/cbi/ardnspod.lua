--[[
 ArDnspod shell script for luci CBI page
 Copyright (C) 2018 plutoghost <plutoghost@gmail.com>
]]--

local sys = require "luci.sys"


m = Map("ardnspod", translate("ArDnspod"),
        translatef("Configure dynamic dnspod resolve by ArDnspod shell script."))

s = m:section(TypedSection, "general", translate("general settings"))
s.anonymous = true
enabled = s:option(Flag, "enabled", translate("Enable"))
enabled.default = 0
enabled.rmempty = false

email = s:option(Value, "login_email", translate("login email"),translate("the dnspod login username"))

pass = s:option(Value, "login_password", translate("login password"),translate("the dnspod login password"))
pass.password = true

token = s:option(Value, "login_token", translate("login token"),translate("recommend"))

t = m:section(TypedSection, "domain", translate("domain settings"))
t.addremove = true
t.anonymous = true 
t.template = "cbi/tblsection"
sub = t:option(Value, "sub_domain", translate("sub domain"),translate("the sub domain name to be resolved.")) 
main = t:option(Value, "main_domain", translate("main domain"),translate("the domain name to be resolved."))

local apply = luci.http.formvalue("cbi.apply")
if apply then
	io.popen("/etc/init.d/ardnspod restart &")
end


return m



local M = { help={}, test={} }

-- module ---------------------------------------------------------------------

M.help.self = [[
NAME
  mad.lang

SYNOPSIS
  local lang   = require"mad.lang"
  local parser = lang.getParser(key [,line])
  local key    = lang.getCurrentKey()

DESCRIPTION
  Contains functions for getting the parsers corresponding to different languages.

  local parser = lang.getParser(key [,line])
    -Returns the parser corresponding to key. line is an optional argument to be
     given when parsing in interactive mode.
  local key    = lang.getCurrentKey()
    -Returns the key of the parser being used at the moment.

RETURN VALUES
  None

SEE ALSO
  None
]]

-- require --------------------------------------------------------------------
local tableUtil = require"lua.tableUtil"
local options = require"mad.core.options"

-- module ---------------------------------------------------------------------
local parsers = {
	lua = require"mad.lang.lua.parser",
	mad = require"mad.lang.mad.parser"
}

local currentKey

M.getParser = function (key, line, ...)
    line = line or 0
	if not options then error("Options haven't been set for lang.lua") end
	if not parsers[key] then error("There's no parser mapped to key: "..key) end
	local p = parsers[key](...)
	local parse = p.parse
	local modifiedParse = function(self, inputStream, fileName, pos)
	    pos = pos or 1
		currentKey = key
		local ast = parse(self, inputStream, fileName, pos, line)
		ast.fileName = fileName
		return ast
	end
	p.parse = modifiedParse
	return p
end

function M.getCurrentKey()
	return currentKey or "mad"
end

-- test -----------------------------------------------------------------------

if not load_test then return M end

function M.test:getParser(ut)
	ut:succeeds(M.getParser, "lua")
	ut:succeeds(M.getParser, "mad")
	ut:fails(M.getParser, "IGuessThereWillNeverBeALanguageWithThisKey")
end

function M.test:getCurrentKey(ut)
	ut:equals(M.getCurrentKey(),"lua")
	currentKey = "key"
	ut:equals(M.getCurrentKey(),"key")
	currentKey = nil
end

function M.test:self(ut)
    require"mad.tester".addModuleToTest("mad.lang.lua.parser")
    require"mad.tester".addModuleToTest("mad.lang.mad.parser")
end

-- end ------------------------------------------------------------------------
return M

local M = { help={}, test={}, _author="LD", _year=2013 }

-- module -------------------------------

M.help.self = [[
NAME
  mad -- Methodical Accelerator Design package

SYNOPSIS
  local mad = require "mad"

DESCRIPTION
  The MAD package provides a common interface to all the modules and services
  required to run MAD.

RETURN VALUES
  The table of MAD modules and services.

SEE ALSO
  None
]]

-- require --------------------------------------------------------------------


-- core
-- M.init   = require "mad.init"
M.env    = require "mad.env"
M.helper = require "mad.helper"
M.tester = require "mad.tester"
M.module = require "mad.module"
M.object = require "mad.object"

-- end -------------------------------------------------------------------------
return M

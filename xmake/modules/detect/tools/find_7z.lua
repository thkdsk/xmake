--!A cross-platform build utility based on Lua
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2019, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        find_7z.lua
--

-- imports
import("lib.detect.find_program")
import("lib.detect.find_programver")

-- find 7z 
--
-- @param opt   the argument options, e.g. {version = true}
--
-- @return      program, version
--
-- @code 
--
-- local 7z = find_7z()
-- local 7z, version = find_7z({version = true})
-- 
-- @endcode
--
function main(opt)

    -- init options
    opt         = opt or {}
    opt.check   = opt.check or "--help"
    opt.command = opt.command or "--help"
    opt.parse   = "(%d+%.?%d*)%s"
    
    -- find program
    local program = find_program(opt.program or "7z", opt)

    -- find program version
    local version = nil
    if program and opt and opt.version then
        version = find_programver(program, opt)
    end

    -- ok?
    return program, version
end

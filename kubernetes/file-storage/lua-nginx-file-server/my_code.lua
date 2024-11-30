-- defines a factorial function
--function fact (n)
--    if n == 0 then
--        return 1
--    else
--        return n * fact(n - 1)
--    end
--end
--
--for i = 1, 1 do
--    ngx.say("Hello World, Lua")
--    ngx.flush(true)
--    ngx.sleep(1)
--end

--ngx.say(fact(1000))

--path = system.pathForFile("highScore.txt", system.DocumentsDirectory)
--file = io.open(path,'w')
--file:write(tostring(score))
--io.close(file)
--print("High score: "..tostring(score))


--local args, err = ngx.req.get_uri_args()
--
--if err == "truncated" then
--    -- one can choose to ignore or reject the current request here
--end
--
--for key, val in pairs(args) do
--    if type(val) == "table" then
--        ngx.say(key, ": ", table.concat(val, ", "))
--    else
--        ngx.say(key, ": ", val)
--    end
--end



--local table = {
--    "hello, ",
--    {"world: ", true, " or ", false,
--     {": ", nil}}
--}
--ngx.print(table)

--local h, err = ngx.req.get_headers()
--
--if err == "truncated" then
--    -- one can choose to ignore or reject the current request here
--end
--
--for k, v in pairs(h) do
--    ngx.say(k, ': ', v)
--end
--
--ngx.say("Host: ", ngx.req.get_headers()["Host"])


--local it, err = ngx.re.gmatch("hello, world!", "([a-z]+)", "i")
--if not it then
--    ngx.log(ngx.ERR, "error: ", err)
--    return
--end
--
--while true do
--    local m, err = it()
--    if err then
--        ngx.log(ngx.ERR, "error: ", err)
--        return
--    end
--
--    if not m then
--        -- no match found (any more)
--        break
--    end
--
--    -- found a match
--    ngx.say(m[0])
--    ngx.say(m[1])
--end

--ngx.ctx.foo = 76
--ngx.say("foo: ", ngx.ctx.foo)

--local log_path = "/home/hasan/openresty/stream-resp/find_ubuntu_dir.txt"
--local file = io.open(log_path, "rb")
--if file == nil then
--    ngx.say(log_path .. " can\'t read or does not exists")
--    return
--end
--
--local content = file:read("*all")
--file:close()
--ngx.print(content)

local cjson = require "cjson"

uploadedFilename = ''
--ngx.var.scheme.
baseUrl = "https://".. ngx.var.http_host
downloadFolderPath = baseUrl .. "/uploads/"

local charset = {}  do -- [0-9a-zA-Z]
    for c = 48, 57  do table.insert(charset, string.char(c)) end
    for c = 65, 90  do table.insert(charset, string.char(c)) end
    for c = 97, 122 do table.insert(charset, string.char(c)) end
end

local function randomString(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.clock()^5)
    return randomString(length - 1) .. charset[math.random(1, #charset)]
end

local function getFileExtension(url)
    return url:match("[^.]+$")
end

local resty_post = require "resty.post"
local post = resty_post:new({
    path = "/var/www/html/uploads/",           -- path upload file will be saved
    name = function(name, field) -- overide name with user defined function
        uploadedFilename = randomString(30) .. os.time() .. "." .. getFileExtension(name)
        return uploadedFilename
    end
})
local m = post:read()

ngx.status = ngx.HTTP_OK
ngx.header.content_type = "application/json; charset=utf-8"
ngx.say(cjson.encode({ status = true, url = downloadFolderPath .. uploadedFilename }))
ngx.exit(ngx.HTTP_OK)





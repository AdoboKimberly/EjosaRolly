app = app or {}

app.TasklistConfig = {}
app.TasklistConfig.__index = app.TasklistConfig
_vm:set_metatable(app.TasklistConfig, {})

function app.TasklistConfig._create()
	local v = _vm:set_metatable({}, app.TasklistConfig)
	return v
end

function app.TasklistConfig:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.TasklistConfig'
	self['_isType.app.TasklistConfig'] = true
end

function app.TasklistConfig:_construct0()
	app.TasklistConfig._init(self)
	return self
end

function app.TasklistConfig:getAllowedOrigins()
	do return {
		"http://localhost:8080",
		"http://localhost:8081"
	} end
end

function app.TasklistConfig:getCorsUtil()
	local allowed = {}
	local array = self:getAllowedOrigins()
	if array ~= nil then
		local n = 0
		local m = #array
		do
			n = 0
			while n < m do
				local origin = array[n + 1]
				if origin ~= nil then
					do _g.jk.lang.Vector:append(allowed, _g.jk.lang.String:asString(origin)) end
				end
				do n = n + 1 end
			end
		end
	end
	do return _g.jk.http.server.cors.HTTPServerCORSUtil:forWhitelist(allowed) end
end

app.TasklistDatabase = {}
app.TasklistDatabase.__index = app.TasklistDatabase
_vm:set_metatable(app.TasklistDatabase, {})

app.TasklistDatabase.TASK = "task"

function app.TasklistDatabase._create()
	local v = _vm:set_metatable({}, app.TasklistDatabase)
	return v
end

function app.TasklistDatabase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.TasklistDatabase'
	self['_isType.app.TasklistDatabase'] = true
	self.db = nil
end

function app.TasklistDatabase:_construct0()
	app.TasklistDatabase._init(self)
	return self
end

app.TasklistDatabase.Task = _g.jk.json.JSONObjectAdapter._create()
app.TasklistDatabase.Task.__index = app.TasklistDatabase.Task
_vm:set_metatable(app.TasklistDatabase.Task, {
	__index = _g.jk.json.JSONObjectAdapter
})

function app.TasklistDatabase.Task._create()
	local v = _vm:set_metatable({}, app.TasklistDatabase.Task)
	return v
end

function app.TasklistDatabase.Task:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.TasklistDatabase.Task'
	self['_isType.app.TasklistDatabase.Task'] = true
	self['_isType.jk.lang.StringObject'] = true
	self._id = nil
	self._name = nil
	self._description = nil
	self._timeStampAdded = nil
	self._TimeStampLastUpdated = nil
end

function app.TasklistDatabase.Task:_construct0()
	app.TasklistDatabase.Task._init(self)
	do _g.jk.json.JSONObjectAdapter._construct0(self) end
	return self
end

function app.TasklistDatabase.Task:setId(value)
	self._id = value
	do return self end
end

function app.TasklistDatabase.Task:getId()
	do return self._id end
end

function app.TasklistDatabase.Task:setName(value)
	self._name = value
	do return self end
end

function app.TasklistDatabase.Task:getName()
	do return self._name end
end

function app.TasklistDatabase.Task:setDescription(value)
	self._description = value
	do return self end
end

function app.TasklistDatabase.Task:getDescription()
	do return self._description end
end

function app.TasklistDatabase.Task:setTimeStampAddedValue(value)
	do return self:setTimeStampAdded(_g.jk.lang.LongInteger:asObject(value)) end
end

function app.TasklistDatabase.Task:getTimeStampAddedValue()
	do return _g.jk.lang.LongInteger:asLong(self._timeStampAdded) end
end

function app.TasklistDatabase.Task:setTimeStampAdded(value)
	self._timeStampAdded = value
	do return self end
end

function app.TasklistDatabase.Task:getTimeStampAdded()
	do return self._timeStampAdded end
end

function app.TasklistDatabase.Task:setTimeStampLastUpdatedValue(value)
	do return self:setTimeStampLastUpdated(_g.jk.lang.LongInteger:asObject(value)) end
end

function app.TasklistDatabase.Task:getTimeStampLastUpdatedValue()
	do return _g.jk.lang.LongInteger:asLong(self._TimeStampLastUpdated) end
end

function app.TasklistDatabase.Task:setTimeStampLastUpdated(value)
	self._TimeStampLastUpdated = value
	do return self end
end

function app.TasklistDatabase.Task:getTimeStampLastUpdated()
	do return self._TimeStampLastUpdated end
end

function app.TasklistDatabase.Task:toJsonObject()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if self._id ~= nil then
		do v:setObject("id", self:asJsonValue(self._id)) end
	end
	if self._name ~= nil then
		do v:setObject("name", self:asJsonValue(self._name)) end
	end
	if self._description ~= nil then
		do v:setObject("description", self:asJsonValue(self._description)) end
	end
	if self._timeStampAdded ~= nil then
		do v:setObject("timeStampAdded", self:asJsonValue(self._timeStampAdded)) end
	end
	if self._TimeStampLastUpdated ~= nil then
		do v:setObject("TimeStampLastUpdated", self:asJsonValue(self._TimeStampLastUpdated)) end
	end
	do return v end
end

function app.TasklistDatabase.Task:fromJsonObject(o)
	local v = _vm:to_table_with_key(o, '_isType.jk.lang.DynamicMap')
	if not (v ~= nil) then
		do return false end
	end
	self._id = v:getString("id", nil)
	self._name = v:getString("name", nil)
	self._description = v:getString("description", nil)
	if v:get("timeStampAdded") ~= nil then
		self._timeStampAdded = _g.jk.lang.LongInteger:asObject(v:getLongInteger("timeStampAdded", 0))
	end
	if v:get("TimeStampLastUpdated") ~= nil then
		self._TimeStampLastUpdated = _g.jk.lang.LongInteger:asObject(v:getLongInteger("TimeStampLastUpdated", 0))
	end
	do return true end
end

function app.TasklistDatabase.Task:fromJsonString(o)
	do return self:fromJsonObject(_g.jk.json.JSONParser:parse(o)) end
end

function app.TasklistDatabase.Task:toJsonString()
	do return _g.jk.json.JSONEncoder:encode(self:toJsonObject(), true, false) end
end

function app.TasklistDatabase.Task:toString()
	do return self:toJsonString() end
end

function app.TasklistDatabase.Task:forJsonString(o)
	local v = _g.app.TasklistDatabase.Task._construct0(_g.app.TasklistDatabase.Task._create())
	if not v:fromJsonString(o) then
		do return nil end
	end
	do return v end
end

function app.TasklistDatabase.Task:forJsonObject(o)
	local v = _g.app.TasklistDatabase.Task._construct0(_g.app.TasklistDatabase.Task._create())
	if not v:fromJsonObject(o) then
		do return nil end
	end
	do return v end
end

function app.TasklistDatabase:forContext(ctx)
	local cstr = _g.jk.env.EnvironmentVariable:get("TASK_DATABASE")
	do _g.jk.log.Log:debug(ctx, "Opening database connection: '" .. _g.jk.lang.String:safeString(cstr) .. "'") end
	self.db = _g.jk.mysql.MySQLDatabase:forConnectionStringSync(ctx, cstr)
	if not (self.db ~= nil) then
		do _g.jk.lang.Error:throw("failedToConnectToDatabase", cstr) end
	end
	do
		local v = _g.app.TasklistDatabase._construct0(_g.app.TasklistDatabase._create())
		do v:setDb(self.db) end
		do return v end
	end
end

function app.TasklistDatabase:updateTable(table)
	if not (table ~= nil) then
		do _g.jk.lang.Error:throw("nullTable", "updateTable") end
	end
	if not (self.db ~= nil) then
		do _g.jk.lang.Error:throw("nullDB", "updateTable") end
	end
	if not self.db:ensureTableExistsSync(table) then
		do _g.jk.lang.Error:throw("failedToUpdateTable", table:getName()) end
	end
end

function app.TasklistDatabase:updateTables()
	local task = _g.jk.sql.SQLTableInfo:forName(_g.app.TasklistDatabase.TASK)
	do task:addStringKeyColumn("id") end
	do task:addStringKeyColumn("name") end
	do task:addStringKeyColumn("description") end
	do self:updateTable(task) end
end

function app.TasklistDatabase:addTask(task)
	if not (task ~= nil) then
		do return nil end
	end
	do task:setId("1") end
	do task:setTimeStampAddedValue(_g.jk.time.SystemClock:asUTCSeconds()) end
	if not self.db:executeSync(self.db:prepareInsertStatementSync(_g.app.TasklistDatabase.TASK, task:toDynamicMap())) then
		do return nil end
	end
	do return task end
end

function app.TasklistDatabase:updateTask(id, task)
	if not (task ~= nil) then
		do return false end
	end
	do task:setTimeStampLastUpdatedValue(_g.jk.time.SystemClock:asUTCSeconds()) end
	do
		local criteria = _g.app.TasklistDatabase.Task._construct0(_g.app.TasklistDatabase.Task._create())
		do criteria:setId(id) end
		do return self.db:executeSync(self.db:prepareUpdateStatementSync(_g.app.TasklistDatabase.TASK, criteria:toDynamicMap(), task:toDynamicMap())) end
	end
end

function app.TasklistDatabase:deleteTask(id)
	local criteria = _g.app.TasklistDatabase.Task._construct0(_g.app.TasklistDatabase.Task._create())
	do criteria:setId(id) end
	do return self.db:executeSync(self.db:prepareInsertStatementSync(_g.app.TasklistDatabase.TASK, criteria:toDynamicMap())) end
end

function app.TasklistDatabase:getTasks()
	local v = {}
	local it = self.db:querySync(self.db:prepareQueryAllStatementSync(_g.app.TasklistDatabase.TASK, nil, nil))
	if not (it ~= nil) then
		do return nil end
	end
	while it ~= nil do
		local o = it:next()
		if not (o ~= nil) then
			do break end
		end
		do
			local task = _g.app.TasklistDatabase.Task:forJsonObject(o)
			if not (task ~= nil) then
				goto _continue1
			end
			do _g.jk.lang.Vector:append(v, task) end
		end
		::_continue1::
	end
	do
		local data = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do data:setObject("records", v) end
		do return data end
	end
end

function app.TasklistDatabase:close()
	if self.db ~= nil then
		do self.db:closeSync() end
	end
	self.db = nil
end

function app.TasklistDatabase:getDb()
	do return self.db end
end

function app.TasklistDatabase:setDb(v)
	self.db = v
	do return self end
end

app.TasklistApiHandler = _g.jk.http.worker.HTTPRPCRouter._create()
app.TasklistApiHandler.__index = app.TasklistApiHandler
_vm:set_metatable(app.TasklistApiHandler, {
	__index = _g.jk.http.worker.HTTPRPCRouter
})

function app.TasklistApiHandler._create()
	local v = _vm:set_metatable({}, app.TasklistApiHandler)
	return v
end

function app.TasklistApiHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.TasklistApiHandler'
	self['_isType.app.TasklistApiHandler'] = true
end

function app.TasklistApiHandler:_construct0()
	app.TasklistApiHandler._init(self)
	do _g.jk.http.worker.HTTPRPCRouter._construct0(self) end
	return self
end

app.TasklistApiHandler.TaskRequest = _g.jk.json.JSONObjectAdapter._create()
app.TasklistApiHandler.TaskRequest.__index = app.TasklistApiHandler.TaskRequest
_vm:set_metatable(app.TasklistApiHandler.TaskRequest, {
	__index = _g.jk.json.JSONObjectAdapter
})

function app.TasklistApiHandler.TaskRequest._create()
	local v = _vm:set_metatable({}, app.TasklistApiHandler.TaskRequest)
	return v
end

function app.TasklistApiHandler.TaskRequest:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.TasklistApiHandler.TaskRequest'
	self['_isType.app.TasklistApiHandler.TaskRequest'] = true
	self['_isType.jk.lang.StringObject'] = true
	self._name = nil
	self._description = nil
end

function app.TasklistApiHandler.TaskRequest:_construct0()
	app.TasklistApiHandler.TaskRequest._init(self)
	do _g.jk.json.JSONObjectAdapter._construct0(self) end
	return self
end

function app.TasklistApiHandler.TaskRequest:setName(value)
	self._name = value
	do return self end
end

function app.TasklistApiHandler.TaskRequest:getName()
	do return self._name end
end

function app.TasklistApiHandler.TaskRequest:setDescription(value)
	self._description = value
	do return self end
end

function app.TasklistApiHandler.TaskRequest:getDescription()
	do return self._description end
end

function app.TasklistApiHandler.TaskRequest:toJsonObject()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if self._name ~= nil then
		do v:setObject("name", self:asJsonValue(self._name)) end
	end
	if self._description ~= nil then
		do v:setObject("description", self:asJsonValue(self._description)) end
	end
	do return v end
end

function app.TasklistApiHandler.TaskRequest:fromJsonObject(o)
	local v = _vm:to_table_with_key(o, '_isType.jk.lang.DynamicMap')
	if not (v ~= nil) then
		do return false end
	end
	self._name = v:getString("name", nil)
	self._description = v:getString("description", nil)
	do return true end
end

function app.TasklistApiHandler.TaskRequest:fromJsonString(o)
	do return self:fromJsonObject(_g.jk.json.JSONParser:parse(o)) end
end

function app.TasklistApiHandler.TaskRequest:toJsonString()
	do return _g.jk.json.JSONEncoder:encode(self:toJsonObject(), true, false) end
end

function app.TasklistApiHandler.TaskRequest:toString()
	do return self:toJsonString() end
end

function app.TasklistApiHandler.TaskRequest:forJsonString(o)
	local v = _g.app.TasklistApiHandler.TaskRequest._construct0(_g.app.TasklistApiHandler.TaskRequest._create())
	if not v:fromJsonString(o) then
		do return nil end
	end
	do return v end
end

function app.TasklistApiHandler.TaskRequest:forJsonObject(o)
	local v = _g.app.TasklistApiHandler.TaskRequest._construct0(_g.app.TasklistApiHandler.TaskRequest._create())
	if not v:fromJsonObject(o) then
		do return nil end
	end
	do return v end
end

function app.TasklistApiHandler:initRoutes()
	do _g.jk.http.worker.HTTPRPCRouter.initRoutes(self) end
	do self:addRoute("GET", "/task", function(req, resp, vars)
	end) end
	do self:addRoute("POST", "/task", function(req, resp, vars)
	end) end
	do self:addRoute("PUT", "/task/:id", function(req, resp, vars)
	end) end
	do self:addRoute("DELETE", "/task/:id", function(req, resp, vars)
	end) end
end

app.TasklistApiServer = _g.jk.server.web.WebServer._create()
app.TasklistApiServer.__index = app.TasklistApiServer
_vm:set_metatable(app.TasklistApiServer, {
	__index = _g.jk.server.web.WebServer
})

function app.TasklistApiServer._create()
	local v = _vm:set_metatable({}, app.TasklistApiServer)
	return v
end

function app.TasklistApiServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.TasklistApiServer'
	self['_isType.app.TasklistApiServer'] = true
end

function app.TasklistApiServer:_construct0()
	app.TasklistApiServer._init(self)
	do _g.jk.server.web.WebServer._construct0(self) end
	return self
end

function app.TasklistApiServer:initializeServer(server)
	if not _g.jk.server.web.WebServer.initializeServer(self, server) then
		do return false end
	end
	do return true end
end

function app.TasklistApiServer:_main(args)
	do return _g.app.TasklistApiServer._construct0(_g.app.TasklistApiServer._create()):setWorker("class:app.TasklistApiHandler"):executeMain(args) end
end

function _main(args)
	do return app.TasklistApiServer:_main(args) end
end

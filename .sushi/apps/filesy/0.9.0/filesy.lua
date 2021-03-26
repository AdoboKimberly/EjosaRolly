jk = jk or {}

jk.lang = jk.lang or {}

jk.lang.Runnable = {}

jk.lang.LongIntegerObject = {}

jk.lang.CharacterObject = {}

jk.lang.ObjectWithSize = {}

jk.lang.Iterator = {}

jk.lang.StringObject = {}

jk.lang.Duplicateable = {}

jk.lang.StringDataReceiver = {}

jk.lang.IntegerIterator = {}

jk.lang.Vector = {}
jk.lang.Vector.__index = jk.lang.Vector
_vm:set_metatable(jk.lang.Vector, {})

function jk.lang.Vector._create()
	local v = _vm:set_metatable({}, jk.lang.Vector)
	return v
end

function jk.lang.Vector:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Vector'
	self['_isType.jk.lang.Vector'] = true
end

function jk.lang.Vector:_construct0()
	jk.lang.Vector._init(self)
	return self
end

function jk.lang.Vector:asVector(obj)
	local vo = _vm:to_table_with_key(obj, '_isType.jk.lang.VectorObject')
	if not (vo ~= nil) then
		do return nil end
	end
	do return vo:toVector() end
end

function jk.lang.Vector:asObjectVector(o)
	local it = _g.jk.lang.DynamicObject:iterate(o)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local oo = it:next()
			if not (oo ~= nil) then
				do break end
			end
			do _g.jk.lang.Vector:append(v, oo) end
		end
		do return v end
	end
end

function jk.lang.Vector:forIterator(iterator)
	if not (iterator ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local o = iterator:next()
			if o == nil then
				do break end
			end
			do _g.jk.lang.Vector:append(v, o) end
		end
		do return v end
	end
end

function jk.lang.Vector:forArray(array)
	if not (array ~= nil) then
		do return nil end
	end
	do
		local v = {}
		do
			local n = 0
			while n < #array do
				do _g.jk.lang.Vector:append(v, array[n + 1]) end
				do n = n + 1 end
			end
		end
		do return v end
	end
end

function jk.lang.Vector:toVectorOfObject(collection)
	if not (collection ~= nil) then
		do return nil end
	end
	do
		local nvec = {}
		if collection ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(collection)
			do
				n = 0
				while n < m do
					local item = collection[n + 1]
					if item ~= nil then
						do _g.jk.lang.Vector:append(nvec, item) end
					end
					do n = n + 1 end
				end
			end
		end
		do return nvec end
	end
end

function jk.lang.Vector:dupObjectVector(vector)
	if not (vector ~= nil) then
		do return nil end
	end
	do
		local v = {}
		if vector ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(vector)
			do
				n = 0
				while n < m do
					local o = vector[n + 1]
					if o ~= nil then
						do _g.jk.lang.Vector:append(v, o) end
					end
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function jk.lang.Vector:contains(vector, object)
	if not (vector ~= nil) then
		do return false end
	end
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local oo = vector[n + 1]
				if oo ~= nil then
					if object == oo then
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function jk.lang.Vector:append(vector, object)
	do local sz = vector["n"] or 0 vector[sz + 1] = object vector["n"] = sz + 1 end
end

function jk.lang.Vector:prepend(vector, object)
	do _g.jk.lang.Vector:insert(vector, object, 0) end
end

function jk.lang.Vector:insert(vector, object, index)
	do local sz = vector["n"] or 0 _vm:insert_to_indexed_table(vector, index + 1, object) vector["n"] = sz + 1 end
end

function jk.lang.Vector:setCapacity(vector, capacity)
	if not (vector ~= nil) then
		do return end
	end
end

function jk.lang.Vector:setSize(vector, newSize)
	if not (vector ~= nil) then
		do return nil end
	end
	do
		local sz = newSize
		if sz < 0 then
			sz = 0
		end
		do
			local osz = _g.jk.lang.Vector:getSize(vector)
			if sz == osz then
				do return end
			end
			if sz < osz then
				do
					local n = osz - 1
					while n >= sz do
						do _g.jk.lang.Vector:remove(vector, n) end
						do n = n - 1 end
					end
				end
			else
				do
					local n = osz
					while n < sz do
						do _g.jk.lang.Vector:append(vector, nil) end
						do n = n + 1 end
					end
				end
			end
			do return vector end
		end
	end
end

function jk.lang.Vector:getSize(vector)
	if vector == nil then
		do return 0 end
	end
	do return vector["n"] or 0 end
end

function jk.lang.Vector:getAt(vector, index)
	do return _g.jk.lang.Vector:get(vector, index) end
end

function jk.lang.Vector:get(vector, index)
	if index < 0 or index >= _g.jk.lang.Vector:getSize(vector) then
		do return nil end
	end
	do return vector[index + 1] end
end

function jk.lang.Vector:getFirst(vector)
	do return _g.jk.lang.Vector:get(vector, 0) end
end

function jk.lang.Vector:getLast(vector)
	do return _g.jk.lang.Vector:get(vector, _g.jk.lang.Vector:getSize(vector) - 1) end
end

function jk.lang.Vector:set(vector, index, val)
	if index < 0 or index >= _g.jk.lang.Vector:getSize(vector) then
		do return end
	end
	do vector[index + 1]  = val end
end

function jk.lang.Vector:remove(vector, index)
	local sz = _g.jk.lang.Vector:getSize(vector)
	if index < 0 or index >= sz then
		do return nil end
	end
	do _vm:remove_from_indexed_table(vector, index+1) vector["n"] = sz - 1 end
end

function jk.lang.Vector:popFirst(vector)
	if vector == nil or _g.jk.lang.Vector:getSize(vector) < 1 then
		do return nil end
	end
	do
		local v = _g.jk.lang.Vector:get(vector, 0)
		do _g.jk.lang.Vector:removeFirst(vector) end
		do return v end
	end
end

function jk.lang.Vector:removeFirst(vector)
	if vector == nil or _g.jk.lang.Vector:getSize(vector) < 1 then
		do return end
	end
	do _g.jk.lang.Vector:remove(vector, 0) end
end

function jk.lang.Vector:popLast(vector)
	local sz = _g.jk.lang.Vector:getSize(vector)
	if vector == nil or sz < 1 then
		do return nil end
	end
	do
		local v = _g.jk.lang.Vector:get(vector, sz - 1)
		do _g.jk.lang.Vector:removeLast(vector) end
		do return v end
	end
end

function jk.lang.Vector:removeLast(vector)
	if vector == nil then
		do return end
	end
	do
		local sz = _g.jk.lang.Vector:getSize(vector)
		if sz < 1 then
			do return end
		end
		do _g.jk.lang.Vector:remove(vector, sz - 1) end
	end
end

function jk.lang.Vector:removeValue(vector, value)
	local n = 0
	do
		n = 0
		while n < _g.jk.lang.Vector:getSize(vector) do
			if vector[n + 1] == value then
				do _g.jk.lang.Vector:remove(vector, n) end
				do return n end
			end
			do n = n + 1 end
		end
	end
	do return -1 end
end

function jk.lang.Vector:clear(vector)
	do _vm:clear_table(vector) vector["n"] = 0 end
end

function jk.lang.Vector:isEmpty(vector)
	if vector == nil then
		do return true end
	end
	do
		local v = false
		do local sz = vector["n"] if sz == nil or sz < 1 then v = true end end
		do return v end
	end
end

function jk.lang.Vector:isNotEmpty(vector)
	do return not _g.jk.lang.Vector:isEmpty(vector) end
end

function jk.lang.Vector:removeRange(vector, index, count)
	do
		local n = 0
		while n < count do
			do _g.jk.lang.Vector:remove(vector, index) end
			do n = n + 1 end
		end
	end
end

jk.lang.Vector.VectorIterator = {}
jk.lang.Vector.VectorIterator.__index = jk.lang.Vector.VectorIterator
_vm:set_metatable(jk.lang.Vector.VectorIterator, {})

function jk.lang.Vector.VectorIterator._create()
	local v = _vm:set_metatable({}, jk.lang.Vector.VectorIterator)
	return v
end

function jk.lang.Vector.VectorIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Vector.VectorIterator'
	self['_isType.jk.lang.Vector.VectorIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.vector = nil
	self.index = 0
	self.increment = 1
end

function jk.lang.Vector.VectorIterator:_construct0()
	jk.lang.Vector.VectorIterator._init(self)
	return self
end

function jk.lang.Vector.VectorIterator:_construct2(vector, increment)
	jk.lang.Vector.VectorIterator._init(self)
	self.vector = vector
	self.increment = increment
	if increment < 0 and vector ~= nil then
		self.index = _g.jk.lang.Vector:getSize(vector) - 1
	end
	return self
end

function jk.lang.Vector.VectorIterator:next()
	if self.vector == nil then
		do return nil end
	end
	if self.index < 0 or self.index >= _g.jk.lang.Vector:getSize(self.vector) then
		do return nil end
	end
	do
		local v = self.vector[self.index + 1]
		self.index = self.index + self.increment
		do return v end
	end
end

function jk.lang.Vector.VectorIterator:hasNext()
	if not (self.vector ~= nil) then
		do return false end
	end
	if not (self.index < _g.jk.lang.Vector:getSize(self.vector) - 1) then
		do return false end
	end
	do return true end
end

function jk.lang.Vector:iterate(vector)
	do return _g.jk.lang.Vector.VectorIterator._construct2(_g.jk.lang.Vector.VectorIterator._create(), vector, 1) end
end

function jk.lang.Vector:iterateReverse(vector)
	do return _g.jk.lang.Vector.VectorIterator._construct2(_g.jk.lang.Vector.VectorIterator._create(), vector, -1) end
end

function jk.lang.Vector:sort(vector, comparer)
	if not (vector ~= nil) then
		do return end
	end
	do _vm:sort_table(vector, comparer) end
end

function jk.lang.Vector:sortReverse(vector, comparer)
	local cc = comparer
	do _g.jk.lang.Vector:sort(vector, function(a, b)
		do return -cc(a, b) end
	end) end
end

function jk.lang.Vector:sortAsStrings(vector)
	do _g.jk.lang.Vector:sort(vector, function(a, b)
		do return _g.jk.lang.String:compare(_g.jk.lang.String:asString(a), _g.jk.lang.String:asString(b)) end
	end) end
end

function jk.lang.Vector:sortAsStringsReverse(vector)
	do _g.jk.lang.Vector:sortReverse(vector, function(a, b)
		do return _g.jk.lang.String:compare(_g.jk.lang.String:asString(a), _g.jk.lang.String:asString(b)) end
	end) end
end

function jk.lang.Vector:reverse(vector)
	if not (vector ~= nil) then
		do return end
	end
	do
		local a = 0
		local b = _g.jk.lang.Vector:getSize(vector) - 1
		while a < b do
			local t = _g.jk.lang.Vector:getAt(vector, b)
			do _g.jk.lang.Vector:set(vector, b, _g.jk.lang.Vector:getAt(vector, a)) end
			do _g.jk.lang.Vector:set(vector, a, t) end
			do a = a + 1 end
			do b = b - 1 end
		end
	end
end

jk.lang.StringIterator = {}

jk.lang.MapObject = {}

jk.lang.Stack = {}
jk.lang.Stack.__index = jk.lang.Stack
_vm:set_metatable(jk.lang.Stack, {})

function jk.lang.Stack._create()
	local v = _vm:set_metatable({}, jk.lang.Stack)
	return v
end

function jk.lang.Stack:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Stack'
	self['_isType.jk.lang.Stack'] = true
	self.data = nil
end

function jk.lang.Stack:_construct0()
	jk.lang.Stack._init(self)
	self.data = {}
	return self
end

function jk.lang.Stack:push(o)
	do _g.jk.lang.Vector:append(self.data, o) end
end

function jk.lang.Stack:pop()
	local sz = _g.jk.lang.Vector:getSize(self.data)
	if sz < 1 then
		do return nil end
	end
	do
		local v = _g.jk.lang.Vector:getAt(self.data, sz - 1)
		do _g.jk.lang.Vector:remove(self.data, sz - 1) end
		do return v end
	end
end

function jk.lang.Stack:peek()
	local sz = _g.jk.lang.Vector:getSize(self.data)
	if sz < 1 then
		do return nil end
	end
	do return _g.jk.lang.Vector:getAt(self.data, sz - 1) end
end

function jk.lang.Stack:isEmpty()
	do return self:getSize() < 1 end
end

function jk.lang.Stack:getSize()
	do return _g.jk.lang.Vector:getSize(self.data) end
end

function jk.lang.Stack:dupData()
	local v = {}
	if self.data ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.data)
		do
			n = 0
			while n < m do
				local o = self.data[n + 1]
				if o ~= nil then
					do _g.jk.lang.Vector:append(v, o) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.Stack:dup()
	local v = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	do v:setData(self:dupData()) end
	do return v end
end

function jk.lang.Stack:getData()
	do return self.data end
end

function jk.lang.Stack:setData(v)
	self.data = v
	do return self end
end

jk.lang.Exception = {}
jk.lang.Exception.__index = jk.lang.Exception
_vm:set_metatable(jk.lang.Exception, {})

function jk.lang.Exception._create()
	local v = _vm:set_metatable({}, jk.lang.Exception)
	return v
end

function jk.lang.Exception:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Exception'
	self['_isType.jk.lang.Exception'] = true
end

function jk.lang.Exception:_construct0()
	jk.lang.Exception._init(self)
	return self
end

jk.lang.Matrix = {}
jk.lang.Matrix.__index = jk.lang.Matrix
_vm:set_metatable(jk.lang.Matrix, {})

function jk.lang.Matrix._create()
	local v = _vm:set_metatable({}, jk.lang.Matrix)
	return v
end

function jk.lang.Matrix:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Matrix'
	self['_isType.jk.lang.Matrix'] = true
	self.vector = nil
	self.columnCount = 0
end

function jk.lang.Matrix:_construct0()
	jk.lang.Matrix._init(self)
	return self
end

function jk.lang.Matrix:_construct2(rowSize, columnSize)
	jk.lang.Matrix._init(self)
	self.vector = {}
	do self:setSize(rowSize, columnSize) end
	return self
end

function jk.lang.Matrix:set(row, column, val)
	if not (self.vector ~= nil) then
		do return end
	end
	if not (row >= 0 or column >= 0) then
		do return end
	end
	do
		local size = row * self.columnCount + column
		if not (_g.jk.lang.Vector:getSize(self.vector) > size) then
			do return end
		end
		do _g.jk.lang.Vector:set(self.vector, size, val) end
	end
end

function jk.lang.Matrix:get(row, column)
	if not (self.vector ~= nil) then
		do return nil end
	end
	if not (row >= 0 or column >= 0) then
		do return nil end
	end
	do
		local size = row * self.columnCount + column
		if not (_g.jk.lang.Vector:getSize(self.vector) > size) then
			do return nil end
		end
		do return _g.jk.lang.Vector:get(self.vector, size) end
	end
end

function jk.lang.Matrix:setSize(rowSize, colSize)
	if not (self.vector ~= nil) then
		do return nil end
	end
	self.columnCount = colSize
	do _g.jk.lang.Vector:setSize(self.vector, rowSize * colSize) end
	do return self end
end

function jk.lang.Matrix:getRowCount()
	if not (self.vector ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Vector:getSize(self.vector) / self.columnCount end
end

function jk.lang.Matrix:getColumnCount()
	if not (self.vector ~= nil) then
		do return 0 end
	end
	do return self.columnCount end
end

jk.lang.KeyValueList = {}
jk.lang.KeyValueList.__index = jk.lang.KeyValueList
_vm:set_metatable(jk.lang.KeyValueList, {})

function jk.lang.KeyValueList._create()
	local v = _vm:set_metatable({}, jk.lang.KeyValueList)
	return v
end

function jk.lang.KeyValueList:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.KeyValueList'
	self['_isType.jk.lang.KeyValueList'] = true
	self.values = nil
end

function jk.lang.KeyValueList:_construct0()
	jk.lang.KeyValueList._init(self)
	return self
end

function jk.lang.KeyValueList:add(key, val)
	if self.values == nil then
		self.values = {}
	end
	do
		local kvp = _g.jk.lang.KeyValuePair._construct0(_g.jk.lang.KeyValuePair._create())
		kvp.key = key
		kvp.value = val
		do _g.jk.lang.Vector:append(self.values, kvp) end
	end
end

function jk.lang.KeyValueList:addPair(pair)
	if self.values == nil then
		self.values = {}
	end
	do _g.jk.lang.Vector:append(self.values, pair) end
end

function jk.lang.KeyValueList:prepend(key, val)
	if self.values == nil then
		self.values = {}
	end
	do
		local kvp = _g.jk.lang.KeyValuePair._construct0(_g.jk.lang.KeyValuePair._create())
		kvp.key = key
		kvp.value = val
		do _g.jk.lang.Vector:prepend(self.values, kvp) end
	end
end

function jk.lang.KeyValueList:prependPair(pair)
	if self.values == nil then
		self.values = {}
	end
	do _g.jk.lang.Vector:prepend(self.values, pair) end
end

function jk.lang.KeyValueList:iterate()
	local v = _g.jk.lang.Vector:iterate(self.values)
	do return v end
end

function jk.lang.KeyValueList:asVector()
	do return self.values end
end

function jk.lang.KeyValueList:dup()
	local v = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	local it = self:iterate()
	while true do
		local kvp = it:next()
		if kvp == nil then
			do break end
		end
		do v:add(kvp.key, kvp.value) end
	end
	do return v end
end

function jk.lang.KeyValueList:getKey(index)
	if self.values == nil then
		do return nil end
	end
	do
		local kvp = _g.jk.lang.Vector:get(self.values, index)
		if kvp == nil then
			do return nil end
		end
		do return kvp.key end
	end
end

function jk.lang.KeyValueList:getValue(index)
	if self.values == nil then
		do return nil end
	end
	do
		local kvp = _g.jk.lang.Vector:get(self.values, index)
		if kvp == nil then
			do return nil end
		end
		do return kvp.value end
	end
end

function jk.lang.KeyValueList:count()
	if self.values == nil then
		do return 0 end
	end
	do return _g.jk.lang.Vector:getSize(self.values) end
end

function jk.lang.KeyValueList:remove(index)
	do _g.jk.lang.Vector:remove(self.values, index) end
end

function jk.lang.KeyValueList:clear()
	self.values = nil
end

jk.lang.IntegerObject = {}

jk.lang.CharacterIterator = {}

jk.lang.StringObjectWithDebug = {}

jk.lang.CharacterDecoder = {}
jk.lang.CharacterDecoder.__index = jk.lang.CharacterDecoder
_vm:set_metatable(jk.lang.CharacterDecoder, {})

jk.lang.CharacterDecoder.UTF8 = 0
jk.lang.CharacterDecoder.ASCII = 1
jk.lang.CharacterDecoder.UCS2 = 2

function jk.lang.CharacterDecoder._create()
	local v = _vm:set_metatable({}, jk.lang.CharacterDecoder)
	return v
end

function jk.lang.CharacterDecoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.CharacterDecoder'
	self['_isType.jk.lang.CharacterDecoder'] = true
	self['_isType.jk.lang.CharacterIterator'] = true
	self.encoding = 0
	self.current = 0
	self.surrogatePair = nil
	self.counter = 0
	self.currentSize = 0
	self.ended = false
end

function jk.lang.CharacterDecoder:_construct0()
	jk.lang.CharacterDecoder._init(self)
	return self
end

function jk.lang.CharacterDecoder:resetDecoder()
	self.current = 0
	self.surrogatePair = nil
	self.counter = 0
	self.currentSize = 0
	self.ended = false
end

function jk.lang.CharacterDecoder:copyTo(o)
	o.encoding = self.encoding
	o.current = self.current
	o.currentSize = self.currentSize
	o.ended = self.ended
end

function jk.lang.CharacterDecoder:moveToPreviousByte()
	do return false end
end

function jk.lang.CharacterDecoder:moveToNextByte()
	do return false end
end

function jk.lang.CharacterDecoder:getCurrentByte()
	do return 0 end
end

function jk.lang.CharacterDecoder:setEncoding(ee)
	if _g.jk.lang.String:equalsIgnoreCase(ee, "UTF8") or _g.jk.lang.String:equalsIgnoreCase(ee, "UTF-8") then
		self.encoding = _g.jk.lang.CharacterDecoder.UTF8
		self.currentSize = 1
		do return self end
	end
	if _g.jk.lang.String:equalsIgnoreCase(ee, "ASCII") then
		self.encoding = _g.jk.lang.CharacterDecoder.ASCII
		self.currentSize = 1
		do return self end
	end
	if _g.jk.lang.String:equalsIgnoreCase(ee, "UCS2") or _g.jk.lang.String:equalsIgnoreCase(ee, "UCS-2") then
		self.encoding = _g.jk.lang.CharacterDecoder.UCS2
		self.currentSize = 2
		do return self end
	end
	do return nil end
end

function jk.lang.CharacterDecoder:getEncoding()
	do return self.encoding end
end

function jk.lang.CharacterDecoder:moveToPreviousChar()
	local op = self:getCurrentPosition()
	local cs = self.currentSize
	if cs > 1 then
		local n = 0
		do
			n = 0
			while n < cs - 1 do
				if not self:moveToPreviousByte() then
					do return false end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local v = self:doMoveToPreviousChar()
		if not v then
			do self:setCurrentPosition(op) end
		end
		if v and self.ended then
			self.ended = false
		end
		do return v end
	end
end

function jk.lang.CharacterDecoder:convertToChar(v)
	do return v end
end

function jk.lang.CharacterDecoder:getSurrogatePair()
	if not (self.surrogatePair ~= nil) then
		do return 0 end
	end
	do
		local c = self.surrogatePair[self.counter + 1]
		do self.counter = self.counter + 1 end
		if self.counter == 2 then
			self.counter = 0
			self.surrogatePair = nil
		end
		do return c end
	end
end

function jk.lang.CharacterDecoder:doMoveToPreviousChar()
	if self.encoding == _g.jk.lang.CharacterDecoder.UTF8 then
		if not self:moveToPreviousByte() then
			do return false end
		end
		do
			local c2 = self:getCurrentByte()
			if c2 <= 127 then
				self.current = c2
				self.currentSize = 1
				do return true end
			end
			if not self:moveToPreviousByte() then
				do return false end
			end
			do
				local c1 = self:getCurrentByte()
				if _vm:bitwise_and(c1, 192) == 192 then
					if not self:moveToNextByte() then
						do return false end
					end
					do
						local v = _vm:bitwise_left_shift(_vm:bitwise_and(c1, 31), 6)
						v = v + _vm:bitwise_and(c2, 63)
						self.current = self:convertToChar(v)
						self.currentSize = 2
						do return true end
					end
				end
				if not self:moveToPreviousByte() then
					do return false end
				end
				do
					local c0 = self:getCurrentByte()
					if _vm:bitwise_and(c0, 224) == 224 then
						if not self:moveToNextByte() then
							do return false end
						end
						if not self:moveToNextByte() then
							do return false end
						end
						do
							local v = _vm:bitwise_left_shift(_vm:bitwise_and(c0, 15), 12)
							v = v + _vm:bitwise_left_shift(_vm:bitwise_and(c1, 63), 6)
							v = v + _vm:bitwise_and(c2, 63)
							self.current = self:convertToChar(v)
							self.currentSize = 3
							do return true end
						end
					end
					if not self:moveToPreviousByte() then
						do return false end
					end
					do
						local cm1 = self:getCurrentByte()
						if _vm:bitwise_and(cm1, 240) == 240 then
							if not self:moveToNextByte() then
								do return false end
							end
							if not self:moveToNextByte() then
								do return false end
							end
							if not self:moveToNextByte() then
								do return false end
							end
							do
								local v = _vm:bitwise_left_shift(_vm:bitwise_and(cm1, 7), 18)
								v = v + _vm:bitwise_left_shift(_vm:bitwise_and(c0, 63), 12)
								v = v + _vm:bitwise_left_shift(_vm:bitwise_and(c1, 63), 6)
								v = v + _vm:bitwise_and(c2, 63)
								self.current = self:convertToChar(v)
								self.currentSize = 4
								do return true end
							end
						end
						do self:moveToNextByte() end
						do self:moveToNextByte() end
						do self:moveToNextByte() end
						self.current = 63
						self.currentSize = 1
						do return true end
					end
				end
			end
		end
	end
	if self.encoding == _g.jk.lang.CharacterDecoder.ASCII then
		if not self:moveToPreviousByte() then
			do return false end
		end
		self.current = self:getCurrentByte()
		do return true end
	end
	if self.encoding == _g.jk.lang.CharacterDecoder.UCS2 then
		if not self:moveToPreviousByte() then
			do return false end
		end
		do
			local c1 = self:getCurrentByte()
			if not self:moveToPreviousByte() then
				do return false end
			end
			do
				local c0 = self:getCurrentByte()
				if not self:moveToNextByte() then
					do return false end
				end
				self.current = _vm:bitwise_and(_vm:bitwise_left_shift(c0, 8), c1)
				do return true end
			end
		end
	end
	_io:write_to_stdout("Unsupported encoding in CharacterDecoder: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.encoding)) .. "\n")
	do return false end
end

function jk.lang.CharacterDecoder:moveToNextChar()
	local v = self:doMoveToNextChar()
	if v == false then
		self.current = 0
		self.ended = true
	end
	do return v end
end

function jk.lang.CharacterDecoder:doMoveToNextChar()
	if self.encoding == _g.jk.lang.CharacterDecoder.UTF8 then
		if self.surrogatePair ~= nil then
			self.current = self:getSurrogatePair()
			do return true end
		end
		if not self:moveToNextByte() then
			do return false end
		end
		do
			local b1 = self:getCurrentByte()
			local v = -1
			if b1 <= 127 then
				v = b1
				self.currentSize = 1
			elseif b1 >= 240 then
				v = _vm:bitwise_left_shift(_vm:bitwise_and(b1, 7), 18)
				if not self:moveToNextByte() then
					do return false end
				end
				do
					local b2 = self:getCurrentByte()
					v = v + _vm:bitwise_left_shift(_vm:bitwise_and(b2, 63), 12)
					if not self:moveToNextByte() then
						do return false end
					end
					do
						local b3 = self:getCurrentByte()
						v = v + _vm:bitwise_left_shift(_vm:bitwise_and(b3, 63), 6)
						if not self:moveToNextByte() then
							do return false end
						end
						do
							local b4 = self:getCurrentByte()
							v = v + _vm:bitwise_and(b4, 63)
							self.currentSize = 4
						end
					end
				end
			elseif b1 >= 224 then
				v = _vm:bitwise_left_shift(_vm:bitwise_and(b1, 15), 12)
				if not self:moveToNextByte() then
					do return false end
				end
				do
					local b2 = self:getCurrentByte()
					v = v + _vm:bitwise_left_shift(_vm:bitwise_and(b2, 63), 6)
					if not self:moveToNextByte() then
						do return false end
					end
					do
						local b3 = self:getCurrentByte()
						v = v + _vm:bitwise_and(b3, 63)
						self.currentSize = 3
					end
				end
			elseif b1 >= 192 then
				v = _vm:bitwise_left_shift(_vm:bitwise_and(b1, 31), 6)
				if not self:moveToNextByte() then
					do return false end
				end
				do
					local b2 = self:getCurrentByte()
					v = v + _vm:bitwise_and(b2, 63)
					self.currentSize = 2
				end
			else
				v = _util:convert_to_integer(63)
				self.currentSize = 1
			end
			self.current = self:convertToChar(v)
			do return true end
		end
	end
	if self.encoding == _g.jk.lang.CharacterDecoder.ASCII then
		if not self:moveToNextByte() then
			do return false end
		end
		self.current = self:getCurrentByte()
		do return true end
	end
	if self.encoding == _g.jk.lang.CharacterDecoder.UCS2 then
		if not self:moveToNextByte() then
			do return false end
		end
		do
			local c0 = self:getCurrentByte()
			if not self:moveToNextByte() then
				do return false end
			end
			do
				local c1 = self:getCurrentByte()
				self.current = _vm:bitwise_and(_vm:bitwise_left_shift(c0, 8), c1)
				do return true end
			end
		end
	end
	_io:write_to_stdout("Unsupported encoding in CharacterDecoder: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.encoding)) .. "\n")
	do return false end
end

function jk.lang.CharacterDecoder:getCurrentChar()
	do return self.current end
end

function jk.lang.CharacterDecoder:getNextChar()
	if self:moveToNextChar() == false then
		do return 0 end
	end
	do return self.current end
end

function jk.lang.CharacterDecoder:hasEnded()
	do return self.ended end
end

function jk.lang.CharacterDecoder:getCurrentPosition()
end

function jk.lang.CharacterDecoder:setCurrentPosition(position)
end

jk.lang.DateTime = {}
jk.lang.DateTime.__index = jk.lang.DateTime
_vm:set_metatable(jk.lang.DateTime, {})

function jk.lang.DateTime._create()
	local v = _vm:set_metatable({}, jk.lang.DateTime)
	return v
end

function jk.lang.DateTime:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DateTime'
	self['_isType.jk.lang.DateTime'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.timezoneOffset = 0
	self.weekDay = 0
	self.dayOfMonth = 0
	self.month = 0
	self.year = 0
	self.hours = 0
	self.minutes = 0
	self.seconds = 0
end

function jk.lang.DateTime:_construct0()
	jk.lang.DateTime._init(self)
	return self
end

function jk.lang.DateTime:forSeconds(seconds)
	local v = _g.jk.lang.DateTime._construct0(_g.jk.lang.DateTime._create())
	do v:updateFromTimestamp(seconds) end
	do return v end
end

function jk.lang.DateTime:forTimeValue(tv)
	if not (tv ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.lang.DateTime._construct0(_g.jk.lang.DateTime._create())
		do v:updateFromTimestamp(tv:getSeconds()) end
		do return v end
	end
end

function jk.lang.DateTime:forString(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local comps = _g.jk.lang.String:split(string, 32, 2)
		if not (comps ~= nil) then
			do return nil end
		end
		do
			local c0 = _g.jk.lang.Vector:get(comps, 0)
			local c1 = _g.jk.lang.Vector:get(comps, 1)
			if not _g.jk.lang.String:isNotEmpty(c0) then
				do return nil end
			end
			do
				local comps2 = _g.jk.lang.String:split(c0, 45, 3)
				if not (comps2 ~= nil) then
					do return nil end
				end
				if not (_g.jk.lang.Vector:getSize(comps2) == 3) then
					do return nil end
				end
				do
					local v = _g.jk.lang.DateTime._construct0(_g.jk.lang.DateTime._create())
					do v:setYear(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(comps2, 0))) end
					do v:setMonth(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(comps2, 1))) end
					do v:setDayOfMonth(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(comps2, 2))) end
					if _g.jk.lang.String:isNotEmpty(c1) then
						local tcs = _g.jk.lang.String:split(c1, 58, 3)
						if _g.jk.lang.Vector:getSize(tcs) == 3 then
							do v:setHours(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(tcs, 0))) end
							do v:setMinutes(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(tcs, 1))) end
							do v:setSeconds(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(tcs, 2))) end
						end
					end
					do return v end
				end
			end
		end
	end
end

function jk.lang.DateTime:updateFromTimestamp(seconds)
	local o = self
	do o.weekDay, o.dayOfMonth, o.month, o.year, o.hours, o.minutes, o.seconds = _os:get_timestamp_details_utc(seconds) end
end

function jk.lang.DateTime:toStringDate(delim)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getYear(), 4, nil)) end
	if delim > 0 then
		do sb:appendCharacter(delim) end
	end
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getMonth(), 2, nil)) end
	if delim > 0 then
		do sb:appendCharacter(delim) end
	end
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getDayOfMonth(), 2, nil)) end
	do return sb:toString() end
end

function jk.lang.DateTime:toStringTime(delim)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getHours(), 2, nil)) end
	if delim > 0 then
		do sb:appendCharacter(delim) end
	end
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getMinutes(), 2, nil)) end
	if delim > 0 then
		do sb:appendCharacter(delim) end
	end
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getSeconds(), 2, nil)) end
	do return sb:toString() end
end

function jk.lang.DateTime:toStringDateTime()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(self:toStringDate(45)) end
	do sb:appendString(" ") end
	do sb:appendString(self:toStringTime(58)) end
	do return sb:toString() end
end

function jk.lang.DateTime:toString()
	do return self:toStringDateTime() end
end

function jk.lang.DateTime:getTimezoneOffset()
	do return self.timezoneOffset end
end

function jk.lang.DateTime:setTimezoneOffset(v)
	self.timezoneOffset = v
	do return self end
end

function jk.lang.DateTime:getWeekDay()
	do return self.weekDay end
end

function jk.lang.DateTime:setWeekDay(v)
	self.weekDay = v
	do return self end
end

function jk.lang.DateTime:getDayOfMonth()
	do return self.dayOfMonth end
end

function jk.lang.DateTime:setDayOfMonth(v)
	self.dayOfMonth = v
	do return self end
end

function jk.lang.DateTime:getMonth()
	do return self.month end
end

function jk.lang.DateTime:setMonth(v)
	self.month = v
	do return self end
end

function jk.lang.DateTime:getYear()
	do return self.year end
end

function jk.lang.DateTime:setYear(v)
	self.year = v
	do return self end
end

function jk.lang.DateTime:getHours()
	do return self.hours end
end

function jk.lang.DateTime:setHours(v)
	self.hours = v
	do return self end
end

function jk.lang.DateTime:getMinutes()
	do return self.minutes end
end

function jk.lang.DateTime:setMinutes(v)
	self.minutes = v
	do return self end
end

function jk.lang.DateTime:getSeconds()
	do return self.seconds end
end

function jk.lang.DateTime:setSeconds(v)
	self.seconds = v
	do return self end
end

jk.lang.LongInteger = {}
jk.lang.LongInteger.__index = jk.lang.LongInteger
_vm:set_metatable(jk.lang.LongInteger, {})

function jk.lang.LongInteger._create()
	local v = _vm:set_metatable({}, jk.lang.LongInteger)
	return v
end

function jk.lang.LongInteger:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.LongInteger'
	self['_isType.jk.lang.LongInteger'] = true
	self['_isType.jk.lang.LongIntegerObject'] = true
	self.value = 0
end

function jk.lang.LongInteger:_construct0()
	jk.lang.LongInteger._init(self)
	return self
end

function jk.lang.LongInteger:forValue(value)
	do return _g.jk.lang.LongInteger:asObject(value) end
end

function jk.lang.LongInteger:asObject(value)
	local v = _g.jk.lang.LongInteger._construct0(_g.jk.lang.LongInteger._create())
	do v:setValue(value) end
	do return v end
end

function jk.lang.LongInteger:asLong(obj)
	if not (obj ~= nil) then
		do return 0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _util:convert_to_integer(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		local oi = obj
		do return oi:toLong() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = _util:convert_to_integer(obj)
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		local oi = obj
		do return oi:toInteger() end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		do return _g.jk.lang.String:toLong(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		do return _g.jk.lang.String:toLong(obj:toString()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return _util:convert_to_integer(v) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		local od = obj
		do return _util:convert_to_integer(od:toDouble()) end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		if obj == true then
			do return 1 end
		end
		do return 0 end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		if obj:toBoolean() then
			do return 1 end
		end
		do return 0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return _util:convert_to_integer(v) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		local oc = obj
		do return _util:convert_to_integer(oc:toCharacter()) end
	end
	do return 0 end
end

function jk.lang.LongInteger:add(amount)
	self.value = self.value + amount
end

function jk.lang.LongInteger:toLong()
	do return self.value end
end

function jk.lang.LongInteger:getValue()
	do return self.value end
end

function jk.lang.LongInteger:setValue(v)
	self.value = v
	do return self end
end

jk.lang.Set = {}
jk.lang.Set.__index = jk.lang.Set
_vm:set_metatable(jk.lang.Set, {})

function jk.lang.Set._create()
	local v = _vm:set_metatable({}, jk.lang.Set)
	return v
end

function jk.lang.Set:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Set'
	self['_isType.jk.lang.Set'] = true
end

function jk.lang.Set:_construct0()
	jk.lang.Set._init(self)
	return self
end

function jk.lang.Set:add(set, value)
	if not (set ~= nil) then
		do return end
	end
	_io:write_to_stdout("[jk.lang.Set.add] (Set.sling:50:3): Not implemented" .. "\n")
end

function jk.lang.Set:remove(set, value)
	if not (set ~= nil) then
		do return end
	end
	_io:write_to_stdout("[jk.lang.Set.remove] (Set.sling:76:3): Not implemented" .. "\n")
end

function jk.lang.Set:clear(set)
	if not (set ~= nil) then
		do return end
	end
	_io:write_to_stdout("[jk.lang.Set.clear] (Set.sling:102:3): Not implemented" .. "\n")
end

function jk.lang.Set:getSize(set)
	if not (set ~= nil) then
		do return 0 end
	end
	_io:write_to_stdout("[jk.lang.Set.getSize] (Set.sling:128:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.lang.Set:contains(set, value)
	if not (set ~= nil) then
		do return false end
	end
	_io:write_to_stdout("[jk.lang.Set.contains] (Set.sling:155:3): Not implemented" .. "\n")
	do return false end
end

function jk.lang.Set:getValues(set)
	if not (set ~= nil) then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.Set.getValues] (Set.sling:214:3): Not implemented" .. "\n")
	do return nil end
end

jk.lang.CharacterIteratorForString = _g.jk.lang.CharacterDecoder._create()
jk.lang.CharacterIteratorForString.__index = jk.lang.CharacterIteratorForString
_vm:set_metatable(jk.lang.CharacterIteratorForString, {
	__index = _g.jk.lang.CharacterDecoder
})

function jk.lang.CharacterIteratorForString._create()
	local v = _vm:set_metatable({}, jk.lang.CharacterIteratorForString)
	return v
end

function jk.lang.CharacterIteratorForString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.CharacterIteratorForString'
	self['_isType.jk.lang.CharacterIteratorForString'] = true
	self['_isType.jk.lang.Duplicateable'] = true
	self.string = nil
	self.stringSize = 0
	self.currentPosition = -1
end

function jk.lang.CharacterIteratorForString:_construct0()
	jk.lang.CharacterIteratorForString._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	return self
end

function jk.lang.CharacterIteratorForString:forString(string)
	local v = _g.jk.lang.CharacterIteratorForString._construct0(_g.jk.lang.CharacterIteratorForString._create())
	do v:setString(string) end
	do return v end
end

function jk.lang.CharacterIteratorForString:moveToPreviousByte()
	if self.currentPosition < 1 then
		do return false end
	end
	do self.currentPosition = self.currentPosition - 1 end
	do return true end
end

function jk.lang.CharacterIteratorForString:moveToNextByte()
	local n = self.currentPosition + 1
	if n >= self.stringSize then
		do return false end
	end
	self.currentPosition = n
	do return true end
end

function jk.lang.CharacterIteratorForString:getCurrentByte()
	do return _util:get_byte_from_string(self.string, self.currentPosition) end
end

function jk.lang.CharacterIteratorForString:getCurrentPosition()
	do return self.currentPosition end
end

function jk.lang.CharacterIteratorForString:setCurrentPosition(position)
	if position < 0 then
		self.current = 0
		self.currentPosition = -1
	else
		self.currentPosition = position + 1
		do self:doMoveToPreviousChar() end
	end
end

function jk.lang.CharacterIteratorForString:duplicate()
	local v = _g.jk.lang.CharacterIteratorForString._construct0(_g.jk.lang.CharacterIteratorForString._create())
	do _g.jk.lang.CharacterDecoder.copyTo(self, v) end
	v.string = self.string
	v.stringSize = self.stringSize
	v.currentPosition = self.currentPosition
	do return v end
end

function jk.lang.CharacterIteratorForString:setString(string)
	do self:resetDecoder() end
	self.string = string
	self.stringSize = _util:get_string_length(string)
	self.currentPosition = -1
end

jk.lang.Error = {}
jk.lang.Error.__index = jk.lang.Error
_vm:set_metatable(jk.lang.Error, {})

function jk.lang.Error._create()
	local v = _vm:set_metatable({}, jk.lang.Error)
	return v
end

function jk.lang.Error:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Error'
	self['_isType.jk.lang.Error'] = true
	self['_isType.jk.lang.StringObject'] = true
	self['_isType.jk.lang.StringObjectWithDebug'] = true
	self.code = nil
	self.detail = nil
end

function jk.lang.Error:_construct0()
	jk.lang.Error._init(self)
	return self
end

function jk.lang.Error:throw(code, detail)
	_vm:throw_error(_g.jk.lang.ExceptionWithError:forError(_g.jk.lang.Error:forCode(code, detail)))
end

function jk.lang.Error:forCode(code, detail)
	do return _g.jk.lang.Error._construct0(_g.jk.lang.Error._create()):setCode(code):setDetail(detail) end
end

function jk.lang.Error:asString(error)
	if not (error ~= nil) then
		do return "error" end
	end
	do return error:toString() end
end

function jk.lang.Error:set(error, code, detail)
	if not (error ~= nil) then
		do return nil end
	end
	do error:setCode(code) end
	do error:setDetail(detail) end
	do return error end
end

function jk.lang.Error:setErrorCode(error, code)
	do return _g.jk.lang.Error:set(error, code, nil) end
end

function jk.lang.Error:setErrorDetail(error, detail)
	do return _g.jk.lang.Error:set(error, nil, detail) end
end

function jk.lang.Error:isError(o)
	if not (o ~= nil) then
		do return false end
	end
	if not (_vm:to_table_with_key(o, '_isType.jk.lang.Error') ~= nil) then
		do return false end
	end
	do
		local e = o
		if _g.jk.lang.String:isEmpty(e:getCode()) then
			do return false end
		end
		do return true end
	end
end

function jk.lang.Error:clear()
	self.code = nil
	self.detail = nil
	do return self end
end

function jk.lang.Error:toStringWithDefault(debug, defaultError)
	local details = nil
	if (_vm:to_table_with_key(self.detail, '_isType.jk.lang.StringObjectWithDebug') ~= nil) then
		details = self.detail:toStringWithDebug(debug)
	else
		details = _g.jk.lang.String:asString(self.detail)
	end
	if _g.jk.lang.String:isEmpty(self.code) == false then
		if _g.jk.lang.String:isEmpty(details) == false then
			do return _g.jk.lang.String:safeString(self.code) .. ":" .. _g.jk.lang.String:safeString(details) end
		end
		do return self.code end
	end
	if _g.jk.lang.String:isEmpty(details) == false then
		do return "errorWithDetail:" .. _g.jk.lang.String:safeString(details) end
	end
	do return defaultError end
end

function jk.lang.Error:toStringWithDebug(debug)
	do return self:toStringWithDefault(debug, "unknownError") end
end

function jk.lang.Error:toString()
	do return self:toStringWithDebug(false) end
end

function jk.lang.Error:getCode()
	do return self.code end
end

function jk.lang.Error:setCode(v)
	self.code = v
	do return self end
end

function jk.lang.Error:getDetail()
	do return self.detail end
end

function jk.lang.Error:setDetail(v)
	self.detail = v
	do return self end
end

jk.lang.KeyValuePair = {}
jk.lang.KeyValuePair.__index = jk.lang.KeyValuePair
_vm:set_metatable(jk.lang.KeyValuePair, {})

function jk.lang.KeyValuePair._create()
	local v = _vm:set_metatable({}, jk.lang.KeyValuePair)
	return v
end

function jk.lang.KeyValuePair:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.KeyValuePair'
	self['_isType.jk.lang.KeyValuePair'] = true
	self.key = nil
	self.value = nil
end

function jk.lang.KeyValuePair:_construct0()
	jk.lang.KeyValuePair._init(self)
	return self
end

function jk.lang.KeyValuePair:_construct2(key, value)
	jk.lang.KeyValuePair._init(self)
	self.key = key
	self.value = value
	return self
end

jk.lang.DynamicObject = {}
jk.lang.DynamicObject.__index = jk.lang.DynamicObject
_vm:set_metatable(jk.lang.DynamicObject, {})

function jk.lang.DynamicObject._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject)
	return v
end

function jk.lang.DynamicObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject'
	self['_isType.jk.lang.DynamicObject'] = true
end

function jk.lang.DynamicObject:_construct0()
	jk.lang.DynamicObject._init(self)
	return self
end

jk.lang.DynamicObject.StringIteratorWrapper = {}
jk.lang.DynamicObject.StringIteratorWrapper.__index = jk.lang.DynamicObject.StringIteratorWrapper
_vm:set_metatable(jk.lang.DynamicObject.StringIteratorWrapper, {})

function jk.lang.DynamicObject.StringIteratorWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject.StringIteratorWrapper)
	return v
end

function jk.lang.DynamicObject.StringIteratorWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject.StringIteratorWrapper'
	self['_isType.jk.lang.DynamicObject.StringIteratorWrapper'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.iterator = nil
end

function jk.lang.DynamicObject.StringIteratorWrapper:_construct0()
	jk.lang.DynamicObject.StringIteratorWrapper._init(self)
	return self
end

function jk.lang.DynamicObject.StringIteratorWrapper:next()
	if not (self.iterator ~= nil) then
		do return nil end
	end
	do
		local c = self.iterator:getNextChar()
		if _g.jk.lang.Character:isEOF(c) then
			self.iterator = nil
			do return nil end
		end
		do return c end
	end
end

function jk.lang.DynamicObject.StringIteratorWrapper:hasNext()
	if not (self.iterator ~= nil) then
		do return false end
	end
	do return not self.iterator:hasEnded() end
end

function jk.lang.DynamicObject.StringIteratorWrapper:getIterator()
	do return self.iterator end
end

function jk.lang.DynamicObject.StringIteratorWrapper:setIterator(v)
	self.iterator = v
	do return self end
end

jk.lang.DynamicObject.BufferIteratorWrapper = {}
jk.lang.DynamicObject.BufferIteratorWrapper.__index = jk.lang.DynamicObject.BufferIteratorWrapper
_vm:set_metatable(jk.lang.DynamicObject.BufferIteratorWrapper, {})

function jk.lang.DynamicObject.BufferIteratorWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject.BufferIteratorWrapper)
	return v
end

function jk.lang.DynamicObject.BufferIteratorWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject.BufferIteratorWrapper'
	self['_isType.jk.lang.DynamicObject.BufferIteratorWrapper'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.buffer = nil
	self.size = 0
	self.position = 0
end

function jk.lang.DynamicObject.BufferIteratorWrapper:_construct0()
	jk.lang.DynamicObject.BufferIteratorWrapper._init(self)
	return self
end

function jk.lang.DynamicObject.BufferIteratorWrapper:next()
	if not (self.buffer ~= nil) then
		do return nil end
	end
	if self.position >= self.size then
		do return nil end
	end
	do
		local v = self.buffer[self.position + 1]
		do self.position = self.position + 1 end
		do return v end
	end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:hasNext()
	if not (self.buffer ~= nil) then
		do return false end
	end
	if not (self.position < self.size - 1) then
		do return false end
	end
	do return true end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:getBuffer()
	do return self.buffer end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:setBuffer(v)
	self.buffer = v
	do return self end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:getSize()
	do return self.size end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:setSize(v)
	self.size = v
	do return self end
end

jk.lang.DynamicObject.ArrayIteratorWrapper = {}
jk.lang.DynamicObject.ArrayIteratorWrapper.__index = jk.lang.DynamicObject.ArrayIteratorWrapper
_vm:set_metatable(jk.lang.DynamicObject.ArrayIteratorWrapper, {})

function jk.lang.DynamicObject.ArrayIteratorWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject.ArrayIteratorWrapper)
	return v
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject.ArrayIteratorWrapper'
	self['_isType.jk.lang.DynamicObject.ArrayIteratorWrapper'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.array = nil
	self.size = 0
	self.position = 0
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:_construct0()
	jk.lang.DynamicObject.ArrayIteratorWrapper._init(self)
	return self
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:next()
	if not (self.array ~= nil) then
		do return nil end
	end
	if self.position >= self.size then
		do return nil end
	end
	do
		local v = self.array[self.position + 1]
		do self.position = self.position + 1 end
		do return v end
	end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:hasNext()
	if not (self.array ~= nil) then
		do return false end
	end
	if not (self.position < self.size - 1) then
		do return false end
	end
	do return true end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:getArray()
	do return self.array end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:setArray(v)
	self.array = v
	do return self end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:getSize()
	do return self.size end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:setSize(v)
	self.size = v
	do return self end
end

jk.lang.DynamicObject.VectorIteratorWrapper = {}
jk.lang.DynamicObject.VectorIteratorWrapper.__index = jk.lang.DynamicObject.VectorIteratorWrapper
_vm:set_metatable(jk.lang.DynamicObject.VectorIteratorWrapper, {})

function jk.lang.DynamicObject.VectorIteratorWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject.VectorIteratorWrapper)
	return v
end

function jk.lang.DynamicObject.VectorIteratorWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject.VectorIteratorWrapper'
	self['_isType.jk.lang.DynamicObject.VectorIteratorWrapper'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.vector = nil
	self.size = 0
	self.position = 0
end

function jk.lang.DynamicObject.VectorIteratorWrapper:_construct0()
	jk.lang.DynamicObject.VectorIteratorWrapper._init(self)
	return self
end

function jk.lang.DynamicObject.VectorIteratorWrapper:next()
	if not (self.vector ~= nil) then
		do return nil end
	end
	if self.position >= self.size then
		do return nil end
	end
	do
		local v = self.vector[self.position + 1]
		do self.position = self.position + 1 end
		do return v end
	end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:hasNext()
	if not (self.vector ~= nil) then
		do return false end
	end
	if not (self.position < self.size - 1) then
		do return false end
	end
	do return true end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:getVector()
	do return self.vector end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:setVector(v)
	self.vector = v
	do return self end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:getSize()
	do return self.size end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:setSize(v)
	self.size = v
	do return self end
end

function jk.lang.DynamicObject:iterate(object)
	if (_vm:get_variable_type(object) == 'string') then
		local v = _g.jk.lang.DynamicObject.StringIteratorWrapper._construct0(_g.jk.lang.DynamicObject.StringIteratorWrapper._create())
		do v:setIterator(_g.jk.lang.String:iterate(object)) end
		do return v end
	end
	if _util:is_buffer(object) then
		local v = _g.jk.lang.DynamicObject.BufferIteratorWrapper._construct0(_g.jk.lang.DynamicObject.BufferIteratorWrapper._create())
		do v:setBuffer(object) end
		do v:setSize(#object) end
		do return v end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(object) then
		local v = _g.jk.lang.DynamicObject.ArrayIteratorWrapper._construct0(_g.jk.lang.DynamicObject.ArrayIteratorWrapper._create())
		do v:setArray(object) end
		do v:setSize(#object) end
		do return v end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(object) then
		local v = _g.jk.lang.DynamicObject.VectorIteratorWrapper._construct0(_g.jk.lang.DynamicObject.VectorIteratorWrapper._create())
		do v:setVector(object) end
		do v:setSize(_g.jk.lang.Vector:getSize(object)) end
		do return v end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x < 1 end)(object) then
		do return _g.jk.lang.DynamicObject:iterate(_g.jk.lang.Map:getValues(object)) end
	end
	do return nil end
end

jk.lang.BooleanIterator = {}

jk.lang.ArrayObject = {}

jk.lang.ExceptionWithString = _g.jk.lang.Exception._create()
jk.lang.ExceptionWithString.__index = jk.lang.ExceptionWithString
_vm:set_metatable(jk.lang.ExceptionWithString, {
	__index = _g.jk.lang.Exception
})

function jk.lang.ExceptionWithString._create()
	local v = _vm:set_metatable({}, jk.lang.ExceptionWithString)
	return v
end

function jk.lang.ExceptionWithString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.ExceptionWithString'
	self['_isType.jk.lang.ExceptionWithString'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.exceptionMessage = nil
	self.stackTraceString = nil
end

function jk.lang.ExceptionWithString:_construct0()
	jk.lang.ExceptionWithString._init(self)
	do _g.jk.lang.Exception._construct0(self) end
	return self
end

function jk.lang.ExceptionWithString:forString(string, allowStackTrace)
	local v = _g.jk.lang.ExceptionWithString._construct0(_g.jk.lang.ExceptionWithString._create())
	do v:setExceptionMessage(string) end
	if allowStackTrace then
		do v:updateStackTrace() end
	end
	do return v end
end

function jk.lang.ExceptionWithString:updateStackTrace()
	do self:setStackTraceString(_g.jk.lang.StackTrace:generate()) end
end

function jk.lang.ExceptionWithString:toString()
	if not (self.stackTraceString ~= nil) then
		do return self.exceptionMessage end
	end
	do
		local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do v:appendString(self.exceptionMessage) end
		do
			local ss = self.stackTraceString
			if _g.jk.lang.String:getLength(ss) > 0 then
				if v:count() > 0 then
					do v:appendCharacter(10) end
				end
				do v:appendString(ss) end
			end
			do return v:toString() end
		end
	end
end

function jk.lang.ExceptionWithString:getExceptionMessage()
	do return self.exceptionMessage end
end

function jk.lang.ExceptionWithString:setExceptionMessage(v)
	self.exceptionMessage = v
	do return self end
end

function jk.lang.ExceptionWithString:getStackTraceString()
	do return self.stackTraceString end
end

function jk.lang.ExceptionWithString:setStackTraceString(v)
	self.stackTraceString = v
	do return self end
end

jk.lang.StringSet = {}
jk.lang.StringSet.__index = jk.lang.StringSet
_vm:set_metatable(jk.lang.StringSet, {})

function jk.lang.StringSet._create()
	local v = _vm:set_metatable({}, jk.lang.StringSet)
	return v
end

function jk.lang.StringSet:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.StringSet'
	self['_isType.jk.lang.StringSet'] = true
	self.data = nil
end

function jk.lang.StringSet:_construct0()
	jk.lang.StringSet._init(self)
	self.data = {}
	return self
end

function jk.lang.StringSet:add(string)
	do _g.jk.lang.Map:setValue(self.data, string, _g.jk.lang.Boolean:asObject(true)) end
end

function jk.lang.StringSet:remove(string)
	do _g.jk.lang.Map:remove(self.data, string) end
end

function jk.lang.StringSet:count()
	do return _g.jk.lang.Map:count(self.data) end
end

function jk.lang.StringSet:contains(string)
	if _g.jk.lang.Map:getValue(self.data, string) ~= nil then
		do return true end
	end
	do return false end
end

function jk.lang.StringSet:getAll()
	local v = _g.jk.lang.Map:getKeys(self.data)
	do return v end
end

function jk.lang.StringSet:clear()
	do _g.jk.lang.Map:clear(self.data) end
end

jk.lang.Array = {}
jk.lang.Array.__index = jk.lang.Array
_vm:set_metatable(jk.lang.Array, {})

function jk.lang.Array._create()
	local v = _vm:set_metatable({}, jk.lang.Array)
	return v
end

function jk.lang.Array:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Array'
	self['_isType.jk.lang.Array'] = true
end

function jk.lang.Array:_construct0()
	jk.lang.Array._init(self)
	return self
end

jk.lang.Array.MyArrayObject = {}
jk.lang.Array.MyArrayObject.__index = jk.lang.Array.MyArrayObject
_vm:set_metatable(jk.lang.Array.MyArrayObject, {})

function jk.lang.Array.MyArrayObject._create()
	local v = _vm:set_metatable({}, jk.lang.Array.MyArrayObject)
	return v
end

function jk.lang.Array.MyArrayObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Array.MyArrayObject'
	self['_isType.jk.lang.Array.MyArrayObject'] = true
	self['_isType.jk.lang.ArrayObject'] = true
	self['_isType.jk.lang.ObjectWithSize'] = true
	self.array = nil
end

function jk.lang.Array.MyArrayObject:_construct0()
	jk.lang.Array.MyArrayObject._init(self)
	return self
end

function jk.lang.Array.MyArrayObject:toArray()
	do return self.array end
end

function jk.lang.Array.MyArrayObject:getSize()
	do return #self.array end
end

function jk.lang.Array.MyArrayObject:getArray()
	do return self.array end
end

function jk.lang.Array.MyArrayObject:setArray(v)
	self.array = v
	do return self end
end

function jk.lang.Array:asObject(array)
	local v = _g.jk.lang.Array.MyArrayObject._construct0(_g.jk.lang.Array.MyArrayObject._create())
	do v:setArray(array) end
	do return v end
end

function jk.lang.Array:isEmpty(array)
	if array == nil then
		do return true end
	end
	if #array < 1 then
		do return true end
	end
	do return false end
end

function jk.lang.Array:isNotEmpty(array)
	do return not _g.jk.lang.Array:isEmpty(array) end
end

function jk.lang.Array:contains(array, element)
	if not (array ~= nil) then
		do return false end
	end
	if array ~= nil then
		local n = 0
		local m = #array
		do
			n = 0
			while n < m do
				local oo = array[n + 1]
				if oo ~= nil then
					if element == oo then
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function jk.lang.Array:toVector(array)
	do return _g.jk.lang.Vector:forArray(array) end
end

function jk.lang.Array:copyFrom(array, src, soffset, doffset, size)
	if not (array ~= nil) then
		do return end
	end
	if not (src ~= nil) then
		do return end
	end
	do
		local n = 0
		while n < size do
			array[doffset + n + 1] = src[soffset + n + 1]
			do n = n + 1 end
		end
	end
end

jk.lang.Reflection = {}
jk.lang.Reflection.__index = jk.lang.Reflection
_vm:set_metatable(jk.lang.Reflection, {})

function jk.lang.Reflection._create()
	local v = _vm:set_metatable({}, jk.lang.Reflection)
	return v
end

function jk.lang.Reflection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Reflection'
	self['_isType.jk.lang.Reflection'] = true
end

function jk.lang.Reflection:_construct0()
	jk.lang.Reflection._init(self)
	return self
end

function jk.lang.Reflection:createClassInstance(qualifiedName)
	_io:write_to_stdout("[jk.lang.Reflection.createClassInstance] (Reflection.sling:30:2): Not implemented." .. "\n")
	do return nil end
end

function jk.lang.Reflection:callMethod(object, methodName, arguments)
	_io:write_to_stdout("[jk.lang.Reflection.callMethod] (Reflection.sling:37:2): Not implemented." .. "\n")
	do return nil end
end

function jk.lang.Reflection:getDataTypeInfo(variable)
	do return _vm:get_datatype_info(variable) end
end

function jk.lang.Reflection:isSameType(primary, other)
	if primary == nil and other == nil then
		do return true end
	end
	if primary == nil or other == nil then
		do return false end
	end
	do
		local ta = _vm:get_datatype_info(primary)
		local tb = _vm:get_datatype_info(other)
		if ta == tb then
			do return true end
		end
		do return false end
	end
end

function jk.lang.Reflection:isInstanceOf(object, type)
	if not (object ~= nil) then
		do return false end
	end
	do return _vm:is_instance_of(object, type) end
end

jk.lang.Integer = {}
jk.lang.Integer.__index = jk.lang.Integer
_vm:set_metatable(jk.lang.Integer, {})

function jk.lang.Integer._create()
	local v = _vm:set_metatable({}, jk.lang.Integer)
	return v
end

function jk.lang.Integer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Integer'
	self['_isType.jk.lang.Integer'] = true
	self['_isType.jk.lang.IntegerObject'] = true
	self.value = 0
end

function jk.lang.Integer:_construct0()
	jk.lang.Integer._init(self)
	return self
end

function jk.lang.Integer:forValue(value)
	do return _g.jk.lang.Integer:asObject(value) end
end

function jk.lang.Integer:asObject(integer)
	local v = _g.jk.lang.Integer._construct0(_g.jk.lang.Integer._create())
	do v:setValue(integer) end
	do return v end
end

function jk.lang.Integer:asInteger(obj)
	if not (obj ~= nil) then
		do return 0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _util:convert_to_integer(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		local oi = obj
		do return oi:toInteger() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = _util:convert_to_integer(obj)
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		local oi = obj
		do return oi:toLong() end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		do return _g.jk.lang.String:toInteger(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		do return _g.jk.lang.String:toInteger(obj:toString()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return _util:convert_to_integer(v) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		local od = obj
		do return _util:convert_to_integer(od:toDouble()) end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		if obj == true then
			do return 1 end
		end
		do return 0 end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		if obj:toBoolean() then
			do return 1 end
		end
		do return 0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return _util:convert_to_integer(v) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		local oc = obj
		do return _util:convert_to_integer(oc:toCharacter()) end
	end
	do return 0 end
end

function jk.lang.Integer:add(amount)
	self.value = self.value + amount
end

function jk.lang.Integer:toInteger()
	do return self.value end
end

function jk.lang.Integer:getValue()
	do return self.value end
end

function jk.lang.Integer:setValue(v)
	self.value = v
	do return self end
end

jk.lang.LongIntegerIterator = {}

jk.lang.Serializer = {}
jk.lang.Serializer.__index = jk.lang.Serializer
_vm:set_metatable(jk.lang.Serializer, {})

function jk.lang.Serializer._create()
	local v = _vm:set_metatable({}, jk.lang.Serializer)
	return v
end

function jk.lang.Serializer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Serializer'
	self['_isType.jk.lang.Serializer'] = true
end

function jk.lang.Serializer:_construct0()
	jk.lang.Serializer._init(self)
	return self
end

function jk.lang.Serializer:toBuffer(object)
	if not (object ~= nil) then
		do return nil end
	end
	do return _vm:serialize_object(object) end
end

function jk.lang.Serializer:fromBuffer(buffer)
	if not (buffer ~= nil) then
		do return nil end
	end
	do
		local oo = nil
		do oo = _vm:unserialize_object(buffer) end
		if not (oo ~= nil) then
			do return nil end
		end
		do _vm:set_metatable(oo, _vm:get_global(oo._qualifiedClassName)) end
		do return oo end
	end
end

jk.lang.RunnableFunction = {}
jk.lang.RunnableFunction.__index = jk.lang.RunnableFunction
_vm:set_metatable(jk.lang.RunnableFunction, {})

function jk.lang.RunnableFunction._create()
	local v = _vm:set_metatable({}, jk.lang.RunnableFunction)
	return v
end

function jk.lang.RunnableFunction:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.RunnableFunction'
	self['_isType.jk.lang.RunnableFunction'] = true
	self['_isType.jk.lang.Runnable'] = true
	self._function = nil
end

function jk.lang.RunnableFunction:_construct0()
	jk.lang.RunnableFunction._init(self)
	return self
end

function jk.lang.RunnableFunction:forFunction(_function)
	local v = _g.jk.lang.RunnableFunction._construct0(_g.jk.lang.RunnableFunction._create())
	do v:setFunction(_function) end
	do return v end
end

function jk.lang.RunnableFunction:run()
	if self._function ~= nil then
		do self._function() end
	end
end

function jk.lang.RunnableFunction:getFunction()
	do return self._function end
end

function jk.lang.RunnableFunction:setFunction(v)
	self._function = v
	do return self end
end

jk.lang.EventLoop = {}

jk.lang.KeyValueListForStrings = _g.jk.lang.KeyValueList._create()
jk.lang.KeyValueListForStrings.__index = jk.lang.KeyValueListForStrings
_vm:set_metatable(jk.lang.KeyValueListForStrings, {
	__index = _g.jk.lang.KeyValueList
})

function jk.lang.KeyValueListForStrings._create()
	local v = _vm:set_metatable({}, jk.lang.KeyValueListForStrings)
	return v
end

function jk.lang.KeyValueListForStrings:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.KeyValueListForStrings'
	self['_isType.jk.lang.KeyValueListForStrings'] = true
end

function jk.lang.KeyValueListForStrings:_construct0()
	jk.lang.KeyValueListForStrings._init(self)
	do _g.jk.lang.KeyValueList._construct0(self) end
	return self
end

jk.lang.Queue = {}
jk.lang.Queue.__index = jk.lang.Queue
_vm:set_metatable(jk.lang.Queue, {})

function jk.lang.Queue._create()
	local v = _vm:set_metatable({}, jk.lang.Queue)
	return v
end

function jk.lang.Queue:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Queue'
	self['_isType.jk.lang.Queue'] = true
	self.data = nil
end

function jk.lang.Queue:_construct0()
	jk.lang.Queue._init(self)
	self.data = {}
	return self
end

function jk.lang.Queue:clear()
	self.data = {}
end

function jk.lang.Queue:push(o)
	do _g.jk.lang.Vector:append(self.data, o) end
end

function jk.lang.Queue:pop()
	local sz = _g.jk.lang.Vector:getSize(self.data)
	if sz < 1 then
		do return nil end
	end
	do
		local v = _g.jk.lang.Vector:getAt(self.data, 0)
		do _g.jk.lang.Vector:remove(self.data, 0) end
		do return v end
	end
end

function jk.lang.Queue:peek()
	local sz = _g.jk.lang.Vector:getSize(self.data)
	if sz < 1 then
		do return nil end
	end
	do return _g.jk.lang.Vector:getAt(self.data, 0) end
end

function jk.lang.Queue:isEmpty()
	do return self:getSize() < 1 end
end

function jk.lang.Queue:getSize()
	do return _g.jk.lang.Vector:getSize(self.data) end
end

function jk.lang.Queue:getData()
	do return self.data end
end

function jk.lang.Queue:setData(v)
	self.data = v
	do return self end
end

jk.lang.TimeValue = {}
jk.lang.TimeValue.__index = jk.lang.TimeValue
_vm:set_metatable(jk.lang.TimeValue, {})

function jk.lang.TimeValue._create()
	local v = _vm:set_metatable({}, jk.lang.TimeValue)
	return v
end

function jk.lang.TimeValue:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.TimeValue'
	self['_isType.jk.lang.TimeValue'] = true
	self.seconds = 0
	self.microSeconds = 0
end

function jk.lang.TimeValue:_construct0()
	jk.lang.TimeValue._init(self)
	return self
end

function jk.lang.TimeValue:forSeconds(seconds)
	local v = _g.jk.lang.TimeValue._construct0(_g.jk.lang.TimeValue._create())
	v.seconds = seconds
	do return v end
end

function jk.lang.TimeValue:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(_g.jk.lang.String:forLongInteger(self.seconds)) end
	do sb:appendCharacter(46) end
	do sb:appendString(_g.jk.lang.String:forLongInteger(self.microSeconds)) end
	do return sb:toString() end
end

function jk.lang.TimeValue:dup()
	local v = _g.jk.lang.TimeValue._construct0(_g.jk.lang.TimeValue._create())
	do v:copyFrom(self) end
	do return v end
end

function jk.lang.TimeValue:reset()
	self.seconds = 0
	self.microSeconds = 0
end

function jk.lang.TimeValue:copyFrom(tv)
	self.seconds = tv.seconds
	self.microSeconds = tv.microSeconds
end

function jk.lang.TimeValue:set(tv)
	self.seconds = tv:getSeconds()
	self.microSeconds = tv:getMicroSeconds()
end

function jk.lang.TimeValue:setSeconds(value)
	self.seconds = value
end

function jk.lang.TimeValue:setMilliSeconds(value)
	self.microSeconds = value * 1000
end

function jk.lang.TimeValue:setMicroSeconds(value)
	self.microSeconds = value
end

function jk.lang.TimeValue:add(s, us)
	local ts = self:getSeconds() + s
	local tus = self:getMicroSeconds() + us
	if tus > 1000000 then
		ts = ts + _util:convert_to_integer(tus / 1000000)
		tus = _util:convert_to_integer(tus % 1000000)
	end
	while tus < 0 do
		do ts = ts - 1 end
		tus = tus + 1000000
	end
	do
		local v = _g.jk.lang.TimeValue._construct0(_g.jk.lang.TimeValue._create())
		v.seconds = ts
		v.microSeconds = tus
		do return v end
	end
end

function jk.lang.TimeValue:addTimeValue(tv)
	if tv == nil then
		do return self end
	end
	do return self:add(tv:getSeconds(), tv:getMicroSeconds()) end
end

function jk.lang.TimeValue:subtract(tv)
	if tv == nil then
		do return self end
	end
	do return self:add(-tv:getSeconds(), -tv:getMicroSeconds()) end
end

function jk.lang.TimeValue:asMicroSeconds()
	do return self:getSeconds() * 1000000 + self:getMicroSeconds() end
end

function jk.lang.TimeValue:diff(a, b)
	if a == nil and b == nil then
		do return 0 end
	end
	if a == nil then
		do return b:asMicroSeconds() end
	end
	if b == nil then
		do return a:asMicroSeconds() end
	end
	do
		local r = (a.seconds - b.seconds) * 1000000 + (a.microSeconds - b.microSeconds)
		do return r end
	end
end

function jk.lang.TimeValue:diffDouble(a, b)
	do return _g.jk.lang.TimeValue:diff(a, b) / 1000000.0 end
end

function jk.lang.TimeValue:getSeconds()
	do return self.seconds end
end

function jk.lang.TimeValue:getMicroSeconds()
	do return self.microSeconds end
end

jk.lang.BufferDataReceiver = {}

jk.lang.Iterateable = {}

jk.lang.VectorObject = {}

jk.lang.ObjectWrapper = {}
jk.lang.ObjectWrapper.__index = jk.lang.ObjectWrapper
_vm:set_metatable(jk.lang.ObjectWrapper, {})

function jk.lang.ObjectWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.ObjectWrapper)
	return v
end

function jk.lang.ObjectWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.ObjectWrapper'
	self['_isType.jk.lang.ObjectWrapper'] = true
	self.value = nil
end

function jk.lang.ObjectWrapper:_construct0()
	jk.lang.ObjectWrapper._init(self)
	return self
end

function jk.lang.ObjectWrapper:getValue()
	do return self.value end
end

function jk.lang.ObjectWrapper:setValue(v)
	self.value = v
	do return self end
end

jk.lang.BufferObject = {}

jk.lang.Buffer = {}
jk.lang.Buffer.__index = jk.lang.Buffer
_vm:set_metatable(jk.lang.Buffer, {})

function jk.lang.Buffer._create()
	local v = _vm:set_metatable({}, jk.lang.Buffer)
	return v
end

function jk.lang.Buffer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Buffer'
	self['_isType.jk.lang.Buffer'] = true
end

function jk.lang.Buffer:_construct0()
	jk.lang.Buffer._init(self)
	return self
end

jk.lang.Buffer.MyBufferObject = {}
jk.lang.Buffer.MyBufferObject.__index = jk.lang.Buffer.MyBufferObject
_vm:set_metatable(jk.lang.Buffer.MyBufferObject, {})

function jk.lang.Buffer.MyBufferObject._create()
	local v = _vm:set_metatable({}, jk.lang.Buffer.MyBufferObject)
	return v
end

function jk.lang.Buffer.MyBufferObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Buffer.MyBufferObject'
	self['_isType.jk.lang.Buffer.MyBufferObject'] = true
	self['_isType.jk.lang.BufferObject'] = true
	self.buffer = nil
end

function jk.lang.Buffer.MyBufferObject:_construct0()
	jk.lang.Buffer.MyBufferObject._init(self)
	return self
end

function jk.lang.Buffer.MyBufferObject:toBuffer()
	do return self.buffer end
end

function jk.lang.Buffer.MyBufferObject:getBuffer()
	do return self.buffer end
end

function jk.lang.Buffer.MyBufferObject:setBuffer(v)
	self.buffer = v
	do return self end
end

function jk.lang.Buffer:asObject(buffer)
	local v = _g.jk.lang.Buffer.MyBufferObject._construct0(_g.jk.lang.Buffer.MyBufferObject._create())
	do v:setBuffer(buffer) end
	do return v end
end

function jk.lang.Buffer:asBuffer(obj)
	if not (obj ~= nil) then
		do return nil end
	end
	if _util:is_buffer(obj) then
		do return obj end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BufferObject') ~= nil) then
		local bo = obj
		do return bo:toBuffer() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.Buffer:forInt32BE(_util:convert_to_integer(obj)) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.Buffer:forInt64BE(_util:convert_to_integer(obj)) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.Buffer:forDouble64BE(obj) end
	end
	do return nil end
end

function jk.lang.Buffer:forInt8Array(buf)
	if not (buf ~= nil) then
		do return nil end
	end
	do
		local sz = #buf
		local v = _util:allocate_buffer(sz)
		do
			local n = 0
			while n < sz do
				v[n + 1] = buf[n + 1]
				do n = n + 1 end
			end
		end
		do return v end
	end
end

function jk.lang.Buffer:toInt8Array(buf)
	if not (buf ~= nil) then
		do return nil end
	end
	do
		local sz = #buf
		local v = _vm:allocate_array(sz)
		do
			local n = 0
			while n < sz do
				v[n + 1] = buf[n + 1]
				do n = n + 1 end
			end
		end
		do return v end
	end
end

function jk.lang.Buffer:getSubBuffer(buffer, offset, size, alwaysNewBuffer)
	if alwaysNewBuffer == false and offset == 0 and size < 0 then
		do return buffer end
	end
	do
		local bsz = _g.jk.lang.Buffer:getSize(buffer)
		local sz = size
		if sz < 0 then
			sz = bsz - offset
		end
		if alwaysNewBuffer == false and offset == 0 and sz == bsz then
			do return buffer end
		end
		if sz < 1 then
			do return nil end
		end
		do
			local v = _util:allocate_buffer(sz)
			do _g.jk.lang.Buffer:copyFrom(v, buffer, offset, 0, sz) end
			do return v end
		end
	end
end

function jk.lang.Buffer:getInt8(buffer, offset)
	if not (buffer ~= nil) then
		do return 0 end
	end
	do return buffer[offset+1] end
end

function jk.lang.Buffer:copyFrom(array, src, soffset, doffset, size)
	if not (array ~= nil) then
		do return end
	end
	if not (src ~= nil) then
		do return end
	end
	do _util:copy_buffer_bytes(src, array, soffset, doffset, size) end
end

function jk.lang.Buffer:getInt16LE(buffer, offset)
	if not (buffer ~= nil) then
		do return 0 end
	end
	do
		local b1 = buffer[offset + 1]
		local b2 = buffer[offset + 1 + 1]
		do return _util:network_bytes_to_host16(b2, b1) end
	end
end

function jk.lang.Buffer:getInt16BE(buffer, offset)
	if not (buffer ~= nil) then
		do return 0 end
	end
	do
		local b1 = buffer[offset + 1]
		local b2 = buffer[offset + 1 + 1]
		do return _util:network_bytes_to_host16(b1, b2) end
	end
end

function jk.lang.Buffer:getInt32LE(buffer, offset)
	local b1 = buffer[offset + 1]
	local b2 = buffer[offset + 1 + 1]
	local b3 = buffer[offset + 2 + 1]
	local b4 = buffer[offset + 3 + 1]
	do return _util:network_bytes_to_host32(b4, b3, b2, b1) end
end

function jk.lang.Buffer:getInt32BE(buffer, offset)
	local b1 = buffer[offset + 1]
	local b2 = buffer[offset + 1 + 1]
	local b3 = buffer[offset + 2 + 1]
	local b4 = buffer[offset + 3 + 1]
	do return _util:network_bytes_to_host32(b1, b2, b3, b4) end
end

function jk.lang.Buffer:getInt64LE(buffer, offset)
	local b1 = buffer[offset + 1]
	local b2 = buffer[offset + 1 + 1]
	local b3 = buffer[offset + 2 + 1]
	local b4 = buffer[offset + 3 + 1]
	local b5 = buffer[offset + 4 + 1]
	local b6 = buffer[offset + 5 + 1]
	local b7 = buffer[offset + 6 + 1]
	local b8 = buffer[offset + 7 + 1]
	do return _util:network_bytes_to_host64(b8, b7, b6, b5, b4, b3, b2, b1) end
end

function jk.lang.Buffer:getInt64BE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getInt64BE] (Buffer.sling:514:2): Not implemented" .. "\n")
	do return 0 end
end

function jk.lang.Buffer:getFloatLE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getFloatLE] (Buffer.sling:521:2): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Buffer:getFloatBE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getFloatBE] (Buffer.sling:528:2): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Buffer:getDoubleLE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getDoubleLE] (Buffer.sling:535:2): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Buffer:getDoubleBE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getDoubleBE] (Buffer.sling:542:2): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Buffer:forInt8(number)
	local v = _util:allocate_buffer(1)
	v[0 + 1] = _vm:bitwise_and(number, 255)
	do return v end
end

function jk.lang.Buffer:forInt16BE(number)
	do return _util:integer_to_buffer16(number, 0) end
end

function jk.lang.Buffer:forInt16LE(number)
	do return _util:integer_to_buffer16(number, 1) end
end

function jk.lang.Buffer:forInt32BE(number)
	do return _util:integer_to_buffer32(number, 0) end
end

function jk.lang.Buffer:forInt32LE(number)
	do return _util:integer_to_buffer32(number, 1) end
end

function jk.lang.Buffer:forInt64BE(number)
	do return _util:integer_to_buffer64(number, 0) end
end

function jk.lang.Buffer:forInt64LE(number)
	do return _util:integer_to_buffer64(number, 1) end
end

function jk.lang.Buffer:forFloat32BE(number)
	do return _util:float_to_buffer32(number, 0) end
end

function jk.lang.Buffer:forFloat32LE(number)
	do return _util:float_to_buffer32(number, 1) end
end

function jk.lang.Buffer:forDouble64BE(number)
	do return _util:double_to_buffer64(number, 0) end
end

function jk.lang.Buffer:forDouble64LE(number)
	do return _util:double_to_buffer64(number, 1) end
end

function jk.lang.Buffer:getSize(buffer)
	if buffer == nil then
		do return 0 end
	end
	do return #buffer end
end

function jk.lang.Buffer:getByte(buffer, offset)
	do return _g.jk.lang.Buffer:getInt8(buffer, offset) end
end

function jk.lang.Buffer:setByte(buffer, offset, value)
	if not (buffer ~= nil) then
		do return end
	end
	do buffer[offset+1] = value end
end

function jk.lang.Buffer:allocate(size)
	do return _util:allocate_buffer(size) end
end

function jk.lang.Buffer:resize(buffer, newSize)
	if newSize < 1 then
		do return nil end
	end
	if not (buffer ~= nil) then
		do return _g.jk.lang.Buffer:allocate(newSize) end
	end
	if #buffer == newSize then
		do return buffer end
	end
	do
		local oldSize = 0
		if buffer ~= nil then
			oldSize = #buffer
		end
		do
			local v = _util:allocate_buffer(newSize)
			if newSize >= oldSize then
				if oldSize > 0 then
					do _g.jk.lang.Buffer:copyFrom(v, buffer, 0, 0, oldSize) end
				end
			else
				do _g.jk.lang.Buffer:copyFrom(v, buffer, 0, 0, newSize) end
			end
			do return v end
		end
	end
end

function jk.lang.Buffer:append(original, toAppend, size)
	if toAppend == nil or size == 0 then
		do return original end
	end
	do
		local sz = size
		local os = _g.jk.lang.Buffer:getSize(original)
		local oas = _g.jk.lang.Buffer:getSize(toAppend)
		if sz >= 0 then
			oas = sz
		end
		do
			local nl = os + oas
			local nb = _g.jk.lang.Buffer:resize(original, nl)
			do _g.jk.lang.Buffer:copyFrom(nb, toAppend, 0, os, oas) end
			do return nb end
		end
	end
end

function jk.lang.Buffer:forHexString(str)
	if str == nil or _util:convert_to_integer(_g.jk.lang.String:getLength(str) % 2) ~= 0 then
		do return nil end
	end
	do
		local sb = nil
		local b = _g.jk.lang.Buffer:allocate(_util:convert_to_integer(_g.jk.lang.String:getLength(str) / 2))
		local n = 0
		local it = _g.jk.lang.String:iterate(str)
		while it ~= nil do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if sb == nil then
				sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			if c >= 97 and c <= 102 or (c >= 65 and c <= 70) or (c >= 48 and c <= 57) then
				do sb:appendCharacter(c) end
				if sb:count() == 2 then
					do _g.jk.lang.Buffer:setByte(b, (function() local v = n n = n + 1 return v end)(), _g.jk.lang.String:toIntegerFromHex(sb:toString())) end
					do sb:clear() end
				end
			else
				do return nil end
			end
		end
		do return b end
	end
end

jk.lang.BooleanObject = {}

jk.lang.Closable = {}

jk.lang.DynamicMap = {}
jk.lang.DynamicMap.__index = jk.lang.DynamicMap
_vm:set_metatable(jk.lang.DynamicMap, {})

function jk.lang.DynamicMap._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicMap)
	return v
end

function jk.lang.DynamicMap:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicMap'
	self['_isType.jk.lang.DynamicMap'] = true
	self['_isType.jk.lang.Duplicateable'] = true
	self['_isType.jk.lang.Iterateable'] = true
	self.map = nil
end

function jk.lang.DynamicMap:asDynamicMap(object)
	if not (object ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(object, '_isType.jk.lang.DynamicMap') ~= nil) then
		do return object end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x < 1 end)(object) then
		do return _g.jk.lang.DynamicMap:forObjectMap(object) end
	end
	do return nil end
end

function jk.lang.DynamicMap:forObjectMap(map)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if map ~= nil then
		local it = _g.jk.lang.Map:iterateKeys(map)
		while it ~= nil do
			local key = it:next()
			if key == nil then
				do break end
			end
			if (_vm:get_variable_type(key) == 'string') == false then
				goto _continue1
			end
			do v:setObject(key, _g.jk.lang.Map:getValue(map, key)) end
			::_continue1::
		end
	end
	do return v end
end

function jk.lang.DynamicMap:forStringMap(map)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if map ~= nil then
		local it = _g.jk.lang.Map:iterateKeys(map)
		while it ~= nil do
			local key = it:next()
			if key == nil then
				do break end
			end
			do v:setString(key, _g.jk.lang.Map:getValue(map, key)) end
		end
	end
	do return v end
end

function jk.lang.DynamicMap:forDynamicMaps(map1, map2)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:mergeFrom(map1) end
	do v:mergeFrom(map2) end
	do return v end
end

function jk.lang.DynamicMap:forDynamicMap(map)
	if not (map ~= nil) then
		do return nil end
	end
	do return map:duplicateMap() end
end

function jk.lang.DynamicMap:_construct0()
	jk.lang.DynamicMap._init(self)
	self.map = {}
	return self
end

function jk.lang.DynamicMap:asMap()
	do return self.map end
end

function jk.lang.DynamicMap:asStringMap()
	do return self:toStringMap() end
end

function jk.lang.DynamicMap:toStringMap()
	local v = {}
	local it = self:iterateKeys()
	while it ~= nil do
		local key = it:next()
		if not (key ~= nil) then
			do break end
		end
		do _g.jk.lang.Map:set(v, key, self:getString(key, nil)) end
	end
	do return v end
end

function jk.lang.DynamicMap:toObjectMap()
	local v = {}
	local it = self:iterateKeys()
	while it ~= nil do
		local key = it:next()
		if not (key ~= nil) then
			do break end
		end
		do _g.jk.lang.Map:set(v, key, self:getString(key, nil)) end
	end
	do return v end
end

function jk.lang.DynamicMap:duplicate()
	do return self:duplicateMap() end
end

function jk.lang.DynamicMap:duplicateMap()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	local it = self:iterateKeys()
	while it ~= nil do
		local key = it:next()
		if key == nil then
			do break end
		end
		do v:setObject(key, self:get(key)) end
	end
	do return v end
end

function jk.lang.DynamicMap:mergeFrom(other)
	if other == nil then
		do return self end
	end
	do
		local it = other:iterateKeys()
		while it ~= nil do
			local key = it:next()
			if key == nil then
				do break end
			end
			do self:setObject(key, other:get(key)) end
		end
		do return self end
	end
end

function jk.lang.DynamicMap:setObject(key, value)
	if key ~= nil then
		self.map[key] = value
	end
	do return self end
end

function jk.lang.DynamicMap:setString(key, value)
	if key ~= nil then
		self.map[key] = value
	end
	do return self end
end

function jk.lang.DynamicMap:setBuffer(key, value)
	if not (value ~= nil) then
		self.map[key] = nil
		do return self end
	end
	do return self:setObject(key, _g.jk.lang.Buffer:asObject(value)) end
end

function jk.lang.DynamicMap:setInteger(key, value)
	do return self:setObject(key, _g.jk.lang.Integer:asObject(value)) end
end

function jk.lang.DynamicMap:setLong(key, value)
	do return self:setObject(key, _g.jk.lang.LongInteger:asObject(value)) end
end

function jk.lang.DynamicMap:setBoolean(key, value)
	do return self:setObject(key, _g.jk.lang.Boolean:asObject(value)) end
end

function jk.lang.DynamicMap:setDouble(key, value)
	do return self:setObject(key, _g.jk.lang.Double:asObject(value)) end
end

function jk.lang.DynamicMap:get(key)
	do return _g.jk.lang.Map:getValue(self.map, key) end
end

function jk.lang.DynamicMap:getString(key, defval)
	local v = _g.jk.lang.String:asString(self:get(key))
	if v == nil then
		do return defval end
	end
	do return v end
end

function jk.lang.DynamicMap:getInteger(key, defval)
	local vv = self:get(key)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Integer:asInteger(vv) end
end

function jk.lang.DynamicMap:getLongInteger(key, defval)
	local vv = self:get(key)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.LongInteger:asLong(vv) end
end

function jk.lang.DynamicMap:getBoolean(key, defval)
	local vv = self:get(key)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Boolean:asBoolean(vv, false) end
end

function jk.lang.DynamicMap:getDouble(key, defval)
	local vv = self:get(key)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Double:asDouble(vv) end
end

function jk.lang.DynamicMap:getBuffer(key)
	local vv = self:get(key)
	if not (vv ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Buffer:asBuffer(vv) end
end

function jk.lang.DynamicMap:getDynamicVector(key)
	local vv = _vm:to_table_with_key(self:get(key), '_isType.jk.lang.DynamicVector')
	if vv ~= nil then
		do return vv end
	end
	do
		local v = self:getVector(key)
		if v ~= nil then
			do return _g.jk.lang.DynamicVector:forObjectVector(v) end
		end
		do return nil end
	end
end

function jk.lang.DynamicMap:getVector(key)
	local val = self:get(key)
	if not (val ~= nil) then
		do return nil end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(val) then
		do return val end
	end
	if (_vm:to_table_with_key(val, '_isType.jk.lang.VectorObject') ~= nil) then
		local vo = val
		local vv = vo:toVector()
		do return vv end
	end
	do return nil end
end

function jk.lang.DynamicMap:getDynamicMap(key)
	do return _vm:to_table_with_key(self:get(key), '_isType.jk.lang.DynamicMap') end
end

function jk.lang.DynamicMap:getKeys()
	local v = _g.jk.lang.Map:getKeys(self.map)
	do return v end
end

function jk.lang.DynamicMap:getValues()
	local v = _g.jk.lang.Map:getValues(self.map)
	do return v end
end

function jk.lang.DynamicMap:iterate()
	local v = _g.jk.lang.Map:iterateKeys(self.map)
	do return v end
end

function jk.lang.DynamicMap:iterateKeys()
	local v = _g.jk.lang.Map:iterateKeys(self.map)
	do return v end
end

function jk.lang.DynamicMap:iterateValues()
	local v = _g.jk.lang.Map:iterateValues(self.map)
	do return v end
end

function jk.lang.DynamicMap:remove(key)
	do _g.jk.lang.Map:remove(self.map, key) end
end

function jk.lang.DynamicMap:clear()
	do _g.jk.lang.Map:clear(self.map) end
end

function jk.lang.DynamicMap:getCount()
	do return _g.jk.lang.Map:count(self.map) end
end

function jk.lang.DynamicMap:containsKey(key)
	do return _g.jk.lang.Map:containsKey(self.map, key) end
end

jk.lang.Map = {}
jk.lang.Map.__index = jk.lang.Map
_vm:set_metatable(jk.lang.Map, {})

function jk.lang.Map._create()
	local v = _vm:set_metatable({}, jk.lang.Map)
	return v
end

function jk.lang.Map:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Map'
	self['_isType.jk.lang.Map'] = true
end

function jk.lang.Map:_construct0()
	jk.lang.Map._init(self)
	return self
end

jk.lang.Map.MyMapObject = {}
jk.lang.Map.MyMapObject.__index = jk.lang.Map.MyMapObject
_vm:set_metatable(jk.lang.Map.MyMapObject, {})

function jk.lang.Map.MyMapObject._create()
	local v = _vm:set_metatable({}, jk.lang.Map.MyMapObject)
	return v
end

function jk.lang.Map.MyMapObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Map.MyMapObject'
	self['_isType.jk.lang.Map.MyMapObject'] = true
	self['_isType.jk.lang.MapObject'] = true
	self.map = nil
end

function jk.lang.Map.MyMapObject:_construct0()
	jk.lang.Map.MyMapObject._init(self)
	return self
end

function jk.lang.Map.MyMapObject:toMap()
	do return self.map end
end

function jk.lang.Map.MyMapObject:getMap()
	do return self.map end
end

function jk.lang.Map.MyMapObject:setMap(v)
	self.map = v
	do return self end
end

function jk.lang.Map:asObject(map)
	if not (map ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.lang.Map.MyMapObject._construct0(_g.jk.lang.Map.MyMapObject._create())
		do v:setMap(map) end
		do return v end
	end
end

function jk.lang.Map:asMap(o)
	if not (o ~= nil) then
		do return nil end
	end
	do return nil end
end

function jk.lang.Map:getWithDefault(map, key, ddf)
	if map == nil or key == nil then
		do return ddf end
	end
	if _g.jk.lang.Map:containsKey(map, key) == false then
		do return ddf end
	end
	do return _g.jk.lang.Map:getValue(map, key) end
end

function jk.lang.Map:get(map, key)
	do return _g.jk.lang.Map:getValue(map, key) end
end

function jk.lang.Map:getValue(map, key)
	if map == nil or key == nil then
		do return nil end
	end
	do return map[key] end
end

function jk.lang.Map:set(data, key, val)
	if not (data ~= nil) then
		do return false end
	end
	if not (key ~= nil) then
		do return false end
	end
	data[key] = val
	do return true end
end

function jk.lang.Map:setValue(data, key, val)
	do return _g.jk.lang.Map:set(data, key, val) end
end

function jk.lang.Map:remove(data, key)
	if not (data ~= nil) then
		do return end
	end
	if not (key ~= nil) then
		do return end
	end
	do data[key] = nil end
end

function jk.lang.Map:count(data)
	if data == nil then
		do return 0 end
	end
	do return _g.jk.lang.Vector:getSize(_g.jk.lang.Map:getKeys(data)) end
end

function jk.lang.Map:containsKey(data, key)
	if not (data ~= nil) then
		do return false end
	end
	if not (key ~= nil) then
		do return false end
	end
	do
		local array = _g.jk.lang.Map:getKeys(data)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local kk = array[n + 1]
					if kk ~= nil then
						if key == kk then
							do return true end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function jk.lang.Map:containsValue(data, val)
	if not (data ~= nil) then
		do return false end
	end
	if not (val ~= nil) then
		do return false end
	end
	do
		local array = _g.jk.lang.Map:getValues(data)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local vv = array[n + 1]
					if vv ~= nil then
						if val == vv then
							do return true end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function jk.lang.Map:clear(data)
	if not (data ~= nil) then
		do return end
	end
	do _vm:clear_table(data) end
end

function jk.lang.Map:dup(data)
	if not (data ~= nil) then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.Map.dup] (Map.sling:372:3): Not implemented" .. "\n")
	do return nil end
end

function jk.lang.Map:getKeys(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local v = nil
		do v = _vm:get_table_keys(data) end
		do return v end
	end
end

function jk.lang.Map:getValues(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local v = nil
		do v = _vm:get_table_values(data) end
		do return v end
	end
end

function jk.lang.Map:iterateKeys(data)
	do return _g.jk.lang.Vector:iterate(_g.jk.lang.Map:getKeys(data)) end
end

function jk.lang.Map:iterateValues(data)
	do return _g.jk.lang.Vector:iterate(_g.jk.lang.Map:getValues(data)) end
end

jk.lang.DoubleIterator = {}

jk.lang.DynamicMapObject = {}

jk.lang.String = {}
jk.lang.String.__index = jk.lang.String
_vm:set_metatable(jk.lang.String, {})

function jk.lang.String._create()
	local v = _vm:set_metatable({}, jk.lang.String)
	return v
end

function jk.lang.String:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.String'
	self['_isType.jk.lang.String'] = true
end

function jk.lang.String:_construct0()
	jk.lang.String._init(self)
	return self
end

function jk.lang.String:asString(obj)
	if not (obj ~= nil) then
		do return nil end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		do return obj end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		local os = obj
		do return os:toString() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.String:forInteger(_util:convert_to_integer(obj)) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		do return _g.jk.lang.String:forInteger(obj:toInteger()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.String:forLongInteger(_util:convert_to_integer(obj)) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		do return _g.jk.lang.String:forLongInteger(obj:toLong()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.String:forDouble(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		do return _g.jk.lang.String:forDouble(obj:toDouble()) end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		do return _g.jk.lang.String:forBoolean(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		do return _g.jk.lang.String:forBoolean(obj:toBoolean()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.String:forCharacter(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		do return _g.jk.lang.String:forCharacter(obj:toCharacter()) end
	end
	if _util:is_buffer(obj) then
		do return _g.jk.lang.String:forBufferHex(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BufferObject') ~= nil) then
		local v = obj:toBuffer()
		if not (v ~= nil) then
			do return "" end
		end
		do return _g.jk.lang.String:forBufferHex(v) end
	end
	do return nil end
end

function jk.lang.String:forObject(obj)
	do return _g.jk.lang.String:asString(obj) end
end

function jk.lang.String:safeString(str)
	if not (str ~= nil) then
		do return "" end
	end
	do return str end
end

function jk.lang.String:isEmpty(str)
	if not (str ~= nil) then
		do return true end
	end
	if _util:get_string_length(str) < 1 then
		do return true end
	end
	do return false end
end

function jk.lang.String:isNotEmpty(str)
	do return not _g.jk.lang.String:isEmpty(str) end
end

function jk.lang.String:forBuffer(data, encoding)
	if not (data ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:equalsIgnoreCase("UTF8", encoding) or _g.jk.lang.String:equalsIgnoreCase("UTF-8", encoding) then
		do return _g.jk.lang.String:forUTF8Buffer(data) end
	end
	if _g.jk.lang.String:equalsIgnoreCase("UCS2", encoding) or _g.jk.lang.String:equalsIgnoreCase("UCS-2", encoding) then
		do return _g.jk.lang.String:forUCS2Buffer(data) end
	end
	if _g.jk.lang.String:equalsIgnoreCase("ASCII", encoding) then
		do return _g.jk.lang.String:forASCIIBuffer(data) end
	end
	do return nil end
end

function jk.lang.String:forASCIIBuffer(data)
	if not (data ~= nil) then
		do return nil end
	end
	do return _util:convert_buffer_ascii_to_string(data) end
end

function jk.lang.String:forUTF8Buffer(data)
	if not (data ~= nil) then
		do return nil end
	end
	do return _util:convert_buffer_to_string(data) end
end

function jk.lang.String:forUCS2Buffer(data)
	if data == nil then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.String.forUCS2Buffer] (String.sling:312:3): Not implemented." .. "\n")
	do return nil end
end

function jk.lang.String:forCharArray(chars, offset, count)
	if not (chars ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local sz = #chars
		do
			local n = 0
			while n < count and n + offset < sz do
				do sb:appendCharacter(chars[n + offset + 1]) end
				do n = n + 1 end
			end
		end
		do return sb:toString() end
	end
end

function jk.lang.String:forBoolean(vv)
	if vv == true then
		do return "true" end
	end
	do return "false" end
end

function jk.lang.String:forInteger(vv)
	do return _util:create_decimal_string_for_integer(vv) end
end

function jk.lang.String:forLongInteger(vv)
	do return _util:create_decimal_string_for_integer(vv) end
end

function jk.lang.String:forIntegerWithPadding(vv, length, paddingString)
	local r = _g.jk.lang.String:forInteger(vv)
	if not (r ~= nil) then
		do return nil end
	end
	do
		local ll = _g.jk.lang.String:getLength(r)
		if ll >= length then
			do return r end
		end
		do
			local ps = paddingString
			if ps == nil then
				ps = "0"
			end
			do
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				local n = 0
				do
					n = 0
					while n < length - ll do
						do sb:appendString(ps) end
						do n = n + 1 end
					end
				end
				do sb:appendString(r) end
				do return sb:toString() end
			end
		end
	end
end

function jk.lang.String:forIntegerHex(vv, minlength)
	local v = nil
	v = _util:create_hex_string_for_integer(vv)
	if not (v ~= nil) then
		do return nil end
	end
	if minlength > 0 then
		while _g.jk.lang.String:getLength(v) < minlength do
			v = "0" .. _g.jk.lang.String:safeString(v)
		end
	end
	do return v end
end

function jk.lang.String:forLongIntegerHex(vv, minlength)
	local v = nil
	v = _util:create_hex_string_for_integer(vv)
	if not (v ~= nil) then
		do return nil end
	end
	if minlength > 0 then
		while _g.jk.lang.String:getLength(v) < minlength do
			v = "0" .. _g.jk.lang.String:safeString(v)
		end
	end
	do return v end
end

function jk.lang.String:forIntegerOctal(vv)
	local v = nil
	v = _util:create_octal_string_for_integer(vv)
	do return v end
end

function jk.lang.String:forIntegerBinary(vv)
	local v = nil
	_io:write_to_stdout("[jk.lang.String.forIntegerBinary] (String.sling:606:3): Not implemented" .. "\n")
	do return nil end
end

function jk.lang.String:forBufferHex(buffer)
	local size = _g.jk.lang.Buffer:getSize(buffer)
	if not (size ~= 0) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local p = 0
		while p < size do
			local s = _g.jk.lang.String:forIntegerHex(_g.jk.lang.Buffer:getByte(buffer, p), 0)
			if _g.jk.lang.String:getLength(s) < 2 then
				do sb:appendCharacter(48) end
			end
			do sb:appendString(s) end
			do p = p + 1 end
		end
		do return sb:toString() end
	end
end

function jk.lang.String:forCharacter(vv)
	if vv < 128 then
		do return _util:create_string_for_byte(vv) end
	end
	if vv < 2048 then
		local v1 = _vm:bitwise_or(192, _vm:bitwise_right_shift(vv, 6))
		local v2 = _vm:bitwise_or(128, _vm:bitwise_and(vv, 63))
		do return _util:create_string_for_byte(v1) .. _util:create_string_for_byte(v2) end
	end
	if vv < 65536 then
		local v1 = _vm:bitwise_or(224, _vm:bitwise_right_shift(vv, 12))
		local v2 = _vm:bitwise_or(128, _vm:bitwise_and(_vm:bitwise_right_shift(vv, 6), 63))
		local v3 = _vm:bitwise_or(128, _vm:bitwise_and(vv, 63))
		do return _util:create_string_for_byte(v1) .. _util:create_string_for_byte(v2) .. _util:create_string_for_byte(v3) end
	end
	do
		local v1 = _vm:bitwise_or(240, _vm:bitwise_right_shift(vv, 18))
		local v2 = _vm:bitwise_or(128, _vm:bitwise_and(_vm:bitwise_right_shift(vv, 12), 63))
		local v3 = _vm:bitwise_or(128, _vm:bitwise_and(_vm:bitwise_right_shift(vv, 6), 63))
		local v4 = _vm:bitwise_or(128, _vm:bitwise_and(vv, 63))
		do return _util:create_string_for_byte(v1) .. _util:create_string_for_byte(v2) .. _util:create_string_for_byte(v3) .. _util:create_string_for_byte(v4) end
	end
end

function jk.lang.String:forFloat(vv)
	do return _util:create_string_for_float(vv) end
end

function jk.lang.String:forDouble(vv)
	do return _util:create_string_for_float(vv) end
end

function jk.lang.String:toUTF8Buffer(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _util:convert_string_to_buffer(str) end
end

function jk.lang.String:toBuffer(str, charset)
	if not (str ~= nil) then
		do return nil end
	end
	if not (charset ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:equalsIgnoreCase("UTF8", charset) or _g.jk.lang.String:equalsIgnoreCase("UTF-8", charset) then
		do return _g.jk.lang.String:toUTF8Buffer(str) end
	end
	do
		local bytes = _g.jk.lang.String:getBytesUnsigned(str, charset)
		if not (bytes ~= nil) then
			do return nil end
		end
		do
			local c = #bytes
			local bb = _util:allocate_buffer(c)
			local n = 0
			do
				n = 0
				while n < c do
					do _g.jk.lang.Buffer:setByte(bb, n, bytes[n + 1]) end
					do n = n + 1 end
				end
			end
			do return bb end
		end
	end
end

function jk.lang.String:getBytesUnsignedUTF8(str)
	do return _g.jk.lang.String:getBytesUnsigned(str, "UTF-8") end
end

function jk.lang.String:getBytesUnsigned(str, charset)
	if not (str ~= nil) then
		do return nil end
	end
	if not (charset ~= nil) then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.String.getBytesUnsigned] (String.sling:938:3): Not implemented" .. "\n")
	do return nil end
end

function jk.lang.String:getBytesSignedUTF8(str)
	do return _g.jk.lang.String:getBytesSigned(str, "UTF-8") end
end

function jk.lang.String:getBytesSigned(str, charset)
	if str == nil or charset == nil then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.String.getBytesSigned] (String.sling:988:3): Not implemented" .. "\n")
	do return nil end
end

function jk.lang.String:getLength(str)
	if str == nil then
		do return 0 end
	end
	do return _util:get_utf8_character_count(str) end
end

function jk.lang.String:appendString(str1, str2)
	if str1 == nil then
		do return str2 end
	end
	if str2 == nil then
		do return str1 end
	end
	do return str1 .. str2 end
end

function jk.lang.String:appendInteger(str, intvalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forInteger(intvalue)) end
end

function jk.lang.String:appendCharacter(str, charvalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forCharacter(charvalue)) end
end

function jk.lang.String:appendFloat(str, floatvalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forFloat(floatvalue)) end
end

function jk.lang.String:appendDouble(str, doublevalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forDouble(doublevalue)) end
end

function jk.lang.String:appendBoolean(str, boolvalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forBoolean(boolvalue)) end
end

function jk.lang.String:toLowerCase(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _util:change_string_to_lowercase(str) end
end

function jk.lang.String:toUpperCase(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _util:change_string_to_uppercase(str) end
end

function jk.lang.String:capitalize(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local c = _g.jk.lang.String:getChar(str, 0)
		if _g.jk.lang.Character:isLowercaseAlpha(c) == false then
			do return str end
		end
		do return _g.jk.lang.String:safeString(_g.jk.lang.String:forCharacter(_g.jk.lang.Character:toUppercase(c))) .. _g.jk.lang.String:safeString(_g.jk.lang.String:getEndOfString(str, 1)) end
	end
end

function jk.lang.String:getChar(str, index)
	if str == nil or index < 0 then
		do return 0 end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		local n = 0
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if n == index then
				do return c end
			end
			do n = n + 1 end
		end
		do return 0 end
	end
end

function jk.lang.String:equals(str1, str2)
	if str1 == nil and str2 == nil then
		do return true end
	end
	if not (str1 ~= nil and str2 ~= nil) then
		do return false end
	end
	do return str1 == str2 end
end

function jk.lang.String:isNotEqual(str1, str2)
	do return not _g.jk.lang.String:equals(str1, str2) end
end

function jk.lang.String:equalsIgnoreCase(str1, str2)
	if str1 == nil and str2 == nil then
		do return true end
	end
	if not (str1 ~= nil and str2 ~= nil) then
		do return false end
	end
	do return 0 == _util:compare_string_ignore_case(str1, str2) end
end

function jk.lang.String:compare(str1, str2)
	if str1 == nil or str2 == nil then
		do return 0 end
	end
	do
		local it1 = _g.jk.lang.String:iterate(str1)
		local it2 = _g.jk.lang.String:iterate(str2)
		if it1 == nil or it2 == nil then
			do return 0 end
		end
		while true do
			if it1:hasEnded() and it2:hasEnded() then
				do break end
			end
			if it1:hasEnded() then
				do return -1 end
			end
			if it2:hasEnded() then
				do return 1 end
			end
			do
				local c1 = it1:getNextChar()
				local c2 = it2:getNextChar()
				if c1 < c2 then
					do return -1 end
				end
				if c1 > c2 then
					do return 1 end
				end
			end
		end
		do return 0 end
	end
end

function jk.lang.String:compareToIgnoreCase(str1, str2)
	if str1 == nil or str2 == nil then
		do return 0 end
	end
	do
		local it1 = _g.jk.lang.String:iterate(str1)
		local it2 = _g.jk.lang.String:iterate(str2)
		if it1 == nil or it2 == nil then
			do return 0 end
		end
		while true do
			if it1:hasEnded() and it2:hasEnded() then
				do break end
			end
			if it1:hasEnded() then
				do return -1 end
			end
			if it2:hasEnded() then
				do return 1 end
			end
			do
				local c1 = _g.jk.lang.Character:toLowercase(it1:getNextChar())
				local c2 = _g.jk.lang.Character:toLowercase(it2:getNextChar())
				if c1 < c2 then
					do return -1 end
				end
				if c1 > c2 then
					do return 1 end
				end
			end
		end
		do return 0 end
	end
end

function jk.lang.String:getHashCode(str)
	if str == nil then
		do return 0 end
	end
	do
		local hash = 0
		local it = _g.jk.lang.String:iterate(str)
		while it ~= nil do
			local ch = it:getNextChar()
			if _g.jk.lang.Character:isEOF(ch) then
				do break end
			end
			hash = _vm:bitwise_left_shift(hash, 5) - hash + ch
			hash = _vm:bitwise_and(hash, hash)
		end
		do return hash end
	end
end

function jk.lang.String:getIndexOfCharacter(str, c, start)
	if str == nil or c == 0 then
		do return -1 end
	end
	do return _util:get_index_of_character(str, c, start) end
end

function jk.lang.String:getIndexOfString(str, s, start)
	if str == nil or s == nil then
		do return -1 end
	end
	if _g.jk.lang.String:isEmpty(s) then
		do return 0 end
	end
	do return _util:get_index_of_substring(str, s, start) end
end

function jk.lang.String:getLastIndexOfCharacter(str, c, start)
	if str == nil then
		do return -1 end
	end
	do
		local ss = start
		if ss < 0 then
			ss = 0
		end
		do
			local ii = _g.jk.lang.String:getIndexOfCharacter(str, c, ss)
			if ii >= 0 then
				while true do
					local ix = _g.jk.lang.String:getIndexOfCharacter(str, c, ii + 1)
					if ix < 0 then
						do break end
					end
					ii = ix
				end
			end
			do return ii end
		end
	end
end

function jk.lang.String:getLastIndexOfString(str, s, start)
	if str == nil then
		do return -1 end
	end
	do
		local ss = start
		if ss < 0 then
			ss = 0
		end
		do
			local ii = _g.jk.lang.String:getIndexOfString(str, s, ss)
			if ii >= 0 then
				while true do
					local ix = _g.jk.lang.String:getIndexOfString(str, s, ii + 1)
					if ix < 0 then
						do break end
					end
					ii = ix
				end
			end
			do return ii end
		end
	end
end

function jk.lang.String:getEndOfString(str, start)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local ss = start
		if ss < 0 then
			ss = 0
		end
		do return _util:get_substring(str, ss, #str) end
	end
end

function jk.lang.String:getSubString(str, start, length)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local ss = start
		if ss < 0 then
			ss = 0
		end
		do
			local v = _util:get_substring(str, ss, ss+length)
			if not (v ~= nil) then
				v = ""
			end
			do return v end
		end
	end
end

function jk.lang.String:contains(str1, str2)
	if not (str1 ~= nil) then
		do return false end
	end
	if not (str2 ~= nil) then
		do return false end
	end
	if _g.jk.lang.String:getIndexOfString(str1, str2, 0) >= 0 then
		do return true end
	end
	do return false end
end

function jk.lang.String:startsWith(str1, str2, offset)
	if not (str1 ~= nil) then
		do return false end
	end
	if not (str2 ~= nil) then
		do return false end
	end
	do
		local nstr = nil
		if offset > 0 then
			nstr = _g.jk.lang.String:getEndOfString(str1, offset)
		else
			nstr = str1
		end
		do return _util:string_starts_with(str1, str2, offset) end
	end
end

function jk.lang.String:startsWithAny(str, strings)
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local str2 = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if str2 ~= nil then
					if _g.jk.lang.String:startsWith(str, str2, 0) then
						do return str2 end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function jk.lang.String:startsWithIgnoreCase(str1, str2, offset)
	do return _g.jk.lang.String:startsWith(_g.jk.lang.String:toLowerCase(str1), _g.jk.lang.String:toLowerCase(str2), offset) end
end

function jk.lang.String:startsWithAnyIgnoreCase(str, strings)
	local ostr = _g.jk.lang.String:toLowerCase(str)
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local str2 = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if str2 ~= nil then
					if _g.jk.lang.String:startsWith(ostr, _g.jk.lang.String:toLowerCase(str2), 0) then
						do return str2 end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function jk.lang.String:endsWith(str1, str2)
	if not (str1 ~= nil) then
		do return false end
	end
	if not (str2 ~= nil) then
		do return false end
	end
	do return _util:get_substring(str1, _util:get_string_length(str1)-_util:get_string_length(str2), _util:get_string_length(str1)) == str2 end
end

function jk.lang.String:endsWithAny(str, strings)
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local str2 = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if str2 ~= nil then
					if _g.jk.lang.String:endsWith(str, str2) then
						do return str2 end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function jk.lang.String:endsWithIgnoreCase(str1, str2)
	do return _g.jk.lang.String:endsWith(_g.jk.lang.String:toLowerCase(str1), _g.jk.lang.String:toLowerCase(str2)) end
end

function jk.lang.String:endsWithAnyIgnoreCase(str, strings)
	local ostr = _g.jk.lang.String:toLowerCase(str)
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local str2 = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if str2 ~= nil then
					if _g.jk.lang.String:endsWith(ostr, _g.jk.lang.String:toLowerCase(str2)) then
						do return str2 end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function jk.lang.String:strip(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.String:stripFromStart(_g.jk.lang.String:stripFromEnd(str)) end
end

function jk.lang.String:stripFromEnd(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local ll = _g.jk.lang.String:getLength(str)
		if ll < 1 then
			do return str end
		end
		do
			local n = 0
			while true do
				local c = _g.jk.lang.String:getChar(str, ll - 1 - n)
				if c == 32 or c == 9 or c == 13 or c == 10 then
					do n = n + 1 end
				else
					do break end
				end
			end
			if n < 1 then
				do return str end
			end
			do return _g.jk.lang.String:getSubString(str, 0, ll - n) end
		end
	end
end

function jk.lang.String:stripFromStart(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local n = 0
		while true do
			local c = _g.jk.lang.String:getChar(str, n)
			if c == 32 or c == 9 or c == 13 or c == 10 then
				do n = n + 1 end
			else
				do break end
			end
		end
		if n < 1 then
			do return str end
		end
		do return _g.jk.lang.String:getEndOfString(str, n) end
	end
end

function jk.lang.String:replaceCharacter(str, oldChar, newChar)
	if not (str ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.String:replaceString(str, _g.jk.lang.String:forCharacter(oldChar), _g.jk.lang.String:forCharacter(newChar)) end
end

function jk.lang.String:replaceString(str, target, replacement)
	if not (str ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:isEmpty(target) then
		do return str end
	end
	do
		local rr = replacement
		if not (rr ~= nil) then
			rr = ""
		end
		do
			local v = str
			while true do
				local p = _g.jk.lang.String:getIndexOfString(v, target, 0)
				if p < 0 then
					do break end
				end
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendString(_g.jk.lang.String:getSubString(v, 0, p)) end
					do sb:appendString(rr) end
					do sb:appendString(_g.jk.lang.String:getEndOfString(v, p + _g.jk.lang.String:getLength(target))) end
					v = sb:toString()
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toCharArray(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		local v = nil
		do v = {} end
		do
			local n = 0
			while it ~= nil do
				local c = it:getNextChar()
				if _g.jk.lang.Character:isEOF(c) then
					do break end
				end
				do v[n + 1] = c end
				do n = n + 1 end
			end
			do return v end
		end
	end
end

function jk.lang.String:split(str, delim, max)
	local v = {}
	if str == nil then
		do return v end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local n = 0
		while true do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if c == delim and (max < 1 or n < max - 1) then
				local s = sb:toString()
				if not (s ~= nil) then
					s = ""
				end
				do _g.jk.lang.Vector:append(v, s) end
				do sb:clear() end
				do n = n + 1 end
			else
				do sb:appendCharacter(c) end
			end
		end
		do
			local s = sb:toString()
			if not (s ~= nil) then
				s = ""
			end
			do _g.jk.lang.Vector:append(v, s) end
			do return v end
		end
	end
end

function jk.lang.String:isInteger(str)
	if not (str ~= nil) then
		do return false end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		if not (it ~= nil) then
			do return false end
		end
		while true do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if c < 48 or c > 57 then
				do return false end
			end
		end
		do return true end
	end
end

function jk.lang.String:toInteger(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			local first = true
			local negative = false
			while true do
				local c = iter:getNextChar()
				if first and c == 45 then
					negative = true
					first = false
					goto _continue2
				end
				if c >= 48 and c <= 57 then
					v = v * 10
					v = v + _util:convert_to_integer(c - 48)
				else
					do break end
				end
				first = false
				::_continue2::
			end
			if negative then
				v = v * -1
			end
			do return v end
		end
	end
end

function jk.lang.String:toLong(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			local first = true
			local negative = false
			while true do
				local c = iter:getNextChar()
				if first and c == 45 then
					negative = true
					first = false
					goto _continue3
				end
				if c >= 48 and c <= 57 then
					v = v * 10
					v = v + _util:convert_to_integer(c - 48)
				else
					do break end
				end
				first = false
				::_continue3::
			end
			if negative then
				v = v * -1
			end
			do return v end
		end
	end
end

function jk.lang.String:toIntegerFromHex(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			while true do
				local c = iter:getNextChar()
				if c >= 48 and c <= 57 then
					v = v * 16
					v = v + _util:convert_to_integer(c - 48)
				elseif c >= 97 and c <= 102 then
					v = v * 16
					v = v + (10 + c - 97)
				elseif c >= 65 and c <= 70 then
					v = v * 16
					v = v + (10 + c - 65)
				else
					do break end
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toLongIntegerFromHex(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			while true do
				local c = iter:getNextChar()
				if c >= 48 and c <= 57 then
					v = v * 16
					v = v + _util:convert_to_integer(c - 48)
				elseif c >= 97 and c <= 102 then
					v = v * 16
					v = v + (10 + c - 97)
				elseif c >= 65 and c <= 70 then
					v = v * 16
					v = v + (10 + c - 65)
				else
					do break end
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toIntegerFromOctal(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			while true do
				local c = iter:getNextChar()
				if c >= 48 and c <= 55 then
					v = v * 8
					v = v + _util:convert_to_integer(c - 48)
				else
					do break end
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toIntegerFromBinary(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			while true do
				local c = iter:getNextChar()
				if c >= 48 and c <= 49 then
					v = v * 2
					v = v + _util:convert_to_integer(c - 48)
				else
					do break end
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toDouble(str)
	if str == nil then
		do return 0.0 end
	end
	do return _util:to_number(str) end
end

function jk.lang.String:iterate(string)
	do return _g.jk.lang.CharacterIteratorForString:forString(string) end
end

function jk.lang.String:reverse(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local it = _g.jk.lang.String:iterate(string)
		local c = 0
		while (function()
			c = it:getNextChar()
			do return c end
		end)() > 0 do
			do sb:insertCharacter(0, c) end
		end
		do return sb:toString() end
	end
end

function jk.lang.String:iterateReverse(string)
	do return _g.jk.lang.String:iterate(_g.jk.lang.String:reverse(string)) end
end

jk.lang.DoubleObject = {}

jk.lang.Character = {}
jk.lang.Character.__index = jk.lang.Character
_vm:set_metatable(jk.lang.Character, {})

function jk.lang.Character._create()
	local v = _vm:set_metatable({}, jk.lang.Character)
	return v
end

function jk.lang.Character:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Character'
	self['_isType.jk.lang.Character'] = true
	self['_isType.jk.lang.CharacterObject'] = true
	self.character = 0
end

function jk.lang.Character:_construct0()
	jk.lang.Character._init(self)
	return self
end

function jk.lang.Character:asObject(character)
	local v = _g.jk.lang.Character._construct0(_g.jk.lang.Character._create())
	do v:setCharacter(character) end
	do return v end
end

function jk.lang.Character:toUppercase(c)
	if c >= 97 and c <= 122 then
		do return c - 97 + 65 end
	end
	do return c end
end

function jk.lang.Character:toLowercase(c)
	if c >= 65 and c <= 90 then
		do return c - 65 + 97 end
	end
	do return c end
end

function jk.lang.Character:isDigit(c)
	do return c >= 48 and c <= 57 end
end

function jk.lang.Character:isLowercaseAlpha(c)
	do return c >= 97 and c <= 122 end
end

function jk.lang.Character:isUppercaseAlpha(c)
	do return c >= 65 and c <= 90 end
end

function jk.lang.Character:isHexDigit(c)
	local v = c >= 97 and c <= 102 or (c >= 65 and c <= 70) or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:isAlnum(c)
	local v = c >= 97 and c <= 122 or (c >= 65 and c <= 90) or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:isAlpha(c)
	local v = c >= 97 and c <= 122 or (c >= 65 and c <= 90)
	do return v end
end

function jk.lang.Character:isAlphaNumeric(c)
	local v = c >= 97 and c <= 122 or (c >= 65 and c <= 90) or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:isLowercaseAlphaNumeric(c)
	local v = c >= 97 and c <= 122 or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:isUppercaseAlphaNumeric(c)
	local v = c >= 65 and c <= 90 or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:toCharacter()
	do return self.character end
end

function jk.lang.Character:isEOF(c)
	do return c == 0 or c == -1 end
end

function jk.lang.Character:getHexDigit(c)
	local v = 0
	if c >= 48 and c <= 57 then
		v = _util:convert_to_integer(c - 48)
	elseif c >= 97 and c <= 102 then
		v = 10 + c - 97
	elseif c >= 65 and c <= 70 then
		v = 10 + c - 65
	else
		do return 0 end
	end
	do return v end
end

function jk.lang.Character:getCharacter()
	do return self.character end
end

function jk.lang.Character:setCharacter(v)
	self.character = v
	do return self end
end

jk.lang.StringBuilder = {}
jk.lang.StringBuilder.__index = jk.lang.StringBuilder
_vm:set_metatable(jk.lang.StringBuilder, {})

function jk.lang.StringBuilder._create()
	local v = _vm:set_metatable({}, jk.lang.StringBuilder)
	return v
end

function jk.lang.StringBuilder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.StringBuilder'
	self['_isType.jk.lang.StringBuilder'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.buffer = nil
	self.position = 0
end

function jk.lang.StringBuilder:forString(initial)
	local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do v:appendString(initial) end
	do return v end
end

function jk.lang.StringBuilder:dup(initial)
	local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if initial ~= nil then
		do v:appendString(initial:toString()) end
	end
	do return v end
end

function jk.lang.StringBuilder:resizeTo(size)
	local osz = #self.buffer
	if osz < size then
		while osz < size do
			osz = osz + 1024
		end
		self.buffer = _g.jk.lang.Buffer:resize(self.buffer, osz)
	end
end

function jk.lang.StringBuilder:_construct0()
	jk.lang.StringBuilder._init(self)
	do self:initialize() end
	return self
end

function jk.lang.StringBuilder:initialize()
	self.buffer = _util:allocate_buffer(1024)
end

function jk.lang.StringBuilder:clear()
	self.buffer = _util:allocate_buffer(1024)
	self.position = 0
end

function jk.lang.StringBuilder:count()
	do return self.position end
end

function jk.lang.StringBuilder:appendLong(c)
	do return self:appendString(_g.jk.lang.String:forLongInteger(c)) end
end

function jk.lang.StringBuilder:appendInteger(c)
	do return self:appendString(_g.jk.lang.String:forInteger(c)) end
end

function jk.lang.StringBuilder:appendDouble(c)
	do return self:appendString(_g.jk.lang.String:forDouble(c)) end
end

function jk.lang.StringBuilder:appendFloat(c)
	do return self:appendString(_g.jk.lang.String:forFloat(c)) end
end

function jk.lang.StringBuilder:appendCharacter(c)
	if c == 0 or c == -1 then
		do return self end
	end
	if c <= 127 then
		do self:resizeTo(self.position + 1) end
		self.buffer[self.position + 1] = _util:convert_to_integer(c)
		do self.position = self.position + 1 end
	else
		do self:appendString(_g.jk.lang.String:forCharacter(c)) end
	end
	do return self end
end

function jk.lang.StringBuilder:appendString(str)
	if str == nil then
		do return self end
	end
	do
		local nbuf = _g.jk.lang.String:toUTF8Buffer(str)
		if nbuf ~= nil then
			local nsz = #nbuf
			do self:resizeTo(self.position + nsz) end
			do _g.jk.lang.Buffer:copyFrom(self.buffer, nbuf, 0, self.position, nsz) end
			self.position = self.position + nsz
		end
		do return self end
	end
end

function jk.lang.StringBuilder:insertInteger(index, c)
	do return self:insertString(index, _g.jk.lang.String:forInteger(c)) end
end

function jk.lang.StringBuilder:insertCharacter(index, c)
	if c == 0 then
		do return self end
	end
	do return self:insertString(index, _g.jk.lang.String:forCharacter(c)) end
end

function jk.lang.StringBuilder:insertDouble(index, c)
	do return self:insertString(index, _g.jk.lang.String:forDouble(c)) end
end

function jk.lang.StringBuilder:insertFloat(index, c)
	do return self:insertString(index, _g.jk.lang.String:forFloat(c)) end
end

function jk.lang.StringBuilder:insertString(index, str)
	if str == nil then
		do return self end
	end
	do
		local nbuf = _g.jk.lang.String:toUTF8Buffer(str)
		if nbuf ~= nil then
			local nsz = #nbuf
			do self:resizeTo(self.position + nsz) end
			do _g.jk.lang.Buffer:copyFrom(self.buffer, self.buffer, index, index + nsz, self.position - index) end
			do _g.jk.lang.Buffer:copyFrom(self.buffer, nbuf, 0, index, nsz) end
			self.position = self.position + nsz
		end
		do return self end
	end
end

function jk.lang.StringBuilder:remove(index, length)
	if length < 1 then
		do return self end
	end
	if index < self.position then
		local ll = length
		local limit = self.position - index
		if ll > limit then
			ll = limit
		end
		do _g.jk.lang.Buffer:copyFrom(self.buffer, self.buffer, index + ll, index, self.position - index - ll) end
		self.position = self.position - ll
	end
	do return self end
end

function jk.lang.StringBuilder:removeLastCharacter()
	local c = self:count()
	if c > 0 then
		do self:remove(c - 1, 1) end
	end
	do return self end
end

function jk.lang.StringBuilder:toString()
	if not (self.buffer ~= nil) or self.position < 1 then
		do return "" end
	end
	do
		local bb = self.buffer
		if self.position < #bb then
			bb = _g.jk.lang.Buffer:getSubBuffer(bb, 0, self.position, false)
		end
		do return _g.jk.lang.String:forUTF8Buffer(bb) end
	end
end

jk.lang.StackTrace = {}
jk.lang.StackTrace.__index = jk.lang.StackTrace
_vm:set_metatable(jk.lang.StackTrace, {})

function jk.lang.StackTrace._create()
	local v = _vm:set_metatable({}, jk.lang.StackTrace)
	return v
end

function jk.lang.StackTrace:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.StackTrace'
	self['_isType.jk.lang.StackTrace'] = true
end

function jk.lang.StackTrace:_construct0()
	jk.lang.StackTrace._init(self)
	return self
end

function jk.lang.StackTrace:generate()
	do return _vm:get_stack_trace() end
end

jk.lang.Task = {}

jk.lang.DynamicIterator = {}

jk.lang.DynamicVector = {}
jk.lang.DynamicVector.__index = jk.lang.DynamicVector
_vm:set_metatable(jk.lang.DynamicVector, {})

function jk.lang.DynamicVector._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicVector)
	return v
end

function jk.lang.DynamicVector:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicVector'
	self['_isType.jk.lang.DynamicVector'] = true
	self['_isType.jk.lang.Duplicateable'] = true
	self['_isType.jk.lang.Iterateable'] = true
	self['_isType.jk.lang.VectorObject'] = true
	self['_isType.jk.lang.ObjectWithSize'] = true
	self.vector = nil
end

function jk.lang.DynamicVector:asDynamicVector(object)
	if not (object ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(object, '_isType.jk.lang.DynamicVector') ~= nil) then
		do return object end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(object) then
		do return _g.jk.lang.DynamicVector:forArray(object) end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(object) then
		do return _g.jk.lang.DynamicVector:forObjectVector(object) end
	end
	do return nil end
end

function jk.lang.DynamicVector:forStringVector(vector)
	local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local item = vector[n + 1]
				if item ~= nil then
					do v:appendObject(item) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:forObjectVector(vector)
	local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local item = vector[n + 1]
				if item ~= nil then
					do v:appendObject(item) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:forArray(array)
	local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	if array ~= nil then
		local n = 0
		local m = #array
		do
			n = 0
			while n < m do
				local item = array[n + 1]
				if item ~= nil then
					do v:appendObject(item) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:_construct0()
	jk.lang.DynamicVector._init(self)
	self.vector = {}
	return self
end

function jk.lang.DynamicVector:toVector()
	do return self.vector end
end

function jk.lang.DynamicVector:toVectorOfStrings()
	local v = {}
	if self.vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.vector)
		do
			n = 0
			while n < m do
				local o = self.vector[n + 1]
				if o ~= nil then
					local s = _g.jk.lang.String:asString(o)
					if s ~= nil then
						do _g.jk.lang.Vector:append(v, s) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:toVectorOfDynamicMaps()
	local v = {}
	if self.vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.vector)
		do
			n = 0
			while n < m do
				local o = _vm:to_table_with_key(self.vector[n + 1], '_isType.jk.lang.DynamicMap')
				if o ~= nil then
					do _g.jk.lang.Vector:append(v, o) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:duplicate()
	local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	local it = self:iterate()
	while it ~= nil do
		local o = it:next()
		if o == nil then
			do break end
		end
		do v:appendObject(o) end
	end
	do return v end
end

function jk.lang.DynamicVector:mergeDynamicVector(dynamicVector)
	if not (dynamicVector ~= nil) or dynamicVector:getSize() < 1 then
		do return self end
	end
	do return self:mergeVector(dynamicVector:toVector()) end
end

function jk.lang.DynamicVector:mergeVector(vector)
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local item = vector[n + 1]
				if item ~= nil then
					do self:appendObject(item) end
				end
				do n = n + 1 end
			end
		end
	end
	do return self end
end

function jk.lang.DynamicVector:appendObject(object)
	do _g.jk.lang.Vector:append(self.vector, object) end
	do return self end
end

function jk.lang.DynamicVector:appendString(string)
	do _g.jk.lang.Vector:append(self.vector, string) end
	do return self end
end

function jk.lang.DynamicVector:appendInteger(value)
	do _g.jk.lang.Vector:append(self.vector, _g.jk.lang.Integer:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:appendLong(value)
	do _g.jk.lang.Vector:append(self.vector, _g.jk.lang.LongInteger:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:appendBoolean(value)
	do _g.jk.lang.Vector:append(self.vector, _g.jk.lang.Boolean:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:appendDouble(value)
	do _g.jk.lang.Vector:append(self.vector, _g.jk.lang.Double:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:setObject(index, object)
	do _g.jk.lang.Vector:set(self.vector, index, object) end
	do return self end
end

function jk.lang.DynamicVector:setInteger(index, value)
	do _g.jk.lang.Vector:set(self.vector, index, _g.jk.lang.Integer:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:setLong(index, value)
	do _g.jk.lang.Vector:set(self.vector, index, _g.jk.lang.LongInteger:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:setBoolean(index, value)
	do _g.jk.lang.Vector:set(self.vector, index, _g.jk.lang.Boolean:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:setDouble(index, value)
	do _g.jk.lang.Vector:set(self.vector, index, _g.jk.lang.Double:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:get(index)
	do return _g.jk.lang.Vector:getAt(self.vector, index) end
end

function jk.lang.DynamicVector:getString(index, defval)
	local v = _g.jk.lang.String:asString(self:get(index))
	if v == nil then
		do return defval end
	end
	do return v end
end

function jk.lang.DynamicVector:getInteger(index, defval)
	local vv = self:get(index)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Integer:asInteger(vv) end
end

function jk.lang.DynamicVector:getLongInteger(index, defval)
	local vv = self:get(index)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.LongInteger:asLong(vv) end
end

function jk.lang.DynamicVector:getBoolean(index, defval)
	local vv = self:get(index)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Boolean:asBoolean(vv, false) end
end

function jk.lang.DynamicVector:getDouble(index, defval)
	local vv = self:get(index)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Double:asDouble(vv) end
end

function jk.lang.DynamicVector:getMap(index)
	do return _vm:to_table_with_key(self:get(index), '_isType.jk.lang.DynamicMap') end
end

function jk.lang.DynamicVector:getVector(index)
	do return _vm:to_table_with_key(self:get(index), '_isType.jk.lang.DynamicVector') end
end

function jk.lang.DynamicVector:iterate()
	local v = _g.jk.lang.Vector:iterate(self.vector)
	do return v end
end

function jk.lang.DynamicVector:iterateReverse()
	local v = _g.jk.lang.Vector:iterateReverse(self.vector)
	do return v end
end

function jk.lang.DynamicVector:remove(index)
	do _g.jk.lang.Vector:remove(self.vector, index) end
end

function jk.lang.DynamicVector:removeValue(value)
	do _g.jk.lang.Vector:removeValue(self.vector, value) end
end

function jk.lang.DynamicVector:clear()
	do _g.jk.lang.Vector:clear(self.vector) end
end

function jk.lang.DynamicVector:contains(object)
	do return _g.jk.lang.Vector:contains(self.vector, object) end
end

function jk.lang.DynamicVector:getSize()
	do return _g.jk.lang.Vector:getSize(self.vector) end
end

function jk.lang.DynamicVector:setCapacity(capacity)
	do _g.jk.lang.Vector:setCapacity(self.vector, capacity) end
end

function jk.lang.DynamicVector:sort()
	do _g.jk.lang.Vector:sort(self.vector, function(a, b)
		do return _g.jk.lang.String:compare(_g.jk.lang.String:asString(a), _g.jk.lang.String:asString(b)) end
	end) end
end

function jk.lang.DynamicVector:sortWithComparer(comparer)
	if comparer == nil then
		do self:sort() end
		do return end
	end
	do _g.jk.lang.Vector:sort(self.vector, comparer) end
end

function jk.lang.DynamicVector:sortReverse()
	do _g.jk.lang.Vector:sortReverse(self.vector, function(a, b)
		do return _g.jk.lang.String:compare(_g.jk.lang.String:asString(a), _g.jk.lang.String:asString(b)) end
	end) end
end

function jk.lang.DynamicVector:sortReverseWithComparer(comparer)
	if comparer == nil then
		do self:sortReverse() end
		do return end
	end
	do _g.jk.lang.Vector:sortReverse(self.vector, comparer) end
end

jk.lang.BufferBuilder = {}
jk.lang.BufferBuilder.__index = jk.lang.BufferBuilder
_vm:set_metatable(jk.lang.BufferBuilder, {})

function jk.lang.BufferBuilder._create()
	local v = _vm:set_metatable({}, jk.lang.BufferBuilder)
	return v
end

function jk.lang.BufferBuilder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.BufferBuilder'
	self['_isType.jk.lang.BufferBuilder'] = true
	self.buffer = nil
	self.pointer = 0
end

function jk.lang.BufferBuilder:_construct0()
	jk.lang.BufferBuilder._init(self)
	return self
end

function jk.lang.BufferBuilder:allocate(sz)
	if self.buffer == nil then
		self.buffer = _util:allocate_buffer(8192)
		do return end
	end
	do
		local needed = self.pointer + sz
		local csz = _g.jk.lang.Buffer:getSize(self.buffer)
		if csz >= needed then
			do return end
		end
		do
			local nsz = csz
			while nsz < needed do
				nsz = nsz + 1024
			end
			self.buffer = _g.jk.lang.Buffer:resize(self.buffer, nsz)
		end
	end
end

function jk.lang.BufferBuilder:getSize()
	do return self.pointer end
end

function jk.lang.BufferBuilder:appendInteger(value)
	do self:allocate(self.pointer + 1) end
	do _g.jk.lang.Buffer:setByte(self.buffer, self.pointer, value) end
	do self.pointer = self.pointer + 1 end
end

function jk.lang.BufferBuilder:appendBuffer(sbuffer)
	do self:appendSubBuffer(sbuffer, 0, _g.jk.lang.Buffer:getSize(sbuffer)) end
end

function jk.lang.BufferBuilder:appendSubBuffer(sbuffer, offset, size)
	if not (sbuffer ~= nil) then
		do return end
	end
	if not (offset >= 0) then
		do return end
	end
	if not (size >= 0) then
		do return end
	end
	do self:allocate(self.pointer + size) end
	do _g.jk.lang.Buffer:copyFrom(self.buffer, sbuffer, offset, self.pointer, size) end
	self.pointer = self.pointer + size
end

function jk.lang.BufferBuilder:toBuffer()
	do return _g.jk.lang.Buffer:getSubBuffer(self.buffer, 0, self.pointer, false) end
end

jk.lang.Range = {}
jk.lang.Range.__index = jk.lang.Range
_vm:set_metatable(jk.lang.Range, {})

jk.lang.Range.TYPE_NONE = 0
jk.lang.Range.TYPE_EXCLUDE_UPPER_BOUND = 1
jk.lang.Range.TYPE_EXCLUDE_LOWER_BOUND = 2
jk.lang.Range.TYPE_EXCLUDE_BOTH_BOUNDS = 3

function jk.lang.Range._create()
	local v = _vm:set_metatable({}, jk.lang.Range)
	return v
end

function jk.lang.Range:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Range'
	self['_isType.jk.lang.Range'] = true
	self['_isType.jk.lang.Iterateable'] = true
	self.lowerBound = 0.0
	self.upperBound = 0.0
	self.exclusionType = 0
end

function jk.lang.Range:forIntegerValues(lowerBound, upperBound, exclusionType)
	local v = _g.jk.lang.Range._construct0(_g.jk.lang.Range._create())
	do v:setLowerBound(lowerBound) end
	do v:setUpperBound(upperBound) end
	do v:setExclusionType(exclusionType) end
	do return v end
end

function jk.lang.Range:forDoubleValues(lowerBound, upperBound, exclusionType)
	local v = _g.jk.lang.Range._construct0(_g.jk.lang.Range._create())
	do v:setLowerBound(lowerBound) end
	do v:setUpperBound(upperBound) end
	do v:setExclusionType(exclusionType) end
	do return v end
end

function jk.lang.Range:forValues(lowerBound, upperBound, exclusionType)
	if (_vm:get_variable_type(lowerBound) == 'number') and (_vm:get_variable_type(upperBound) == 'number') then
		do return _g.jk.lang.Range:forDoubleValues(lowerBound, upperBound, exclusionType) end
	end
	if (_vm:get_variable_type(lowerBound) == 'number') and (_vm:get_variable_type(upperBound) == 'number') then
		do return _g.jk.lang.Range:forIntegerValues(_util:convert_to_integer(lowerBound), _util:convert_to_integer(upperBound), exclusionType) end
	end
	do return nil end
end

function jk.lang.Range:_construct0()
	jk.lang.Range._init(self)
	return self
end

function jk.lang.Range:setLowerBound(lowerBound)
	self.lowerBound = lowerBound
end

function jk.lang.Range:setUpperBound(upperBound)
	self.upperBound = upperBound
end

function jk.lang.Range:setExclusionType(exclusionType)
	self.exclusionType = exclusionType
end

function jk.lang.Range:getLowerBoundAsInteger()
	do return _util:convert_to_integer(self.lowerBound) end
end

function jk.lang.Range:getLowerBoundAsDouble()
	do return self.lowerBound end
end

function jk.lang.Range:getUpperBoundAsInteger()
	do return _util:convert_to_integer(self.upperBound) end
end

function jk.lang.Range:getUpperBoundAsDouble()
	do return self.upperBound end
end

function jk.lang.Range:containsIntegerValue(value)
	do return self:containsDoubleValue(value) end
end

function jk.lang.Range:containsDoubleValue(value)
	if self.exclusionType == _g.jk.lang.Range.TYPE_NONE then
		do return value >= self.lowerBound and value <= self.upperBound end
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_UPPER_BOUND then
		do return value >= self.lowerBound and value < self.upperBound end
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_LOWER_BOUND then
		do return value > self.lowerBound and value <= self.upperBound end
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_BOTH_BOUNDS then
		do return value > self.lowerBound and value < self.upperBound end
	end
	do return false end
end

jk.lang.Range.RangeIterator = {}
jk.lang.Range.RangeIterator.__index = jk.lang.Range.RangeIterator
_vm:set_metatable(jk.lang.Range.RangeIterator, {})

function jk.lang.Range.RangeIterator._create()
	local v = _vm:set_metatable({}, jk.lang.Range.RangeIterator)
	return v
end

function jk.lang.Range.RangeIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Range.RangeIterator'
	self['_isType.jk.lang.Range.RangeIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.lowerBound = 0
	self.upperBound = 0
	self.increment = 0
	self.current = nil
end

function jk.lang.Range.RangeIterator:_construct0()
	jk.lang.Range.RangeIterator._init(self)
	return self
end

function jk.lang.Range.RangeIterator:_construct2(lowerBound, upperBound)
	jk.lang.Range.RangeIterator._init(self)
	self.lowerBound = lowerBound
	self.upperBound = upperBound
	if lowerBound <= upperBound then
		self.increment = 1
	else
		self.increment = -1
	end
	return self
end

function jk.lang.Range.RangeIterator:next()
	if not (self.current ~= nil) then
		self.current = _g.jk.lang.Integer:forValue(self.lowerBound)
	else
		do self.current:add(self.increment) end
	end
	do return self.current:getValue() end
end

function jk.lang.Range.RangeIterator:hasNext()
	if not (self.current ~= nil) then
		do return true end
	end
	if self.increment > 0 then
		do return self.current:getValue() < self.upperBound end
	end
	do return self.current:getValue() > self.upperBound end
end

function jk.lang.Range:iterate()
	local lv = _util:convert_to_integer(self.lowerBound)
	local uv = _util:convert_to_integer(self.upperBound)
	if self.exclusionType == _g.jk.lang.Range.TYPE_NONE then
	end
	if self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_UPPER_BOUND then
		uv = uv - 1
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_LOWER_BOUND then
		lv = lv + 1
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_BOTH_BOUNDS then
		uv = uv - 1
		lv = lv + 1
	end
	do return _g.jk.lang.Range.RangeIterator._construct2(_g.jk.lang.Range.RangeIterator._create(), lv, uv) end
end

jk.lang.ExceptionWithError = _g.jk.lang.Exception._create()
jk.lang.ExceptionWithError.__index = jk.lang.ExceptionWithError
_vm:set_metatable(jk.lang.ExceptionWithError, {
	__index = _g.jk.lang.Exception
})

function jk.lang.ExceptionWithError._create()
	local v = _vm:set_metatable({}, jk.lang.ExceptionWithError)
	return v
end

function jk.lang.ExceptionWithError:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.ExceptionWithError'
	self['_isType.jk.lang.ExceptionWithError'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.error = nil
end

function jk.lang.ExceptionWithError:_construct0()
	jk.lang.ExceptionWithError._init(self)
	do _g.jk.lang.Exception._construct0(self) end
	return self
end

function jk.lang.ExceptionWithError:forError(error)
	local v = _g.jk.lang.ExceptionWithError._construct0(_g.jk.lang.ExceptionWithError._create())
	do v:setError(error) end
	do return v end
end

function jk.lang.ExceptionWithError:forCode(code, detail)
	do return _g.jk.lang.ExceptionWithError:forError(_g.jk.lang.Error:forCode(code, detail)) end
end

function jk.lang.ExceptionWithError:getErrorCode()
	if not (self.error ~= nil) then
		do return nil end
	end
	do return self.error:getCode() end
end

function jk.lang.ExceptionWithError:getErrorDetail()
	if not (self.error ~= nil) then
		do return nil end
	end
	do return self.error:getDetail() end
end

function jk.lang.ExceptionWithError:toString()
	do return _g.jk.lang.Error:asString(self.error) end
end

function jk.lang.ExceptionWithError:getError()
	do return self.error end
end

function jk.lang.ExceptionWithError:setError(v)
	self.error = v
	do return self end
end

jk.lang.Double = {}
jk.lang.Double.__index = jk.lang.Double
_vm:set_metatable(jk.lang.Double, {})

function jk.lang.Double._create()
	local v = _vm:set_metatable({}, jk.lang.Double)
	return v
end

function jk.lang.Double:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Double'
	self['_isType.jk.lang.Double'] = true
	self['_isType.jk.lang.DoubleObject'] = true
	self.value = 0.0
end

function jk.lang.Double:_construct0()
	jk.lang.Double._init(self)
	return self
end

function jk.lang.Double:forValue(value)
	do return _g.jk.lang.Double:asObject(value) end
end

function jk.lang.Double:asObject(value)
	local v = _g.jk.lang.Double._construct0(_g.jk.lang.Double._create())
	do v:setValue(value) end
	do return v end
end

function jk.lang.Double:asDouble(obj)
	if not (obj ~= nil) then
		do return 0.0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return obj end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		local od = obj
		do return od:toDouble() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = _util:convert_to_integer(obj)
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		local oi = obj
		do return oi:toInteger() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = _util:convert_to_integer(obj)
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		local oi = obj
		do return oi:toLong() end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		do return _g.jk.lang.String:toDouble(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		do return _g.jk.lang.String:toDouble(obj:toString()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		local oc = obj
		do return oc:toCharacter() end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		if obj == true then
			do return 1.0 end
		end
		do return 0.0 end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		if obj:toBoolean() then
			do return 1.0 end
		end
		do return 0.0 end
	end
	do return 0.0 end
end

function jk.lang.Double:longBitsToDouble(vv)
	_io:write_to_stdout("[jk.lang.Double.longBitsToDouble] (Double.sling:98:3): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Double:doubleToLongBits(vv)
	_io:write_to_stdout("[jk.lang.Double.doubleToLongBits] (Double.sling:112:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.lang.Double:add(amount)
	self.value = self.value + amount
end

function jk.lang.Double:toDouble()
	do return self.value end
end

function jk.lang.Double:getValue()
	do return self.value end
end

function jk.lang.Double:setValue(v)
	self.value = v
	do return self end
end

jk.lang.CharacterIteratorForBuffer = _g.jk.lang.CharacterDecoder._create()
jk.lang.CharacterIteratorForBuffer.__index = jk.lang.CharacterIteratorForBuffer
_vm:set_metatable(jk.lang.CharacterIteratorForBuffer, {
	__index = _g.jk.lang.CharacterDecoder
})

function jk.lang.CharacterIteratorForBuffer._create()
	local v = _vm:set_metatable({}, jk.lang.CharacterIteratorForBuffer)
	return v
end

function jk.lang.CharacterIteratorForBuffer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.CharacterIteratorForBuffer'
	self['_isType.jk.lang.CharacterIteratorForBuffer'] = true
	self['_isType.jk.lang.Duplicateable'] = true
	self.buffer = nil
	self.bufferSize = 0
	self.currentPosition = -1
end

function jk.lang.CharacterIteratorForBuffer:_construct0()
	jk.lang.CharacterIteratorForBuffer._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	return self
end

function jk.lang.CharacterIteratorForBuffer:forBuffer(buffer)
	local v = _g.jk.lang.CharacterIteratorForBuffer._construct0(_g.jk.lang.CharacterIteratorForBuffer._create())
	do v:setBuffer(buffer) end
	do return v end
end

function jk.lang.CharacterIteratorForBuffer:setBuffer(buffer)
	do self:resetDecoder() end
	self.buffer = buffer
	self.bufferSize = _g.jk.lang.Buffer:getSize(buffer)
	self.currentPosition = -1
end

function jk.lang.CharacterIteratorForBuffer:moveToPreviousByte()
	if self.currentPosition < 1 then
		do return false end
	end
	do self.currentPosition = self.currentPosition - 1 end
	do return true end
end

function jk.lang.CharacterIteratorForBuffer:moveToNextByte()
	local n = self.currentPosition + 1
	if n >= self.bufferSize then
		do return false end
	end
	self.currentPosition = n
	do return true end
end

function jk.lang.CharacterIteratorForBuffer:getCurrentByte()
	local v = _vm:bitwise_and(self.buffer[self.currentPosition + 1], 255)
	do return v end
end

function jk.lang.CharacterIteratorForBuffer:getCurrentPosition()
	do return self.currentPosition end
end

function jk.lang.CharacterIteratorForBuffer:setCurrentPosition(position)
	if position < 0 then
		self.current = 0
		self.currentPosition = -1
	else
		self.currentPosition = position + 1
		do self:doMoveToPreviousChar() end
	end
end

function jk.lang.CharacterIteratorForBuffer:duplicate()
	local v = _g.jk.lang.CharacterIteratorForBuffer._construct0(_g.jk.lang.CharacterIteratorForBuffer._create())
	do _g.jk.lang.CharacterDecoder.copyTo(self, v) end
	v.buffer = self.buffer
	v.bufferSize = self.bufferSize
	v.currentPosition = self.currentPosition
	do return v end
end

jk.lang.Boolean = {}
jk.lang.Boolean.__index = jk.lang.Boolean
_vm:set_metatable(jk.lang.Boolean, {})

function jk.lang.Boolean._create()
	local v = _vm:set_metatable({}, jk.lang.Boolean)
	return v
end

function jk.lang.Boolean:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Boolean'
	self['_isType.jk.lang.Boolean'] = true
	self['_isType.jk.lang.BooleanObject'] = true
	self.value = false
end

function jk.lang.Boolean:_construct0()
	jk.lang.Boolean._init(self)
	return self
end

function jk.lang.Boolean:asObject(value)
	local v = _g.jk.lang.Boolean._construct0(_g.jk.lang.Boolean._create())
	do v:setValue(value) end
	do return v end
end

function jk.lang.Boolean:asBoolean(obj, default)
	if obj == nil then
		do return false end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		do return obj end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		local bo = obj
		do return bo:toBoolean() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		if _util:convert_to_integer(obj) == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		if obj:toInteger() == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		if _util:convert_to_integer(obj) == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		if obj:toLong() == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		local str = _g.jk.lang.String:toLowerCase(obj)
		if str == "yes" or str == "true" or str == "1" then
			do return true end
		end
		if str == "no" or str == "false" or str == "0" then
			do return false end
		end
		do return default end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		local str = obj:toString()
		if str ~= nil then
			str = _g.jk.lang.String:toLowerCase(str)
			if str == "yes" or str == "true" or str == "1" then
				do return true end
			end
			if str == "no" or str == "false" or str == "0" then
				do return false end
			end
		end
		do return default end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		if obj == 0.0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		if obj:toDouble() == 0.0 then
			do return false end
		end
		do return true end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		if _util:convert_to_integer(obj) == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		if _util:convert_to_integer(obj:toCharacter()) == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.ObjectWithSize') ~= nil) then
		local sz = obj:getSize()
		if sz == 0 then
			do return false end
		end
		do return true end
	end
	do return default end
end

function jk.lang.Boolean:toBoolean()
	do return self.value end
end

function jk.lang.Boolean:getValue()
	do return self.value end
end

function jk.lang.Boolean:setValue(v)
	self.value = v
	do return self end
end
jk = jk or {}

jk.os = jk.os or {}

jk.os.OS = {}
jk.os.OS.__index = jk.os.OS
_vm:set_metatable(jk.os.OS, {})

jk.os.OS.isWindowsFlag = nil
jk.os.OS.isLinuxFlag = nil
jk.os.OS.isMacOSFlag = nil
jk.os.OS.isAndroidFlag = nil
jk.os.OS.isIOSFlag = nil

function jk.os.OS._create()
	local v = _vm:set_metatable({}, jk.os.OS)
	return v
end

function jk.os.OS:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.os.OS'
	self['_isType.jk.os.OS'] = true
end

function jk.os.OS:_construct0()
	jk.os.OS._init(self)
	return self
end

function jk.os.OS:getCurrentPlatformName()
	do return "Sushi" end
end

function jk.os.OS:is32Bit()
	local cpu = _g.jk.os.OS:getProcessorType()
	if cpu == "x86" or cpu == "arm" then
		do return true end
	end
	do return false end
end

function jk.os.OS:is64Bit()
	local cpu = _g.jk.os.OS:getProcessorType()
	if cpu == "x64" or cpu == "arm64" then
		do return true end
	end
	do return false end
end

function jk.os.OS:getProcessorType()
	do return nil end
end

function jk.os.OS:isWindows()
	if _g.jk.os.OS.isWindowsFlag ~= nil then
		do return _g.jk.os.OS.isWindowsFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("windows")
		_g.jk.os.OS.isWindowsFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isLinux()
	if _g.jk.os.OS.isLinuxFlag ~= nil then
		do return _g.jk.os.OS.isLinuxFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("linux")
		_g.jk.os.OS.isLinuxFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isMacOS()
	if _g.jk.os.OS.isMacOSFlag ~= nil then
		do return _g.jk.os.OS.isMacOSFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("macos")
		_g.jk.os.OS.isMacOSFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isOSX()
	do return _g.jk.os.OS:isMacOS() end
end

function jk.os.OS:isAndroid()
	if _g.jk.os.OS.isAndroidFlag ~= nil then
		do return _g.jk.os.OS.isAndroidFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("android")
		_g.jk.os.OS.isAndroidFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isIOS()
	if _g.jk.os.OS.isIOSFlag ~= nil then
		do return _g.jk.os.OS.isIOSFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("ios")
		_g.jk.os.OS.isIOSFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isSystemType(ida)
	local id = ida
	if id == "osx" then
		id = "macos"
	end
	do
		local type = _os:get_system_type()
		do return type == id end
	end
end

function jk.os.OS:isDirectory(path)
	if not _g.jk.lang.String:isNotEmpty(path) then
		do return false end
	end
	_io:write_to_stdout("[jk.os.OS.isDirectory] (OS.sling:386:3): Not implemented" .. "\n")
	do return false end
end

function jk.os.OS:isFile(path)
	if not _g.jk.lang.String:isNotEmpty(path) then
		do return false end
	end
	_io:write_to_stdout("[jk.os.OS.isFile] (OS.sling:424:3): Not implemented" .. "\n")
	do return false end
end
jk = jk or {}

jk.log = jk.log or {}

jk.log.Log = {}
jk.log.Log.__index = jk.log.Log
_vm:set_metatable(jk.log.Log, {})

function jk.log.Log._create()
	local v = _vm:set_metatable({}, jk.log.Log)
	return v
end

function jk.log.Log:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.log.Log'
	self['_isType.jk.log.Log'] = true
end

function jk.log.Log:_construct0()
	jk.log.Log._init(self)
	return self
end

function jk.log.Log:asString(context, object)
	if context ~= nil and (_vm:to_table_with_key(object, '_isType.jk.lang.StringObjectWithDebug') ~= nil) then
		do return object:toStringWithDebug(context:isInDebugMode()) end
	end
	do return _g.jk.lang.String:asString(object) end
end

function jk.log.Log:error(context, message)
	if context ~= nil then
		do context:logError(message) end
	end
end

function jk.log.Log:warning(context, message)
	if context ~= nil then
		do context:logWarning(message) end
	end
end

function jk.log.Log:info(context, message)
	if context ~= nil then
		do context:logInfo(message) end
	end
end

function jk.log.Log:debug(context, message)
	if context ~= nil then
		do context:logDebug(message) end
	end
end

function jk.log.Log:status(context, message)
	if context ~= nil then
		do context:logStatus(message) end
	end
end

jk.log.LoggingContext = {}
jk = jk or {}

jk.io = jk.io or {}

jk.io.DataStream = {}

jk.io.Reader = {}

jk.io.Writer = {}

jk.io.DataStreamSource = {}

jk.io.FlushableWriter = {}

jk.io.FileDescriptor = {}

jk.io.LineReader = {}

jk.io.CharacterIteratorForReader = _g.jk.lang.CharacterDecoder._create()
jk.io.CharacterIteratorForReader.__index = jk.io.CharacterIteratorForReader
_vm:set_metatable(jk.io.CharacterIteratorForReader, {
	__index = _g.jk.lang.CharacterDecoder
})

function jk.io.CharacterIteratorForReader._create()
	local v = _vm:set_metatable({}, jk.io.CharacterIteratorForReader)
	return v
end

function jk.io.CharacterIteratorForReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.CharacterIteratorForReader'
	self['_isType.jk.io.CharacterIteratorForReader'] = true
	self.reader = nil
	self.buffer = nil
	self.bufferStart = -1
	self.bufferSize = 0
	self.bufferDataSize = 0
	self.currentPos = -1
	self.readPos = 0
end

function jk.io.CharacterIteratorForReader:_construct0()
	jk.io.CharacterIteratorForReader._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	return self
end

function jk.io.CharacterIteratorForReader:forReader(reader)
	do return _g.jk.io.CharacterIteratorForReader._construct1(_g.jk.io.CharacterIteratorForReader._create(), reader) end
end

function jk.io.CharacterIteratorForReader:forReaderWithBufferSize(reader, bufferSize)
	do return _g.jk.io.CharacterIteratorForReader._construct2(_g.jk.io.CharacterIteratorForReader._create(), reader, bufferSize) end
end

function jk.io.CharacterIteratorForReader:_construct1(reader)
	jk.io.CharacterIteratorForReader._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	self.reader = reader
	self.buffer = _util:allocate_buffer(1024)
	self.bufferSize = 1024
	return self
end

function jk.io.CharacterIteratorForReader:_construct2(reader, bufferSize)
	jk.io.CharacterIteratorForReader._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	self.reader = reader
	self.buffer = _util:allocate_buffer(bufferSize)
	self.bufferSize = bufferSize
	return self
end

function jk.io.CharacterIteratorForReader:makeDataAvailable(n)
	if n >= self.bufferStart and n < self.bufferStart + self.bufferDataSize then
		do return true end
	end
	if (_vm:to_table_with_key(self.reader, '_isType.jk.io.SeekableReader') ~= nil) then
		local rs = self.reader
		local block = _util:convert_to_integer(n / self.bufferSize)
		local blockPos = block * self.bufferSize
		if self.readPos ~= blockPos then
			if not rs:setCurrentPosition(blockPos) then
				do return false end
			end
			self.readPos = blockPos
		end
	end
	self.bufferDataSize = self.reader:read(self.buffer)
	self.bufferStart = self.readPos
	self.readPos = self.readPos + self.bufferDataSize
	if n >= self.bufferStart and n < self.bufferStart + self.bufferDataSize then
		do return true end
	end
	do return false end
end

function jk.io.CharacterIteratorForReader:moveToPreviousByte()
	if not self:makeDataAvailable(self.currentPos - 1) then
		do return false end
	end
	do self.currentPos = self.currentPos - 1 end
	do return true end
end

function jk.io.CharacterIteratorForReader:moveToNextByte()
	if not self:makeDataAvailable(self.currentPos + 1) then
		do return false end
	end
	do self.currentPos = self.currentPos + 1 end
	do return true end
end

function jk.io.CharacterIteratorForReader:getCurrentByte()
	do return _g.jk.lang.Buffer:getByte(self.buffer, self.currentPos - self.bufferStart) end
end

function jk.io.CharacterIteratorForReader:getCurrentPosition()
	do return self.currentPos end
end

function jk.io.CharacterIteratorForReader:setCurrentPosition(position)
	self.currentPos = position
end

jk.io.StringLineReader = {}
jk.io.StringLineReader.__index = jk.io.StringLineReader
_vm:set_metatable(jk.io.StringLineReader, {})

function jk.io.StringLineReader._create()
	local v = _vm:set_metatable({}, jk.io.StringLineReader)
	return v
end

function jk.io.StringLineReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.StringLineReader'
	self['_isType.jk.io.StringLineReader'] = true
	self['_isType.jk.io.LineReader'] = true
	self.iterator = nil
end

function jk.io.StringLineReader:_construct0()
	jk.io.StringLineReader._init(self)
	return self
end

function jk.io.StringLineReader:_construct1(str)
	jk.io.StringLineReader._init(self)
	self.iterator = _g.jk.lang.CharacterIteratorForString:forString(str)
	return self
end

function jk.io.StringLineReader:readLine()
	if not (self.iterator ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local c = self.iterator:getNextChar()
			if c < 1 then
				if sb:count() < 1 then
					do return nil end
				end
				do break end
			end
			if c == 13 then
				goto _continue1
			end
			if c == 10 then
				do break end
			end
			do sb:appendCharacter(c) end
			::_continue1::
		end
		if sb:count() < 1 then
			do return "" end
		end
		do return sb:toString() end
	end
end

jk.io.StaticFileDescriptor = {}
jk.io.StaticFileDescriptor.__index = jk.io.StaticFileDescriptor
_vm:set_metatable(jk.io.StaticFileDescriptor, {})

function jk.io.StaticFileDescriptor._create()
	local v = _vm:set_metatable({}, jk.io.StaticFileDescriptor)
	return v
end

function jk.io.StaticFileDescriptor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.StaticFileDescriptor'
	self['_isType.jk.io.StaticFileDescriptor'] = true
	self['_isType.jk.io.FileDescriptor'] = true
	self.fileDescriptor = 0
end

function jk.io.StaticFileDescriptor:_construct0()
	jk.io.StaticFileDescriptor._init(self)
	return self
end

function jk.io.StaticFileDescriptor:forFileDescriptor(fd)
	do return _g.jk.io.StaticFileDescriptor._construct0(_g.jk.io.StaticFileDescriptor._create()):setFileDescriptor(fd) end
end

function jk.io.StaticFileDescriptor:getFileDescriptor()
	do return self.fileDescriptor end
end

function jk.io.StaticFileDescriptor:setFileDescriptor(v)
	self.fileDescriptor = v
	do return self end
end

jk.io.BufferWriter = {}
jk.io.BufferWriter.__index = jk.io.BufferWriter
_vm:set_metatable(jk.io.BufferWriter, {})

function jk.io.BufferWriter._create()
	local v = _vm:set_metatable({}, jk.io.BufferWriter)
	return v
end

function jk.io.BufferWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.BufferWriter'
	self['_isType.jk.io.BufferWriter'] = true
	self['_isType.jk.io.Writer'] = true
	self.buffer = nil
	self.pos = 0
end

function jk.io.BufferWriter:_construct0()
	jk.io.BufferWriter._init(self)
	return self
end

function jk.io.BufferWriter:forBuffer(buf)
	local v = _g.jk.io.BufferWriter._construct0(_g.jk.io.BufferWriter._create())
	v.buffer = buf
	do return v end
end

function jk.io.BufferWriter:getBufferSize()
	do return _g.jk.lang.Buffer:getSize(self.buffer) end
end

function jk.io.BufferWriter:getBufferPos()
	do return 0 end
end

function jk.io.BufferWriter:getBuffer()
	do return self.buffer end
end

function jk.io.BufferWriter:write(src, ssize)
	if src == nil then
		do return 0 end
	end
	do
		local size = ssize
		if size < 0 then
			size = _g.jk.lang.Buffer:getSize(src)
		end
		if size < 1 then
			do return 0 end
		end
		if self.buffer == nil then
			self.buffer = _util:allocate_buffer(size)
			if self.buffer == nil then
				do return 0 end
			end
			do _g.jk.lang.Buffer:copyFrom(self.buffer, src, 0, 0, size) end
			self.pos = size
		elseif self.pos + size <= _g.jk.lang.Buffer:getSize(self.buffer) then
			do _g.jk.lang.Buffer:copyFrom(self.buffer, src, 0, self.pos, size) end
			self.pos = self.pos + size
		else
			local nb = _g.jk.lang.Buffer:resize(self.buffer, self.pos + size)
			if nb == nil then
				do return 0 end
			end
			self.buffer = nb
			do _g.jk.lang.Buffer:copyFrom(self.buffer, src, 0, self.pos, size) end
			self.pos = self.pos + size
		end
		do return size end
	end
end

jk.io.SeekableWriter = {}

jk.io.PrintWriter = {}

jk.io.PrintReader = {}
jk.io.PrintReader.__index = jk.io.PrintReader
_vm:set_metatable(jk.io.PrintReader, {})

function jk.io.PrintReader._create()
	local v = _vm:set_metatable({}, jk.io.PrintReader)
	return v
end

function jk.io.PrintReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.PrintReader'
	self['_isType.jk.io.PrintReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.io.LineReader'] = true
	self['_isType.jk.lang.Closable'] = true
	self.reader = nil
	self.iterator = nil
end

function jk.io.PrintReader:_construct0()
	jk.io.PrintReader._init(self)
	return self
end

function jk.io.PrintReader:forReader(reader)
	if not (reader ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(reader, '_isType.jk.io.PrintReader') ~= nil) then
		do return reader end
	end
	do
		local v = _g.jk.io.PrintReader._construct0(_g.jk.io.PrintReader._create())
		do v:setReader(reader, nil) end
		do return v end
	end
end

function jk.io.PrintReader:forReaderAndEncoding(reader, encoding)
	if not (reader ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(reader, '_isType.jk.io.PrintReader') ~= nil) then
		do return reader end
	end
	do
		local v = _g.jk.io.PrintReader._construct0(_g.jk.io.PrintReader._create())
		do v:setReader(reader, encoding) end
		do return v end
	end
end

function jk.io.PrintReader:setReader(reader, encoding)
	self.reader = reader
	if reader == nil then
		self.iterator = nil
	else
		self.iterator = _g.jk.io.CharacterIteratorForReader:forReader(reader)
		if encoding ~= nil then
			do self.iterator:setEncoding(encoding) end
		end
	end
end

function jk.io.PrintReader:readLine()
	if not (self.iterator ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local c = self.iterator:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				if sb:count() < 1 then
					do return nil end
				end
				do break end
			end
			if c == 13 then
				goto _continue2
			end
			if c == 10 then
				do break end
			end
			do sb:appendCharacter(c) end
			::_continue2::
		end
		if sb:count() < 1 then
			do return "" end
		end
		do return sb:toString() end
	end
end

function jk.io.PrintReader:readAll()
	if not (self.iterator ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local c = self.iterator:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			do sb:appendCharacter(c) end
		end
		if sb:count() < 1 then
			do return nil end
		end
		do return sb:toString() end
	end
end

function jk.io.PrintReader:hasEnded()
	if not (self.iterator ~= nil) then
		do return true end
	end
	do return self.iterator:hasEnded() end
end

function jk.io.PrintReader:read(buffer)
	if self.reader == nil then
		do return -1 end
	end
	do return self.reader:read(buffer) end
end

function jk.io.PrintReader:close()
	local rc = _vm:to_table_with_key(self.reader, '_isType.jk.lang.Closable')
	if rc ~= nil then
		do rc:close() end
	end
end

jk.io.PrintWriterWrapper = {}
jk.io.PrintWriterWrapper.__index = jk.io.PrintWriterWrapper
_vm:set_metatable(jk.io.PrintWriterWrapper, {})

function jk.io.PrintWriterWrapper._create()
	local v = _vm:set_metatable({}, jk.io.PrintWriterWrapper)
	return v
end

function jk.io.PrintWriterWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.PrintWriterWrapper'
	self['_isType.jk.io.PrintWriterWrapper'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.io.PrintWriter'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.FlushableWriter'] = true
	self.writer = nil
end

function jk.io.PrintWriterWrapper:_construct0()
	jk.io.PrintWriterWrapper._init(self)
	return self
end

function jk.io.PrintWriterWrapper:forWriter(writer)
	if writer == nil then
		do return nil end
	end
	if (_vm:to_table_with_key(writer, '_isType.jk.io.PrintWriter') ~= nil) then
		do return writer end
	end
	do
		local v = _g.jk.io.PrintWriterWrapper._construct0(_g.jk.io.PrintWriterWrapper._create())
		do v:setWriter(writer) end
		do return v end
	end
end

function jk.io.PrintWriterWrapper:closeWriter(writer)
	local wc = _vm:to_table_with_key(writer, '_isType.jk.lang.Closable')
	if not (wc ~= nil) then
		do return nil end
	end
	do wc:close() end
	do return nil end
end

function jk.io.PrintWriterWrapper:print(str)
	if str == nil then
		do return false end
	end
	do
		local buffer = _g.jk.lang.String:toUTF8Buffer(str)
		if buffer == nil then
			do return false end
		end
		do
			local sz = _g.jk.lang.Buffer:getSize(buffer)
			if self.writer:write(buffer, -1) ~= sz then
				do return false end
			end
			do return true end
		end
	end
end

function jk.io.PrintWriterWrapper:println(str)
	do return self:print(_g.jk.lang.String:safeString(str) .. "\n") end
end

function jk.io.PrintWriterWrapper:writeWholeBuffer(buf)
	do return self:write(buf, -1) end
end

function jk.io.PrintWriterWrapper:write(buf, size)
	if self.writer == nil then
		do return -1 end
	end
	do return self.writer:write(buf, size) end
end

function jk.io.PrintWriterWrapper:close()
	local cw = _vm:to_table_with_key(self.writer, '_isType.jk.lang.Closable')
	if cw ~= nil then
		do cw:close() end
	end
end

function jk.io.PrintWriterWrapper:flush()
	local cw = _vm:to_table_with_key(self.writer, '_isType.jk.io.FlushableWriter')
	if cw ~= nil then
		do cw:flush() end
	end
end

function jk.io.PrintWriterWrapper:getWriter()
	do return self.writer end
end

function jk.io.PrintWriterWrapper:setWriter(v)
	self.writer = v
	do return self end
end

jk.io.FileDescriptorWriter = {}
jk.io.FileDescriptorWriter.__index = jk.io.FileDescriptorWriter
_vm:set_metatable(jk.io.FileDescriptorWriter, {})

function jk.io.FileDescriptorWriter._create()
	local v = _vm:set_metatable({}, jk.io.FileDescriptorWriter)
	return v
end

function jk.io.FileDescriptorWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.FileDescriptorWriter'
	self['_isType.jk.io.FileDescriptorWriter'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.FileDescriptor'] = true
	self.fd = -1
end

function jk.io.FileDescriptorWriter:_construct0()
	jk.io.FileDescriptorWriter._init(self)
	return self
end

function jk.io.FileDescriptorWriter:forFileDescriptor(fd)
	local v = _g.jk.io.FileDescriptorWriter._construct0(_g.jk.io.FileDescriptorWriter._create())
	do v:setFd(fd) end
	do return v end
end

function jk.io.FileDescriptorWriter:getFileDescriptor()
	do return self.fd end
end

function jk.io.FileDescriptorWriter:write(buf, size)
	local v = -1
	local handle = self.fd
	if handle >= 0 then
		do v = _io:write_to_handle(handle, buf, size) end
	end
	do return v end
end

function jk.io.FileDescriptorWriter:close()
	local handle = self.fd
	if handle >= 0 then
		do _io:close_handle(handle) end
		self.fd = -1
	end
end

function jk.io.FileDescriptorWriter:getFd()
	do return self.fd end
end

function jk.io.FileDescriptorWriter:setFd(v)
	self.fd = v
	do return self end
end

jk.io.BinaryReader = {}
jk.io.BinaryReader.__index = jk.io.BinaryReader
_vm:set_metatable(jk.io.BinaryReader, {})

function jk.io.BinaryReader._create()
	local v = _vm:set_metatable({}, jk.io.BinaryReader)
	return v
end

function jk.io.BinaryReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.BinaryReader'
	self['_isType.jk.io.BinaryReader'] = true
	self['_isType.jk.lang.Closable'] = true
	self.reader = nil
	self.buffer1 = nil
	self.buffer2 = nil
	self.buffer4 = nil
end

function jk.io.BinaryReader:_construct0()
	jk.io.BinaryReader._init(self)
	return self
end

function jk.io.BinaryReader:forReader(reader)
	local v = _g.jk.io.BinaryReader._construct0(_g.jk.io.BinaryReader._create())
	do v:setReader(reader) end
	do return v end
end

function jk.io.BinaryReader:isOK()
	if not (self.reader ~= nil) then
		do return false end
	end
	do return true end
end

function jk.io.BinaryReader:close()
	local rc = _vm:to_table_with_key(self.reader, '_isType.jk.lang.Closable')
	if rc ~= nil then
		do rc:close() end
	end
	self.reader = nil
end

function jk.io.BinaryReader:seek(position)
	local sr = _vm:to_table_with_key(self.reader, '_isType.jk.io.SeekableReader')
	if not (sr ~= nil) then
		do return false end
	end
	do return sr:setCurrentPosition(position) end
end

function jk.io.BinaryReader:read1()
	if not (self.reader ~= nil) then
		do return nil end
	end
	if not (self.buffer1 ~= nil) then
		self.buffer1 = _util:allocate_buffer(1)
	end
	do
		local r = self.reader:read(self.buffer1)
		if not (r == 1) then
			do self:close() end
			do return nil end
		end
		do return self.buffer1 end
	end
end

function jk.io.BinaryReader:read2()
	if not (self.reader ~= nil) then
		do return nil end
	end
	if not (self.buffer2 ~= nil) then
		self.buffer2 = _util:allocate_buffer(2)
	end
	do
		local r = self.reader:read(self.buffer2)
		if not (r == 2) then
			do self:close() end
			do return nil end
		end
		do return self.buffer2 end
	end
end

function jk.io.BinaryReader:read4()
	if not (self.reader ~= nil) then
		do return nil end
	end
	if not (self.buffer4 ~= nil) then
		self.buffer4 = _util:allocate_buffer(4)
	end
	do
		local r = self.reader:read(self.buffer4)
		if not (r == 4) then
			do self:close() end
			do return nil end
		end
		do return self.buffer4 end
	end
end

function jk.io.BinaryReader:readBuffer(size)
	if not (self.reader ~= nil) then
		do return nil end
	end
	if not (size > 0) then
		do return nil end
	end
	do
		local b = _util:allocate_buffer(size)
		local r = self.reader:read(b)
		if not (r == size) then
			do self:close() end
			do return nil end
		end
		do return b end
	end
end

function jk.io.BinaryReader:readInt8()
	local b = self:read1()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt8(b, 0) end
end

function jk.io.BinaryReader:readInt16LE()
	local b = self:read2()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt16LE(b, 0) end
end

function jk.io.BinaryReader:readInt16BE()
	local b = self:read2()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt16BE(b, 0) end
end

function jk.io.BinaryReader:readInt32LE()
	local b = self:read4()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt32LE(b, 0) end
end

function jk.io.BinaryReader:readInt32BE()
	local b = self:read4()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt32BE(b, 0) end
end

function jk.io.BinaryReader:getReader()
	do return self.reader end
end

function jk.io.BinaryReader:setReader(v)
	self.reader = v
	do return self end
end

jk.io.SeekableReader = {}

jk.io.FileDescriptorReader = {}
jk.io.FileDescriptorReader.__index = jk.io.FileDescriptorReader
_vm:set_metatable(jk.io.FileDescriptorReader, {})

function jk.io.FileDescriptorReader._create()
	local v = _vm:set_metatable({}, jk.io.FileDescriptorReader)
	return v
end

function jk.io.FileDescriptorReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.FileDescriptorReader'
	self['_isType.jk.io.FileDescriptorReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.FileDescriptor'] = true
	self.fd = -1
end

function jk.io.FileDescriptorReader:_construct0()
	jk.io.FileDescriptorReader._init(self)
	return self
end

function jk.io.FileDescriptorReader:forFileDescriptor(fd)
	local v = _g.jk.io.FileDescriptorReader._construct0(_g.jk.io.FileDescriptorReader._create())
	do v:setFd(fd) end
	do return v end
end

function jk.io.FileDescriptorReader:getFileDescriptor()
	do return self.fd end
end

function jk.io.FileDescriptorReader:read(buffer)
	local v = -1
	local handle = self.fd
	if handle >= 0 then
		do v = _io:read_from_handle(handle, buffer) end
	end
	do return v end
end

function jk.io.FileDescriptorReader:close()
	local handle = self.fd
	if handle >= 0 then
		do _io:close_handle(handle) end
		self.fd = -1
	end
end

function jk.io.FileDescriptorReader:getFd()
	do return self.fd end
end

function jk.io.FileDescriptorReader:setFd(v)
	self.fd = v
	do return self end
end

jk.io.SizedReader = {}

jk.io.ByteReader = {}

jk.io.BufferReader = {}
jk.io.BufferReader.__index = jk.io.BufferReader
_vm:set_metatable(jk.io.BufferReader, {})

function jk.io.BufferReader._create()
	local v = _vm:set_metatable({}, jk.io.BufferReader)
	return v
end

function jk.io.BufferReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.BufferReader'
	self['_isType.jk.io.BufferReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.io.SizedReader'] = true
	self['_isType.jk.io.SeekableReader'] = true
	self.buffer = nil
	self.pos = 0
end

function jk.io.BufferReader:_construct0()
	jk.io.BufferReader._init(self)
	return self
end

function jk.io.BufferReader:readFrom(reader)
	if not (reader ~= nil) then
		do return nil end
	end
	do
		local v = nil
		local tmp = _util:allocate_buffer(1024)
		while true do
			local r = reader:read(tmp)
			if r < 1 then
				do break end
			end
			v = _g.jk.lang.Buffer:append(v, tmp, r)
			if v == nil then
				do break end
			end
		end
		do return v end
	end
end

function jk.io.BufferReader:forBuffer(buf)
	do return _g.jk.io.BufferReader._construct0(_g.jk.io.BufferReader._create()):setBuffer(buf) end
end

function jk.io.BufferReader:setCurrentPosition(n)
	self.pos = n
	do return true end
end

function jk.io.BufferReader:getCurrentPosition()
	do return self.pos end
end

function jk.io.BufferReader:getBuffer()
	do return self.buffer end
end

function jk.io.BufferReader:setBuffer(buf)
	self.buffer = buf
	self.pos = 0
	do return self end
end

function jk.io.BufferReader:rewind()
	self.pos = 0
end

function jk.io.BufferReader:getSize()
	if self.buffer == nil then
		do return 0 end
	end
	do return #self.buffer end
end

function jk.io.BufferReader:read(buf)
	if buf == nil or self.buffer == nil then
		do return 0 end
	end
	do
		local buffersz = #self.buffer
		if self.pos >= buffersz then
			do return 0 end
		end
		do
			local size = #buf
			if size > buffersz - self.pos then
				size = buffersz - self.pos
			end
			do _g.jk.lang.Buffer:copyFrom(buf, self.buffer, self.pos, 0, size) end
			self.pos = self.pos + size
			do return size end
		end
	end
end

function jk.io.BufferReader:getPos()
	do return self.pos end
end

function jk.io.BufferReader:setPos(v)
	self.pos = v
	do return self end
end
jk = jk or {}

jk.time = jk.time or {}

jk.time.SystemClock = {}
jk.time.SystemClock.__index = jk.time.SystemClock
_vm:set_metatable(jk.time.SystemClock, {})

function jk.time.SystemClock._create()
	local v = _vm:set_metatable({}, jk.time.SystemClock)
	return v
end

function jk.time.SystemClock:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.time.SystemClock'
	self['_isType.jk.time.SystemClock'] = true
end

function jk.time.SystemClock:_construct0()
	jk.time.SystemClock._init(self)
	return self
end

function jk.time.SystemClock:asDateTimeUTC()
	do return _g.jk.lang.DateTime:forSeconds(_g.jk.time.SystemClock:asUTCSeconds()) end
end

function jk.time.SystemClock:asDateTimeLocal()
	local v = _g.jk.lang.DateTime:forSeconds(_g.jk.time.SystemClock:asSeconds())
	do v:setTimezoneOffset(_g.jk.time.SystemClock:getTimezoneOffsetAsSeconds()) end
	do return v end
end

function jk.time.SystemClock:getTimezoneOffsetAsSeconds()
	do return _os:get_system_timezone_seconds() end
end

function jk.time.SystemClock:asUTCSeconds()
	do return _g.jk.time.SystemClock:asSeconds() + _g.jk.time.SystemClock:getTimezoneOffsetAsSeconds() end
end

function jk.time.SystemClock:asSeconds()
	do return _os:get_system_time_seconds() end
end

function jk.time.SystemClock:asTimeValue()
	local v = _g.jk.lang.TimeValue._construct0(_g.jk.lang.TimeValue._create())
	do _g.jk.time.SystemClock:update(v) end
	do return v end
end

function jk.time.SystemClock:update(v)
	if not (v ~= nil) then
		do return end
	end
	do
		local millis = _os:get_system_time_milliseconds()
		local secs = _util:convert_to_integer(millis / 1000)
		local micros = (millis - secs * 1000) * 1000
		do v:setSeconds(secs) end
		do v:setMicroSeconds(micros) end
	end
end
jk = jk or {}

jk.fs = jk.fs or {}

jk.fs.FileReader = {}

jk.fs.FileWriter = {}

jk.fs.FileKit = {}
jk.fs.FileKit.__index = jk.fs.FileKit
_vm:set_metatable(jk.fs.FileKit, {})

function jk.fs.FileKit._create()
	local v = _vm:set_metatable({}, jk.fs.FileKit)
	return v
end

function jk.fs.FileKit:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileKit'
	self['_isType.jk.fs.FileKit'] = true
	self.ctx = nil
end

function jk.fs.FileKit:_construct0()
	jk.fs.FileKit._init(self)
	return self
end

function jk.fs.FileKit:_construct1(ctx)
	jk.fs.FileKit._init(self)
	self.ctx = ctx
	return self
end

function jk.fs.FileKit:asFile(file)
	local fo = _g.jk.fs.File:asFile(file)
	if not (fo ~= nil) then
		do _g.jk.lang.Error:throw("invalidParameter", _g.jk.lang.String:asString(file)) end
	end
	do return fo end
end

function jk.fs.FileKit:copy(src, dst)
	local srcf = self:asFile(src)
	local dstf = self:asFile(dst)
	if dstf:isDirectory() then
		dstf = dstf:entry(srcf:getBasename())
	end
	if not srcf:copyFileOrDirectoryTo(dstf) then
		do _g.jk.lang.Error:throw("failedToCopy", srcf:getPath()) end
	end
	do return dstf end
end

function jk.fs.FileKit:remove(file)
	local fo = self:asFile(file)
	if not fo:removeRecursive() then
		do _g.jk.lang.Error:throw("failedToRemove", fo:getPath()) end
	end
end

function jk.fs.FileKit:readAsBuffer(file)
	local fo = self:asFile(file)
	local v = fo:getContentsBuffer()
	if not (v ~= nil) then
		do _g.jk.lang.Error:throw("failedToRead", fo:getPath()) end
	end
	do return v end
end

function jk.fs.FileKit:readAsString(file)
	local fo = self:asFile(file)
	local v = fo:getContentsUTF8()
	if not (v ~= nil) then
		do _g.jk.lang.Error:throw("failedToRead", fo:getPath()) end
	end
	do return v end
end

function jk.fs.FileKit:writeBuffer(file, data)
	local fo = self:asFile(file)
	if not fo:setContentsBuffer(data) then
		do _g.jk.lang.Error:throw("failedToWrite", fo:getPath()) end
	end
end

function jk.fs.FileKit:writeString(file, data)
	local fo = self:asFile(file)
	if not fo:setContentsUTF8(_g.jk.lang.String:asString(data)) then
		do _g.jk.lang.Error:throw("failedToWrite", fo:getPath()) end
	end
end

jk.fs.CurrentDirectory = {}
jk.fs.CurrentDirectory.__index = jk.fs.CurrentDirectory
_vm:set_metatable(jk.fs.CurrentDirectory, {})

function jk.fs.CurrentDirectory._create()
	local v = _vm:set_metatable({}, jk.fs.CurrentDirectory)
	return v
end

function jk.fs.CurrentDirectory:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.CurrentDirectory'
	self['_isType.jk.fs.CurrentDirectory'] = true
end

function jk.fs.CurrentDirectory:_construct0()
	jk.fs.CurrentDirectory._init(self)
	return self
end

function jk.fs.CurrentDirectory:set(dir)
	if not (dir ~= nil) then
		do return end
	end
	do _io:set_current_directory(dir:getPath()) end
end

function jk.fs.CurrentDirectory:get()
	do return _g.jk.fs.File:forPath(_io:get_current_directory()) end
end

jk.fs.PathInfo = {}
jk.fs.PathInfo.__index = jk.fs.PathInfo
_vm:set_metatable(jk.fs.PathInfo, {})

function jk.fs.PathInfo._create()
	local v = _vm:set_metatable({}, jk.fs.PathInfo)
	return v
end

function jk.fs.PathInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.PathInfo'
	self['_isType.jk.fs.PathInfo'] = true
end

function jk.fs.PathInfo:_construct0()
	jk.fs.PathInfo._init(self)
	return self
end

function jk.fs.PathInfo:getPathSeparator()
	if _g.jk.os.OS:isWindows() then
		do return 92 end
	end
	do return 47 end
end

function jk.fs.PathInfo:isAbsolutePath(path)
	if not (path ~= nil) then
		do return false end
	end
	do
		local c0 = _g.jk.lang.String:getChar(path, 0)
		if c0 == 47 then
			do return true end
		end
		if _g.jk.os.OS:isWindows() then
			if c0 == 92 then
				do return true end
			end
			if _g.jk.lang.Character:isAlpha(c0) and _g.jk.lang.String:getChar(path, 1) == 58 then
				local d = _g.jk.lang.String:getChar(path, 2)
				if d == 92 or d == 47 then
					do return true end
				end
			end
		end
		do return false end
	end
end

jk.fs.File = {}
jk.fs.File.__index = jk.fs.File
_vm:set_metatable(jk.fs.File, {})

function jk.fs.File._create()
	local v = _vm:set_metatable({}, jk.fs.File)
	return v
end

function jk.fs.File:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.File'
	self['_isType.jk.fs.File'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.lastErrorDescription = nil
end

function jk.fs.File:_construct0()
	jk.fs.File._init(self)
	return self
end

function jk.fs.File:asFile(o)
	if not (o ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(o, '_isType.jk.fs.File') ~= nil) then
		do return o end
	end
	do
		local ss = _g.jk.lang.String:asString(o)
		if ss ~= nil then
			do return _g.jk.fs.File:forPath(ss) end
		end
		do return nil end
	end
end

function jk.fs.File:asFileVector(o)
	local it = _g.jk.lang.DynamicObject:iterate(o)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local oo = it:next()
			if not (oo ~= nil) then
				do break end
			end
			do
				local ff = _g.jk.fs.File:asFile(oo)
				if ff ~= nil then
					do _g.jk.lang.Vector:append(v, ff) end
				end
			end
		end
		do return v end
	end
end

function jk.fs.File:forPath(path)
	if path == nil or _g.jk.lang.String:getLength(path) < 1 then
		do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
	end
	do return _g.jk.fs.FileForSushi:forPath(path) end
end

function jk.fs.File:forRelativePath(path, relativeTo, alwaysSupportWindowsPathnames)
	if relativeTo == nil then
		do return _g.jk.fs.File:forPath(path) end
	end
	if path == nil then
		do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
	end
	if _g.jk.fs.PathInfo:isAbsolutePath(path) then
		do return _g.jk.fs.File:forPath(path) end
	end
	do
		local sep = _g.jk.fs.PathInfo:getPathSeparator()
		if sep ~= 47 then
			if _g.jk.lang.String:getIndexOfCharacter(path, sep, 0) < 0 and _g.jk.lang.String:getIndexOfCharacter(path, 47, 0) >= 0 then
				sep = 47
			end
		elseif alwaysSupportWindowsPathnames then
			if _g.jk.lang.String:getIndexOfCharacter(path, sep, 0) < 0 and _g.jk.lang.String:getIndexOfCharacter(path, 92, 0) >= 0 then
				sep = 92
			end
		end
		do
			local f = relativeTo
			local comps = _g.jk.lang.String:split(path, sep, 0)
			if comps ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(comps)
				do
					n = 0
					while n < m do
						local comp = comps[n + 1]
						if comp ~= nil then
							if _g.jk.lang.String:isEmpty(comp) then
								goto _continue1
							end
							f = f:entry(comp)
						end
						::_continue1::
						do n = n + 1 end
					end
				end
			end
			do return f end
		end
	end
end

function jk.fs.File:entry(name)
end

function jk.fs.File:entries()
end

function jk.fs.File:move(dest, replace)
end

function jk.fs.File:touch()
end

function jk.fs.File:read()
end

function jk.fs.File:write()
end

function jk.fs.File:append()
end

function jk.fs.File:stat()
end

function jk.fs.File:createDirectory()
end

function jk.fs.File:createDirectoryRecursive()
end

function jk.fs.File:removeDirectory()
end

function jk.fs.File:getPath()
end

function jk.fs.File:remove()
end

function jk.fs.File:makeExecutable()
end

function jk.fs.File:getRelativePath(baseFile, prefix)
	if not (baseFile ~= nil) then
		do return nil end
	end
	do
		local vp = self:getPath()
		local bp = baseFile:getPath()
		while _g.jk.lang.String:endsWith(bp, "/") or _g.jk.lang.String:endsWith(bp, "\\") do
			bp = _g.jk.lang.String:getSubString(bp, 0, _g.jk.lang.String:getLength(bp) - 1)
		end
		if _g.jk.lang.String:startsWith(vp, _g.jk.lang.String:safeString(bp) .. "/", 0) or _g.jk.lang.String:startsWith(vp, _g.jk.lang.String:safeString(bp) .. "\\", 0) then
			if prefix ~= nil then
				do return _g.jk.lang.String:safeString(prefix) .. _g.jk.lang.String:safeString(_g.jk.lang.String:getEndOfString(vp, _g.jk.lang.String:getLength(bp))) end
			end
			do return _g.jk.lang.String:getEndOfString(vp, _g.jk.lang.String:getLength(bp) + 1) end
		end
		do return nil end
	end
end

function jk.fs.File:getRelativePathOrBasename(baseFile, prefix)
	local v = self:getRelativePath(baseFile, prefix)
	if v ~= nil then
		do return v end
	end
	do return self:getBasename() end
end

function jk.fs.File:rename(newname, replace)
	do return self:move(_g.jk.fs.File:forPath(newname), replace) end
end

function jk.fs.File:writeFromReader(reader, doAppend)
	do self:onError(nil) end
	if not (reader ~= nil) then
		do return false end
	end
	do
		local buffer = _util:allocate_buffer(1024)
		if not (buffer ~= nil) then
			do return false end
		end
		do
			local writer = nil
			if doAppend then
				writer = self:append()
			else
				writer = self:write()
			end
			if not (writer ~= nil) then
				do return false end
			end
			do
				local v = true
				while true do
					local r = reader:read(buffer)
					if r < 1 then
						do break end
					end
					do
						local w = writer:write(buffer, r)
						if w < r then
							v = false
							do break end
						end
					end
				end
				do writer:close() end
				do return v end
			end
		end
	end
end

function jk.fs.File:createFifo()
	do self:onError("Not supported") end
	do return false end
end

function jk.fs.File:isExecutable()
	if _g.jk.os.OS:isWindows() then
		do return self:hasExtension("exe") or self:hasExtension("bat") or self:hasExtension("cmd") or self:hasExtension("com") end
	end
	do return self:stat():getExecutable() end
end

function jk.fs.File:exists()
	do self:onError(nil) end
	do
		local fi = self:stat()
		do return fi:getType() ~= _g.jk.fs.FileInfo.FILE_TYPE_UNKNOWN end
	end
end

function jk.fs.File:isIdentical(file)
	if not (file ~= nil) then
		do return false end
	end
	do
		local myrd = self:read()
		if not (myrd ~= nil) then
			do return false end
		end
		do
			local oord = file:read()
			if not (oord ~= nil) then
				do return false end
			end
			do
				local mybuf = _util:allocate_buffer(1024)
				if not (mybuf ~= nil) then
					do return false end
				end
				do
					local oobuf = _util:allocate_buffer(1024)
					if not (oobuf ~= nil) then
						do return false end
					end
					do
						local v = true
						while v do
							local myr = myrd:read(mybuf)
							local oor = oord:read(oobuf)
							if myr ~= oor then
								v = false
							else
								if myr < 1 then
									do break end
								end
								do
									local n = 0
									while n < myr do
										if mybuf[n + 1] ~= oobuf[n + 1] then
											v = false
										end
										do n = n + 1 end
									end
								end
							end
						end
						do myrd:close() end
						do oord:close() end
						do return v end
					end
				end
			end
		end
	end
end

jk.fs.File.ReadLineIterator = {}
jk.fs.File.ReadLineIterator.__index = jk.fs.File.ReadLineIterator
_vm:set_metatable(jk.fs.File.ReadLineIterator, {})

function jk.fs.File.ReadLineIterator._create()
	local v = _vm:set_metatable({}, jk.fs.File.ReadLineIterator)
	return v
end

function jk.fs.File.ReadLineIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.File.ReadLineIterator'
	self['_isType.jk.fs.File.ReadLineIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.reader = nil
end

function jk.fs.File.ReadLineIterator:_construct0()
	jk.fs.File.ReadLineIterator._init(self)
	return self
end

function jk.fs.File.ReadLineIterator:next()
	if not (self.reader ~= nil) then
		do return nil end
	end
	do
		local v = self.reader:readLine()
		if v == nil then
			do self.reader:close() end
			self.reader = nil
		end
		do return v end
	end
end

function jk.fs.File.ReadLineIterator:hasNext()
	if not (self.reader ~= nil) then
		do return false end
	end
	do return not self.reader:hasEnded() end
end

function jk.fs.File.ReadLineIterator:getReader()
	do return self.reader end
end

function jk.fs.File.ReadLineIterator:setReader(v)
	self.reader = v
	do return self end
end

function jk.fs.File:getLastErrorDescription()
	do return self.lastErrorDescription end
end

function jk.fs.File:onError(v)
	local pp = self:getPath()
	if not (v ~= nil) then
		self.lastErrorDescription = nil
	elseif pp ~= nil then
		self.lastErrorDescription = _g.jk.lang.String:safeString(pp) .. ": " .. _g.jk.lang.String:safeString(v)
	else
		self.lastErrorDescription = v
	end
end

function jk.fs.File:readLines()
	local rd = _g.jk.io.PrintReader:forReader(self:read())
	if not (rd ~= nil) then
		do return nil end
	end
	do return _g.jk.fs.File.ReadLineIterator._construct0(_g.jk.fs.File.ReadLineIterator._create()):setReader(rd) end
end

function jk.fs.File:readLinesVector()
	local it = self:readLines()
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local line = it:next()
			if not (line ~= nil) then
				do break end
			end
			do _g.jk.lang.Vector:append(v, line) end
		end
		do return v end
	end
end

function jk.fs.File:hasChangedSince(originalTimeStamp)
	local nts = self:getLastModifiedTimeStamp()
	if nts > originalTimeStamp then
		do return true end
	end
	do return false end
end

function jk.fs.File:getLastModifiedTimeStamp()
	if self:isFile() == false then
		do return 0 end
	end
	do
		local st = self:stat()
		if st == nil then
			do return 0 end
		end
		do return st:getModifyTime() end
	end
end

function jk.fs.File:compareModificationTime(bf)
	if bf == nil then
		do return 1 end
	end
	do
		local myts = self:getLastModifiedTimeStamp()
		local bfts = bf:getLastModifiedTimeStamp()
		if myts < bfts then
			do return -1 end
		end
		if myts > bfts then
			do return 1 end
		end
		do return 0 end
	end
end

function jk.fs.File:isNewerThan(bf)
	do return self:compareModificationTime(bf) > 0 end
end

function jk.fs.File:isOlderThan(bf)
	do return self:compareModificationTime(bf) < 0 end
end

function jk.fs.File:isSame(file)
	do self:onError(nil) end
	if not (file ~= nil) then
		do return false end
	end
	do
		local path = self:getPath()
		if path ~= nil and path == file:getPath() then
			do return true end
		end
		do return false end
	end
end

function jk.fs.File:removeRecursive()
	do self:onError(nil) end
	do
		local finfo = self:stat()
		if not (finfo ~= nil) then
			do return true end
		end
		if finfo:isDirectory() == false or finfo:isLink() == true then
			do return self:remove() end
		end
		do
			local it = self:entries()
			if not (it ~= nil) then
				do return false end
			end
			while it ~= nil do
				local f = it:next()
				if not (f ~= nil) then
					do break end
				end
				if not f:removeRecursive() then
					do self:onError(f:getLastErrorDescription()) end
					do return false end
				end
			end
			do return self:removeDirectory() end
		end
	end
end

function jk.fs.File:isFile()
	local st = self:stat()
	if not (st ~= nil) then
		do return false end
	end
	do return st:isFile() end
end

function jk.fs.File:isDirectory()
	local st = self:stat()
	if not (st ~= nil) then
		do return false end
	end
	do return st:isDirectory() end
end

function jk.fs.File:isLink()
	local st = self:stat()
	if not (st ~= nil) then
		do return false end
	end
	do return st:isLink() end
end

function jk.fs.File:getSize()
	local st = self:stat()
	if st == nil then
		do return 0 end
	end
	do return st:getSize() end
end

function jk.fs.File:setMode(mode)
	do self:onError("Not supported") end
	do return false end
end

function jk.fs.File:setOwnerUser(uid)
	do self:onError("Not supported") end
	do return false end
end

function jk.fs.File:setOwnerGroup(gid)
	do self:onError("Not supported") end
	do return false end
end

function jk.fs.File:withExtension(ext)
	if not (ext ~= nil) then
		do return self end
	end
	do
		local bn = self:getBasename()
		do return self:getSibling(_g.jk.lang.String:safeString(bn) .. "." .. _g.jk.lang.String:safeString(ext)) end
	end
end

function jk.fs.File:asExecutable()
	if _g.jk.os.OS:isWindows() then
		if self:hasExtension("exe") == false and self:hasExtension("bat") == false and self:hasExtension("cmd") == false and self:hasExtension("com") == false then
			local exe = self:withExtension("exe")
			if exe:isFile() then
				do return exe end
			end
			do
				local bat = self:withExtension("bat")
				if bat:isFile() then
					do return bat end
				end
				do
					local cmd = self:withExtension("cmd")
					if cmd:isFile() then
						do return cmd end
					end
					do
						local com = self:withExtension("com")
						if com:isFile() then
							do return com end
						end
						do return exe end
					end
				end
			end
		end
	end
	do return self end
end

function jk.fs.File:getParent()
	do self:onError(nil) end
	do
		local path = self:directoryName()
		if path == nil then
			do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
		end
		do return _g.jk.fs.File:forPath(path) end
	end
end

function jk.fs.File:getSibling(name)
	local pp = self:getParent()
	if not (pp ~= nil) then
		do return nil end
	end
	if name == nil then
		do return pp end
	end
	do return pp:entry(name) end
end

function jk.fs.File:hasExtension(ext)
	local xx = self:extension()
	if not (xx ~= nil) then
		do return false end
	end
	do return _g.jk.lang.String:equalsIgnoreCase(xx, ext) end
end

function jk.fs.File:extension()
	local bn = self:getBasename()
	if not (bn ~= nil) then
		do return nil end
	end
	do
		local dot = _g.jk.lang.String:getLastIndexOfCharacter(bn, 46, -1)
		if dot < 0 then
			do return nil end
		end
		do return _g.jk.lang.String:getEndOfString(bn, dot + 1) end
	end
end

function jk.fs.File:directoryName()
	local path = self:getPath()
	if not (path ~= nil) then
		do return nil end
	end
	do
		local delim = _g.jk.fs.PathInfo:getPathSeparator()
		local dp = _g.jk.lang.String:getLastIndexOfCharacter(path, delim, -1)
		if dp < 0 then
			do return "." end
		end
		do return _g.jk.lang.String:getSubString(path, 0, dp) end
	end
end

function jk.fs.File:getBasename()
	local path = self:getPath()
	if not (path ~= nil) then
		do return nil end
	end
	do
		local delim = _g.jk.fs.PathInfo:getPathSeparator()
		if _g.jk.lang.String:endsWith(path, _g.jk.lang.String:forCharacter(delim)) then
			path = _g.jk.lang.String:getSubString(path, 0, _g.jk.lang.String:getLength(path) - 1)
		end
		do
			local dp = _g.jk.lang.String:getLastIndexOfCharacter(path, delim, -1)
			if dp < 0 then
				do return path end
			end
			do return _g.jk.lang.String:getEndOfString(path, dp + 1) end
		end
	end
end

function jk.fs.File:getBasenameWithoutExtension()
	local bn = self:getBasename()
	if not (bn ~= nil) then
		do return nil end
	end
	do
		local dot = _g.jk.lang.String:getLastIndexOfCharacter(bn, 46, -1)
		if dot < 0 then
			do return bn end
		end
		do return _g.jk.lang.String:getSubString(bn, 0, dot) end
	end
end

function jk.fs.File:baseName()
	do return self:getBasename() end
end

function jk.fs.File:baseNameWithoutExtension()
	do return self:getBasenameWithoutExtension() end
end

function jk.fs.File:copyFileTo(dest)
	do self:onError(nil) end
	if not (dest ~= nil) then
		do return false end
	end
	if self:isSame(dest) then
		do return true end
	end
	do
		local buf = _util:allocate_buffer(4096 * 4)
		if not (buf ~= nil) then
			do return false end
		end
		do
			local reader = self:read()
			if not (reader ~= nil) then
				do return false end
			end
			do
				local writer = dest:write()
				if not (writer ~= nil) then
					if (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
						do reader:close() end
					end
					do self:onError(dest:getLastErrorDescription()) end
					do return false end
				end
				do
					local v = true
					local n = 0
					while (function()
						n = reader:read(buf)
						do return n end
					end)() > 0 do
						local nr = writer:write(buf, n)
						if nr ~= n then
							v = false
							do break end
						end
					end
					if v then
						local fi = self:stat()
						if fi ~= nil then
							local mode = fi:getMode()
							if mode ~= 0 then
								do dest:setMode(mode) end
							end
						end
					else
						do dest:remove() end
					end
					if reader ~= nil and (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
						do reader:close() end
					end
					if writer ~= nil and (_vm:to_table_with_key(writer, '_isType.jk.lang.Closable') ~= nil) then
						do writer:close() end
					end
					do return v end
				end
			end
		end
	end
end

function jk.fs.File:copyFileOrDirectoryTo(dest)
	if not (dest ~= nil) then
		do return false end
	end
	if self:isFile() then
		do return self:copyFileTo(dest) end
	end
	if not self:isDirectory() then
		do return false end
	end
	if not dest:createDirectoryRecursive() then
		do return false end
	end
	do
		local it = self:entries()
		if not (it ~= nil) then
			do return false end
		end
		while true do
			local nsrc = it:next()
			if not (nsrc ~= nil) then
				do break end
			end
			do
				local ndest = dest:entry(nsrc:getBasename())
				if not nsrc:copyFileOrDirectoryTo(ndest) then
					do return false end
				end
			end
		end
		do return true end
	end
end

function jk.fs.File:setContentsString(str, encoding)
	if _g.jk.lang.String:isEmpty(encoding) then
		do return false end
	end
	do return self:setContentsBuffer(_g.jk.lang.String:toBuffer(str, encoding)) end
end

function jk.fs.File:setContentsUTF8(str)
	do return self:setContentsBuffer(_g.jk.lang.String:toUTF8Buffer(str)) end
end

function jk.fs.File:setContentsBuffer(buffer)
	do self:onError(nil) end
	if not (buffer ~= nil) then
		do return false end
	end
	do
		local writer = self:write()
		if not (writer ~= nil) then
			do return false end
		end
		if writer:write(buffer, #buffer) < 0 then
			do return false end
		end
		do writer:close() end
		do return true end
	end
end

function jk.fs.File:getContentsString(encoding)
	if _g.jk.lang.String:isEmpty(encoding) then
		do return nil end
	end
	do
		local b = self:getContentsBuffer()
		if not (b ~= nil) then
			if self:isFile() and self:getSize() == 0 then
				do return "" end
			end
			do return nil end
		end
		do return _g.jk.lang.String:forBuffer(b, encoding) end
	end
end

function jk.fs.File:getContentsUTF8()
	local b = self:getContentsBuffer()
	if not (b ~= nil) then
		if self:isFile() and self:getSize() == 0 then
			do return "" end
		end
		do return nil end
	end
	do return _g.jk.lang.String:forUTF8Buffer(b) end
end

function jk.fs.File:getContentsWithBOM()
	local buf = self:getContentsBuffer()
	if not (buf ~= nil) then
		if self:isFile() and self:getSize() == 0 then
			do return "" end
		end
		do return nil end
	end
	if _g.jk.lang.Buffer:getByte(buf, 0) == 239 and _g.jk.lang.Buffer:getByte(buf, 1) == 187 and _g.jk.lang.Buffer:getByte(buf, 2) == 191 then
		do return _g.jk.lang.String:forUTF8Buffer(_g.jk.lang.Buffer:getSubBuffer(buf, 3, _g.jk.lang.Buffer:getSize(buf) - 3, false)) end
	elseif _g.jk.lang.Buffer:getByte(buf, 0) == 255 and _g.jk.lang.Buffer:getByte(buf, 1) == 254 then
		do self:onError("Not supported encoding, UTF-16 little endian") end
		do return nil end
	elseif _g.jk.lang.Buffer:getByte(buf, 0) == 254 and _g.jk.lang.Buffer:getByte(buf, 1) == 255 then
		do self:onError("Not supported encoding, UTF-16 big-endian") end
		do return nil end
	elseif _g.jk.lang.Buffer:getByte(buf, 0) == 255 and _g.jk.lang.Buffer:getByte(buf, 1) == 254 and _g.jk.lang.Buffer:getByte(buf, 2) == 0 and _g.jk.lang.Buffer:getByte(buf, 3) == 0 then
		do self:onError("Not supported encoding, UTF-32 little endian") end
		do return nil end
	elseif _g.jk.lang.Buffer:getByte(buf, 0) == 0 and _g.jk.lang.Buffer:getByte(buf, 1) == 0 and _g.jk.lang.Buffer:getByte(buf, 2) == 254 and _g.jk.lang.Buffer:getByte(buf, 3) == 255 then
		do self:onError("Not supported encoding, UTF-32 big endian") end
		do return nil end
	end
	do return _g.jk.lang.String:forUTF8Buffer(buf) end
end

function jk.fs.File:getContentsBuffer()
	do self:onError(nil) end
	do
		local reader = self:read()
		if not (reader ~= nil) then
			do return nil end
		end
		do
			local sz = reader:getSize()
			if sz < 1 then
				do reader:close() end
				do return nil end
			end
			do
				local b = _util:allocate_buffer(sz)
				local rsz = reader:read(b)
				do reader:close() end
				if rsz < sz then
					do return nil end
				end
				do return b end
			end
		end
	end
end

function jk.fs.File:toString()
	do return self:getPath() end
end

jk.fs.FileForSushi = _g.jk.fs.File._create()
jk.fs.FileForSushi.__index = jk.fs.FileForSushi
_vm:set_metatable(jk.fs.FileForSushi, {
	__index = _g.jk.fs.File
})

function jk.fs.FileForSushi._create()
	local v = _vm:set_metatable({}, jk.fs.FileForSushi)
	return v
end

function jk.fs.FileForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileForSushi'
	self['_isType.jk.fs.FileForSushi'] = true
	self.path = nil
end

function jk.fs.FileForSushi:_construct0()
	jk.fs.FileForSushi._init(self)
	do _g.jk.fs.File._construct0(self) end
	return self
end

jk.fs.FileForSushi.MyFileReader = {}
jk.fs.FileForSushi.MyFileReader.__index = jk.fs.FileForSushi.MyFileReader
_vm:set_metatable(jk.fs.FileForSushi.MyFileReader, {})

function jk.fs.FileForSushi.MyFileReader._create()
	local v = _vm:set_metatable({}, jk.fs.FileForSushi.MyFileReader)
	return v
end

function jk.fs.FileForSushi.MyFileReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileForSushi.MyFileReader'
	self['_isType.jk.fs.FileForSushi.MyFileReader'] = true
	self['_isType.jk.fs.FileReader'] = true
	self['_isType.jk.io.SizedReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.SeekableReader'] = true
	self.handle = -1
	self.file = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.fs.FileForSushi.MyFileReader:_construct0()
	jk.fs.FileForSushi.MyFileReader._init(self)
	return self
end

function jk.fs.FileForSushi.MyFileReader:_destruct()
	do self:close() end
end

function jk.fs.FileForSushi.MyFileReader:read(buffer)
	local v = -1
	local handle = self.handle
	if handle >= 0 then
		do v = _io:read_from_handle(handle, buffer) end
	end
	do return v end
end

function jk.fs.FileForSushi.MyFileReader:getSize()
	local v = -1
	local handle = self.handle
	if handle >= 0 then
		do v = _io:get_size_for_handle(handle) end
	end
	do return v end
end

function jk.fs.FileForSushi.MyFileReader:close()
	local handle = self.handle
	if handle >= 0 then
		do _io:close_handle(handle) end
		self.handle = -1
	end
end

function jk.fs.FileForSushi.MyFileReader:setCurrentPosition(n)
	local handle = self.handle
	if handle < 0 then
		do return false end
	end
	if _io:set_current_position(handle, n) < 0 then
		do return false end
	end
	do return true end
end

function jk.fs.FileForSushi.MyFileReader:getCurrentPosition()
	local handle = self.handle
	if handle < 0 then
		do return 0 end
	end
	do return _io:get_current_position(handle) end
end

function jk.fs.FileForSushi.MyFileReader:getHandle()
	do return self.handle end
end

function jk.fs.FileForSushi.MyFileReader:setHandle(v)
	self.handle = v
	do return self end
end

function jk.fs.FileForSushi.MyFileReader:getFile()
	do return self.file end
end

function jk.fs.FileForSushi.MyFileReader:setFile(v)
	self.file = v
	do return self end
end

jk.fs.FileForSushi.MyFileWriter = {}
jk.fs.FileForSushi.MyFileWriter.__index = jk.fs.FileForSushi.MyFileWriter
_vm:set_metatable(jk.fs.FileForSushi.MyFileWriter, {})

function jk.fs.FileForSushi.MyFileWriter._create()
	local v = _vm:set_metatable({}, jk.fs.FileForSushi.MyFileWriter)
	return v
end

function jk.fs.FileForSushi.MyFileWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileForSushi.MyFileWriter'
	self['_isType.jk.fs.FileForSushi.MyFileWriter'] = true
	self['_isType.jk.fs.FileWriter'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.SeekableWriter'] = true
	self.handle = -1
	self.file = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.fs.FileForSushi.MyFileWriter:_construct0()
	jk.fs.FileForSushi.MyFileWriter._init(self)
	return self
end

function jk.fs.FileForSushi.MyFileWriter:_destruct()
	do self:close() end
end

function jk.fs.FileForSushi.MyFileWriter:write(buf, size)
	local v = -1
	local handle = self.handle
	if handle >= 0 then
		do v = _io:write_to_handle(handle, buf, size) end
	end
	do return v end
end

function jk.fs.FileForSushi.MyFileWriter:close()
	local handle = self.handle
	if handle >= 0 then
		do _io:close_handle(handle) end
		self.handle = -1
	end
end

function jk.fs.FileForSushi.MyFileWriter:setCurrentPosition(n)
	local handle = self.handle
	if handle < 0 then
		do return false end
	end
	if _io:set_current_position(handle, n) < 0 then
		do return false end
	end
	do return true end
end

function jk.fs.FileForSushi.MyFileWriter:getCurrentPosition()
	local handle = self.handle
	if handle < 0 then
		do return 0 end
	end
	do return _io:get_current_position(handle) end
end

function jk.fs.FileForSushi.MyFileWriter:getHandle()
	do return self.handle end
end

function jk.fs.FileForSushi.MyFileWriter:setHandle(v)
	self.handle = v
	do return self end
end

function jk.fs.FileForSushi.MyFileWriter:getFile()
	do return self.file end
end

function jk.fs.FileForSushi.MyFileWriter:setFile(v)
	self.file = v
	do return self end
end

function jk.fs.FileForSushi:forPath(path)
	local v = _g.jk.fs.FileForSushi._construct0(_g.jk.fs.FileForSushi._create())
	do v:setPath(path) end
	do return v end
end

function jk.fs.FileForSushi:entry(name)
	local pp = self.path
	if _g.jk.lang.String:isNotEmpty(name) then
		if pp ~= nil then
			pp = _g.jk.lang.String:safeString(pp) .. "/" .. _g.jk.lang.String:safeString(name)
		else
			pp = name
		end
	end
	do return _g.jk.fs.FileForSushi:forPath(pp) end
end

function jk.fs.FileForSushi:move(dest, replace)
	_io:write_to_stdout("--- stub --- jk.fs.FileForSushi :: move" .. "\n")
	do return false end
end

function jk.fs.FileForSushi:touch()
	local path = self.path
	local r = _io:touch_file(path)
	if r == 1 then
		do return true end
	end
	do return false end
end

function jk.fs.FileForSushi:read()
	local handle = 0
	local path = self.path
	do handle = _io:open_file_for_reading(path) end
	if not (handle >= 0) then
		do return nil end
	end
	do
		local v = _g.jk.fs.FileForSushi.MyFileReader._construct0(_g.jk.fs.FileForSushi.MyFileReader._create())
		do v:setFile(self) end
		do v:setHandle(handle) end
		do return v end
	end
end

function jk.fs.FileForSushi:write()
	local handle = 0
	local path = self.path
	do handle = _io:open_file_for_writing(path) end
	if not (handle >= 0) then
		do return nil end
	end
	do
		local v = _g.jk.fs.FileForSushi.MyFileWriter._construct0(_g.jk.fs.FileForSushi.MyFileWriter._create())
		do v:setFile(self) end
		do v:setHandle(handle) end
		do return v end
	end
end

function jk.fs.FileForSushi:append()
	local handle = 0
	local path = self.path
	do handle = _io:open_file_for_appending(path) end
	if not (handle >= 0) then
		do return nil end
	end
	do
		local v = _g.jk.fs.FileForSushi.MyFileWriter._construct0(_g.jk.fs.FileForSushi.MyFileWriter._create())
		do v:setFile(self) end
		do v:setHandle(handle) end
		do return v end
	end
end

function jk.fs.FileForSushi:stat()
	local path = self.path
	local valid = true
	local size = 0
	local ctim = 0
	local atim = 0
	local mtim = 0
	local uid = 0
	local gid = 0
	local mode = 0
	do size, ctim, atim, mtim, uid, gid, mode = _io:get_file_info(path) if size == nil then valid = false end end
	do
		local v = _g.jk.fs.FileInfo._construct0(_g.jk.fs.FileInfo._create())
		do v:setFile(self) end
		if not valid then
			do v:setType(_g.jk.fs.FileInfo.FILE_TYPE_UNKNOWN) end
			do return v end
		end
		do v:setSize(size) end
		do v:setCreateTime(ctim) end
		do v:setAccessTime(ctim) end
		do v:setModifyTime(mtim) end
		do v:setOwnerUser(uid) end
		do v:setOwnerGroup(gid) end
		do v:setMode(_vm:bitwise_and(mode, 511)) end
		if _vm:bitwise_and(mode, 32768) ~= 0 then
			do v:setType(_g.jk.fs.FileInfo.FILE_TYPE_FILE) end
		elseif _vm:bitwise_and(mode, 16384) ~= 0 then
			do v:setType(_g.jk.fs.FileInfo.FILE_TYPE_DIR) end
		else
			do v:setType(_g.jk.fs.FileInfo.FILE_TYPE_UNKNOWN) end
		end
		if _vm:bitwise_and(mode, 40960) ~= 0 then
			do v:setLink(true) end
		end
		if _vm:bitwise_and(mode, 64) ~= 0 or _vm:bitwise_and(mode, 8) ~= 0 or _vm:bitwise_and(mode, 1) ~= 0 then
			do v:setExecutable(true) end
		end
		do return v end
	end
end

function jk.fs.FileForSushi:createDirectory()
	local path = self.path
	local r = _io:create_directory(path)
	if r == 1 then
		do return true end
	end
	do return false end
end

function jk.fs.FileForSushi:createDirectoryRecursive()
	if self:isDirectory() then
		do return true end
	end
	do
		local parent = self:getParent()
		if parent ~= nil then
			if not parent:createDirectoryRecursive() then
				do return false end
			end
		end
		do return self:createDirectory() end
	end
end

function jk.fs.FileForSushi:removeDirectory()
	local path = self.path
	local r = _io:remove_directory(path)
	if r == 1 then
		do return true end
	end
	do return false end
end

function jk.fs.FileForSushi:normalizePath(apath)
	local path = apath
	if not (path ~= nil) then
		do return nil end
	end
	if _g.jk.os.OS:isWindows() then
		path = _g.jk.lang.String:replaceCharacter(path, 92, 47)
	end
	do
		local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local comps = _g.jk.lang.String:split(path, 47, 0)
		if comps ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(comps)
			do
				n = 0
				while n < m do
					local comp = comps[n + 1]
					if comp ~= nil then
						if _g.jk.lang.String:isEmpty(comp) then
						elseif comp == "." then
						elseif comp == ".." then
							local str = v:toString()
							do v:clear() end
							if str ~= nil then
								local slash = _g.jk.lang.String:getLastIndexOfCharacter(str, 47, -1)
								if slash > 0 then
									do v:appendString(_g.jk.lang.String:getSubString(str, 0, slash)) end
								end
							end
						else
							if v:count() > 0 then
								do v:appendCharacter(47) end
							end
							do v:appendString(comp) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if _g.jk.lang.String:startsWith(path, "/", 0) then
			do return "/" .. _g.jk.lang.String:safeString(v:toString()) end
		end
		do return v:toString() end
	end
end

function jk.fs.FileForSushi:setPath(v)
	if _g.jk.lang.String:isEmpty(v) then
		self.path = nil
		do return end
	end
	if _g.jk.os.OS:isWindows() then
		local l = _g.jk.lang.String:getLength(v)
		local c1 = _g.jk.lang.String:getChar(v, 1)
		if l == 2 and c1 == 58 then
			self.path = _g.jk.lang.String:safeString(v) .. "/"
			do return end
		end
		do
			local c2 = _g.jk.lang.String:getChar(v, 2)
			if l == 3 and c1 == 58 and (c2 == 92 or c2 == 47) then
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do sb:appendCharacter(_g.jk.lang.String:getChar(v, 0)) end
				do sb:appendCharacter(58) end
				do sb:appendCharacter(47) end
				self.path = sb:toString()
				do return end
			end
		end
	end
	do
		local realpath = nil
		do realpath = _io:get_real_path(v) end
		if _g.jk.lang.String:isNotEmpty(realpath) then
			self.path = realpath
			if _g.jk.os.OS:isWindows() then
				self.path = _g.jk.lang.String:replaceCharacter(self.path, 92, 47)
			end
			do return end
		end
		if _g.jk.fs.PathInfo:isAbsolutePath(v) then
			self.path = self:normalizePath(v)
		else
			self.path = self:normalizePath(_g.jk.lang.String:safeString(_io:get_current_directory()) .. "/" .. _g.jk.lang.String:safeString(v))
		end
	end
end

function jk.fs.FileForSushi:getPath()
	do return self.path end
end

function jk.fs.FileForSushi:remove()
	local path = self.path
	if _io:remove_file(path) == 1 then
		do return true end
	end
	do return false end
end

function jk.fs.FileForSushi:makeExecutable()
	local path = self.path
	local mode = _vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(1, 4), 8), 32), 64), 128), 256)
	do return _io:set_file_mode(path, mode ) end
end

function jk.fs.FileForSushi:setMode(mode)
	local path = self.path
	do return _io:set_file_mode(path, mode ) end
end

jk.fs.FileForSushi.MyDirectoryIterator = {}
jk.fs.FileForSushi.MyDirectoryIterator.__index = jk.fs.FileForSushi.MyDirectoryIterator
_vm:set_metatable(jk.fs.FileForSushi.MyDirectoryIterator, {})

function jk.fs.FileForSushi.MyDirectoryIterator._create()
	local v = _vm:set_metatable({}, jk.fs.FileForSushi.MyDirectoryIterator)
	return v
end

function jk.fs.FileForSushi.MyDirectoryIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileForSushi.MyDirectoryIterator'
	self['_isType.jk.fs.FileForSushi.MyDirectoryIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self['_isType.jk.lang.Closable'] = true
	self.parent = nil
	self.handle = nil
	self.current = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.fs.FileForSushi.MyDirectoryIterator:_construct0()
	jk.fs.FileForSushi.MyDirectoryIterator._init(self)
	return self
end

function jk.fs.FileForSushi.MyDirectoryIterator:_destruct()
	do self:close() end
end

function jk.fs.FileForSushi.MyDirectoryIterator:close()
	local handle = self.handle
	if handle ~= nil then
		do _io:close_directory(handle) end
		self.handle = nil
	end
end

function jk.fs.FileForSushi.MyDirectoryIterator:doNext()
	local handle = self.handle
	if not (handle ~= nil) then
		do return nil end
	end
	do
		local name = _io:read_directory(handle)
		if not (name ~= nil) then
			do self:close() end
			do return nil end
		end
		do return _g.jk.fs.File:forRelativePath(name, self.parent, false) end
	end
end

function jk.fs.FileForSushi.MyDirectoryIterator:next()
	if self.current ~= nil then
		local vv = self.current
		self.current = nil
		do return vv end
	end
	do return self:doNext() end
end

function jk.fs.FileForSushi.MyDirectoryIterator:hasNext()
	if self.current ~= nil then
		do return true end
	end
	do
		local v = self:doNext()
		if v ~= nil then
			self.current = v
			do return true end
		end
		do return false end
	end
end

function jk.fs.FileForSushi.MyDirectoryIterator:getParent()
	do return self.parent end
end

function jk.fs.FileForSushi.MyDirectoryIterator:setParent(v)
	self.parent = v
	do return self end
end

function jk.fs.FileForSushi.MyDirectoryIterator:getHandle()
	do return self.handle end
end

function jk.fs.FileForSushi.MyDirectoryIterator:setHandle(v)
	self.handle = v
	do return self end
end

function jk.fs.FileForSushi:entries()
	local pp = self.path
	if not _g.jk.lang.String:isNotEmpty(pp) then
		do return nil end
	end
	do
		local handle = _io:open_directory(pp)
		if not (handle ~= nil) then
			do return nil end
		end
		do
			local v = _g.jk.fs.FileForSushi.MyDirectoryIterator._construct0(_g.jk.fs.FileForSushi.MyDirectoryIterator._create())
			do v:setParent(self) end
			do v:setHandle(handle) end
			do return v end
		end
	end
end

jk.fs.FileFinder = {}
jk.fs.FileFinder.__index = jk.fs.FileFinder
_vm:set_metatable(jk.fs.FileFinder, {})

function jk.fs.FileFinder._create()
	local v = _vm:set_metatable({}, jk.fs.FileFinder)
	return v
end

function jk.fs.FileFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileFinder'
	self['_isType.jk.fs.FileFinder'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.root = nil
	self.patterns = nil
	self.excludePatterns = nil
	self.stack = nil
	self.includeMatchingDirectories = false
	self.includeDirectories = false
end

function jk.fs.FileFinder:forRoot(root)
	do return _g.jk.fs.FileFinder._construct0(_g.jk.fs.FileFinder._create()):setRoot(root) end
end

jk.fs.FileFinder.Pattern = {}
jk.fs.FileFinder.Pattern.__index = jk.fs.FileFinder.Pattern
_vm:set_metatable(jk.fs.FileFinder.Pattern, {})

function jk.fs.FileFinder.Pattern._create()
	local v = _vm:set_metatable({}, jk.fs.FileFinder.Pattern)
	return v
end

function jk.fs.FileFinder.Pattern:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileFinder.Pattern'
	self['_isType.jk.fs.FileFinder.Pattern'] = true
	self.pattern = nil
	self.suffix = nil
	self.prefix = nil
end

function jk.fs.FileFinder.Pattern:_construct0()
	jk.fs.FileFinder.Pattern._init(self)
	return self
end

function jk.fs.FileFinder.Pattern:setPattern(pattern)
	self.pattern = pattern
	if pattern ~= nil then
		if _g.jk.lang.String:startsWith(pattern, "*", 0) then
			self.suffix = _g.jk.lang.String:getEndOfString(pattern, 1)
		end
		if _g.jk.lang.String:endsWith(pattern, "*") then
			self.prefix = _g.jk.lang.String:getSubString(pattern, 0, _g.jk.lang.String:getLength(pattern) - 1)
		end
	end
	do return self end
end

function jk.fs.FileFinder.Pattern:match(check)
	if not (check ~= nil) then
		do return false end
	end
	if self.pattern == check then
		do return true end
	end
	if self.suffix ~= nil and _g.jk.lang.String:endsWith(check, self.suffix) then
		do return true end
	end
	if self.prefix ~= nil and _g.jk.lang.String:startsWith(check, self.prefix, 0) then
		do return true end
	end
	do return false end
end

function jk.fs.FileFinder:_construct0()
	jk.fs.FileFinder._init(self)
	self.patterns = {}
	self.excludePatterns = {}
	return self
end

function jk.fs.FileFinder:setRoot(root)
	self.root = root
	self.stack = nil
	do return self end
end

function jk.fs.FileFinder:addPattern(pattern)
	do _g.jk.lang.Vector:append(self.patterns, _g.jk.fs.FileFinder.Pattern._construct0(_g.jk.fs.FileFinder.Pattern._create()):setPattern(pattern)) end
	do return self end
end

function jk.fs.FileFinder:addExcludePattern(pattern)
	do _g.jk.lang.Vector:append(self.excludePatterns, _g.jk.fs.FileFinder.Pattern._construct0(_g.jk.fs.FileFinder.Pattern._create()):setPattern(pattern)) end
	do return self end
end

function jk.fs.FileFinder:matchPattern(file)
	if not (file ~= nil) then
		do return false end
	end
	if _g.jk.lang.Vector:getSize(self.patterns) < 1 then
		do return true end
	end
	do
		local filename = file:getBasename()
		if self.patterns ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.patterns)
			do
				n = 0
				while n < m do
					local pattern = self.patterns[n + 1]
					if pattern ~= nil then
						if pattern:match(filename) then
							do return true end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function jk.fs.FileFinder:matchExcludePattern(file)
	if not (file ~= nil) then
		do return false end
	end
	if _g.jk.lang.Vector:getSize(self.excludePatterns) < 1 then
		do return false end
	end
	do
		local filename = file:getBasename()
		if self.excludePatterns ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.excludePatterns)
			do
				n = 0
				while n < m do
					local pattern = self.excludePatterns[n + 1]
					if pattern ~= nil then
						if pattern:match(filename) then
							do return true end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function jk.fs.FileFinder:next()
	while true do
		if not (self.stack ~= nil) then
			if not (self.root ~= nil) then
				do break end
			end
			do
				local es = self.root:entries()
				self.root = nil
				if not (es ~= nil) then
					do break end
				end
				self.stack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
				do self.stack:push(es) end
			end
		end
		do
			local entries = self.stack:peek()
			if not (entries ~= nil) then
				self.stack = nil
				do break end
			end
			do
				local e = entries:next()
				if not (e ~= nil) then
					do self.stack:pop() end
				elseif self:matchExcludePattern(e) then
				elseif e:isFile() then
					if self:matchPattern(e) then
						do return e end
					end
				elseif self.includeMatchingDirectories and e:isDirectory() and self:matchPattern(e) then
					do return e end
				elseif e:isDirectory() and e:isLink() == false then
					local ees = e:entries()
					if ees ~= nil then
						do self.stack:push(ees) end
					end
					if self.includeDirectories then
						do return e end
					end
				end
			end
		end
	end
	do return nil end
end

function jk.fs.FileFinder:hasNext()
	if not (self.stack ~= nil) then
		do return false end
	end
	do
		local it = self.stack:peek()
		if not (it ~= nil) then
			do return false end
		end
		do return it:hasNext() end
	end
end

function jk.fs.FileFinder:getIncludeMatchingDirectories()
	do return self.includeMatchingDirectories end
end

function jk.fs.FileFinder:setIncludeMatchingDirectories(v)
	self.includeMatchingDirectories = v
	do return self end
end

function jk.fs.FileFinder:getIncludeDirectories()
	do return self.includeDirectories end
end

function jk.fs.FileFinder:setIncludeDirectories(v)
	self.includeDirectories = v
	do return self end
end

jk.fs.FileInfo = {}
jk.fs.FileInfo.__index = jk.fs.FileInfo
_vm:set_metatable(jk.fs.FileInfo, {})

jk.fs.FileInfo.FILE_TYPE_UNKNOWN = 0
jk.fs.FileInfo.FILE_TYPE_FILE = 1
jk.fs.FileInfo.FILE_TYPE_DIR = 2

function jk.fs.FileInfo._create()
	local v = _vm:set_metatable({}, jk.fs.FileInfo)
	return v
end

function jk.fs.FileInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileInfo'
	self['_isType.jk.fs.FileInfo'] = true
	self.file = nil
	self.size = 0
	self.createTime = 0
	self.accessTime = 0
	self.modifyTime = 0
	self.ownerUser = 0
	self.ownerGroup = 0
	self.mode = 0
	self.executable = false
	self.type = 0
	self.link = false
end

function jk.fs.FileInfo:_construct0()
	jk.fs.FileInfo._init(self)
	return self
end

function jk.fs.FileInfo:forFile(file)
	if file == nil then
		do return _g.jk.fs.FileInfo._construct0(_g.jk.fs.FileInfo._create()) end
	end
	do return file:stat() end
end

function jk.fs.FileInfo:setFile(v)
	self.file = v
end

function jk.fs.FileInfo:setSize(v)
	self.size = v
end

function jk.fs.FileInfo:setCreateTime(v)
	self.createTime = v
end

function jk.fs.FileInfo:setAccessTime(v)
	self.accessTime = v
end

function jk.fs.FileInfo:setModifyTime(v)
	self.modifyTime = v
end

function jk.fs.FileInfo:setOwnerUser(v)
	self.ownerUser = v
end

function jk.fs.FileInfo:setOwnerGroup(v)
	self.ownerGroup = v
end

function jk.fs.FileInfo:setMode(v)
	self.mode = v
end

function jk.fs.FileInfo:setExecutable(v)
	self.executable = v
end

function jk.fs.FileInfo:setType(v)
	self.type = v
end

function jk.fs.FileInfo:setLink(v)
	self.link = v
end

function jk.fs.FileInfo:getFile()
	do return self.file end
end

function jk.fs.FileInfo:getSize()
	do return self.size end
end

function jk.fs.FileInfo:getCreateTime()
	do return self.createTime end
end

function jk.fs.FileInfo:getCreateTimeUTC()
	do return self.createTime + _g.jk.time.SystemClock:getTimezoneOffsetAsSeconds() end
end

function jk.fs.FileInfo:getAccessTime()
	do return self.accessTime end
end

function jk.fs.FileInfo:getAccessTimeUTC()
	do return self.accessTime + _g.jk.time.SystemClock:getTimezoneOffsetAsSeconds() end
end

function jk.fs.FileInfo:getModifyTime()
	do return self.modifyTime end
end

function jk.fs.FileInfo:getModifyTimeUTC()
	do return self.modifyTime + _g.jk.time.SystemClock:getTimezoneOffsetAsSeconds() end
end

function jk.fs.FileInfo:getOwnerUser()
	do return self.ownerUser end
end

function jk.fs.FileInfo:getOwnerGroup()
	do return self.ownerGroup end
end

function jk.fs.FileInfo:getMode()
	do return self.mode end
end

function jk.fs.FileInfo:getExecutable()
	do return self.executable end
end

function jk.fs.FileInfo:getType()
	do return self.type end
end

function jk.fs.FileInfo:getLink()
	do return self.link end
end

function jk.fs.FileInfo:isFile()
	if self.type == _g.jk.fs.FileInfo.FILE_TYPE_FILE then
		do return true end
	end
	do return false end
end

function jk.fs.FileInfo:isLink()
	do return self.link end
end

function jk.fs.FileInfo:isDirectory()
	if self.type == _g.jk.fs.FileInfo.FILE_TYPE_DIR then
		do return true end
	end
	do return false end
end

function jk.fs.FileInfo:exists()
	do return self:isFile() or self:isDirectory() or self:isLink() end
end

jk.fs.FileInvalid = _g.jk.fs.File._create()
jk.fs.FileInvalid.__index = jk.fs.FileInvalid
_vm:set_metatable(jk.fs.FileInvalid, {
	__index = _g.jk.fs.File
})

function jk.fs.FileInvalid._create()
	local v = _vm:set_metatable({}, jk.fs.FileInvalid)
	return v
end

function jk.fs.FileInvalid:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileInvalid'
	self['_isType.jk.fs.FileInvalid'] = true
end

function jk.fs.FileInvalid:_construct0()
	jk.fs.FileInvalid._init(self)
	do _g.jk.fs.File._construct0(self) end
	return self
end

function jk.fs.FileInvalid:entry(name)
	do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
end

function jk.fs.FileInvalid:makeExecutable()
	do return false end
end

function jk.fs.FileInvalid:move(dest, replace)
	do return false end
end

function jk.fs.FileInvalid:touch()
	do return false end
end

function jk.fs.FileInvalid:read()
	do return nil end
end

function jk.fs.FileInvalid:write()
	do return nil end
end

function jk.fs.FileInvalid:append()
	do return nil end
end

function jk.fs.FileInvalid:stat()
	do return nil end
end

function jk.fs.FileInvalid:exists()
	do return false end
end

function jk.fs.FileInvalid:isExecutable()
	do return false end
end

function jk.fs.FileInvalid:createFifo()
	do return false end
end

function jk.fs.FileInvalid:createDirectory()
	do return false end
end

function jk.fs.FileInvalid:createDirectoryRecursive()
	do return false end
end

function jk.fs.FileInvalid:removeDirectory()
	do return false end
end

function jk.fs.FileInvalid:getPath()
	do return nil end
end

function jk.fs.FileInvalid:isSame(file)
	do return false end
end

function jk.fs.FileInvalid:remove()
	do return false end
end

function jk.fs.FileInvalid:removeRecursive()
	do return false end
end

function jk.fs.FileInvalid:getBasename()
	do return nil end
end

function jk.fs.FileInvalid:isIdentical(file)
	do return false end
end

function jk.fs.FileInvalid:getContentsBuffer()
	do return nil end
end

function jk.fs.FileInvalid:getContentsString(encoding)
	do return nil end
end

function jk.fs.FileInvalid:setContentsBuffer(buffer)
	do return false end
end

function jk.fs.FileInvalid:setContentsString(str, encoding)
	do return false end
end

function jk.fs.FileInvalid:entries()
	do return nil end
end
jk = jk or {}

jk.app = jk.app or {}

jk.app.ApplicationContext = {}
jk = jk or {}

jk.posix = jk.posix or {}

jk.posix.PosixEnvironment = {}
jk.posix.PosixEnvironment.__index = jk.posix.PosixEnvironment
_vm:set_metatable(jk.posix.PosixEnvironment, {})

function jk.posix.PosixEnvironment._create()
	local v = _vm:set_metatable({}, jk.posix.PosixEnvironment)
	return v
end

function jk.posix.PosixEnvironment:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.posix.PosixEnvironment'
	self['_isType.jk.posix.PosixEnvironment'] = true
end

function jk.posix.PosixEnvironment:_construct0()
	jk.posix.PosixEnvironment._init(self)
	return self
end

jk.posix.PosixEnvironment.PosixUser = {}
jk.posix.PosixEnvironment.PosixUser.__index = jk.posix.PosixEnvironment.PosixUser
_vm:set_metatable(jk.posix.PosixEnvironment.PosixUser, {})

function jk.posix.PosixEnvironment.PosixUser._create()
	local v = _vm:set_metatable({}, jk.posix.PosixEnvironment.PosixUser)
	return v
end

function jk.posix.PosixEnvironment.PosixUser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.posix.PosixEnvironment.PosixUser'
	self['_isType.jk.posix.PosixEnvironment.PosixUser'] = true
	self.pwName = nil
	self.pwUid = 0
	self.pwGid = 0
	self.pwGecos = nil
	self.pwDir = nil
	self.pwShell = nil
end

function jk.posix.PosixEnvironment.PosixUser:_construct0()
	jk.posix.PosixEnvironment.PosixUser._init(self)
	return self
end

function jk.posix.PosixEnvironment.PosixUser:getPwName()
	do return self.pwName end
end

function jk.posix.PosixEnvironment.PosixUser:setPwName(v)
	self.pwName = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwUid()
	do return self.pwUid end
end

function jk.posix.PosixEnvironment.PosixUser:setPwUid(v)
	self.pwUid = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwGid()
	do return self.pwGid end
end

function jk.posix.PosixEnvironment.PosixUser:setPwGid(v)
	self.pwGid = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwGecos()
	do return self.pwGecos end
end

function jk.posix.PosixEnvironment.PosixUser:setPwGecos(v)
	self.pwGecos = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwDir()
	do return self.pwDir end
end

function jk.posix.PosixEnvironment.PosixUser:setPwDir(v)
	self.pwDir = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwShell()
	do return self.pwShell end
end

function jk.posix.PosixEnvironment.PosixUser:setPwShell(v)
	self.pwShell = v
	do return self end
end

function jk.posix.PosixEnvironment:getpwnam(username)
	do return nil end
end

function jk.posix.PosixEnvironment:getpwuid(uid)
	do return nil end
end

function jk.posix.PosixEnvironment:setuid(gid)
	do return false end
end

function jk.posix.PosixEnvironment:setgid(gid)
	do return false end
end

function jk.posix.PosixEnvironment:seteuid(uid)
	do return false end
end

function jk.posix.PosixEnvironment:setegid(gid)
	do return false end
end

function jk.posix.PosixEnvironment:getuid()
	do return -1 end
end

function jk.posix.PosixEnvironment:geteuid()
	do return -1 end
end

function jk.posix.PosixEnvironment:getgid()
	do return -1 end
end

function jk.posix.PosixEnvironment:getegid()
	do return -1 end
end

jk.posix.PosixSignal = {}
jk.posix.PosixSignal.__index = jk.posix.PosixSignal
_vm:set_metatable(jk.posix.PosixSignal, {})

jk.posix.PosixSignal.SIGHUP = 1
jk.posix.PosixSignal.SIGINT = 2
jk.posix.PosixSignal.SIGQUIT = 3
jk.posix.PosixSignal.SIGILL = 4
jk.posix.PosixSignal.SIGTRAP = 5
jk.posix.PosixSignal.SIGABRT = 6
jk.posix.PosixSignal.SIGFPE = 8
jk.posix.PosixSignal.SIGKILL = 9
jk.posix.PosixSignal.SIGSEGV = 11
jk.posix.PosixSignal.SIGPIPE = 13
jk.posix.PosixSignal.SIGALRM = 14
jk.posix.PosixSignal.SIGTERM = 15

function jk.posix.PosixSignal._create()
	local v = _vm:set_metatable({}, jk.posix.PosixSignal)
	return v
end

function jk.posix.PosixSignal:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.posix.PosixSignal'
	self['_isType.jk.posix.PosixSignal'] = true
end

function jk.posix.PosixSignal:_construct0()
	jk.posix.PosixSignal._init(self)
	return self
end

function jk.posix.PosixSignal:trapSignal(signum, enabled)
	local n = (function(a, b, c)
		if a then
			do return b() end
		end
		do return c() end
	end)(enabled, function()
		do return 1 end
	end, function()
		do return 0 end
	end)
	local o = _os:trap_signal(signum, n)
	if o == 1 then
		do return true end
	end
	do return false end
end

function jk.posix.PosixSignal:checkSignalState(signum)
	local n = _os:check_signal_state(signum, n)
	if n == 1 then
		do return true end
	end
	do return false end
end
jk = jk or {}

jk.math = jk.math or {}

jk.math.Matrix33 = {}
jk.math.Matrix33.__index = jk.math.Matrix33
_vm:set_metatable(jk.math.Matrix33, {})

function jk.math.Matrix33._create()
	local v = _vm:set_metatable({}, jk.math.Matrix33)
	return v
end

function jk.math.Matrix33:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Matrix33'
	self['_isType.jk.math.Matrix33'] = true
	self.v = _vm:allocate_array(9)
end

function jk.math.Matrix33:_construct0()
	jk.math.Matrix33._init(self)
	return self
end

function jk.math.Matrix33:forZero()
	do return _g.jk.math.Matrix33:forValues({
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0
	}) end
end

function jk.math.Matrix33:forIdentity()
	do return _g.jk.math.Matrix33:forValues({
		1.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:invertMatrix(m)
	local d = m.v[0 + 1] * m.v[4 + 1] * m.v[8 + 1] + m.v[3 + 1] * m.v[7 + 1] * m.v[2 + 1] + m.v[6 + 1] * m.v[1 + 1] * m.v[5 + 1] - m.v[0 + 1] * m.v[7 + 1] * m.v[5 + 1] - m.v[3 + 1] * m.v[1 + 1] * m.v[8 + 1] - m.v[6 + 1] * m.v[4 + 1] * m.v[2 + 1]
	local v = _g.jk.math.Matrix33._construct0(_g.jk.math.Matrix33._create())
	v.v[0 + 1] = (m.v[4 + 1] * m.v[8 + 1] - m.v[7 + 1] * m.v[5 + 1]) / d
	v.v[3 + 1] = (m.v[6 + 1] * m.v[5 + 1] - m.v[3 + 1] * m.v[8 + 1]) / d
	v.v[6 + 1] = (m.v[3 + 1] * m.v[7 + 1] - m.v[6 + 1] * m.v[4 + 1]) / d
	v.v[1 + 1] = (m.v[7 + 1] * m.v[2 + 1] - m.v[1 + 1] * m.v[8 + 1]) / d
	v.v[4 + 1] = (m.v[0 + 1] * m.v[8 + 1] - m.v[6 + 1] * m.v[2 + 1]) / d
	v.v[7 + 1] = (m.v[6 + 1] * m.v[1 + 1] - m.v[0 + 1] * m.v[7 + 1]) / d
	v.v[2 + 1] = (m.v[1 + 1] * m.v[5 + 1] - m.v[4 + 1] * m.v[2 + 1]) / d
	v.v[5 + 1] = (m.v[3 + 1] * m.v[2 + 1] - m.v[0 + 1] * m.v[5 + 1]) / d
	v.v[8 + 1] = (m.v[0 + 1] * m.v[4 + 1] - m.v[3 + 1] * m.v[1 + 1]) / d
	do return v end
end

function jk.math.Matrix33:forTranslate(translateX, translateY)
	do return _g.jk.math.Matrix33:forValues({
		1.0,
		0.0,
		translateX,
		0.0,
		1.0,
		translateY,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:forRotation(angle)
	local c = _g.jk.math.Math:cos(angle)
	local s = _g.jk.math.Math:sin(angle)
	do return _g.jk.math.Matrix33:forValues({
		c,
		s,
		0.0,
		-s,
		c,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:forRotationWithCenter(angle, centerX, centerY)
	local translate = _g.jk.math.Matrix33:forTranslate(centerX, centerY)
	local rotate = _g.jk.math.Matrix33:forRotation(angle)
	local translateBack = _g.jk.math.Matrix33:forTranslate(-centerX, -centerY)
	local translatedRotated = _g.jk.math.Matrix33:multiplyMatrix(translate, rotate)
	do return _g.jk.math.Matrix33:multiplyMatrix(translatedRotated, translateBack) end
end

function jk.math.Matrix33:forSkew(skewX, skewY)
	do return _g.jk.math.Matrix33:forValues({
		1.0,
		skewX,
		0.0,
		skewY,
		1.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:forScale(scaleX, scaleY)
	do return _g.jk.math.Matrix33:forValues({
		scaleX,
		0.0,
		0.0,
		0.0,
		scaleY,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:forFlip(flipX, flipY)
	local xmat33 = _g.jk.math.Matrix33:forValues({
		1.0,
		0.0,
		0.0,
		0.0,
		-1.0,
		0.0,
		0.0,
		0.0,
		1.0
	})
	local ymat33 = _g.jk.math.Matrix33:forValues({
		-1.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		1.0
	})
	if flipX and flipY then
		do return _g.jk.math.Matrix33:multiplyMatrix(xmat33, ymat33) end
	elseif flipX then
		do return xmat33 end
	elseif flipY then
		do return ymat33 end
	end
	do return _g.jk.math.Matrix33:forIdentity() end
end

function jk.math.Matrix33:forValues(mv)
	local v = _g.jk.math.Matrix33._construct0(_g.jk.math.Matrix33._create())
	local i = 0
	do
		i = 0
		while i < 9 do
			if i >= #mv then
				v.v[i + 1] = 0.0
			else
				v.v[i + 1] = mv[i + 1]
			end
			do i = i + 1 end
		end
	end
	do return v end
end

function jk.math.Matrix33:multiplyScalar(v, mm)
	local mat33 = _g.jk.math.Matrix33:forZero()
	mat33.v[0 + 1] = mm.v[0 + 1] * v
	mat33.v[1 + 1] = mm.v[1 + 1] * v
	mat33.v[2 + 1] = mm.v[2 + 1] * v
	mat33.v[3 + 1] = mm.v[3 + 1] * v
	mat33.v[4 + 1] = mm.v[4 + 1] * v
	mat33.v[5 + 1] = mm.v[5 + 1] * v
	mat33.v[6 + 1] = mm.v[6 + 1] * v
	mat33.v[7 + 1] = mm.v[7 + 1] * v
	mat33.v[8 + 1] = mm.v[8 + 1] * v
	do return mat33 end
end

function jk.math.Matrix33:multiplyMatrix(a, b)
	local matrix33 = _g.jk.math.Matrix33._construct0(_g.jk.math.Matrix33._create())
	matrix33.v[0 + 1] = a.v[0 + 1] * b.v[0 + 1] + a.v[1 + 1] * b.v[3 + 1] + a.v[2 + 1] * b.v[6 + 1]
	matrix33.v[1 + 1] = a.v[0 + 1] * b.v[1 + 1] + a.v[1 + 1] * b.v[4 + 1] + a.v[2 + 1] * b.v[7 + 1]
	matrix33.v[2 + 1] = a.v[0 + 1] * b.v[2 + 1] + a.v[1 + 1] * b.v[5 + 1] + a.v[2 + 1] * b.v[8 + 1]
	matrix33.v[3 + 1] = a.v[3 + 1] * b.v[0 + 1] + a.v[4 + 1] * b.v[3 + 1] + a.v[5 + 1] * b.v[6 + 1]
	matrix33.v[4 + 1] = a.v[3 + 1] * b.v[1 + 1] + a.v[4 + 1] * b.v[4 + 1] + a.v[5 + 1] * b.v[7 + 1]
	matrix33.v[5 + 1] = a.v[3 + 1] * b.v[2 + 1] + a.v[4 + 1] * b.v[5 + 1] + a.v[5 + 1] * b.v[8 + 1]
	matrix33.v[6 + 1] = a.v[6 + 1] * b.v[0 + 1] + a.v[7 + 1] * b.v[3 + 1] + a.v[8 + 1] * b.v[6 + 1]
	matrix33.v[7 + 1] = a.v[6 + 1] * b.v[1 + 1] + a.v[7 + 1] * b.v[4 + 1] + a.v[8 + 1] * b.v[7 + 1]
	matrix33.v[8 + 1] = a.v[6 + 1] * b.v[2 + 1] + a.v[7 + 1] * b.v[5 + 1] + a.v[8 + 1] * b.v[8 + 1]
	do return matrix33 end
end

function jk.math.Matrix33:multiplyVector(a, b)
	local x = a.v[0 + 1] * b.x + a.v[1 + 1] * b.y + a.v[2 + 1] * 1.0
	local y = a.v[3 + 1] * b.x + a.v[4 + 1] * b.y + a.v[5 + 1] * 1.0
	do return _g.jk.math.Vector2:create(x, y) end
end

jk.math.Matrix44 = {}
jk.math.Matrix44.__index = jk.math.Matrix44
_vm:set_metatable(jk.math.Matrix44, {})

function jk.math.Matrix44._create()
	local v = _vm:set_metatable({}, jk.math.Matrix44)
	return v
end

function jk.math.Matrix44:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Matrix44'
	self['_isType.jk.math.Matrix44'] = true
	self.v = _vm:allocate_array(16)
end

function jk.math.Matrix44:_construct0()
	jk.math.Matrix44._init(self)
	return self
end

function jk.math.Matrix44:forZero()
	do return _g.jk.math.Matrix44:forValues({
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0
	}) end
end

function jk.math.Matrix44:forIdentity()
	do return _g.jk.math.Matrix44:forValues({
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forTranslate(translateX, translateY, translateZ)
	do return _g.jk.math.Matrix44:forValues({
		1.0,
		0.0,
		0.0,
		translateX,
		0.0,
		1.0,
		0.0,
		translateY,
		0.0,
		0.0,
		1.0,
		translateZ,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forXRotation(angle)
	local c = _g.jk.math.Math:cos(angle)
	local s = _g.jk.math.Math:sin(angle)
	do return _g.jk.math.Matrix44:forValues({
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		c,
		-s,
		0.0,
		0.0,
		s,
		c,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forYRotation(angle)
	local c = _g.jk.math.Math:cos(angle)
	local s = _g.jk.math.Math:sin(angle)
	do return _g.jk.math.Matrix44:forValues({
		c,
		0.0,
		s,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		-s,
		0.0,
		c,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forZRotation(angle)
	local c = _g.jk.math.Math:cos(angle)
	local s = _g.jk.math.Math:sin(angle)
	do return _g.jk.math.Matrix44:forValues({
		c,
		-s,
		0.0,
		0.0,
		s,
		c,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forSkew(vx, vy, vz)
	do return _g.jk.math.Matrix44:forValues({
		1.0,
		vx,
		vx,
		0.0,
		vy,
		1.0,
		vy,
		0.0,
		vz,
		vz,
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forXRotationWithCenter(angle, centerX, centerY, centerZ)
	local translate = _g.jk.math.Matrix44:forTranslate(centerX, centerY, centerZ)
	local rotate = _g.jk.math.Matrix44:forXRotation(angle)
	local translateBack = _g.jk.math.Matrix44:forTranslate(-centerX, -centerY, -centerZ)
	local translatedRotated = _g.jk.math.Matrix44:multiplyMatrix(translate, rotate)
	do return _g.jk.math.Matrix44:multiplyMatrix(translatedRotated, translateBack) end
end

function jk.math.Matrix44:forYRotationWithCenter(angle, centerX, centerY, centerZ)
	local translate = _g.jk.math.Matrix44:forTranslate(centerX, centerY, centerZ)
	local rotate = _g.jk.math.Matrix44:forYRotation(angle)
	local translateBack = _g.jk.math.Matrix44:forTranslate(-centerX, -centerY, -centerZ)
	local translatedRotated = _g.jk.math.Matrix44:multiplyMatrix(translate, rotate)
	do return _g.jk.math.Matrix44:multiplyMatrix(translatedRotated, translateBack) end
end

function jk.math.Matrix44:forZRotationWithCenter(angle, centerX, centerY, centerZ)
	local translate = _g.jk.math.Matrix44:forTranslate(centerX, centerY, centerZ)
	local rotate = _g.jk.math.Matrix44:forZRotation(angle)
	local translateBack = _g.jk.math.Matrix44:forTranslate(-centerX, -centerY, -centerZ)
	local translatedRotated = _g.jk.math.Matrix44:multiplyMatrix(translate, rotate)
	do return _g.jk.math.Matrix44:multiplyMatrix(translatedRotated, translateBack) end
end

function jk.math.Matrix44:forScale(scaleX, scaleY, scaleZ)
	do return _g.jk.math.Matrix44:forValues({
		scaleX,
		0.0,
		0.0,
		0.0,
		0.0,
		scaleY,
		0.0,
		0.0,
		0.0,
		0.0,
		scaleZ,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forFlipXY(flipXY)
	if flipXY then
		do return _g.jk.math.Matrix44:forValues({
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			-1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0
		}) end
	end
	do return _g.jk.math.Matrix44:forIdentity() end
end

function jk.math.Matrix44:forFlipXZ(flipXZ)
	if flipXZ then
		do return _g.jk.math.Matrix44:forValues({
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			-1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0
		}) end
	end
	do return _g.jk.math.Matrix44:forIdentity() end
end

function jk.math.Matrix44:forFlipYZ(flipYZ)
	if flipYZ then
		do return _g.jk.math.Matrix44:forValues({
			-1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0
		}) end
	end
	do return _g.jk.math.Matrix44:forIdentity() end
end

function jk.math.Matrix44:forValues(mv)
	local v = _g.jk.math.Matrix44._construct0(_g.jk.math.Matrix44._create())
	local i = 0
	do
		i = 0
		while i < 16 do
			if i >= #mv then
				v.v[i + 1] = 0.0
			else
				v.v[i + 1] = mv[i + 1]
			end
			do i = i + 1 end
		end
	end
	do return v end
end

function jk.math.Matrix44:multiplyScalar(v, mm)
	do return _g.jk.math.Matrix44:forValues({
		mm.v[0 + 1] * v,
		mm.v[1 + 1] * v,
		mm.v[2 + 1] * v,
		mm.v[3 + 1] * v,
		mm.v[4 + 1] * v,
		mm.v[5 + 1] * v,
		mm.v[6 + 1] * v,
		mm.v[7 + 1] * v,
		mm.v[8 + 1] * v,
		mm.v[9 + 1] * v,
		mm.v[10 + 1] * v,
		mm.v[11 + 1] * v,
		mm.v[12 + 1] * v,
		mm.v[3 + 1] * v,
		mm.v[14 + 1] * v,
		mm.v[15 + 1] * v
	}) end
end

function jk.math.Matrix44:multiplyMatrix(a, b)
	local matrix44 = _g.jk.math.Matrix44._construct0(_g.jk.math.Matrix44._create())
	matrix44.v[0 + 1] = a.v[0 + 1] * b.v[0 + 1] + a.v[1 + 1] * b.v[4 + 1] + a.v[2 + 1] * b.v[8 + 1] + a.v[3 + 1] * b.v[12 + 1]
	matrix44.v[1 + 1] = a.v[0 + 1] * b.v[1 + 1] + a.v[1 + 1] * b.v[5 + 1] + a.v[2 + 1] * b.v[9 + 1] + a.v[3 + 1] * b.v[13 + 1]
	matrix44.v[2 + 1] = a.v[0 + 1] * b.v[2 + 1] + a.v[1 + 1] * b.v[6 + 1] + a.v[2 + 1] * b.v[10 + 1] + a.v[3 + 1] * b.v[14 + 1]
	matrix44.v[3 + 1] = a.v[0 + 1] * b.v[3 + 1] + a.v[1 + 1] * b.v[7 + 1] + a.v[2 + 1] * b.v[11 + 1] + a.v[3 + 1] * b.v[15 + 1]
	matrix44.v[4 + 1] = a.v[4 + 1] * b.v[0 + 1] + a.v[5 + 1] * b.v[4 + 1] + a.v[6 + 1] * b.v[8 + 1] + a.v[7 + 1] * b.v[12 + 1]
	matrix44.v[5 + 1] = a.v[4 + 1] * b.v[1 + 1] + a.v[5 + 1] * b.v[5 + 1] + a.v[6 + 1] * b.v[9 + 1] + a.v[7 + 1] * b.v[13 + 1]
	matrix44.v[6 + 1] = a.v[4 + 1] * b.v[2 + 1] + a.v[5 + 1] * b.v[6 + 1] + a.v[6 + 1] * b.v[10 + 1] + a.v[7 + 1] * b.v[14 + 1]
	matrix44.v[7 + 1] = a.v[4 + 1] * b.v[3 + 1] + a.v[5 + 1] * b.v[7 + 1] + a.v[6 + 1] * b.v[11 + 1] + a.v[7 + 1] * b.v[15 + 1]
	matrix44.v[8 + 1] = a.v[8 + 1] * b.v[0 + 1] + a.v[9 + 1] * b.v[4 + 1] + a.v[10 + 1] * b.v[8 + 1] + a.v[11 + 1] * b.v[12 + 1]
	matrix44.v[9 + 1] = a.v[8 + 1] * b.v[1 + 1] + a.v[9 + 1] * b.v[5 + 1] + a.v[10 + 1] * b.v[9 + 1] + a.v[11 + 1] * b.v[13 + 1]
	matrix44.v[10 + 1] = a.v[8 + 1] * b.v[2 + 1] + a.v[9 + 1] * b.v[6 + 1] + a.v[10 + 1] * b.v[10 + 1] + a.v[11 + 1] * b.v[14 + 1]
	matrix44.v[11 + 1] = a.v[8 + 1] * b.v[3 + 1] + a.v[9 + 1] * b.v[7 + 1] + a.v[10 + 1] * b.v[11 + 1] + a.v[11 + 1] * b.v[15 + 1]
	matrix44.v[12 + 1] = a.v[12 + 1] * b.v[0 + 1] + a.v[13 + 1] * b.v[4 + 1] + a.v[14 + 1] * b.v[8 + 1] + a.v[15 + 1] * b.v[12 + 1]
	matrix44.v[13 + 1] = a.v[12 + 1] * b.v[1 + 1] + a.v[13 + 1] * b.v[5 + 1] + a.v[14 + 1] * b.v[9 + 1] + a.v[15 + 1] * b.v[13 + 1]
	matrix44.v[14 + 1] = a.v[12 + 1] * b.v[2 + 1] + a.v[13 + 1] * b.v[6 + 1] + a.v[14 + 1] * b.v[10 + 1] + a.v[15 + 1] * b.v[14 + 1]
	matrix44.v[15 + 1] = a.v[12 + 1] * b.v[3 + 1] + a.v[13 + 1] * b.v[7 + 1] + a.v[14 + 1] * b.v[11 + 1] + a.v[15 + 1] * b.v[15 + 1]
	do return matrix44 end
end

function jk.math.Matrix44:multiplyVector(a, b)
	local x = a.v[0 + 1] * b.x + a.v[1 + 1] * b.y + a.v[2 + 1] * b.z + a.v[3 + 1] * 1.0
	local y = a.v[4 + 1] * b.x + a.v[5 + 1] * b.y + a.v[6 + 1] * b.z + a.v[7 + 1] * 1.0
	local z = a.v[8 + 1] * b.x + a.v[9 + 1] * b.y + a.v[10 + 1] * b.z + a.v[11 + 1] * 1.0
	do return _g.jk.math.Vector3:create(x, y, z) end
end

jk.math.Vector3 = {}
jk.math.Vector3.__index = jk.math.Vector3
_vm:set_metatable(jk.math.Vector3, {})

function jk.math.Vector3._create()
	local v = _vm:set_metatable({}, jk.math.Vector3)
	return v
end

function jk.math.Vector3:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Vector3'
	self['_isType.jk.math.Vector3'] = true
	self.x = 0.0
	self.y = 0.0
	self.z = 0.0
end

function jk.math.Vector3:_construct0()
	jk.math.Vector3._init(self)
	return self
end

function jk.math.Vector3:create(x, y, z)
	local v = _g.jk.math.Vector3._construct0(_g.jk.math.Vector3._create())
	v.x = x
	v.y = y
	v.z = z
	do return v end
end

function jk.math.Vector3:add(b)
	self.x = self.x + b.x
	self.y = self.y + b.y
	self.z = self.z + b.z
	do return self end
end

function jk.math.Vector3:subtract(b)
	self.x = self.x - b.x
	self.y = self.y - b.y
	self.z = self.z - b.z
	do return self end
end

function jk.math.Vector3:multiply(b)
	self.x = self.x * b.x
	self.y = self.y * b.y
	self.z = self.z * b.z
	do return self end
end

function jk.math.Vector3:multiplyScalar(a)
	self.x = self.x * a
	self.y = self.y * a
	self.z = self.z * a
	do return self end
end

function jk.math.Vector3:distance(b)
	local dist = (self.y - b.y) * (self.y - b.y) + (self.x - b.x) * (self.x - b.x) + (self.z - b.z) * (self.z - b.z)
	do return _g.jk.math.Math:sqrt(dist) end
end

function jk.math.Vector3:getLength()
	do return _g.jk.math.Math:sqrt(self.x * self.x + self.y * self.y + self.z * self.z) end
end

jk.math.Math = {}
jk.math.Math.__index = jk.math.Math
_vm:set_metatable(jk.math.Math, {})

jk.math.Math.M_PI = 3.14159265358979
jk.math.Math.M_PI_2 = 1.5707963267949
jk.math.Math.M_PI_4 = 0.78539816339745
jk.math.Math.M_1_PI = 0.31830988618379
jk.math.Math.M_2_PI = 0.63661977236758
jk.math.Math.M_2_SQRTPI = 1.12837916709551
jk.math.Math.M_SQRT2 = 1.4142135623731
jk.math.Math.M_SQRT1_2 = 0.70710678118655
jk.math.Math.HALF_AWAY_FROM_ZERO = 0
jk.math.Math.HALF_TOWARD_ZERO = 1
jk.math.Math.HALF_NEAREST_EVEN = 2
jk.math.Math.HALF_POSITIVE = 3
jk.math.Math.HALF_NEGATIVE = 4

function jk.math.Math._create()
	local v = _vm:set_metatable({}, jk.math.Math)
	return v
end

function jk.math.Math:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Math'
	self['_isType.jk.math.Math'] = true
end

function jk.math.Math:_construct0()
	jk.math.Math._init(self)
	return self
end

function jk.math.Math:toRadians(d)
	do return _g.jk.math.Math.M_PI / 180 * d end
end

function jk.math.Math:toDegrees(r)
	do return _g.jk.math.Math.M_PI * r / 180 end
end

function jk.math.Math:abs(d)
	_io:write_to_stdout("[jk.math.Math.abs] (Math.sling:154:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:absFloat(f)
	_io:write_to_stdout("[jk.math.Math.absFloat] (Math.sling:184:3): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.math.Math:absInt32(i)
	_io:write_to_stdout("[jk.math.Math.absInt32] (Math.sling:214:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:absInt64(l)
	_io:write_to_stdout("[jk.math.Math.absInt64] (Math.sling:244:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:acos(d)
	_io:write_to_stdout("[jk.math.Math.acos] (Math.sling:274:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:asin(d)
	_io:write_to_stdout("[jk.math.Math.asin] (Math.sling:304:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:atan(d)
	_io:write_to_stdout("[jk.math.Math.atan] (Math.sling:334:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:atan2(y, x)
	_io:write_to_stdout("[jk.math.Math.atan2] (Math.sling:364:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:ceil(d)
	_io:write_to_stdout("[jk.math.Math.ceil] (Math.sling:394:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:cos(d)
	_io:write_to_stdout("[jk.math.Math.cos] (Math.sling:424:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:cosh(d)
	_io:write_to_stdout("[jk.math.Math.cosh] (Math.sling:454:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:exp(d)
	_io:write_to_stdout("[jk.math.Math.exp] (Math.sling:484:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:floor(d)
	_io:write_to_stdout("[jk.math.Math.floor] (Math.sling:514:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:remainder(x, y)
	_io:write_to_stdout("[jk.math.Math.remainder] (Math.sling:543:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:log(d)
	_io:write_to_stdout("[jk.math.Math.log] (Math.sling:573:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:log10(d)
	_io:write_to_stdout("[jk.math.Math.log10] (Math.sling:603:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:max(d1, d2)
	_io:write_to_stdout("[jk.math.Math.max] (Math.sling:639:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:maxFloat(f1, f2)
	_io:write_to_stdout("[jk.math.Math.maxFloat] (Math.sling:675:3): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.math.Math:maxInt32(i1, i2)
	_io:write_to_stdout("[jk.math.Math.maxInt32] (Math.sling:711:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:maxInt64(l1, l2)
	_io:write_to_stdout("[jk.math.Math.maxInt64] (Math.sling:747:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:min(d1, d2)
	_io:write_to_stdout("[jk.math.Math.min] (Math.sling:783:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:minFloat(f1, f2)
	_io:write_to_stdout("[jk.math.Math.minFloat] (Math.sling:819:3): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.math.Math:minInt32(i1, i2)
	_io:write_to_stdout("[jk.math.Math.minInt32] (Math.sling:855:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:minInt64(l1, l2)
	_io:write_to_stdout("[jk.math.Math.minInt64] (Math.sling:891:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:pow(x, y)
	_io:write_to_stdout("[jk.math.Math.pow] (Math.sling:921:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:round(n)
	_io:write_to_stdout("[jk.math.Math.round] (Math.sling:956:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:roundWithMode(d, mode)
	local fd = _g.jk.math.Math:floor(d)
	local dp = d - fd
	if dp < 0.5 then
		do return fd end
	end
	if dp > 0.5 then
		do return _g.jk.math.Math:ceil(d) end
	end
	if mode == _g.jk.math.Math.HALF_AWAY_FROM_ZERO then
		if d < 0 then
			do return fd end
		end
		do return _g.jk.math.Math:ceil(d) end
	end
	if mode == _g.jk.math.Math.HALF_TOWARD_ZERO then
		if d < 0 then
			do return _g.jk.math.Math:ceil(d) end
		end
		do return fd end
	end
	if mode == _g.jk.math.Math.HALF_NEAREST_EVEN then
		if _util:convert_to_integer(_util:convert_to_integer(fd) % 2) == 0 then
			do return fd end
		end
		do return _g.jk.math.Math:ceil(d) end
	end
	if mode == _g.jk.math.Math.HALF_POSITIVE then
		do return _g.jk.math.Math:ceil(d) end
	end
	if mode == _g.jk.math.Math.HALF_NEGATIVE then
		do return fd end
	end
	do return d end
end

function jk.math.Math:sin(d)
	_io:write_to_stdout("[jk.math.Math.sin] (Math.sling:1056:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:sinh(d)
	_io:write_to_stdout("[jk.math.Math.sinh] (Math.sling:1086:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:sqrt(d)
	_io:write_to_stdout("[jk.math.Math.sqrt] (Math.sling:1116:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:tan(d)
	_io:write_to_stdout("[jk.math.Math.tan] (Math.sling:1146:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:tanh(d)
	_io:write_to_stdout("[jk.math.Math.tanh] (Math.sling:1176:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:computeQuinticInEasing(t, b, c, d)
	local x = t / d
	do return c * x * x * x * x * x + b end
end

function jk.math.Math:computeQuinticOutEasing(t, b, c, d)
	local x = t / d - 1
	do return c * (x * x * x * x * x + 1) + b end
end

function jk.math.Math:computeQuinticInOutEasing(t, b, c, d)
	local x = t / d / 2
	if x < 1.0 then
		do return c / 2 * x * x * x * x * x + b end
	end
	x = x - 2
	do return c / 2 * (x * x * x * x * x + 2) + b end
end

jk.math.Vector2 = {}
jk.math.Vector2.__index = jk.math.Vector2
_vm:set_metatable(jk.math.Vector2, {})

function jk.math.Vector2._create()
	local v = _vm:set_metatable({}, jk.math.Vector2)
	return v
end

function jk.math.Vector2:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Vector2'
	self['_isType.jk.math.Vector2'] = true
	self.x = 0.0
	self.y = 0.0
end

function jk.math.Vector2:_construct0()
	jk.math.Vector2._init(self)
	return self
end

function jk.math.Vector2:create(x, y)
	local v = _g.jk.math.Vector2._construct0(_g.jk.math.Vector2._create())
	v.x = x
	v.y = y
	do return v end
end

function jk.math.Vector2:add(b)
	self.x = self.x + b.x
	self.y = self.y + b.y
	do return self end
end

function jk.math.Vector2:subtract(b)
	self.x = self.x - b.x
	self.y = self.y - b.y
	do return self end
end

function jk.math.Vector2:multiply(b)
	self.x = self.x * b.x
	self.y = self.y * b.y
	do return self end
end

function jk.math.Vector2:multiplyScalar(a)
	self.x = self.x + a
	self.y = self.y + a
	do return self end
end

function jk.math.Vector2:distance(b)
	local dist = (self.y - b.y) * (self.y - b.y) + (self.x - b.x) * (self.x - b.x)
	do return _g.jk.math.Math:sqrt(dist) end
end

function jk.math.Vector2:getLength()
	do return _g.jk.math.Math:sqrt(self.x * self.x + self.y * self.y) end
end
jk = jk or {}

jk.text = jk.text or {}

jk.text.StringUtil = {}
jk.text.StringUtil.__index = jk.text.StringUtil
_vm:set_metatable(jk.text.StringUtil, {})

function jk.text.StringUtil._create()
	local v = _vm:set_metatable({}, jk.text.StringUtil)
	return v
end

function jk.text.StringUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.text.StringUtil'
	self['_isType.jk.text.StringUtil'] = true
end

function jk.text.StringUtil:_construct0()
	jk.text.StringUtil._init(self)
	return self
end

function jk.text.StringUtil:padToLength(string, length, align, paddingCharacter)
	local ll = 0
	if string == nil then
		ll = 0
	else
		ll = _g.jk.lang.String:getLength(string)
	end
	if ll >= length then
		do return string end
	end
	do
		local add = length - ll
		local n = 0
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if align < 0 then
			do sb:appendString(string) end
			do
				n = 0
				while n < add do
					do sb:appendCharacter(paddingCharacter) end
					do n = n + 1 end
				end
			end
		elseif align == 0 then
			local ff = _util:convert_to_integer(add / 2)
			local ss = add - ff
			do
				n = 0
				while n < ff do
					do sb:appendCharacter(paddingCharacter) end
					do n = n + 1 end
				end
			end
			do sb:appendString(string) end
			do
				n = 0
				while n < ss do
					do sb:appendCharacter(paddingCharacter) end
					do n = n + 1 end
				end
			end
		else
			do
				n = 0
				while n < add do
					do sb:appendCharacter(paddingCharacter) end
					do n = n + 1 end
				end
			end
			do sb:appendString(string) end
		end
		do return sb:toString() end
	end
end

function jk.text.StringUtil:quotedStringToVector(str, delim, ignoreRepeatedDelimiters, escapeCharacter)
	local v = {}
	if str == nil then
		do return v end
	end
	do
		local dquote = false
		local quote = false
		local sb = nil
		local it = _g.jk.lang.String:iterate(str)
		while true do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if c == 34 and quote == false then
				dquote = not dquote
			elseif c == 39 and dquote == false then
				quote = not quote
			elseif quote == false and dquote == false and c == delim then
				if sb ~= nil then
					local r = sb:toString()
					if r == nil then
						r = ""
					end
					do _g.jk.lang.Vector:append(v, r) end
				elseif ignoreRepeatedDelimiters == false then
					do _g.jk.lang.Vector:append(v, "") end
				end
				sb = nil
			else
				if escapeCharacter > 0 and c == escapeCharacter then
					c = it:getNextChar()
					if _g.jk.lang.Character:isEOF(c) then
						do break end
					end
				end
				if sb == nil then
					sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
				do sb:appendCharacter(c) end
			end
			if quote == true or dquote == true and sb == nil then
				sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
		end
		if sb ~= nil then
			local r = sb:toString()
			if r == nil then
				r = ""
			end
			do _g.jk.lang.Vector:append(v, r) end
		end
		do return v end
	end
end

function jk.text.StringUtil:quotedStringToMap(str, delim)
	local v = {}
	local vector = _g.jk.text.StringUtil:quotedStringToVector(str, delim, true, 92)
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local c = vector[n + 1]
				if c ~= nil then
					local sp = _g.jk.lang.String:split(c, 61, 2)
					local key = sp[0 + 1]
					local val = sp[1 + 1]
					if _g.jk.lang.String:isEmpty(key) == false then
						v[key] = val
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.text.StringUtil:combine(strings, delim, unique, index)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local flags = nil
	if unique then
		flags = {}
	end
	do
		local i = index
		while i < _g.jk.lang.Vector:getSize(strings) do
			local o = strings[i + 1]
			do i = i + 1 end
			if o == nil then
				goto _continue1
			end
			if flags ~= nil then
				if _g.jk.lang.Map:get(flags, o) ~= nil then
					goto _continue1
				end
				do _g.jk.lang.Map:set(flags, o, "true") end
			end
			if delim > 0 and sb:count() > 0 then
				do sb:appendCharacter(delim) end
			end
			do sb:appendString(o) end
			::_continue1::
		end
		do return sb:toString() end
	end
end

function jk.text.StringUtil:validateCharacters(str, validator)
	if not (str ~= nil) then
		do return false end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		if not (it ~= nil) then
			do return false end
		end
		while true do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if validator(c) == false then
				do return false end
			end
		end
		do return true end
	end
end

function jk.text.StringUtil:toStringVector(vector, allowConversion)
	local v = {}
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local o = vector[n + 1]
				if o ~= nil then
					if allowConversion then
						local s = _g.jk.lang.String:asString(o)
						if s ~= nil then
							do _g.jk.lang.Vector:append(v, s) end
						end
					elseif (_vm:get_variable_type(o) == 'string') then
						do _g.jk.lang.Vector:append(v, o) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.text.StringUtil:toObjectVector(vector)
	do return vector end
end

function jk.text.StringUtil:wrapToLines(text, charactersPerLine)
	if not (text ~= nil) then
		do return nil end
	end
	do
		local v = {}
		local it = _g.jk.lang.String:iterate(text)
		local lineBuilder = nil
		local wordBuilder = nil
		while it ~= nil do
			local c = it:getNextChar()
			if c == 32 or c == 9 or c == 10 or c < 1 then
				if wordBuilder ~= nil then
					local word = wordBuilder:toString()
					wordBuilder = nil
					if lineBuilder == nil then
						lineBuilder = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					end
					do
						local cc = lineBuilder:count()
						if cc > 0 then
							do cc = cc + 1 end
						end
						cc = cc + _g.jk.lang.String:getLength(word)
						if cc > charactersPerLine then
							do _g.jk.lang.Vector:append(v, lineBuilder:toString()) end
							lineBuilder = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						end
						if lineBuilder:count() > 0 then
							do lineBuilder:appendCharacter(32) end
						end
						do lineBuilder:appendString(word) end
					end
				end
				if c < 1 then
					do break end
				end
				goto _continue2
			end
			if wordBuilder == nil then
				wordBuilder = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			do wordBuilder:appendCharacter(c) end
			::_continue2::
		end
		if lineBuilder ~= nil then
			do _g.jk.lang.Vector:append(v, lineBuilder:toString()) end
		end
		do return v end
	end
end

function jk.text.StringUtil:stripLeadingZeros(str)
	if _g.jk.lang.String:getChar(str, 0) == 48 then
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return nil end
		end
		do
			local i = 0
			while true do
				local c = iter:getNextChar()
				if _g.jk.lang.Character:isEOF(c) then
					do break end
				end
				if c ~= 48 then
					do return _g.jk.lang.String:getEndOfString(str, i) end
				end
				do i = i + 1 end
			end
			do return "" end
		end
	end
	do return str end
end

function jk.text.StringUtil:formatNumberString(vv, delimiter)
	if not (vv ~= nil) then
		do return nil end
	end
	do
		local it = _g.jk.lang.String:iterate(vv)
		if not (it ~= nil) then
			do return nil end
		end
		do
			local rr = _g.jk.lang.String:getLength(vv)
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			while true do
				local c = it:getNextChar()
				if c < 1 then
					do break end
				end
				do sb:appendCharacter(c) end
				do rr = rr - 1 end
				if rr < 1 then
					do break end
				end
				if _util:convert_to_integer(rr % 3) == 0 then
					do sb:appendCharacter(delimiter) end
				end
			end
			do return sb:toString() end
		end
	end
end

function jk.text.StringUtil:formatInteger(vv, delimiter)
	do return _g.jk.text.StringUtil:formatNumberString(_g.jk.lang.String:forInteger(vv), delimiter) end
end

function jk.text.StringUtil:formatLongInteger(vv, delimiter)
	do return _g.jk.text.StringUtil:formatNumberString(_g.jk.lang.String:forLongInteger(vv), delimiter) end
end
jk = jk or {}

jk.random = jk.random or {}

jk.random.Random = {}
jk.random.Random.__index = jk.random.Random
_vm:set_metatable(jk.random.Random, {})

jk.random.Random.instance = nil

function jk.random.Random._create()
	local v = _vm:set_metatable({}, jk.random.Random)
	return v
end

function jk.random.Random:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.random.Random'
	self['_isType.jk.random.Random'] = true
	self.random = nil
end

function jk.random.Random:getSushiRandom()
	if not (self.random ~= nil) then
		do self:setSeed(_g.jk.time.SystemClock:asUTCSeconds()) end
	end
	do return self.random end
end

function jk.random.Random:getSharedInstance()
	if not (_g.jk.random.Random.instance ~= nil) then
		_g.jk.random.Random.instance = _g.jk.random.Random._construct0(_g.jk.random.Random._create())
	end
	do return _g.jk.random.Random.instance end
end

function jk.random.Random:_construct0()
	jk.random.Random._init(self)
	return self
end

function jk.random.Random:_construct1(seed)
	jk.random.Random._init(self)
	do self:setSeed(seed) end
	return self
end

function jk.random.Random:setSeed(seed)
	self.random = _util:create_random_number_generator(seed)
end

function jk.random.Random:nextBoolean()
	if _util:convert_to_integer(self:nextInt1() % 2) == 0 then
		do return false end
	end
	do return true end
end

function jk.random.Random:nextInt1()
	local random = self:getSushiRandom()
	do return _util:create_random_number(random) end
end

function jk.random.Random:nextInt2(n)
	do return _util:convert_to_integer(self:nextInt1() % n) end
end

function jk.random.Random:nextInt3(s, e)
	do return s + _util:convert_to_integer(self:nextInt1() % (e - s)) end
end

function jk.random.Random:nextBytes(buf)
	local sz = #buf
	do
		local n = 0
		while n < sz do
			buf[n + 1] = self:nextInt3(-127, 128)
			do n = n + 1 end
		end
	end
end

function jk.random.Random:nextDouble()
	local n = self:nextInt2(2147483647)
	do return n / 2147483647.0 end
end

function jk.random.Random:nextFloat()
	local n = self:nextInt2(2147483647)
	do return n / 2147483647 end
end
jk = jk or {}

jk.env = jk.env or {}

jk.env.TemporaryFile = {}
jk.env.TemporaryFile.__index = jk.env.TemporaryFile
_vm:set_metatable(jk.env.TemporaryFile, {})

function jk.env.TemporaryFile._create()
	local v = _vm:set_metatable({}, jk.env.TemporaryFile)
	return v
end

function jk.env.TemporaryFile:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.TemporaryFile'
	self['_isType.jk.env.TemporaryFile'] = true
end

function jk.env.TemporaryFile:_construct0()
	jk.env.TemporaryFile._init(self)
	return self
end

function jk.env.TemporaryFile:create(extension)
	do return _g.jk.env.TemporaryFile:forDirectory(nil, extension) end
end

function jk.env.TemporaryFile:forDirectory(dir, extension)
	local tmpdir = dir
	if tmpdir == nil then
		tmpdir = _g.jk.env.CommonPath:getTemporaryDirectory()
	end
	if tmpdir == nil or tmpdir:isDirectory() == false then
		do return nil end
	end
	do
		local v = nil
		local n = 0
		local rnd = _g.jk.random.Random._construct0(_g.jk.random.Random._create())
		while n < 100 do
			local id = "_tmp_" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.time.SystemClock:asSeconds())) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_util:convert_to_integer(rnd:nextInt1() % 1000000)))
			if extension == nil or _g.jk.lang.String:getLength(extension) < 1 then
				id = _g.jk.lang.String:safeString(id) .. _g.jk.lang.String:safeString(extension)
			end
			v = tmpdir:entry(id)
			if v:exists() == false then
				do v:touch() end
				do break end
			end
			do n = n + 1 end
		end
		if v ~= nil and v:isFile() == false then
			v = nil
		end
		do return v end
	end
end

jk.env.EnvironmentVariable = {}
jk.env.EnvironmentVariable.__index = jk.env.EnvironmentVariable
_vm:set_metatable(jk.env.EnvironmentVariable, {})

function jk.env.EnvironmentVariable._create()
	local v = _vm:set_metatable({}, jk.env.EnvironmentVariable)
	return v
end

function jk.env.EnvironmentVariable:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.EnvironmentVariable'
	self['_isType.jk.env.EnvironmentVariable'] = true
end

function jk.env.EnvironmentVariable:_construct0()
	jk.env.EnvironmentVariable._init(self)
	return self
end

function jk.env.EnvironmentVariable:getAll()
	local v = {}
	local envs = _os:get_all_environment_variables()
	if envs ~= nil then
		if envs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(envs)
			do
				n = 0
				while n < m do
					local env = envs[n + 1]
					if env ~= nil then
						local comps = _g.jk.lang.String:split(env, 61, 2)
						local key = _g.jk.lang.Vector:get(comps, 0)
						local val = _g.jk.lang.Vector:get(comps, 1)
						if not (key ~= nil) then
							goto _continue1
						end
						if not (val ~= nil) then
							val = ""
						end
						do _g.jk.lang.Map:set(v, key, val) end
					end
					::_continue1::
					do n = n + 1 end
				end
			end
		end
	end
	do return v end
end

function jk.env.EnvironmentVariable:get(key)
	if not (key ~= nil) then
		do return nil end
	end
	do
		local v = nil
		do v = _os:get_environment_variable(key) end
		do return v end
	end
end

function jk.env.EnvironmentVariable:set(key, val)
	if not (key ~= nil) then
		do return end
	end
	_io:write_to_stdout("[jk.env.EnvironmentVariable.set] (EnvironmentVariable.sling:135:3): Not implemented" .. "\n")
end

function jk.env.EnvironmentVariable:unset(key)
	_io:write_to_stdout("[jk.env.EnvironmentVariable.unset] (EnvironmentVariable.sling:141:2): Not implemented" .. "\n")
end

jk.env.ExternalCommand = {}
jk.env.ExternalCommand.__index = jk.env.ExternalCommand
_vm:set_metatable(jk.env.ExternalCommand, {})

function jk.env.ExternalCommand._create()
	local v = _vm:set_metatable({}, jk.env.ExternalCommand)
	return v
end

function jk.env.ExternalCommand:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.ExternalCommand'
	self['_isType.jk.env.ExternalCommand'] = true
end

function jk.env.ExternalCommand:_construct0()
	jk.env.ExternalCommand._init(self)
	return self
end

function jk.env.ExternalCommand:findInPath(command)
	if not (command ~= nil) then
		do return nil end
	end
	do
		local path = _g.jk.env.EnvironmentVariable:get("PATH")
		if not _g.jk.lang.String:isNotEmpty(path) then
			do return nil end
		end
		do
			local separator = 58
			if _g.jk.os.OS:isWindows() then
				separator = 59
			end
			do
				local array = _g.jk.lang.String:split(path, separator, 0)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local dir = array[n + 1]
							if dir ~= nil then
								local pp = _g.jk.fs.File:forPath(dir):entry(command):asExecutable()
								if pp:isFile() then
									do return pp end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do return nil end
			end
		end
	end
end

jk.env.CommonPath = {}
jk.env.CommonPath.__index = jk.env.CommonPath
_vm:set_metatable(jk.env.CommonPath, {})

function jk.env.CommonPath._create()
	local v = _vm:set_metatable({}, jk.env.CommonPath)
	return v
end

function jk.env.CommonPath:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.CommonPath'
	self['_isType.jk.env.CommonPath'] = true
end

function jk.env.CommonPath:_construct0()
	jk.env.CommonPath._init(self)
	return self
end

function jk.env.CommonPath:getTemporaryDirectory()
	if _g.jk.os.OS:isLinux() or _g.jk.os.OS:isMacOS() then
		do return _g.jk.fs.File:forPath("/tmp") end
	end
	_io:write_to_stdout("[jk.env.CommonPath.getTemporaryDirectory] (CommonPath.sling:45:3): Not implemented" .. "\n")
	do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
end

function jk.env.CommonPath:getHomeDirectory()
	local dirname = _g.jk.env.EnvironmentVariable:get("HOME")
	if _g.jk.lang.String:isNotEmpty(dirname) then
		do return _g.jk.fs.File:forPath(dirname) end
	end
	do return nil end
end

function jk.env.CommonPath:getAppDirectory()
	local program = _vm:get_program_path()
	if not _g.jk.lang.String:isNotEmpty(program) then
		do return nil end
	end
	do
		local pf = _g.jk.fs.File:forPath(program)
		if not (pf ~= nil) then
			do return nil end
		end
		do return pf:getParent() end
	end
end

function jk.env.CommonPath:getCodeFileForObject(oo)
	if not (oo ~= nil) then
		do return nil end
	end
	do return nil end
end

function jk.env.CommonPath:getProgramFilesDirectory()
	do return nil end
end

function jk.env.CommonPath:getProgramFilesX86Directory()
	do return nil end
end

function jk.env.CommonPath:getApplicationsDirectory()
	if _g.jk.os.OS:isMacOS() then
		local v = _g.jk.fs.File:forPath("/Applications")
		if v:isDirectory() == false then
			v = nil
		end
		do return v end
	end
	do return nil end
end

jk.env.TemporaryDirectory = {}
jk.env.TemporaryDirectory.__index = jk.env.TemporaryDirectory
_vm:set_metatable(jk.env.TemporaryDirectory, {})

function jk.env.TemporaryDirectory._create()
	local v = _vm:set_metatable({}, jk.env.TemporaryDirectory)
	return v
end

function jk.env.TemporaryDirectory:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.TemporaryDirectory'
	self['_isType.jk.env.TemporaryDirectory'] = true
end

function jk.env.TemporaryDirectory:_construct0()
	jk.env.TemporaryDirectory._init(self)
	return self
end

function jk.env.TemporaryDirectory:create()
	do return _g.jk.env.TemporaryDirectory:forDirectory(nil) end
end

function jk.env.TemporaryDirectory:forDirectory(dir)
	local ff = _g.jk.env.TemporaryFile:forDirectory(dir, nil)
	if not (ff ~= nil) then
		do return nil end
	end
	do ff:remove() end
	do ff:createDirectoryRecursive() end
	if not ff:isDirectory() then
		do return nil end
	end
	do return ff end
end
jk = jk or {}

jk.process = jk.process or {}

jk.process.Process = {}

jk.process.ProcessWithIO = {}

jk.process.CurrentProcess = {}
jk.process.CurrentProcess.__index = jk.process.CurrentProcess
_vm:set_metatable(jk.process.CurrentProcess, {})

function jk.process.CurrentProcess._create()
	local v = _vm:set_metatable({}, jk.process.CurrentProcess)
	return v
end

function jk.process.CurrentProcess:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.CurrentProcess'
	self['_isType.jk.process.CurrentProcess'] = true
end

function jk.process.CurrentProcess:_construct0()
	jk.process.CurrentProcess._init(self)
	return self
end

function jk.process.CurrentProcess:terminate(value)
	_io:write_to_stdout("[jk.process.CurrentProcess.terminate] (CurrentProcess.sling:53:3): Not implemented" .. "\n")
end

function jk.process.CurrentProcess:getExecutableFile()
	do return _g.jk.fs.File:forPath(_vm.get_sushi_executable_path()) end
end

function jk.process.CurrentProcess:getProcessName()
	local v = nil
	local exe = _g.jk.process.CurrentProcess:getExecutableFile()
	if exe ~= nil then
		v = exe:getBasenameWithoutExtension()
	end
	do return v end
end

jk.process.ProcessLauncherSushi = {}
jk.process.ProcessLauncherSushi.__index = jk.process.ProcessLauncherSushi
_vm:set_metatable(jk.process.ProcessLauncherSushi, {})

function jk.process.ProcessLauncherSushi._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncherSushi)
	return v
end

function jk.process.ProcessLauncherSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncherSushi'
	self['_isType.jk.process.ProcessLauncherSushi'] = true
end

function jk.process.ProcessLauncherSushi:_construct0()
	jk.process.ProcessLauncherSushi._init(self)
	return self
end

jk.process.ProcessLauncherSushi.FDReader = {}
jk.process.ProcessLauncherSushi.FDReader.__index = jk.process.ProcessLauncherSushi.FDReader
_vm:set_metatable(jk.process.ProcessLauncherSushi.FDReader, {})

function jk.process.ProcessLauncherSushi.FDReader._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncherSushi.FDReader)
	return v
end

function jk.process.ProcessLauncherSushi.FDReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncherSushi.FDReader'
	self['_isType.jk.process.ProcessLauncherSushi.FDReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.lang.Closable'] = true
	self.fd = 0
end

function jk.process.ProcessLauncherSushi.FDReader:_construct0()
	jk.process.ProcessLauncherSushi.FDReader._init(self)
	return self
end

function jk.process.ProcessLauncherSushi.FDReader:forFd(fd)
	if fd < 0 then
		do return nil end
	end
	do
		local v = _g.jk.process.ProcessLauncherSushi.FDReader._construct0(_g.jk.process.ProcessLauncherSushi.FDReader._create())
		do v:setFd(fd) end
		do return v end
	end
end

function jk.process.ProcessLauncherSushi.FDReader:close()
	local fd = self.fd
	if fd >= 0 then
		do _io:close_handle(fd) end
		fd = -1
	end
end

function jk.process.ProcessLauncherSushi.FDReader:read(buffer)
	if not (buffer ~= nil) then
		do return 0 end
	end
	do
		local fd = self.fd
		local v = 0
		do v = _io:read_from_handle(fd, buffer) end
		do return v end
	end
end

function jk.process.ProcessLauncherSushi.FDReader:getFd()
	do return self.fd end
end

function jk.process.ProcessLauncherSushi.FDReader:setFd(v)
	self.fd = v
	do return self end
end

jk.process.ProcessLauncherSushi.FDWriter = {}
jk.process.ProcessLauncherSushi.FDWriter.__index = jk.process.ProcessLauncherSushi.FDWriter
_vm:set_metatable(jk.process.ProcessLauncherSushi.FDWriter, {})

function jk.process.ProcessLauncherSushi.FDWriter._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncherSushi.FDWriter)
	return v
end

function jk.process.ProcessLauncherSushi.FDWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncherSushi.FDWriter'
	self['_isType.jk.process.ProcessLauncherSushi.FDWriter'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.lang.Closable'] = true
	self.fd = 0
end

function jk.process.ProcessLauncherSushi.FDWriter:_construct0()
	jk.process.ProcessLauncherSushi.FDWriter._init(self)
	return self
end

function jk.process.ProcessLauncherSushi.FDWriter:forFd(fd)
	if fd < 0 then
		do return nil end
	end
	do
		local v = _g.jk.process.ProcessLauncherSushi.FDWriter._construct0(_g.jk.process.ProcessLauncherSushi.FDWriter._create())
		do v:setFd(fd) end
		do return v end
	end
end

function jk.process.ProcessLauncherSushi.FDWriter:close()
	local fd = self.fd
	if fd >= 0 then
		do _io:close_handle(fd) end
		fd = -1
	end
end

function jk.process.ProcessLauncherSushi.FDWriter:write(buf, size)
	local fd = self.fd
	local v = 0
	do v = _io:write_to_handle(fd, buf, size) end
	do return v end
end

function jk.process.ProcessLauncherSushi.FDWriter:getFd()
	do return self.fd end
end

function jk.process.ProcessLauncherSushi.FDWriter:setFd(v)
	self.fd = v
	do return self end
end

jk.process.ProcessLauncherSushi.MyProcess = {}
jk.process.ProcessLauncherSushi.MyProcess.__index = jk.process.ProcessLauncherSushi.MyProcess
_vm:set_metatable(jk.process.ProcessLauncherSushi.MyProcess, {})

function jk.process.ProcessLauncherSushi.MyProcess._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncherSushi.MyProcess)
	return v
end

function jk.process.ProcessLauncherSushi.MyProcess:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncherSushi.MyProcess'
	self['_isType.jk.process.ProcessLauncherSushi.MyProcess'] = true
	self['_isType.jk.process.Process'] = true
	self['_isType.jk.process.ProcessWithIO'] = true
	self.pid = 0
	self.inWriter = nil
	self.outReader = nil
	self.errReader = nil
	self.status = 0
end

function jk.process.ProcessLauncherSushi.MyProcess:_construct0()
	jk.process.ProcessLauncherSushi.MyProcess._init(self)
	return self
end

function jk.process.ProcessLauncherSushi.MyProcess:close()
	if self.inWriter ~= nil then
		do self.inWriter:close() end
		self.inWriter = nil
	end
	if self.outReader ~= nil then
		do self.outReader:close() end
		self.outReader = nil
	end
	if self.errReader ~= nil then
		do self.errReader:close() end
		self.errReader = nil
	end
end

function jk.process.ProcessLauncherSushi.MyProcess:getStandardInput()
	do return self.inWriter end
end

function jk.process.ProcessLauncherSushi.MyProcess:getStandardOutput()
	do return self.outReader end
end

function jk.process.ProcessLauncherSushi.MyProcess:getStandardError()
	do return self.errReader end
end

function jk.process.ProcessLauncherSushi.MyProcess:getId()
	do return _g.jk.lang.String:forInteger(self.pid) end
end

function jk.process.ProcessLauncherSushi.MyProcess:updateStatus()
	if self.pid >= 0 then
		local alive = 0
		local pid = self.pid
		do alive = _os:is_process_alive(pid) end
		if alive == 0 then
			do self:waitForExit() end
		end
	end
end

function jk.process.ProcessLauncherSushi.MyProcess:isRunning()
	do self:updateStatus() end
	if self.pid >= 0 then
		do return true end
	end
	do return false end
end

function jk.process.ProcessLauncherSushi.MyProcess:getExitStatus()
	do self:updateStatus() end
	do return self.status end
end

function jk.process.ProcessLauncherSushi.MyProcess:sendInterrupt()
	local pid = self.pid
	do _os:send_process_signal(pid, 2) end
end

function jk.process.ProcessLauncherSushi.MyProcess:killRequest()
	local pid = self.pid
	do _os:send_process_signal(pid, 15) end
end

function jk.process.ProcessLauncherSushi.MyProcess:killForce()
	local pid = self.pid
	do _os:send_process_signal(pid, 9) end
end

function jk.process.ProcessLauncherSushi.MyProcess:kill(timeout)
	do self:killRequest() end
	do
		local n = 0
		while n < timeout do
			if not self:isRunning() then
				do return end
			end
			do _os:sleep_milliseconds(100); end
			n = n + 100
		end
		do self:killForce() end
	end
end

function jk.process.ProcessLauncherSushi.MyProcess:waitForExit()
	local v = self.status
	local pid = self.pid
	if pid >= 0 then
		do v = _os:wait_for_process(pid) end
		do self:close() end
		self.status = v
		self.pid = -1
	end
	do return v end
end

function jk.process.ProcessLauncherSushi.MyProcess:getPid()
	do return self.pid end
end

function jk.process.ProcessLauncherSushi.MyProcess:setPid(v)
	self.pid = v
	do return self end
end

function jk.process.ProcessLauncherSushi.MyProcess:getInWriter()
	do return self.inWriter end
end

function jk.process.ProcessLauncherSushi.MyProcess:setInWriter(v)
	self.inWriter = v
	do return self end
end

function jk.process.ProcessLauncherSushi.MyProcess:getOutReader()
	do return self.outReader end
end

function jk.process.ProcessLauncherSushi.MyProcess:setOutReader(v)
	self.outReader = v
	do return self end
end

function jk.process.ProcessLauncherSushi.MyProcess:getErrReader()
	do return self.errReader end
end

function jk.process.ProcessLauncherSushi.MyProcess:setErrReader(v)
	self.errReader = v
	do return self end
end

function jk.process.ProcessLauncherSushi:startProcess(launcher, wait, pipeHandler, withIO, errorBuffer)
	if not (launcher ~= nil) then
		do return nil end
	end
	do
		local file = launcher:getFile()
		if not (file ~= nil) then
			do return nil end
		end
		do
			local filepath = file:getPath()
			local params = launcher:getParams()
			local env = {}
			local cenv = _g.jk.env.EnvironmentVariable:getAll()
			if cenv ~= nil then
				local keys = _g.jk.lang.Map:getKeys(cenv)
				if keys ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(keys)
					do
						n = 0
						while n < m do
							local key = keys[n + 1]
							if key ~= nil then
								do _g.jk.lang.Vector:append(env, _g.jk.lang.String:safeString(key) .. "=" .. _g.jk.lang.String:safeString(cenv[key])) end
							end
							do n = n + 1 end
						end
					end
				end
			end
			do
				local emap = launcher:getEnv()
				if emap ~= nil then
					local keys = _g.jk.lang.Map:getKeys(emap)
					if keys ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(keys)
						do
							n2 = 0
							while n2 < m2 do
								local key = keys[n2 + 1]
								if key ~= nil then
									do _g.jk.lang.Vector:append(env, _g.jk.lang.String:safeString(key) .. "=" .. _g.jk.lang.String:safeString(emap[key])) end
								end
								do n2 = n2 + 1 end
							end
						end
					end
				end
				do
					local cwd = launcher:getCwd()
					local cwdpath = nil
					if cwd ~= nil then
						cwdpath = cwd:getPath()
					end
					do
						local pid = 0
						local fdin = -1
						local fdout = -1
						local fderr = -1
						local sigintWasTrapped = false
						if launcher:getTrapSigint() then
							sigintWasTrapped = _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGINT, true)
						end
						if launcher:getReplaceSelf() then
							do _os:replace_process(filepath, params, env, cwdpath) end
						elseif pipeHandler ~= nil then
							do pid, fdin, fdout, fderr = _os:start_piped_process(filepath, params, env, cwdpath) end
						else
							do pid = _os:start_process(filepath, params, env, cwdpath) end
						end
						do
							local v = nil
							if pid >= 0 then
								local vv = _g.jk.process.ProcessLauncherSushi.MyProcess._construct0(_g.jk.process.ProcessLauncherSushi.MyProcess._create())
								do vv:setPid(pid) end
								do vv:setInWriter(_g.jk.process.ProcessLauncherSushi.FDWriter:forFd(fdin)) end
								do vv:setOutReader(_g.jk.process.ProcessLauncherSushi.FDReader:forFd(fdout)) end
								do vv:setErrReader(_g.jk.process.ProcessLauncherSushi.FDReader:forFd(fderr)) end
								if wait then
									if pipeHandler ~= nil then
										local _or = vv:getOutReader()
										local buffer = _util:allocate_buffer(4096)
										while true do
											local r = _or:read(buffer)
											if r < 1 then
												do break end
											end
											do pipeHandler:onBufferData(buffer, r) end
										end
										do
											local er = vv:getErrReader()
											while true do
												local r = er:read(buffer)
												if r < 1 then
													do break end
												end
												do pipeHandler:onBufferData(buffer, r) end
											end
										end
									end
									do vv:waitForExit() end
								end
								v = vv
							end
							if launcher:getTrapSigint() and sigintWasTrapped == false then
								do _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGINT, sigintWasTrapped) end
							end
							do return v end
						end
					end
				end
			end
		end
	end
end

jk.process.ProcessKit = {}
jk.process.ProcessKit.__index = jk.process.ProcessKit
_vm:set_metatable(jk.process.ProcessKit, {})

function jk.process.ProcessKit._create()
	local v = _vm:set_metatable({}, jk.process.ProcessKit)
	return v
end

function jk.process.ProcessKit:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessKit'
	self['_isType.jk.process.ProcessKit'] = true
	self.ctx = nil
end

function jk.process.ProcessKit:_construct0()
	jk.process.ProcessKit._init(self)
	return self
end

function jk.process.ProcessKit:_construct1(ctx)
	jk.process.ProcessKit._init(self)
	self.ctx = ctx
	return self
end

function jk.process.ProcessKit:execute(command)
	local pl = _g.jk.process.ProcessLauncher:asProcessLauncher(command)
	if not (pl ~= nil) then
		do _g.jk.lang.Error:throw("invalidParameter", _g.jk.lang.String:asString(command)) end
	end
	do
		local cmd = pl:toString()
		do _g.jk.log.Log:debug(self.ctx, "Executing command: `" .. _g.jk.lang.String:safeString(cmd) .. "'") end
		do
			local r = pl:execute()
			if r ~= 0 then
				do _g.jk.lang.Error:throw("errorStatus", _g.jk.lang.String:forInteger(r)) end
			end
		end
	end
end

jk.process.ProcessLauncher = {}
jk.process.ProcessLauncher.__index = jk.process.ProcessLauncher
_vm:set_metatable(jk.process.ProcessLauncher, {})

function jk.process.ProcessLauncher._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncher)
	return v
end

function jk.process.ProcessLauncher:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncher'
	self['_isType.jk.process.ProcessLauncher'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.file = nil
	self.params = nil
	self.env = nil
	self.cwd = nil
	self.uid = -1
	self.gid = -1
	self.trapSigint = true
	self.replaceSelf = false
	self.pipePty = false
	self.startGroup = false
	self.noCmdWindow = false
	self.errorBuffer = nil
end

jk.process.ProcessLauncher.MyStringPipeHandler = {}
jk.process.ProcessLauncher.MyStringPipeHandler.__index = jk.process.ProcessLauncher.MyStringPipeHandler
_vm:set_metatable(jk.process.ProcessLauncher.MyStringPipeHandler, {})

function jk.process.ProcessLauncher.MyStringPipeHandler._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncher.MyStringPipeHandler)
	return v
end

function jk.process.ProcessLauncher.MyStringPipeHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncher.MyStringPipeHandler'
	self['_isType.jk.process.ProcessLauncher.MyStringPipeHandler'] = true
	self['_isType.jk.lang.BufferDataReceiver'] = true
	self.builder = nil
	self.encoding = nil
end

function jk.process.ProcessLauncher.MyStringPipeHandler:_construct0()
	jk.process.ProcessLauncher.MyStringPipeHandler._init(self)
	self.encoding = "UTF-8"
	return self
end

function jk.process.ProcessLauncher.MyStringPipeHandler:onBufferData(data, size)
	if self.builder == nil or data == nil or size < 1 then
		do return false end
	end
	do
		local str = _g.jk.lang.String:forBuffer(_g.jk.lang.Buffer:getSubBuffer(data, 0, size, false), self.encoding)
		if not (str ~= nil) then
			do return false end
		end
		do self.builder:appendString(str) end
		do return true end
	end
end

function jk.process.ProcessLauncher.MyStringPipeHandler:getBuilder()
	do return self.builder end
end

function jk.process.ProcessLauncher.MyStringPipeHandler:setBuilder(v)
	self.builder = v
	do return self end
end

function jk.process.ProcessLauncher.MyStringPipeHandler:getEncoding()
	do return self.encoding end
end

function jk.process.ProcessLauncher.MyStringPipeHandler:setEncoding(v)
	self.encoding = v
	do return self end
end

jk.process.ProcessLauncher.MyBufferPipeHandler = {}
jk.process.ProcessLauncher.MyBufferPipeHandler.__index = jk.process.ProcessLauncher.MyBufferPipeHandler
_vm:set_metatable(jk.process.ProcessLauncher.MyBufferPipeHandler, {})

function jk.process.ProcessLauncher.MyBufferPipeHandler._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncher.MyBufferPipeHandler)
	return v
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncher.MyBufferPipeHandler'
	self['_isType.jk.process.ProcessLauncher.MyBufferPipeHandler'] = true
	self['_isType.jk.lang.BufferDataReceiver'] = true
	self.data = nil
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:_construct0()
	jk.process.ProcessLauncher.MyBufferPipeHandler._init(self)
	return self
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:onBufferData(newData, size)
	self.data = _g.jk.lang.Buffer:append(self.data, newData, size)
	do return true end
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:getData()
	do return self.data end
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:setData(v)
	self.data = v
	do return self end
end

jk.process.ProcessLauncher.QuietPipeHandler = {}
jk.process.ProcessLauncher.QuietPipeHandler.__index = jk.process.ProcessLauncher.QuietPipeHandler
_vm:set_metatable(jk.process.ProcessLauncher.QuietPipeHandler, {})

function jk.process.ProcessLauncher.QuietPipeHandler._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncher.QuietPipeHandler)
	return v
end

function jk.process.ProcessLauncher.QuietPipeHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncher.QuietPipeHandler'
	self['_isType.jk.process.ProcessLauncher.QuietPipeHandler'] = true
	self['_isType.jk.lang.BufferDataReceiver'] = true
end

function jk.process.ProcessLauncher.QuietPipeHandler:_construct0()
	jk.process.ProcessLauncher.QuietPipeHandler._init(self)
	return self
end

function jk.process.ProcessLauncher.QuietPipeHandler:onBufferData(data, size)
	do return true end
end

function jk.process.ProcessLauncher:asProcessLauncher(o)
	if not (o ~= nil) then
		do return nil end
	end
	if (_vm:get_variable_type(o) == 'string') then
		do return _g.jk.process.ProcessLauncher:forString(o) end
	end
	do
		local vector = _g.jk.lang.Vector:asObjectVector(o)
		if vector ~= nil then
			local vsz = _g.jk.lang.Vector:getSize(vector)
			if vsz > 0 then
				local pl = _g.jk.process.ProcessLauncher:forCommand(_g.jk.lang.String:asString(_g.jk.lang.Vector:get(vector, 0)), nil)
				if not (pl ~= nil) then
					do return nil end
				end
				do
					local n = 1
					while n < vsz do
						do pl:addToParams(_g.jk.lang.String:asString(_g.jk.lang.Vector:get(vector, n))) end
						do n = n + 1 end
					end
				end
				do return pl end
			end
		end
		do return nil end
	end
end

function jk.process.ProcessLauncher:forSelf()
	local exe = _g.jk.process.CurrentProcess:getExecutableFile()
	if not (exe ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.process.ProcessLauncher._construct0(_g.jk.process.ProcessLauncher._create())
		do v:setFile(exe) end
		do return v end
	end
end

function jk.process.ProcessLauncher:forFile(file, params)
	if file == nil or file:isFile() == false then
		do return nil end
	end
	do
		local v = _g.jk.process.ProcessLauncher._construct0(_g.jk.process.ProcessLauncher._create())
		do v:setFile(file) end
		if params ~= nil then
			local n = 0
			local m = #params
			do
				n = 0
				while n < m do
					local param = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(params[n + 1])
					if param ~= nil then
						do v:addToParams(param) end
					end
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function jk.process.ProcessLauncher:forCommand(command, params)
	if _g.jk.lang.String:isEmpty(command) then
		do return nil end
	end
	do
		local file = nil
		if _g.jk.lang.String:getIndexOfCharacter(command, _g.jk.fs.PathInfo:getPathSeparator(), 0) >= 0 then
			file = _g.jk.fs.File:forPath(command)
		else
			file = _g.jk.env.ExternalCommand:findInPath(command)
		end
		do return _g.jk.process.ProcessLauncher:forFile(file, params) end
	end
end

function jk.process.ProcessLauncher:forString(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return nil end
	end
	do
		local arr = _g.jk.text.StringUtil:quotedStringToVector(str, 32, true, 92)
		if arr == nil or _g.jk.lang.Vector:getSize(arr) < 1 then
			do return nil end
		end
		do
			local vsz = _g.jk.lang.Vector:getSize(arr)
			local cmd = arr[0 + 1]
			local params = nil
			local paramCount = vsz - 1
			if paramCount > 0 then
				params = _vm:allocate_array(paramCount)
				do
					local n = 1
					while n < vsz do
						params[n - 1 + 1] = arr[n + 1]
						do n = n + 1 end
					end
				end
			end
			do return _g.jk.process.ProcessLauncher:forCommand(cmd, params) end
		end
	end
end

function jk.process.ProcessLauncher:_construct0()
	jk.process.ProcessLauncher._init(self)
	self.params = {}
	self.env = {}
	return self
end

function jk.process.ProcessLauncher:appendProperParam(sb, p)
	if not _g.jk.lang.String:isNotEmpty(p) then
		do return end
	end
	do sb:appendCharacter(32) end
	do sb:appendCharacter(34) end
	do self:escapeQuotesAndBackSlashes(sb, p) end
	do sb:appendCharacter(34) end
end

function jk.process.ProcessLauncher:escapeQuotesAndBackSlashes(sb, param)
	local it = _g.jk.lang.String:iterate(param)
	while it ~= nil do
		local c = it:getNextChar()
		if _g.jk.lang.Character:isEOF(c) then
			do break end
		end
		if c == 34 or c == 92 then
			do sb:appendCharacter(92) end
		end
		do sb:appendCharacter(c) end
	end
end

function jk.process.ProcessLauncher:getFullCommandString(includeEnv)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if includeEnv then
		local keys = _g.jk.lang.Map:getKeys(self.env)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = keys[n + 1]
					if key ~= nil then
						do sb:appendString(key) end
						do sb:appendCharacter(61) end
						do sb:appendString(self.env[key]) end
						do sb:appendCharacter(32) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do sb:appendCharacter(34) end
	if self.file ~= nil then
		do self:escapeQuotesAndBackSlashes(sb, self.file:getPath()) end
	end
	do sb:appendCharacter(34) end
	if self.params ~= nil then
		local n2 = 0
		local m2 = _g.jk.lang.Vector:getSize(self.params)
		do
			n2 = 0
			while n2 < m2 do
				local p = self.params[n2 + 1]
				if p ~= nil then
					do self:appendProperParam(sb, p) end
				end
				do n2 = n2 + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.process.ProcessLauncher:toString()
	do return self:getFullCommandString(true) end
end

function jk.process.ProcessLauncher:addToParams(arg)
	if arg ~= nil then
		if self.params == nil then
			self.params = {}
		end
		do _g.jk.lang.Vector:append(self.params, arg) end
	end
	do return self end
end

function jk.process.ProcessLauncher:addFileToParams(file)
	if file ~= nil then
		do self:addToParams(file:getPath()) end
	end
	do return self end
end

function jk.process.ProcessLauncher:addStringsToParams(params)
	if params ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(params)
		do
			n = 0
			while n < m do
				local s = params[n + 1]
				if s ~= nil then
					do self:addToParams(s) end
				end
				do n = n + 1 end
			end
		end
	end
	do return self end
end

function jk.process.ProcessLauncher:setEnvVariable(key, val)
	if key ~= nil then
		if self.env == nil then
			self.env = {}
		end
		self.env[key] = val
	end
end

function jk.process.ProcessLauncher:startProcess(wait, pipeHandler, withIO)
	do return _g.jk.process.ProcessLauncherSushi:startProcess(self, wait, pipeHandler, withIO, self.errorBuffer) end
end

function jk.process.ProcessLauncher:start()
	do return self:startProcess(false, nil, false) end
end

function jk.process.ProcessLauncher:startWithIO()
	do return _vm:to_table_with_key(self:startProcess(false, nil, true), '_isType.jk.process.ProcessWithIO') end
end

function jk.process.ProcessLauncher:execute()
	local cp = self:startProcess(true, nil, false)
	if cp == nil then
		do return -1 end
	end
	do return cp:getExitStatus() end
end

function jk.process.ProcessLauncher:executeSilent()
	local cp = self:startProcess(true, _g.jk.process.ProcessLauncher.QuietPipeHandler._construct0(_g.jk.process.ProcessLauncher.QuietPipeHandler._create()), false)
	if cp == nil then
		do return -1 end
	end
	do return cp:getExitStatus() end
end

function jk.process.ProcessLauncher:executeToStringBuilder(output)
	local msp = _g.jk.process.ProcessLauncher.MyStringPipeHandler._construct0(_g.jk.process.ProcessLauncher.MyStringPipeHandler._create())
	do msp:setBuilder(output) end
	do
		local cp = self:startProcess(true, msp, false)
		if cp == nil then
			do return -1 end
		end
		do return cp:getExitStatus() end
	end
end

function jk.process.ProcessLauncher:executeToString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self:executeToStringBuilder(sb) < 0 then
		do return nil end
	end
	do return sb:toString() end
end

function jk.process.ProcessLauncher:executeToBuffer()
	local ph = _g.jk.process.ProcessLauncher.MyBufferPipeHandler._construct0(_g.jk.process.ProcessLauncher.MyBufferPipeHandler._create())
	local cp = self:startProcess(true, ph, false)
	if cp == nil then
		do return nil end
	end
	do return ph:getData() end
end

function jk.process.ProcessLauncher:executeToPipe(pipeHandler)
	local cp = self:startProcess(true, pipeHandler, false)
	if cp == nil then
		do return -1 end
	end
	do return cp:getExitStatus() end
end

function jk.process.ProcessLauncher:getFile()
	do return self.file end
end

function jk.process.ProcessLauncher:setFile(v)
	self.file = v
	do return self end
end

function jk.process.ProcessLauncher:getParams()
	do return self.params end
end

function jk.process.ProcessLauncher:setParams(v)
	self.params = v
	do return self end
end

function jk.process.ProcessLauncher:getEnv()
	do return self.env end
end

function jk.process.ProcessLauncher:setEnv(v)
	self.env = v
	do return self end
end

function jk.process.ProcessLauncher:getCwd()
	do return self.cwd end
end

function jk.process.ProcessLauncher:setCwd(v)
	self.cwd = v
	do return self end
end

function jk.process.ProcessLauncher:getUid()
	do return self.uid end
end

function jk.process.ProcessLauncher:setUid(v)
	self.uid = v
	do return self end
end

function jk.process.ProcessLauncher:getGid()
	do return self.gid end
end

function jk.process.ProcessLauncher:setGid(v)
	self.gid = v
	do return self end
end

function jk.process.ProcessLauncher:getTrapSigint()
	do return self.trapSigint end
end

function jk.process.ProcessLauncher:setTrapSigint(v)
	self.trapSigint = v
	do return self end
end

function jk.process.ProcessLauncher:getReplaceSelf()
	do return self.replaceSelf end
end

function jk.process.ProcessLauncher:setReplaceSelf(v)
	self.replaceSelf = v
	do return self end
end

function jk.process.ProcessLauncher:getPipePty()
	do return self.pipePty end
end

function jk.process.ProcessLauncher:setPipePty(v)
	self.pipePty = v
	do return self end
end

function jk.process.ProcessLauncher:getStartGroup()
	do return self.startGroup end
end

function jk.process.ProcessLauncher:setStartGroup(v)
	self.startGroup = v
	do return self end
end

function jk.process.ProcessLauncher:getNoCmdWindow()
	do return self.noCmdWindow end
end

function jk.process.ProcessLauncher:setNoCmdWindow(v)
	self.noCmdWindow = v
	do return self end
end

function jk.process.ProcessLauncher:getErrorBuffer()
	do return self.errorBuffer end
end

function jk.process.ProcessLauncher:setErrorBuffer(v)
	self.errorBuffer = v
	do return self end
end
jk = jk or {}

jk.console = jk.console or {}

jk.console.Terminal = {}
jk.console.Terminal.__index = jk.console.Terminal
_vm:set_metatable(jk.console.Terminal, {})

function jk.console.Terminal._create()
	local v = _vm:set_metatable({}, jk.console.Terminal)
	return v
end

function jk.console.Terminal:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.Terminal'
	self['_isType.jk.console.Terminal'] = true
end

function jk.console.Terminal:_construct0()
	jk.console.Terminal._init(self)
	return self
end

function jk.console.Terminal:forCurrent()
	do return nil end
end

function jk.console.Terminal:clear()
end

function jk.console.Terminal:moveTo(x, y)
end

function jk.console.Terminal:print(text)
end

function jk.console.Terminal:printTo(x, y, text)
end

function jk.console.Terminal:readKey()
end

function jk.console.Terminal:readLine()
end

function jk.console.Terminal:readLineWithoutEcho()
end

jk.console.CommandLineArgument = {}
jk.console.CommandLineArgument.__index = jk.console.CommandLineArgument
_vm:set_metatable(jk.console.CommandLineArgument, {})

function jk.console.CommandLineArgument._create()
	local v = _vm:set_metatable({}, jk.console.CommandLineArgument)
	return v
end

function jk.console.CommandLineArgument:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.CommandLineArgument'
	self['_isType.jk.console.CommandLineArgument'] = true
	self.arg = nil
	self.parameter = nil
	self.flag = nil
	self.key = nil
	self.value = nil
end

function jk.console.CommandLineArgument:_construct0()
	jk.console.CommandLineArgument._init(self)
	return self
end

function jk.console.CommandLineArgument:_construct5(arg, parameter, flag, key, value)
	jk.console.CommandLineArgument._init(self)
	self.arg = arg
	self.parameter = parameter
	self.flag = flag
	self.key = key
	self.value = value
	return self
end

function jk.console.CommandLineArgument:isParameter()
	if self.parameter ~= nil then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:isFlag1()
	if self.flag ~= nil then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:isOption1()
	if self.key ~= nil then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:isFlag2(text)
	if text ~= nil and _g.jk.lang.String:equalsIgnoreCase(text, self.flag) then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:isOption2(text)
	if text ~= nil and _g.jk.lang.String:equalsIgnoreCase(text, self.key) then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:hasValue()
	if self.value ~= nil then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:getKey()
	do return self.key end
end

function jk.console.CommandLineArgument:getComplete()
	do return self.arg end
end

function jk.console.CommandLineArgument:getStringValue()
	do return self.value end
end

function jk.console.CommandLineArgument:getIntegerValue()
	do return _g.jk.lang.Integer:asInteger(self.value) end
end

function jk.console.CommandLineArgument:getBooleanValue()
	do return _g.jk.lang.Boolean:asBoolean(self.value, false) end
end

function jk.console.CommandLineArgument:reportAsUnsupported(ctx)
	do _g.jk.log.Log:error(ctx, "Unsupported command line parameter: `" .. _g.jk.lang.String:safeString(self.arg) .. "'") end
end

jk.console.StdoutForSushi = {}
jk.console.StdoutForSushi.__index = jk.console.StdoutForSushi
_vm:set_metatable(jk.console.StdoutForSushi, {})

function jk.console.StdoutForSushi._create()
	local v = _vm:set_metatable({}, jk.console.StdoutForSushi)
	return v
end

function jk.console.StdoutForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.StdoutForSushi'
	self['_isType.jk.console.StdoutForSushi'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.io.PrintWriter'] = true
end

function jk.console.StdoutForSushi:_construct0()
	jk.console.StdoutForSushi._init(self)
	return self
end

function jk.console.StdoutForSushi:write(buf, size)
	local v = 0
	do v = _io:write_to_handle(1, buf, size) end
	do return v end
end

function jk.console.StdoutForSushi:print(str)
	do _io:write_to_stdout(str) end
	do return true end
end

function jk.console.StdoutForSushi:println(str)
	do _io:write_to_stdout(str .. "\n") end
	do return true end
end

jk.console.ConsoleApplicationUtil = {}
jk.console.ConsoleApplicationUtil.__index = jk.console.ConsoleApplicationUtil
_vm:set_metatable(jk.console.ConsoleApplicationUtil, {})

function jk.console.ConsoleApplicationUtil._create()
	local v = _vm:set_metatable({}, jk.console.ConsoleApplicationUtil)
	return v
end

function jk.console.ConsoleApplicationUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.ConsoleApplicationUtil'
	self['_isType.jk.console.ConsoleApplicationUtil'] = true
end

function jk.console.ConsoleApplicationUtil:_construct0()
	jk.console.ConsoleApplicationUtil._init(self)
	return self
end

function jk.console.ConsoleApplicationUtil:printHeader(out, title, version, copyright, license, platform, component)
	if not (out ~= nil) then
		do return end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if _g.jk.lang.String:isEmpty(title) then
			do sb:appendString("Untitled Application") end
		else
			do sb:appendString(title) end
		end
		if _g.jk.lang.String:isNotEmpty(component) then
			if sb:count() > 0 then
				do sb:appendCharacter(32) end
			end
			do sb:appendString(component) end
		end
		if _g.jk.lang.String:isNotEmpty(version) then
			do sb:appendString(" / ") end
			do sb:appendString(version) end
		end
		if _g.jk.lang.String:isNotEmpty(platform) then
			do sb:appendString(" @ ") end
			do sb:appendString(platform) end
		end
		if sb:count() > 0 then
			do sb:appendCharacter(10) end
		end
		if _g.jk.lang.String:isNotEmpty(copyright) then
			do sb:appendString(copyright) end
			do sb:appendCharacter(10) end
		end
		if _g.jk.lang.String:isNotEmpty(license) then
			do sb:appendString(license) end
			do sb:appendCharacter(10) end
		end
		if sb:count() > 0 then
			do sb:appendCharacter(10) end
		end
		if sb:count() > 0 then
			do out:print(sb:toString()) end
		end
	end
end

function jk.console.ConsoleApplicationUtil:printVersion(out, version, title)
	if not (out ~= nil) then
		do return end
	end
	if _g.jk.lang.String:isNotEmpty(title) then
		do out:println(_g.jk.lang.String:safeString(title) .. "/" .. _g.jk.lang.String:safeString(version)) end
	else
		do out:println(version) end
	end
end

function jk.console.ConsoleApplicationUtil:parseCommandLineArguments(args)
	local v = {}
	if args ~= nil then
		local n = 0
		local m = #args
		do
			n = 0
			while n < m do
				local arg = args[n + 1]
				if arg ~= nil then
					if _g.jk.lang.String:startsWith(arg, "-", 0) then
						if _g.jk.lang.String:getIndexOfCharacter(arg, 61, 0) > 0 then
							local comps = _g.jk.lang.String:split(arg, 61, 2)
							local key = _g.jk.lang.String:getEndOfString(comps[0 + 1], 1)
							local val = comps[1 + 1]
							do _g.jk.lang.Vector:append(v, _g.jk.console.CommandLineArgument._construct5(_g.jk.console.CommandLineArgument._create(), arg, nil, nil, key, val)) end
						else
							do _g.jk.lang.Vector:append(v, _g.jk.console.CommandLineArgument._construct5(_g.jk.console.CommandLineArgument._create(), arg, nil, _g.jk.lang.String:getEndOfString(arg, 1), nil, "true")) end
						end
					else
						do _g.jk.lang.Vector:append(v, _g.jk.console.CommandLineArgument._construct5(_g.jk.console.CommandLineArgument._create(), arg, arg, nil, nil, arg)) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.console.ConsoleApplicationUtil:getLongestString(strings, add, ov)
	local v = ov
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local string = (function(o)
					if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if string ~= nil then
					local ss = _g.jk.lang.String:getLength(_g.jk.lang.String:asString(string[0 + 1])) + add
					if ss > v then
						v = ss
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.console.ConsoleApplicationUtil:printUsage(stdout, name, parameters, flags, options)
	local nn = name
	if _g.jk.lang.String:isEmpty(nn) then
		nn = _g.jk.process.CurrentProcess:getProcessName()
	end
	if _g.jk.lang.String:isEmpty(nn) then
		nn = "(command)"
	end
	do
		local ll = 0
		ll = _g.jk.console.ConsoleApplicationUtil:getLongestString(parameters, 0, ll)
		ll = _g.jk.console.ConsoleApplicationUtil:getLongestString(flags, 1, ll)
		ll = _g.jk.console.ConsoleApplicationUtil:getLongestString(options, 9, ll)
		do stdout:print("Usage: " .. _g.jk.lang.String:safeString(nn) .. " [parameters, flags and options]\n") end
		if _g.jk.lang.Array:isEmpty(parameters) == false then
			do stdout:print("\n") end
			do stdout:print("Supported Parameters:\n") end
			do stdout:print("\n") end
			if parameters ~= nil then
				local n = 0
				local m = #parameters
				do
					n = 0
					while n < m do
						local parameter = (function(o)
							if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
								do return o end
							end
							do return nil end
						end)(parameters[n + 1])
						if parameter ~= nil then
							do stdout:print("  " .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:padToLength(_g.jk.lang.String:asString(parameter[0 + 1]), ll, -1, 32)) .. " - " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(parameter[1 + 1])) .. "\n") end
						end
						do n = n + 1 end
					end
				end
			end
		end
		if _g.jk.lang.Array:isEmpty(flags) == false then
			do stdout:print("\n") end
			do stdout:print("Supported Flags:\n") end
			do stdout:print("\n") end
			if flags ~= nil then
				local n2 = 0
				local m2 = #flags
				do
					n2 = 0
					while n2 < m2 do
						local flag = (function(o)
							if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
								do return o end
							end
							do return nil end
						end)(flags[n2 + 1])
						if flag ~= nil then
							do stdout:print("  -" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:padToLength(_g.jk.lang.String:asString(flag[0 + 1]), ll, -1, 32)) .. " - " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(flag[1 + 1])) .. "\n") end
						end
						do n2 = n2 + 1 end
					end
				end
			end
		end
		if _g.jk.lang.Array:isEmpty(options) == false then
			do stdout:print("\n") end
			do stdout:print("Supported Options:\n") end
			do stdout:print("\n") end
			if options ~= nil then
				local n3 = 0
				local m3 = #options
				do
					n3 = 0
					while n3 < m3 do
						local option = (function(o)
							if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
								do return o end
							end
							do return nil end
						end)(options[n3 + 1])
						if option ~= nil then
							do stdout:print("  -" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:padToLength(_g.jk.lang.String:safeString(_g.jk.lang.String:asString(option[0 + 1])) .. "=<value>", ll, -1, 32)) .. " - " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(option[1 + 1])) .. "\n") end
						end
						do n3 = n3 + 1 end
					end
				end
			end
		end
		do stdout:print("\n") end
	end
end

jk.console.ConsoleApplicationMain = {}
jk.console.ConsoleApplicationMain.__index = jk.console.ConsoleApplicationMain
_vm:set_metatable(jk.console.ConsoleApplicationMain, {})

function jk.console.ConsoleApplicationMain._create()
	local v = _vm:set_metatable({}, jk.console.ConsoleApplicationMain)
	return v
end

function jk.console.ConsoleApplicationMain:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.ConsoleApplicationMain'
	self['_isType.jk.console.ConsoleApplicationMain'] = true
	self.stdout = nil
	self.stdin = nil
	self.ctx = nil
	self.args = nil
	self.verbosityLevel = 3
	self.terminal = nil
end

function jk.console.ConsoleApplicationMain:executeMain(app, args)
	if not (app ~= nil) then
		do return -1 end
	end
	do return app:executeWithArgumentArray(args) end
end

function jk.console.ConsoleApplicationMain:_construct0()
	jk.console.ConsoleApplicationMain._init(self)
	self.stdin = _g.jk.console.Stdin:instance()
	self.stdout = _g.jk.console.Stdout:instance()
	self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	return self
end

function jk.console.ConsoleApplicationMain:setCtx(v)
	self.ctx = v
	do return self end
end

function jk.console.ConsoleApplicationMain:getTerminal()
	if not (self.terminal ~= nil) then
		self.terminal = _g.jk.console.Terminal:forCurrent()
	end
	do return self.terminal end
end

function jk.console.ConsoleApplicationMain:print(string)
	if self.stdout ~= nil then
		do self.stdout:print(string) end
	end
end

function jk.console.ConsoleApplicationMain:println(string)
	if self.stdout ~= nil then
		do self.stdout:println(string) end
	end
end

function jk.console.ConsoleApplicationMain:readLine()
	local tt = self:getTerminal()
	if tt ~= nil then
		do return tt:readLine() end
	end
	if self.stdin ~= nil then
		do return self.stdin:readLine() end
	end
	do return nil end
end

function jk.console.ConsoleApplicationMain:readLineWithoutEcho()
	local tt = self:getTerminal()
	if tt ~= nil then
		do return tt:readLineWithoutEcho() end
	end
	do return self:readLine() end
end

function jk.console.ConsoleApplicationMain:initialize()
	do return true end
end

function jk.console.ConsoleApplicationMain:getVerbosityLevel()
	do return self.verbosityLevel end
end

function jk.console.ConsoleApplicationMain:setVerbosityLevel(level)
	self.verbosityLevel = level
	if self.verbosityLevel <= 0 then
		do self.ctx:setEnableOutput(false) end
	elseif self.verbosityLevel == 1 then
		do self.ctx:setEnableOutput(true) end
		do self.ctx:setShowError(true) end
		do self.ctx:setShowWarning(false) end
		do self.ctx:setShowInfo(false) end
		do self.ctx:setShowDebug(false) end
	elseif self.verbosityLevel == 2 then
		do self.ctx:setEnableOutput(true) end
		do self.ctx:setShowError(true) end
		do self.ctx:setShowWarning(true) end
		do self.ctx:setShowInfo(false) end
		do self.ctx:setShowDebug(false) end
	elseif self.verbosityLevel == 3 then
		do self.ctx:setEnableOutput(true) end
		do self.ctx:setShowError(true) end
		do self.ctx:setShowWarning(true) end
		do self.ctx:setShowInfo(true) end
		do self.ctx:setShowDebug(false) end
	else
		do self.ctx:setEnableOutput(true) end
		do self.ctx:setShowError(true) end
		do self.ctx:setShowWarning(true) end
		do self.ctx:setShowInfo(true) end
		do self.ctx:setShowDebug(true) end
	end
end

function jk.console.ConsoleApplicationMain:handleVerbosityParams()
	local nargs = {}
	local vl = self.verbosityLevel
	if self.args ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.args)
		do
			n = 0
			while n < m do
				local arg = self.args[n + 1]
				if arg ~= nil then
					if arg:isFlag2("v0") then
						vl = 0
					elseif arg:isFlag2("v1") then
						vl = 1
					elseif arg:isFlag2("v2") then
						vl = 2
					elseif arg:isFlag2("v3") then
						vl = 3
					elseif arg:isFlag2("v4") or arg:isFlag2("vv") or arg:isFlag2("debug") then
						vl = 4
					else
						do _g.jk.lang.Vector:append(nargs, arg) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	self.args = nargs
	if vl ~= self.verbosityLevel then
		do self:setVerbosityLevel(vl) end
	end
end

function jk.console.ConsoleApplicationMain:executeWithArgumentArray(args)
	if args ~= nil then
		self.args = _g.jk.console.ConsoleApplicationUtil:parseCommandLineArguments(args)
	end
	if not self:initialize() then
		do return 1 end
	end
	do
		local r = self:execute()
		do _g.jk.log.Log:status(self.ctx, nil) end
		if r then
			do return 0 end
		end
		do return 1 end
	end
end

function jk.console.ConsoleApplicationMain:executeWithArgumentVector(args)
	local arga = nil
	if args ~= nil then
		arga = _vm:allocate_array(_g.jk.lang.Vector:getSize(args))
		do
			local n = 0
			if args ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(args)
				do
					n2 = 0
					while n2 < m do
						local arg = args[n2 + 1]
						if arg ~= nil then
							arga[(function() local v = n n = n + 1 return v end)() + 1] = arg
						end
						do n2 = n2 + 1 end
					end
				end
			end
		end
	end
	do return self:executeWithArgumentArray(arga) end
end

function jk.console.ConsoleApplicationMain:executeWithParsedArguments(args)
	self.args = args
	if not self:initialize() then
		do return false end
	end
	do
		local r = self:execute()
		do _g.jk.log.Log:status(self.ctx, nil) end
		do return r end
	end
end

function jk.console.ConsoleApplicationMain:execute()
end

jk.console.UsageInfo = {}
jk.console.UsageInfo.__index = jk.console.UsageInfo
_vm:set_metatable(jk.console.UsageInfo, {})

function jk.console.UsageInfo._create()
	local v = _vm:set_metatable({}, jk.console.UsageInfo)
	return v
end

function jk.console.UsageInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.UsageInfo'
	self['_isType.jk.console.UsageInfo'] = true
	self.command = nil
	self.description = nil
	self.paramDesc = nil
	self.data = nil
end

function jk.console.UsageInfo:forCommand(command)
	local v = _g.jk.console.UsageInfo._construct0(_g.jk.console.UsageInfo._create())
	do v:setCommand(command) end
	do return v end
end

jk.console.UsageInfo.Parameter = {}
jk.console.UsageInfo.Parameter.__index = jk.console.UsageInfo.Parameter
_vm:set_metatable(jk.console.UsageInfo.Parameter, {})

function jk.console.UsageInfo.Parameter._create()
	local v = _vm:set_metatable({}, jk.console.UsageInfo.Parameter)
	return v
end

function jk.console.UsageInfo.Parameter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.UsageInfo.Parameter'
	self['_isType.jk.console.UsageInfo.Parameter'] = true
	self.name = nil
	self.description = nil
end

function jk.console.UsageInfo.Parameter:_construct0()
	jk.console.UsageInfo.Parameter._init(self)
	return self
end

jk.console.UsageInfo.Flag = {}
jk.console.UsageInfo.Flag.__index = jk.console.UsageInfo.Flag
_vm:set_metatable(jk.console.UsageInfo.Flag, {})

function jk.console.UsageInfo.Flag._create()
	local v = _vm:set_metatable({}, jk.console.UsageInfo.Flag)
	return v
end

function jk.console.UsageInfo.Flag:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.UsageInfo.Flag'
	self['_isType.jk.console.UsageInfo.Flag'] = true
	self.flag = nil
	self.description = nil
end

function jk.console.UsageInfo.Flag:_construct0()
	jk.console.UsageInfo.Flag._init(self)
	return self
end

jk.console.UsageInfo.Option = {}
jk.console.UsageInfo.Option.__index = jk.console.UsageInfo.Option
_vm:set_metatable(jk.console.UsageInfo.Option, {})

function jk.console.UsageInfo.Option._create()
	local v = _vm:set_metatable({}, jk.console.UsageInfo.Option)
	return v
end

function jk.console.UsageInfo.Option:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.UsageInfo.Option'
	self['_isType.jk.console.UsageInfo.Option'] = true
	self.name = nil
	self.value = nil
	self.description = nil
end

function jk.console.UsageInfo.Option:_construct0()
	jk.console.UsageInfo.Option._init(self)
	return self
end

function jk.console.UsageInfo:_construct0()
	jk.console.UsageInfo._init(self)
	self.data = {}
	self.paramDesc = "[parameters]"
	self.command = _g.jk.process.CurrentProcess:getProcessName()
	if _g.jk.lang.String:isEmpty(self.command) then
		self.command = "(command)"
	end
	return self
end

function jk.console.UsageInfo:ensureSection()
	if _g.jk.lang.Vector:getSize(self.data) < 1 then
		do self:addSection("Available parameters") end
	end
end

function jk.console.UsageInfo:addSection(name)
	do _g.jk.lang.Vector:append(self.data, name) end
end

function jk.console.UsageInfo:addParameter(name, description)
	do self:ensureSection() end
	do
		local p = _g.jk.console.UsageInfo.Parameter._construct0(_g.jk.console.UsageInfo.Parameter._create())
		p.name = name
		p.description = description
		do _g.jk.lang.Vector:append(self.data, p) end
	end
end

function jk.console.UsageInfo:addFlag(flag, description)
	do self:ensureSection() end
	do
		local f = _g.jk.console.UsageInfo.Flag._construct0(_g.jk.console.UsageInfo.Flag._create())
		f.flag = flag
		f.description = description
		do _g.jk.lang.Vector:append(self.data, f) end
	end
end

function jk.console.UsageInfo:addOption(name, value, description)
	do self:ensureSection() end
	do
		local o = _g.jk.console.UsageInfo.Option._construct0(_g.jk.console.UsageInfo.Option._create())
		o.name = name
		o.value = value
		o.description = description
		do _g.jk.lang.Vector:append(self.data, o) end
	end
end

function jk.console.UsageInfo:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("Usage: ") end
	do sb:appendString(self.command) end
	if _g.jk.lang.String:isEmpty(self.paramDesc) == false then
		do sb:appendCharacter(32) end
		do sb:appendString(self.paramDesc) end
	end
	do sb:appendCharacter(10) end
	do sb:appendCharacter(10) end
	if _g.jk.lang.String:isEmpty(self.description) == false then
		do sb:appendString(self.description) end
		do sb:appendCharacter(10) end
		do sb:appendCharacter(10) end
	end
	do
		local longest = 0
		local db = true
		if self.data ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.data)
			do
				n = 0
				while n < m do
					local o = self.data[n + 1]
					if o ~= nil then
						if (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Parameter') ~= nil) then
							local nn = o.name
							if not (nn == nil) then
								local ll = _g.jk.lang.String:getLength(nn)
								if ll > longest then
									longest = ll
								end
							end
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Flag') ~= nil) then
							local ff = o.flag
							if not (ff == nil) then
								local ll = _g.jk.lang.String:getLength(ff) + 1
								if ll > longest then
									longest = ll
								end
							end
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Option') ~= nil) then
							local name = o.name
							local value = o.value
							local ll = 1 + _g.jk.lang.String:getLength(name) + 2 + _g.jk.lang.String:getLength(value) + 1
							if ll > longest then
								longest = ll
							end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if longest < 30 then
			longest = 30
		end
		if self.data ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(self.data)
			do
				n2 = 0
				while n2 < m2 do
					local o = self.data[n2 + 1]
					if o ~= nil then
						if (_vm:get_variable_type(o) == 'string') or (_vm:to_table_with_key(o, '_isType.jk.lang.StringObject') ~= nil) then
							if db == false then
								do sb:appendCharacter(10) end
							end
							do sb:appendString(_g.jk.lang.String:asString(o)) end
							do sb:appendCharacter(58) end
							do sb:appendCharacter(10) end
							do sb:appendCharacter(10) end
							db = true
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Parameter') ~= nil) then
							local p = o
							do sb:appendString("  ") end
							do sb:appendString(_g.jk.text.StringUtil:padToLength(p.name, longest, -1, 32)) end
							if _g.jk.lang.String:isEmpty(p.description) == false then
								do sb:appendString(" - ") end
								do sb:appendString(p.description) end
							end
							do sb:appendCharacter(10) end
							db = false
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Flag') ~= nil) then
							local p = o
							do sb:appendString("  -") end
							do sb:appendString(_g.jk.text.StringUtil:padToLength(p.flag, longest - 1, -1, 32)) end
							if _g.jk.lang.String:isEmpty(p.description) == false then
								do sb:appendString(" - ") end
								do sb:appendString(p.description) end
							end
							do sb:appendCharacter(10) end
							db = false
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Option') ~= nil) then
							local p = o
							do sb:appendString("  ") end
							do sb:appendString(_g.jk.text.StringUtil:padToLength("-" .. _g.jk.lang.String:safeString(p.name) .. "=[" .. _g.jk.lang.String:safeString(p.value) .. "]", longest, -1, 32)) end
							if _g.jk.lang.String:isEmpty(p.description) == false then
								do sb:appendString(" - ") end
								do sb:appendString(p.description) end
							end
							do sb:appendCharacter(10) end
							db = false
						end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function jk.console.UsageInfo:getCommand()
	do return self.command end
end

function jk.console.UsageInfo:setCommand(v)
	self.command = v
	do return self end
end

function jk.console.UsageInfo:getDescription()
	do return self.description end
end

function jk.console.UsageInfo:setDescription(v)
	self.description = v
	do return self end
end

function jk.console.UsageInfo:getParamDesc()
	do return self.paramDesc end
end

function jk.console.UsageInfo:setParamDesc(v)
	self.paramDesc = v
	do return self end
end

jk.console.StdinForSushi = {}
jk.console.StdinForSushi.__index = jk.console.StdinForSushi
_vm:set_metatable(jk.console.StdinForSushi, {})

function jk.console.StdinForSushi._create()
	local v = _vm:set_metatable({}, jk.console.StdinForSushi)
	return v
end

function jk.console.StdinForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.StdinForSushi'
	self['_isType.jk.console.StdinForSushi'] = true
	self['_isType.jk.io.Reader'] = true
end

function jk.console.StdinForSushi:_construct0()
	jk.console.StdinForSushi._init(self)
	return self
end

function jk.console.StdinForSushi:read(buf)
	if buf == nil then
		do return 0 end
	end
	do
		local v = 0
		do v = _io:read_from_handle(0, buf) end
		do return v end
	end
end

jk.console.ArgumentVector = {}
jk.console.ArgumentVector.__index = jk.console.ArgumentVector
_vm:set_metatable(jk.console.ArgumentVector, {})

function jk.console.ArgumentVector._create()
	local v = _vm:set_metatable({}, jk.console.ArgumentVector)
	return v
end

function jk.console.ArgumentVector:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.ArgumentVector'
	self['_isType.jk.console.ArgumentVector'] = true
	self.args = nil
	self.position = 0
	self.optionValue = nil
end

function jk.console.ArgumentVector:_construct0()
	jk.console.ArgumentVector._init(self)
	return self
end

function jk.console.ArgumentVector:forStringVector(args)
	local v = _g.jk.console.ArgumentVector._construct0(_g.jk.console.ArgumentVector._create())
	do v:setArgs(args) end
	do return v end
end

function jk.console.ArgumentVector:forArray(args)
	local v = _g.jk.console.ArgumentVector._construct0(_g.jk.console.ArgumentVector._create())
	local vv = {}
	if args ~= nil then
		local n = 0
		local m = #args
		do
			n = 0
			while n < m do
				local arg = args[n + 1]
				if arg ~= nil then
					do _g.jk.lang.Vector:append(vv, arg) end
				end
				do n = n + 1 end
			end
		end
	end
	do v:setArgs(vv) end
	do return v end
end

function jk.console.ArgumentVector:getCurrent()
	if not (self.args ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Vector:get(self.args, self.position) end
end

function jk.console.ArgumentVector:moveToNext()
	do self.position = self.position + 1 end
end

function jk.console.ArgumentVector:hasMore()
	if not (self.args ~= nil) then
		do return false end
	end
	if self.position < _g.jk.lang.Vector:getSize(self.args) then
		do return true end
	end
	do return false end
end

function jk.console.ArgumentVector:acceptFlag(flag)
	if not (flag ~= nil) then
		do return false end
	end
	do
		local cc = self:getCurrent()
		if not (cc ~= nil) then
			do return false end
		end
		if cc == "-" .. _g.jk.lang.String:safeString(flag) then
			do self:moveToNext() end
			do return true end
		end
		if cc == "--" .. _g.jk.lang.String:safeString(flag) then
			do self:moveToNext() end
			do return true end
		end
		do return false end
	end
end

function jk.console.ArgumentVector:acceptOption(str)
	if not _g.jk.lang.String:isNotEmpty(str) then
		do return false end
	end
	do
		local cc = self:getCurrent()
		if not (cc ~= nil) then
			do return false end
		end
		do
			local f1 = "-" .. _g.jk.lang.String:safeString(str)
			local f2 = "--" .. _g.jk.lang.String:safeString(str)
			if _g.jk.lang.String:startsWith(cc, _g.jk.lang.String:safeString(f1) .. "=", 0) then
				do self:moveToNext() end
				self.optionValue = _g.jk.lang.String:getEndOfString(cc, _g.jk.lang.String:getLength(f1) + 1)
				do return true end
			end
			if _g.jk.lang.String:startsWith(cc, _g.jk.lang.String:safeString(f2) .. "=", 0) then
				do self:moveToNext() end
				self.optionValue = _g.jk.lang.String:getEndOfString(cc, _g.jk.lang.String:getLength(f2) + 1)
				do return true end
			end
			if cc == f1 or cc == f2 then
				do self:moveToNext() end
				self.optionValue = self:getCurrent()
				if not (self.optionValue ~= nil) then
					do self.position = self.position - 1 end
				else
					do self:moveToNext() end
					do return true end
				end
			end
			do return false end
		end
	end
end

function jk.console.ArgumentVector:acceptValue(value)
	if not (value ~= nil) then
		do return false end
	end
	do
		local cc = self:getCurrent()
		if not (cc ~= nil) then
			do return false end
		end
		if cc == value then
			do self:moveToNext() end
			do return true end
		end
		do return false end
	end
end

function jk.console.ArgumentVector:acceptAnyValue()
	local cc = self:getCurrent()
	if not (cc ~= nil) then
		do return nil end
	end
	do self:moveToNext() end
	do return cc end
end

function jk.console.ArgumentVector:acceptParameter()
	local cc = self:getCurrent()
	if not (cc ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:startsWith(cc, "-", 0) then
		do return nil end
	end
	do self:moveToNext() end
	do return cc end
end

function jk.console.ArgumentVector:requireParameter(name)
	local v = self:acceptParameter()
	if not (v ~= nil) then
		do _g.jk.lang.Error:throw("missingValue", name) end
	end
	do return v end
end

function jk.console.ArgumentVector:acceptAllValues()
	local v = {}
	while true do
		local cc = self:acceptAnyValue()
		if cc ~= nil then
			do _g.jk.lang.Vector:append(v, cc) end
		else
			do break end
		end
	end
	do return v end
end

function jk.console.ArgumentVector:getArgs()
	do return self.args end
end

function jk.console.ArgumentVector:setArgs(v)
	self.args = v
	do return self end
end

function jk.console.ArgumentVector:getPosition()
	do return self.position end
end

function jk.console.ArgumentVector:setPosition(v)
	self.position = v
	do return self end
end

function jk.console.ArgumentVector:getOptionValue()
	do return self.optionValue end
end

function jk.console.ArgumentVector:setOptionValue(v)
	self.optionValue = v
	do return self end
end

jk.console.Stdout = {}
jk.console.Stdout.__index = jk.console.Stdout
_vm:set_metatable(jk.console.Stdout, {})

function jk.console.Stdout._create()
	local v = _vm:set_metatable({}, jk.console.Stdout)
	return v
end

function jk.console.Stdout:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.Stdout'
	self['_isType.jk.console.Stdout'] = true
end

function jk.console.Stdout:_construct0()
	jk.console.Stdout._init(self)
	return self
end

function jk.console.Stdout:instance()
	do return _g.jk.console.StdoutForSushi._construct0(_g.jk.console.StdoutForSushi._create()) end
end

jk.console.ConsoleApplicationContext = {}
jk.console.ConsoleApplicationContext.__index = jk.console.ConsoleApplicationContext
_vm:set_metatable(jk.console.ConsoleApplicationContext, {})

function jk.console.ConsoleApplicationContext._create()
	local v = _vm:set_metatable({}, jk.console.ConsoleApplicationContext)
	return v
end

function jk.console.ConsoleApplicationContext:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.ConsoleApplicationContext'
	self['_isType.jk.console.ConsoleApplicationContext'] = true
	self['_isType.jk.app.ApplicationContext'] = true
	self['_isType.jk.log.LoggingContext'] = true
	self.applicationName = nil
	self.enableColor = true
	self.dumbMode = false
	self.showInfo = true
	self.showWarning = true
	self.showError = true
	self.showDebug = false
	self.enableStatus = true
	self.enableOutput = true
	self.autoClearStatus = true
	self.currentPrefix = nil
	self.lastStatus = false
	self.lastStatusLength = 0
	self.errorCounter = 0
	self.warningCounter = 0
	self.infoCounter = 0
	self.debugCounter = 0
	self.stdout = nil
end

function jk.console.ConsoleApplicationContext:forApplicationName(name)
	local v = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	do v:setApplicationName(name) end
	do return v end
end

function jk.console.ConsoleApplicationContext:_construct0()
	jk.console.ConsoleApplicationContext._init(self)
	self.stdout = _g.jk.console.Stdout:instance()
	do
		local term = _g.jk.env.EnvironmentVariable:get("TERM")
		if term == nil or term == "cygwin" then
			self.enableColor = false
		end
		do
			local logColor = _g.jk.env.EnvironmentVariable:get("CONSOLE_LOG_COLOR")
			if logColor ~= nil then
				self.enableColor = _g.jk.lang.Boolean:asBoolean(logColor, false)
			end
			do
				local logDebug = _g.jk.env.EnvironmentVariable:get("CONSOLE_LOG_DEBUG")
				if not (logDebug ~= nil) then
					logDebug = _g.jk.env.EnvironmentVariable:get("CONSOLE_DEBUG")
				end
				if not (logDebug ~= nil) then
					logDebug = _g.jk.env.EnvironmentVariable:get("EQELA_DEBUG")
				end
				if logDebug ~= nil then
					do self:setEnableDebugMessages(_g.jk.lang.Boolean:asBoolean(logDebug, false)) end
				end
			end
		end
	end
	return self
end

function jk.console.ConsoleApplicationContext:isInDebugMode()
	do return self.showDebug end
end

function jk.console.ConsoleApplicationContext:setEnableDebugMessages(v)
	self.showDebug = v
	do return self end
end

function jk.console.ConsoleApplicationContext:useApplicationNameAsPrefix()
	self.currentPrefix = self.applicationName
	if _g.jk.lang.String:isEmpty(self.currentPrefix) then
		self.currentPrefix = _g.jk.process.CurrentProcess:getProcessName()
	end
end

function jk.console.ConsoleApplicationContext:resetCounters()
	self.errorCounter = 0
	self.warningCounter = 0
	self.infoCounter = 0
	self.debugCounter = 0
end

function jk.console.ConsoleApplicationContext:getErrorCount()
	do return self.errorCounter end
end

function jk.console.ConsoleApplicationContext:getWarningCount()
	do return self.warningCounter end
end

function jk.console.ConsoleApplicationContext:getInfoCount()
	do return self.infoCounter end
end

function jk.console.ConsoleApplicationContext:getDebugCount()
	do return self.debugCounter end
end

function jk.console.ConsoleApplicationContext:logError(message)
	if self.showError and self.enableOutput then
		do self:doPrintLine("ERROR", 91, self.currentPrefix, message) end
	end
	do self.errorCounter = self.errorCounter + 1 end
end

function jk.console.ConsoleApplicationContext:logWarning(message)
	if self.showWarning and self.enableOutput then
		do self:doPrintLine("WARNING", 95, self.currentPrefix, message) end
	end
	do self.warningCounter = self.warningCounter + 1 end
end

function jk.console.ConsoleApplicationContext:logInfo(message)
	if self.showInfo and self.enableOutput then
		do self:doPrintLine("INFO", -1, self.currentPrefix, message) end
	end
	do self.infoCounter = self.infoCounter + 1 end
end

function jk.console.ConsoleApplicationContext:logDebug(message)
	if self.showDebug and self.enableOutput then
		do self:doPrintLine("DEBUG", 96, self.currentPrefix, message) end
	end
	do self.debugCounter = self.debugCounter + 1 end
end

function jk.console.ConsoleApplicationContext:logStatus(message)
	if self.enableOutput and self.enableStatus then
		if self.currentPrefix ~= nil and message ~= nil then
			do self:doPrintStatus("[" .. _g.jk.lang.String:safeString(self.currentPrefix) .. "] " .. _g.jk.lang.String:safeString(message)) end
		else
			do self:doPrintStatus(message) end
		end
	end
end

function jk.console.ConsoleApplicationContext:getApplicationDataDirectory()
	do return self:getApplicationDataDirectoryForAppId(self.applicationName) end
end

function jk.console.ConsoleApplicationContext:getApplicationDataDirectoryForAppId(appId)
	local applicationName = appId
	if _g.jk.lang.String:isEmpty(applicationName) then
		applicationName = _g.jk.process.CurrentProcess:getProcessName()
	end
	if _g.jk.lang.String:isEmpty(applicationName) then
		do return nil end
	end
	do
		local v = nil
		if v == nil then
			v = _g.jk.fs.File:forRelativePath("." .. _g.jk.lang.String:safeString(applicationName), _g.jk.env.CommonPath:getHomeDirectory(), false)
		end
		do return v end
	end
end

function jk.console.ConsoleApplicationContext:doPrintLine(type, color, prefix, message)
	if self.autoClearStatus then
		do self:doPrintStatus(nil) end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if self.lastStatus then
			do sb:appendCharacter(10) end
		end
		if type ~= nil or prefix ~= nil then
			do sb:appendCharacter(91) end
			if self.dumbMode == false and self.enableColor and color >= 0 then
				do sb:appendCharacter(27) end
				do sb:appendCharacter(91) end
				do sb:appendInteger(color) end
				do sb:appendCharacter(109) end
			end
			if type ~= nil then
				do sb:appendString(type) end
				if prefix ~= nil then
					do sb:appendCharacter(58) end
				end
			end
			if prefix ~= nil then
				do sb:appendString(prefix) end
			end
			if self.dumbMode == false and self.enableColor and color >= 0 then
				do sb:appendCharacter(27) end
				do sb:appendString("[39m") end
			end
			do sb:appendCharacter(93) end
			do sb:appendCharacter(32) end
		end
		do sb:appendString(message) end
		do sb:appendCharacter(10) end
		if self.stdout ~= nil then
			do self.stdout:print(sb:toString()) end
		end
		self.lastStatus = false
	end
end

function jk.console.ConsoleApplicationContext:doPrintStatus(m)
	if self.showDebug and m ~= nil then
		do self:doPrintLine(nil, -1, nil, m) end
		do return end
	end
	if self.dumbMode then
		if m == nil then
			do return end
		end
		if self.stdout ~= nil then
			do self.stdout:print(_g.jk.lang.String:safeString(m) .. "\n") end
		end
		do return end
	end
	if self.lastStatusLength < 1 and m == nil then
		do return end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendCharacter(13) end
		do
			local n = 0
			while n < self.lastStatusLength do
				do sb:appendCharacter(32) end
				do n = n + 1 end
			end
		end
		do sb:appendCharacter(13) end
		do
			local rm = m
			if rm ~= nil then
				local width = 0
				if width > 0 and _g.jk.lang.String:getLength(rm) >= width then
					rm = _g.jk.lang.String:safeString(_g.jk.lang.String:getSubString(rm, 0, width - 4)) .. " .."
				end
				do sb:appendString(rm) end
			end
			if self.stdout ~= nil then
				do self.stdout:print(sb:toString()) end
			end
			if m ~= nil then
				self.lastStatusLength = _g.jk.lang.String:getLength(rm)
			else
				self.lastStatusLength = 0
			end
			if rm == nil then
				self.lastStatus = false
			else
				self.lastStatus = true
			end
		end
	end
end

function jk.console.ConsoleApplicationContext:getApplicationName()
	do return self.applicationName end
end

function jk.console.ConsoleApplicationContext:setApplicationName(v)
	self.applicationName = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getEnableColor()
	do return self.enableColor end
end

function jk.console.ConsoleApplicationContext:setEnableColor(v)
	self.enableColor = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getDumbMode()
	do return self.dumbMode end
end

function jk.console.ConsoleApplicationContext:setDumbMode(v)
	self.dumbMode = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getShowInfo()
	do return self.showInfo end
end

function jk.console.ConsoleApplicationContext:setShowInfo(v)
	self.showInfo = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getShowWarning()
	do return self.showWarning end
end

function jk.console.ConsoleApplicationContext:setShowWarning(v)
	self.showWarning = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getShowError()
	do return self.showError end
end

function jk.console.ConsoleApplicationContext:setShowError(v)
	self.showError = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getShowDebug()
	do return self.showDebug end
end

function jk.console.ConsoleApplicationContext:setShowDebug(v)
	self.showDebug = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getEnableStatus()
	do return self.enableStatus end
end

function jk.console.ConsoleApplicationContext:setEnableStatus(v)
	self.enableStatus = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getEnableOutput()
	do return self.enableOutput end
end

function jk.console.ConsoleApplicationContext:setEnableOutput(v)
	self.enableOutput = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getAutoClearStatus()
	do return self.autoClearStatus end
end

function jk.console.ConsoleApplicationContext:setAutoClearStatus(v)
	self.autoClearStatus = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getCurrentPrefix()
	do return self.currentPrefix end
end

function jk.console.ConsoleApplicationContext:setCurrentPrefix(v)
	self.currentPrefix = v
	do return self end
end

jk.console.Stdin = {}
jk.console.Stdin.__index = jk.console.Stdin
_vm:set_metatable(jk.console.Stdin, {})

function jk.console.Stdin._create()
	local v = _vm:set_metatable({}, jk.console.Stdin)
	return v
end

function jk.console.Stdin:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.Stdin'
	self['_isType.jk.console.Stdin'] = true
end

function jk.console.Stdin:_construct0()
	jk.console.Stdin._init(self)
	return self
end

function jk.console.Stdin:instance()
	local reader = nil
	reader = _g.jk.console.StdinForSushi._construct0(_g.jk.console.StdinForSushi._create())
	if not (reader ~= nil) then
		do return nil end
	end
	do return _g.jk.io.PrintReader:forReader(reader) end
end
jk = jk or {}

jk.url = jk.url or {}

jk.url.URLEncoder = {}
jk.url.URLEncoder.__index = jk.url.URLEncoder
_vm:set_metatable(jk.url.URLEncoder, {})

function jk.url.URLEncoder._create()
	local v = _vm:set_metatable({}, jk.url.URLEncoder)
	return v
end

function jk.url.URLEncoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.url.URLEncoder'
	self['_isType.jk.url.URLEncoder'] = true
end

function jk.url.URLEncoder:_construct0()
	jk.url.URLEncoder._init(self)
	return self
end

function jk.url.URLEncoder:encode(str, percentOnly, encodeUnreservedChars)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local buffer = _g.jk.lang.String:toUTF8Buffer(str)
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do
			local i = 0
			while i < #buffer do
				local c = _g.jk.lang.Buffer:getByte(buffer, i)
				if c < 1 then
					do break end
				end
				if c >= 97 and c <= 122 or (c >= 65 and c <= 90) or (c >= 48 and c <= 57) then
					do sb:appendCharacter(c) end
				elseif c == 45 or c == 46 or c == 95 or c == 126 and encodeUnreservedChars == false then
					do sb:appendCharacter(c) end
				elseif c == 32 and percentOnly == false then
					do sb:appendCharacter(43) end
				else
					do sb:appendCharacter(37) end
					do sb:appendString(_g.jk.lang.String:forIntegerHex(_vm:bitwise_and(_util:convert_to_integer(c), 255), 0)) end
				end
				do i = i + 1 end
			end
		end
		do return sb:toString() end
	end
end

jk.url.URLDecoder = {}
jk.url.URLDecoder.__index = jk.url.URLDecoder
_vm:set_metatable(jk.url.URLDecoder, {})

function jk.url.URLDecoder._create()
	local v = _vm:set_metatable({}, jk.url.URLDecoder)
	return v
end

function jk.url.URLDecoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.url.URLDecoder'
	self['_isType.jk.url.URLDecoder'] = true
end

function jk.url.URLDecoder:_construct0()
	jk.url.URLDecoder._init(self)
	return self
end

function jk.url.URLDecoder:xcharToInteger(c)
	if c >= 48 and c <= 57 then
		local ci = _util:convert_to_integer(c)
		do return ci - 48 end
	elseif c >= 97 and c <= 102 then
		do return 10 + c - 97 end
	elseif c >= 65 and c <= 70 then
		do return 10 + c - 65 end
	end
	do return 0 end
end

function jk.url.URLDecoder:decode(astr)
	if not (astr ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local str = _g.jk.lang.String:strip(astr)
		local it = _g.jk.lang.String:iterate(str)
		while it ~= nil do
			local x = it:getNextChar()
			if x < 1 then
				do break end
			end
			if x == 37 then
				local x1 = it:getNextChar()
				local x2 = it:getNextChar()
				if x1 > 0 and x2 > 0 then
					do sb:appendCharacter(_g.jk.url.URLDecoder:xcharToInteger(x1) * 16 + _g.jk.url.URLDecoder:xcharToInteger(x2)) end
				else
					do break end
				end
			elseif x == 43 then
				do sb:appendCharacter(32) end
			else
				do sb:appendCharacter(x) end
			end
		end
		do return sb:toString() end
	end
end

jk.url.QueryString = {}
jk.url.QueryString.__index = jk.url.QueryString
_vm:set_metatable(jk.url.QueryString, {})

function jk.url.QueryString._create()
	local v = _vm:set_metatable({}, jk.url.QueryString)
	return v
end

function jk.url.QueryString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.url.QueryString'
	self['_isType.jk.url.QueryString'] = true
end

function jk.url.QueryString:_construct0()
	jk.url.QueryString._init(self)
	return self
end

function jk.url.QueryString:parse(queryString)
	local v = {}
	if _g.jk.lang.String:isEmpty(queryString) then
		do return v end
	end
	do
		local array = _g.jk.lang.String:split(queryString, 38, 0)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local qs = array[n + 1]
					if qs ~= nil then
						if _g.jk.lang.String:isEmpty(qs) then
							goto _continue1
						end
						if _g.jk.lang.String:getIndexOfCharacter(qs, 61, 0) < 0 then
							do _g.jk.lang.Map:set(v, qs, nil) end
							goto _continue1
						end
						do
							local qsps = _g.jk.lang.String:split(qs, 61, 2)
							local key = qsps[0 + 1]
							local val = qsps[1 + 1]
							if val == nil then
								val = ""
							end
							if _g.jk.lang.String:isEmpty(key) == false then
								do _g.jk.lang.Map:set(v, _g.jk.url.URLDecoder:decode(key), _g.jk.url.URLDecoder:decode(val)) end
							end
						end
					end
					::_continue1::
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function jk.url.QueryString:encode(queryString)
	local str = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local first = true
	local keys = _g.jk.lang.Map:getKeys(queryString)
	if keys ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(keys)
		do
			n = 0
			while n < m do
				local key = keys[n + 1]
				if key ~= nil then
					if _g.jk.lang.String:isEmpty(key) then
						goto _continue2
					end
					do
						local val = _g.jk.lang.Map:getValue(queryString, key)
						if not first then
							do str:appendString("&") end
						end
						do str:appendString(_g.jk.url.URLEncoder:encode(key, false, true)) end
						do str:appendCharacter(61) end
						do str:appendString(_g.jk.url.URLEncoder:encode(val, false, true)) end
						first = false
					end
				end
				::_continue2::
				do n = n + 1 end
			end
		end
	end
	do return str:toString() end
end

jk.url.URL = {}
jk.url.URL.__index = jk.url.URL
_vm:set_metatable(jk.url.URL, {})

function jk.url.URL._create()
	local v = _vm:set_metatable({}, jk.url.URL)
	return v
end

function jk.url.URL:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.url.URL'
	self['_isType.jk.url.URL'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.scheme = nil
	self.username = nil
	self.password = nil
	self.host = nil
	self.port = nil
	self.path = nil
	self.fragment = nil
	self.rawQueryParameters = nil
	self.queryParameters = nil
	self.original = nil
	self.percentOnly = false
	self.encodeUnreservedChars = true
end

function jk.url.URL:_construct0()
	jk.url.URL._init(self)
	return self
end

function jk.url.URL:forString(str, normalizePath)
	local v = _g.jk.url.URL._construct0(_g.jk.url.URL._create())
	do v:parse(str, normalizePath) end
	do return v end
end

function jk.url.URL:dup()
	local v = _g.jk.url.URL._construct0(_g.jk.url.URL._create())
	do v:setScheme(self.scheme) end
	do v:setUsername(self.username) end
	do v:setPassword(self.password) end
	do v:setHost(self.host) end
	do v:setPort(self.port) end
	do v:setPath(self.path) end
	do v:setFragment(self.fragment) end
	if self.rawQueryParameters ~= nil then
		do v:setRawQueryParameters(self.rawQueryParameters:dup()) end
	end
	if self.queryParameters ~= nil then
		do v:setQueryParameters(_g.jk.lang.Map:dup(self.queryParameters)) end
	end
	do return v end
end

function jk.url.URL:toString()
	do return self:toStringDo(true) end
end

function jk.url.URL:toStringNohost()
	do return self:toStringDo(false) end
end

function jk.url.URL:toStringDo(userhost)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if userhost then
		if self.scheme ~= nil then
			do sb:appendString(self.scheme) end
			do sb:appendString("://") end
		end
		if self.username ~= nil then
			do sb:appendString(_g.jk.url.URLEncoder:encode(self.username, false, true)) end
			if self.password ~= nil then
				do sb:appendCharacter(58) end
				do sb:appendString(_g.jk.url.URLEncoder:encode(self.password, false, true)) end
			end
			do sb:appendCharacter(64) end
		end
		if self.host ~= nil then
			do sb:appendString(self.host) end
			if self.port ~= nil then
				do sb:appendCharacter(58) end
				do sb:appendString(self.port) end
			end
		end
	end
	if self.path ~= nil then
		do sb:appendString(_g.jk.lang.String:replaceCharacter(self.path, 32, 43)) end
	end
	if self.rawQueryParameters ~= nil and self.rawQueryParameters:count() > 0 then
		local first = true
		local it = _g.jk.lang.Map:iterateKeys(self.queryParameters)
		while it ~= nil do
			local key = (function(o)
				if (_vm:get_variable_type(o) == 'string') then
					do return o end
				end
				do return nil end
			end)(it:next())
			if key == nil then
				do break end
			end
			if first then
				do sb:appendCharacter(63) end
				first = false
			else
				do sb:appendCharacter(38) end
			end
			do sb:appendString(key) end
			do
				local val = _g.jk.lang.Map:get(self.queryParameters, key)
				if val ~= nil then
					do sb:appendCharacter(61) end
					do sb:appendString(_g.jk.url.URLEncoder:encode(val, self.percentOnly, self.encodeUnreservedChars)) end
				end
			end
		end
	end
	if self.fragment ~= nil then
		do sb:appendCharacter(35) end
		do sb:appendString(self.fragment) end
	end
	do return sb:toString() end
end

function jk.url.URL:clearQueryParameters()
	self.rawQueryParameters = nil
	self.queryParameters = nil
end

function jk.url.URL:normalizePath(path)
	if not (path ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local comps = _g.jk.lang.String:split(path, 47, 0)
		if comps ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(comps)
			do
				n = 0
				while n < m do
					local comp = comps[n + 1]
					if comp ~= nil then
						if _g.jk.lang.String:isEmpty(comp) then
						elseif comp == "." then
						elseif comp == ".." then
							local str = v:toString()
							do v:clear() end
							if str ~= nil then
								local slash = _g.jk.lang.String:getLastIndexOfCharacter(str, 47, -1)
								if slash > 0 then
									do v:appendString(_g.jk.lang.String:getSubString(str, 0, slash)) end
								end
							end
						else
							do v:appendCharacter(47) end
							do v:appendString(comp) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if v:count() < 2 then
			do return "/" end
		end
		if _g.jk.lang.String:endsWith(path, "/") then
			do v:appendCharacter(47) end
		end
		do return v:toString() end
	end
end

function jk.url.URL:parse(astr, doNormalizePath)
	do self:setOriginal(astr) end
	if not (astr ~= nil) then
		do return end
	end
	do
		local fsp = _g.jk.lang.String:split(astr, 35, 2)
		local str = _g.jk.lang.Vector:get(fsp, 0)
		self.fragment = _g.jk.lang.Vector:get(fsp, 1)
		do
			local qsplit = _g.jk.lang.String:split(str, 63, 2)
			str = _g.jk.lang.Vector:get(qsplit, 0)
			do
				local queryString = _g.jk.lang.Vector:get(qsplit, 1)
				if _g.jk.lang.String:isEmpty(queryString) == false then
					local qss = _g.jk.lang.String:split(queryString, 38, 0)
					if qss ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(qss)
						do
							n = 0
							while n < m do
								local qs = qss[n + 1]
								if qs ~= nil then
									if not (self.rawQueryParameters ~= nil) then
										self.rawQueryParameters = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
									end
									if not (self.queryParameters ~= nil) then
										self.queryParameters = {}
									end
									if _g.jk.lang.String:getIndexOfCharacter(qs, 61, 0) < 0 then
										do _g.jk.lang.Map:set(self.queryParameters, qs, nil) end
										do self.rawQueryParameters:add(qs, nil) end
										goto _continue3
									end
									do
										local qsps = _g.jk.lang.String:split(qs, 61, 2)
										local key = _g.jk.lang.Vector:get(qsps, 0)
										local val = _g.jk.lang.Vector:get(qsps, 1)
										if _g.jk.lang.String:isEmpty(key) == false then
											if not (val ~= nil) then
												val = ""
											end
											do
												local udv = _g.jk.url.URLDecoder:decode(val)
												do _g.jk.lang.Map:set(self.queryParameters, key, udv) end
												do self.rawQueryParameters:add(key, udv) end
											end
										end
									end
								end
								::_continue3::
								do n = n + 1 end
							end
						end
					end
				end
				do
					local css = _g.jk.lang.String:getIndexOfString(str, "://", 0)
					if css >= 0 then
						self.scheme = _g.jk.lang.String:getSubString(str, 0, css)
						if _g.jk.lang.String:getIndexOfCharacter(self.scheme, 58, 0) >= 0 or _g.jk.lang.String:getIndexOfCharacter(self.scheme, 47, 0) >= 0 then
							self.scheme = nil
						else
							str = _g.jk.lang.String:getEndOfString(str, css + 3)
						end
					end
					do
						local pp = nil
						if _g.jk.lang.String:getChar(str, 0) == 47 then
							pp = str
						else
							if _g.jk.lang.String:getIndexOfCharacter(str, 47, 0) >= 0 then
								local sssplit = _g.jk.lang.String:split(str, 47, 2)
								str = _g.jk.lang.Vector:get(sssplit, 0)
								pp = _g.jk.lang.Vector:get(sssplit, 1)
								if not (pp ~= nil) then
									pp = ""
								end
								if _g.jk.lang.String:getChar(pp, 0) ~= 47 then
									pp = _g.jk.lang.String:appendString("/", pp)
								end
							end
							if _g.jk.lang.String:getIndexOfCharacter(str, 64, 0) >= 0 then
								local asplit = _g.jk.lang.String:split(str, 64, 2)
								local auth = _g.jk.lang.Vector:get(asplit, 0)
								str = _g.jk.lang.Vector:get(asplit, 1)
								if _g.jk.lang.String:getIndexOfCharacter(auth, 58, 0) >= 0 then
									local acsplit = _g.jk.lang.String:split(auth, 58, 2)
									self.username = _g.jk.url.URLDecoder:decode(_g.jk.lang.Vector:get(acsplit, 0))
									self.password = _g.jk.url.URLDecoder:decode(_g.jk.lang.Vector:get(acsplit, 1))
								else
									self.username = auth
								end
							end
							if _g.jk.lang.String:getIndexOfCharacter(str, 58, 0) >= 0 then
								local hcsplit = _g.jk.lang.String:split(str, 58, 2)
								str = _g.jk.lang.Vector:get(hcsplit, 0)
								self.port = _g.jk.lang.Vector:get(hcsplit, 1)
							end
							self.host = str
						end
						if doNormalizePath then
							self.path = self:normalizePath(pp)
						else
							self.path = pp
						end
						if not (self.port ~= nil) and _g.jk.lang.String:equals("https", self.scheme) or _g.jk.lang.String:equals("wss", self.scheme) then
							self.port = "443"
						end
					end
				end
			end
		end
	end
end

function jk.url.URL:getPortInt()
	if not (self.port ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.String:toInteger(self.port) end
end

function jk.url.URL:getQueryParameter(key)
	if not (self.queryParameters ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.queryParameters, key) end
end

function jk.url.URL:addQueryParameter(key, value)
	if not (self.rawQueryParameters ~= nil) then
		self.rawQueryParameters = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	end
	if not (self.queryParameters ~= nil) then
		self.queryParameters = {}
	end
	do _g.jk.lang.Map:set(self.queryParameters, key, value) end
	do self.rawQueryParameters:add(key, value) end
end

function jk.url.URL:getScheme()
	do return self.scheme end
end

function jk.url.URL:setScheme(v)
	self.scheme = v
	do return self end
end

function jk.url.URL:getUsername()
	do return self.username end
end

function jk.url.URL:setUsername(v)
	self.username = v
	do return self end
end

function jk.url.URL:getPassword()
	do return self.password end
end

function jk.url.URL:setPassword(v)
	self.password = v
	do return self end
end

function jk.url.URL:getHost()
	do return self.host end
end

function jk.url.URL:setHost(v)
	self.host = v
	do return self end
end

function jk.url.URL:getPort()
	do return self.port end
end

function jk.url.URL:setPort(v)
	self.port = v
	do return self end
end

function jk.url.URL:getPath()
	do return self.path end
end

function jk.url.URL:setPath(v)
	self.path = v
	do return self end
end

function jk.url.URL:getFragment()
	do return self.fragment end
end

function jk.url.URL:setFragment(v)
	self.fragment = v
	do return self end
end

function jk.url.URL:getRawQueryParameters()
	do return self.rawQueryParameters end
end

function jk.url.URL:setRawQueryParameters(v)
	self.rawQueryParameters = v
	do return self end
end

function jk.url.URL:getQueryParameters()
	do return self.queryParameters end
end

function jk.url.URL:setQueryParameters(v)
	self.queryParameters = v
	do return self end
end

function jk.url.URL:getOriginal()
	do return self.original end
end

function jk.url.URL:setOriginal(v)
	self.original = v
	do return self end
end

function jk.url.URL:getPercentOnly()
	do return self.percentOnly end
end

function jk.url.URL:setPercentOnly(v)
	self.percentOnly = v
	do return self end
end

function jk.url.URL:getEncodeUnreservedChars()
	do return self.encodeUnreservedChars end
end

function jk.url.URL:setEncodeUnreservedChars(v)
	self.encodeUnreservedChars = v
	do return self end
end
jk = jk or {}

jk.http = jk.http or {}

jk.http.server = jk.http.server or {}

jk.http.server.cookie = jk.http.server.cookie or {}

jk.http.server.cookie.HTTPServerCookie = {}
jk.http.server.cookie.HTTPServerCookie.__index = jk.http.server.cookie.HTTPServerCookie
_vm:set_metatable(jk.http.server.cookie.HTTPServerCookie, {})

function jk.http.server.cookie.HTTPServerCookie._create()
	local v = _vm:set_metatable({}, jk.http.server.cookie.HTTPServerCookie)
	return v
end

function jk.http.server.cookie.HTTPServerCookie:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.cookie.HTTPServerCookie'
	self['_isType.jk.http.server.cookie.HTTPServerCookie'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.key = nil
	self.value = nil
	self.maxAge = -1
	self.path = nil
	self.domain = nil
end

function jk.http.server.cookie.HTTPServerCookie:_construct0()
	jk.http.server.cookie.HTTPServerCookie._init(self)
	return self
end

function jk.http.server.cookie.HTTPServerCookie:_construct2(key, value)
	jk.http.server.cookie.HTTPServerCookie._init(self)
	self.key = key
	self.value = value
	return self
end

function jk.http.server.cookie.HTTPServerCookie:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(self.key) end
	do sb:appendCharacter(61) end
	do sb:appendString(self.value) end
	if self.maxAge >= 0 then
		do sb:appendString("; Max-Age=") end
		do sb:appendString(_g.jk.lang.String:forInteger(self.maxAge)) end
	end
	if _g.jk.lang.String:isEmpty(self.path) == false then
		do sb:appendString("; Path=") end
		do sb:appendString(self.path) end
	end
	if _g.jk.lang.String:isEmpty(self.domain) == false then
		do sb:appendString("; Domain=") end
		do sb:appendString(self.domain) end
	end
	do return sb:toString() end
end

function jk.http.server.cookie.HTTPServerCookie:getKey()
	do return self.key end
end

function jk.http.server.cookie.HTTPServerCookie:setKey(v)
	self.key = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getValue()
	do return self.value end
end

function jk.http.server.cookie.HTTPServerCookie:setValue(v)
	self.value = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getMaxAge()
	do return self.maxAge end
end

function jk.http.server.cookie.HTTPServerCookie:setMaxAge(v)
	self.maxAge = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getPath()
	do return self.path end
end

function jk.http.server.cookie.HTTPServerCookie:setPath(v)
	self.path = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getDomain()
	do return self.domain end
end

function jk.http.server.cookie.HTTPServerCookie:setDomain(v)
	self.domain = v
	do return self end
end
jk = jk or {}

jk.mime = jk.mime or {}

jk.mime.MimeTypeRegistry = {}
jk.mime.MimeTypeRegistry.__index = jk.mime.MimeTypeRegistry
_vm:set_metatable(jk.mime.MimeTypeRegistry, {})

jk.mime.MimeTypeRegistry.sharedInstance = nil

function jk.mime.MimeTypeRegistry._create()
	local v = _vm:set_metatable({}, jk.mime.MimeTypeRegistry)
	return v
end

function jk.mime.MimeTypeRegistry:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mime.MimeTypeRegistry'
	self['_isType.jk.mime.MimeTypeRegistry'] = true
	self.htMime = nil
	self.htExt = nil
end

function jk.mime.MimeTypeRegistry:getSharedInstance()
	if not (_g.jk.mime.MimeTypeRegistry.sharedInstance ~= nil) then
		_g.jk.mime.MimeTypeRegistry.sharedInstance = _g.jk.mime.MimeTypeRegistry._construct0(_g.jk.mime.MimeTypeRegistry._create())
	end
	do return _g.jk.mime.MimeTypeRegistry.sharedInstance end
end

function jk.mime.MimeTypeRegistry:_construct0()
	jk.mime.MimeTypeRegistry._init(self)
	self.htMime = {}
	self.htExt = {}
	do self:addBuiltinTypes() end
	return self
end

function jk.mime.MimeTypeRegistry:addBuiltinTypes()
	do self:add("*.cpp", "text/x-c++src") end
	do self:add("*.ogm", "video/x-ogm+ogg") end
	do self:add("*.epsf", "image/x-eps") end
	do self:add("*.mpeg", "video/mpeg") end
	do self:add("*.rmj", "application/vnd.rn-realmedia") end
	do self:add("*.nes", "application/x-nes-rom") end
	do self:add("*.rmm", "application/vnd.rn-realmedia") end
	do self:add("*.gb", "application/x-gameboy-rom") end
	do self:add("*.qtvr", "video/quicktime") end
	do self:add("*.ogv", "video/ogg") end
	do self:add("*.amr", "audio/AMR") end
	do self:add("*.ogx", "application/ogg") end
	do self:add("*.rms", "application/vnd.rn-realmedia") end
	do self:add("*.gf", "application/x-tex-gf") end
	do self:add("*.gg", "application/x-sms-rom") end
	do self:add("*.xslt", "application/xml") end
	do self:add("*.Z", "application/x-compress") end
	do self:add("*.mdb", "application/vnd.ms-access") end
	do self:add("*.rmx", "application/vnd.rn-realmedia") end
	do self:add("*.anim[1-9j]", "video/x-anim") end
	do self:add("*.gp", "application/x-gnuplot") end
	do self:add("*.a", "application/x-archive") end
	do self:add("*.a", "application/x-shared-library-la") end
	do self:add("*.mdi", "image/vnd.ms-modi") end
	do self:add("*.c", "text/x-csrc") end
	do self:add("*.gv", "text/vnd.graphviz") end
	do self:add("*.m3u8", "audio/x-mpegurl") end
	do self:add("*.e", "text/x-eiffel") end
	do self:add("*.pict1", "image/x-pict") end
	do self:add("*.pict2", "image/x-pict") end
	do self:add("*.spd", "application/x-font-speedo") end
	do self:add("*.spc", "application/x-pkcs7-certificates") end
	do self:add("*.gz", "application/x-gzip") end
	do self:add("*.dtd", "application/xml-dtd") end
	do self:add("*.dvi.gz", "application/x-gzdvi") end
	do self:add("*.h", "text/x-chdr") end
	do self:add("*.o", "application/x-object") end
	do self:add("*.spl", "application/x-shockwave-flash") end
	do self:add("*.etheme", "application/x-e-theme") end
	do self:add("*.d", "text/x-dsrc") end
	do self:add("*.sr2", "image/x-sony-sr2") end
	do self:add("*.t", "text/troff") end
	do self:add("*.hh", "text/x-c++hdr") end
	do self:add("*.m", "text/x-objcsrc") end
	do self:add("*.m", "text/x-matlab") end
	do self:add("*.ps.bz2", "application/x-bzpostscript") end
	do self:add("*.anx", "application/annodex") end
	do self:add("*.crt", "application/x-x509-ca-cert") end
	do self:add("*.med", "audio/x-mod") end
	do self:add("*.crw", "image/x-canon-crw") end
	do self:add("*.spx", "audio/ogg") end
	do self:add("*.spx", "audio/x-speex") end
	do self:add("*.xliff", "application/x-xliff") end
	do self:add("*.ani", "application/x-navi-animation") end
	do self:add("*.hp", "text/x-c++hdr") end
	do self:add("*.vhdl", "text/x-vhdl") end
	do self:add("*.f", "text/x-fortran") end
	do self:add("*.hs", "text/x-haskell") end
	do self:add("*.epub", "application/epub+zip") end
	do self:add("*.kar", "audio/midi") end
	do self:add("*.mpga", "audio/mpeg") end
	do self:add("*.dtx", "text/x-tex") end
	do self:add("*.pptx", "application/vnd.openxmlformats-officedocument.presentationml.presentation") end
	do self:add("*.dsl", "text/x-dsl") end
	do self:add("*.csh", "application/x-csh") end
	do self:add("*.nfo", "text/x-nfo") end
	do self:add("*.pkr", "application/pgp-keys") end
	do self:add("*.epsi.bz2", "image/x-bzeps") end
	do self:add("*.spec", "text/x-rpm-spec") end
	do self:add("*.f90", "text/x-fortran") end
	do self:add("*.sql", "text/x-sql") end
	do self:add("*.css", "text/css") end
	do self:add("*.f95", "text/x-fortran") end
	do self:add("*.csv", "text/csv") end
	do self:add("*.epsi", "image/x-eps") end
	do self:add("*.tsv", "text/tab-separated-values") end
	do self:add("*.pla", "audio/x-iriver-pla") end
	do self:add("*.it", "audio/x-it") end
	do self:add("*.ape", "audio/x-ape") end
	do self:add("*.src", "application/x-wais-source") end
	do self:add("*.tta", "audio/x-tta") end
	do self:add("*.ttc", "application/x-font-ttf") end
	do self:add("*.srf", "image/x-sony-srf") end
	do self:add("*.pln", "application/x-planperfect") end
	do self:add("*.ttf", "application/x-font-ttf") end
	do self:add("*.exe", "application/x-ms-dos-executable") end
	do self:add("*.abw.gz", "application/x-abiword") end
	do self:add("*.chrt", "application/x-kchart") end
	do self:add("*.dvi", "application/x-dvi") end
	do self:add("*.rpm", "application/x-rpm") end
	do self:add("*.epsf.gz", "image/x-gzeps") end
	do self:add("*.pls", "audio/x-scpls") end
	do self:add("*.gcrd", "text/directory") end
	do self:add("*.t2t", "text/x-txt2tags") end
	do self:add("*.srt", "application/x-subrip") end
	do self:add("*.exr", "image/x-exr") end
	do self:add("*.pntg", "image/x-macpaint") end
	do self:add("*.ttx", "application/x-font-ttx") end
	do self:add("*.jad", "text/vnd.sun.j2me.app-descriptor") end
	do self:add("*.js", "application/javascript") end
	do self:add("*.latex", "text/x-tex") end
	do self:add("*.jar", "application/x-java-archive") end
	do self:add("*.ssa", "text/x-ssa") end
	do self:add("*.xspf", "application/xspf+xml") end
	do self:add("*.mgp", "application/x-magicpoint") end
	do self:add("*.movie", "video/x-sgi-movie") end
	do self:add("*.cue", "application/x-cue") end
	do self:add("*.html", "text/html") end
	do self:add("*.smaf", "application/x-smaf") end
	do self:add("*.zabw", "application/x-abiword") end
	do self:add("*.dwg", "image/vnd.dwg") end
	do self:add("authors", "text/x-authors") end
	do self:add("*.msod", "image/x-msod") end
	do self:add("*.xslfo", "text/x-xslfo") end
	do self:add("*.mrml", "text/x-mrml") end
	do self:add("*.kdc", "image/x-kodak-kdc") end
	do self:add("*.cur", "image/x-win-bitmap") end
	do self:add("*.gnucash", "application/x-gnucash") end
	do self:add("*.pkipath", "application/pkix-pkipath") end
	do self:add("*.p", "text/x-pascal") end
	do self:add("*.patch", "text/x-patch") end
	do self:add("*.old", "application/x-trash") end
	do self:add("*.m4", "application/x-m4") end
	do self:add("*.mbox", "application/mbox") end
	do self:add("*.png", "image/png") end
	do self:add("*.stc", "application/vnd.sun.xml.calc.template") end
	do self:add("*.std", "application/vnd.sun.xml.draw.template") end
	do self:add("*.arj", "application/x-arj") end
	do self:add("*.pnm", "image/x-portable-anymap") end
	do self:add("*.dxf", "image/vnd.dxf") end
	do self:add("*.sti", "application/vnd.sun.xml.impress.template") end
	do self:add("*.gplt", "application/x-gnuplot") end
	do self:add("*.la", "application/x-shared-library-la") end
	do self:add("*.stm", "audio/x-stm") end
	do self:add("*.pcf.gz", "application/x-font-pcf") end
	do self:add("*.kexic", "application/x-kexi-connectiondata") end
	do self:add("*.arw", "image/x-sony-arw") end
	do self:add("*.mid", "audio/midi") end
	do self:add("*.stw", "application/vnd.sun.xml.writer.template") end
	do self:add("*.mif", "application/x-mif") end
	do self:add("*.sty", "text/x-tex") end
	do self:add("*.hpgl", "application/vnd.hp-hpgl") end
	do self:add("*.asc", "application/pgp-encrypted") end
	do self:add("*.asc", "application/pgp-keys") end
	do self:add("*.asc", "text/plain") end
	do self:add("*.sub", "text/x-microdvd") end
	do self:add("*.sub", "text/x-mpsub") end
	do self:add("*.sub", "text/x-subviewer") end
	do self:add("*.ly", "text/x-lilypond") end
	do self:add("*.lz", "application/x-lzip") end
	do self:add("*.kexis", "application/x-kexiproject-shortcut") end
	do self:add("*.asf", "video/x-ms-asf") end
	do self:add("*.wmls", "text/vnd.wap.wmlscript") end
	do self:add("*.s3m", "audio/x-s3m") end
	do self:add("*.por", "application/x-spss-por") end
	do self:add("*.asp", "application/x-asp") end
	do self:add("*.aspx", "application/x-asp") end
	do self:add("*.ashx", "application/x-asp") end
	do self:add("*.pot", "application/vnd.ms-powerpoint") end
	do self:add("*.pot", "text/x-gettext-translation-template") end
	do self:add("*.sun", "image/x-sun-raster") end
	do self:add("*.ass", "text/x-ssa") end
	do self:add("*.rss", "application/rss+xml") end
	do self:add("*.lha", "application/x-lha") end
	do self:add("*.md", "application/x-genesis-rom") end
	do self:add("*.me", "text/x-troff-me") end
	do self:add("*.sami", "application/x-sami") end
	do self:add("*.asx", "audio/x-ms-asx") end
	do self:add("*.mm", "text/x-troff-mm") end
	do self:add("*.mo", "application/x-gettext-translation") end
	do self:add("CMakeLists.txt", "text/x-cmake") end
	do self:add("*.ml", "text/x-ocaml") end
	do self:add("*.ms", "text/x-troff-ms") end
	do self:add("*.kfo", "application/x-kformula") end
	do self:add("*.rtf", "application/rtf") end
	do self:add("*.lhs", "text/x-literate-haskell") end
	do self:add("*.svg", "image/svg+xml") end
	do self:add("*.ppm", "image/x-portable-pixmap") end
	do self:add("*.nb", "application/mathematica") end
	do self:add("*.lhz", "application/x-lhz") end
	do self:add("*.pps", "application/vnd.ms-powerpoint") end
	do self:add("*.ppt", "application/vnd.ms-powerpoint") end
	do self:add("*.nc", "application/x-netcdf") end
	do self:add("*.icb", "image/x-tga") end
	do self:add("*.ica", "application/x-ica") end
	do self:add("*.mka", "audio/x-matroska") end
	do self:add("*.ppz", "application/vnd.ms-powerpoint") end
	do self:add("*.txt", "text/plain") end
	do self:add("*.rtx", "text/richtext") end
	do self:add("*.gedcom", "application/x-gedcom") end
	do self:add("*.cxx", "text/x-c++src") end
	do self:add("*.ico", "image/vnd.microsoft.icon") end
	do self:add("*.metalink", "application/metalink+xml") end
	do self:add("*.txz", "application/x-xz-compressed-tar") end
	do self:add("*.ics", "text/calendar") end
	do self:add("*.p10", "application/pkcs10") end
	do self:add("gnumakefile", "text/x-makefile") end
	do self:add("*.p12", "application/x-pkcs12") end
	do self:add("*.swf", "application/x-shockwave-flash") end
	do self:add("*.mkv", "video/x-matroska") end
	do self:add("*.idl", "text/x-idl") end
	do self:add("*.prc", "application/x-palm-database") end
	do self:add("*.mli", "text/x-ocaml") end
	do self:add("*.tar.lzo", "application/x-tzo") end
	do self:add("*.sxc", "application/vnd.sun.xml.calc") end
	do self:add("*.sxd", "application/vnd.sun.xml.draw") end
	do self:add("*.cert", "application/x-x509-ca-cert") end
	do self:add("*.avi", "video/x-msvideo") end
	do self:add("*.sxg", "application/vnd.sun.xml.writer.global") end
	do self:add("*.qtl", "application/x-quicktime-media-link") end
	do self:add("*.sxi", "application/vnd.sun.xml.impress") end
	do self:add("*.xac", "application/x-gnucash") end
	do self:add("*.djvu", "image/vnd.djvu") end
	do self:add("*.sxm", "application/vnd.sun.xml.math") end
	do self:add("winmail.dat", "application/vnd.ms-tnef") end
	do self:add("*.bz2", "application/x-bzip") end
	do self:add("*.ief", "image/ief") end
	do self:add("*.tzo", "application/x-tzo") end
	do self:add("*.pk", "application/x-tex-pk") end
	do self:add("*.pl", "application/x-perl") end
	do self:add("*.rvx", "video/vnd.rn-realvideo") end
	do self:add("*.sxw", "application/vnd.sun.xml.writer") end
	do self:add("*.php4", "application/x-php") end
	do self:add("*.mmf", "application/x-smaf") end
	do self:add("*.BLEND", "application/x-blender") end
	do self:add("*.kil", "application/x-killustrator") end
	do self:add("*.pm", "application/x-perl") end
	do self:add("*.ps", "application/postscript") end
	do self:add("*.awb", "audio/AMR-WB") end
	do self:add("*.psf", "application/x-font-linux-psf") end
	do self:add("*.psf", "audio/x-psf") end
	do self:add("*.pw", "application/x-pw") end
	do self:add("*.aifc", "audio/x-aiff") end
	do self:add("*.mml", "text/mathml") end
	do self:add("*.psd", "image/vnd.adobe.photoshop") end
	do self:add("*.mo3", "audio/x-mo3") end
	do self:add("*.aiff", "audio/x-aiff") end
	do self:add("*.gba", "application/x-gba-rom") end
	do self:add("*.awk", "application/x-awk") end
	do self:add("*.not", "text/x-mup") end
	do self:add("changelog", "text/x-changelog") end
	do self:add("*.sv4cpio", "application/x-sv4cpio") end
	do self:add("*%", "application/x-trash") end
	do self:add("*.po", "text/x-gettext-translation") end
	do self:add("*.hdf", "application/x-hdf") end
	do self:add("*.psw", "application/x-pocket-word") end
	do self:add("*.tar.bz", "application/x-bzip-compressed-tar") end
	do self:add("*.php3", "application/x-php") end
	do self:add("*.desktop", "application/x-desktop") end
	do self:add("*.fb2", "application/x-fictionbook+xml") end
	do self:add("*.wb1", "application/x-quattropro") end
	do self:add("*.wb2", "application/x-quattropro") end
	do self:add("*.ora", "image/openraster") end
	do self:add("*.wb3", "application/x-quattropro") end
	do self:add("*.iff", "image/x-iff") end
	do self:add("*.mp+", "audio/x-musepack") end
	do self:add("*.axa", "audio/annodex") end
	do self:add("*.orf", "image/x-olympus-orf") end
	do self:add("*.xbm", "image/x-xbitmap") end
	do self:add("copying", "text/x-copying") end
	do self:add("*.mp2", "audio/mp2") end
	do self:add("*.mp2", "video/mpeg") end
	do self:add("*.mp3", "audio/mpeg") end
	do self:add("*.mp4", "video/mp4") end
	do self:add("*.py", "text/x-python") end
	do self:add("*.kino", "application/smil") end
	do self:add("*.ra", "audio/vnd.rn-realaudio") end
	do self:add("*.rb", "application/x-ruby") end
	do self:add("*.icns", "image/x-icns") end
	do self:add("*.qt", "video/quicktime") end
	do self:add("*.xcf", "image/x-xcf") end
	do self:add("*.mng", "video/x-mng") end
	do self:add("*.xbl", "application/xml") end
	do self:add("*.axv", "video/annodex") end
	do self:add("*.cpio", "application/x-cpio") end
	do self:add("*.rm", "application/vnd.rn-realmedia") end
	do self:add("*.mod", "audio/x-mod") end
	do self:add("*.sv4crc", "application/x-sv4crc") end
	do self:add("*.rp", "image/vnd.rn-realpix") end
	do self:add("*.mof", "text/x-mof") end
	do self:add("*.wav", "audio/x-wav") end
	do self:add("*.rt", "text/vnd.rn-realtext") end
	do self:add("*.wax", "audio/x-ms-asx") end
	do self:add("*.rv", "video/vnd.rn-realvideo") end
	do self:add("*.moc", "text/x-moc") end
	do self:add("*.siag", "application/x-siag") end
	do self:add("*.pack", "application/x-java-pack200") end
	do self:add("*.gnumeric", "application/x-gnumeric") end
	do self:add("*.tnef", "application/vnd.ms-tnef") end
	do self:add("*.tpic", "image/x-tga") end
	do self:add("*.mov", "video/quicktime") end
	do self:add("*.smil", "application/smil") end
	do self:add("*.sh", "application/x-shellscript") end
	do self:add("*.divx", "video/x-msvideo") end
	do self:add("*.sk", "image/x-skencil") end
	do self:add("*.moov", "video/quicktime") end
	do self:add("*.mpc", "audio/x-musepack") end
	do self:add("*.so", "application/x-sharedlib") end
	do self:add("*.mpe", "video/mpeg") end
	do self:add("*.otc", "application/vnd.oasis.opendocument.chart-template") end
	do self:add("*.midi", "audio/midi") end
	do self:add("*.otf", "application/vnd.oasis.opendocument.formula-template") end
	do self:add("*.otf", "application/x-font-otf") end
	do self:add("*.otg", "application/vnd.oasis.opendocument.graphics-template") end
	do self:add("*.oth", "application/vnd.oasis.opendocument.text-web") end
	do self:add("*.mpg", "video/mpeg") end
	do self:add("*.mpp", "audio/x-musepack") end
	do self:add("*.otp", "application/vnd.oasis.opendocument.presentation-template") end
	do self:add("*~", "application/x-trash") end
	do self:add("*.ged", "application/x-gedcom") end
	do self:add("*.ots", "application/vnd.oasis.opendocument.spreadsheet-template") end
	do self:add("*.ott", "application/vnd.oasis.opendocument.text-template") end
	do self:add("*.tar.lzma", "application/x-lzma-compressed-tar") end
	do self:add("*.docm", "application/vnd.openxmlformats-officedocument.wordprocessingml.document") end
	do self:add("makefile", "text/x-makefile") end
	do self:add("*.wcm", "application/vnd.ms-works") end
	do self:add("*.tk", "text/x-tcl") end
	do self:add("*.gen", "application/x-genesis-rom") end
	do self:add("*.docx", "application/vnd.openxmlformats-officedocument.wordprocessingml.document") end
	do self:add("*.log", "text/x-log") end
	do self:add("*.nsc", "application/x-netshow-channel") end
	do self:add("*.egon", "application/x-egon") end
	do self:add("*.tr", "text/troff") end
	do self:add("*.zip", "application/zip") end
	do self:add("*.kml", "application/vnd.google-earth.kml+xml") end
	do self:add("*.iptables", "text/x-iptables") end
	do self:add("*.m15", "audio/x-mod") end
	do self:add("*.wdb", "application/vnd.ms-works") end
	do self:add("*.kmz", "application/vnd.google-earth.kmz") end
	do self:add("*.shar", "application/x-shar") end
	do self:add("*.nsv", "video/x-nsv") end
	do self:add("*.texinfo", "text/x-texinfo") end
	do self:add("*.so.[0-9].*", "application/x-sharedlib") end
	do self:add("*.ui", "application/x-designer") end
	do self:add("*.ilbm", "image/x-ilbm") end
	do self:add("*.3ds", "image/x-3ds") end
	do self:add("*.vbs", "application/x-vbscript") end
	do self:add("*.mrl", "text/x-mrml") end
	do self:add("*.vcf", "text/directory") end
	do self:add("*.mrw", "image/x-minolta-mrw") end
	do self:add("*.jpeg", "image/jpeg") end
	do self:add("*.3g2", "video/3gpp") end
	do self:add("*.dar", "application/x-dar") end
	do self:add("*.tar.gz", "application/x-compressed-tar") end
	do self:add("*.p7b", "application/x-pkcs7-certificates") end
	do self:add("*.lzma", "application/x-lzma") end
	do self:add("*.vct", "text/directory") end
	do self:add("*.vcs", "text/calendar") end
	do self:add("*.msi", "application/x-msi") end
	do self:add("*.msi", "application/x-ms-win-installer") end
	do self:add("*.psid", "audio/prs.sid") end
	do self:add("*.kon", "application/x-kontour") end
	do self:add("*.blender", "application/x-blender") end
	do self:add("*.pyc", "application/x-python-bytecode") end
	do self:add("*.owl", "application/rdf+xml") end
	do self:add("*.vda", "image/x-tga") end
	do self:add("*.dbf", "application/x-dbf") end
	do self:add("*.p7s", "application/pkcs7-signature") end
	do self:add("*.pyo", "application/x-python-bytecode") end
	do self:add("*.msx", "application/x-msx-rom") end
	do self:add("*.epsf.bz2", "image/x-bzeps") end
	do self:add("*.cb7", "application/x-cb7") end
	do self:add("*.jng", "image/x-jng") end
	do self:add("*.texi", "text/x-texinfo") end
	do self:add("*.so.[0-9]", "application/x-sharedlib") end
	do self:add("*.wp", "application/vnd.wordperfect") end
	do self:add("*.kpm", "application/x-kpovmodeler") end
	do self:add("*.jp2", "image/jp2") end
	do self:add("*.wv", "audio/x-wavpack") end
	do self:add("*.cab", "application/vnd.ms-cab-compressed") end
	do self:add("*.kpr", "application/x-kpresenter") end
	do self:add("*.3ga", "video/3gpp") end
	do self:add("*.kpt", "application/x-kpresenter") end
	do self:add("*.n64", "application/x-n64-rom") end
	do self:add("*.mtm", "audio/x-mod") end
	do self:add("*.m2t", "video/mpeg") end
	do self:add("*.glade", "application/x-glade") end
	do self:add("*.oxt", "application/vnd.openofficeorg.extension") end
	do self:add("*.iso9660", "application/x-cd-image") end
	do self:add("*.gif", "image/gif") end
	do self:add("*.dcm", "application/dicom") end
	do self:add("*.ime", "text/x-iMelody") end
	do self:add("*.h++", "text/x-c++hdr") end
	do self:add("*.3gp", "video/3gpp") end
	do self:add("*.tar", "application/x-tar") end
	do self:add("*.dcr", "image/x-kodak-dcr") end
	do self:add("*.xi", "audio/x-xi") end
	do self:add("*.xm", "audio/x-xm") end
	do self:add("*.dcl", "text/x-dcl") end
	do self:add("*.3gpp", "video/3gpp") end
	do self:add("*.kdelnk", "application/x-desktop") end
	do self:add("*.vivo", "video/vivo") end
	do self:add("*.xz", "application/x-xz") end
	do self:add("*.imy", "text/x-iMelody") end
	do self:add("*.m3u", "audio/x-mpegurl") end
	do self:add("*.mup", "text/x-mup") end
	do self:add("*.kra", "application/x-krita") end
	do self:add("*.cbr", "application/x-cbr") end
	do self:add("*.m4b", "audio/x-m4b") end
	do self:add("*.cbt", "application/x-cbt") end
	do self:add("*.cpio.gz", "application/x-cpio-compressed") end
	do self:add("*.m4a", "audio/mp4") end
	do self:add("*.dds", "image/x-dds") end
	do self:add("*.jpe", "image/jpeg") end
	do self:add("*.jpg", "image/jpeg") end
	do self:add("*.cbz", "application/x-cbz") end
	do self:add("*.jpc", "image/jp2") end
	do self:add("*.tbz", "application/x-bzip-compressed-tar") end
	do self:add("*.eps.bz2", "image/x-bzeps") end
	do self:add("*.jpf", "image/jp2") end
	do self:add("*.k25", "image/x-kodak-k25") end
	do self:add("*.jpr", "application/x-jbuilder-project") end
	do self:add("*.7z", "application/x-7z-compressed") end
	do self:add("*.ins", "text/x-tex") end
	do self:add("*.deb", "application/x-deb") end
	do self:add("*.ini", "text/plain") end
	do self:add("*.psf.gz", "application/x-gz-font-linux-psf") end
	do self:add("*.jpx", "application/x-jbuilder-project") end
	do self:add("*.jpx", "image/jp2") end
	do self:add("*.m4v", "video/mp4") end
	do self:add("*.bak", "application/x-trash") end
	do self:add("*.rmvb", "application/vnd.rn-realmedia") end
	do self:add("gmon.out", "application/x-profile") end
	do self:add("*.perl", "application/x-perl") end
	do self:add("*.sam", "application/x-amipro") end
	do self:add("*.fig", "image/x-xfig") end
	do self:add("*.bcpio", "application/x-bcpio") end
	do self:add("*.gtar", "application/x-tar") end
	do self:add("*.ltx", "text/x-tex") end
	do self:add("*.lua", "text/x-lua") end
	do self:add("*.der", "application/x-x509-ca-cert") end
	do self:add("*.sav", "application/x-spss-sav") end
	do self:add("*.wk1", "application/vnd.lotus-1-2-3") end
	do self:add("*.tcl", "text/x-tcl") end
	do self:add("*.wk3", "application/vnd.lotus-1-2-3") end
	do self:add("*.wk4", "application/vnd.lotus-1-2-3") end
	do self:add("*.zoo", "application/x-zoo") end
	do self:add("*.xcf.gz", "image/x-compressed-xcf") end
	do self:add("*.qtif", "image/x-quicktime") end
	do self:add("*.oleo", "application/x-oleo") end
	do self:add("*.ksp", "application/x-kspread") end
	do self:add("*.ps.gz", "application/x-gzpostscript") end
	do self:add("*.opml", "text/x-opml+xml") end
	do self:add("*.cdf", "application/x-netcdf") end
	do self:add("*.vhd", "text/x-vhdl") end
	do self:add("*.xla", "application/vnd.ms-excel") end
	do self:add("*.inf", "text/plain") end
	do self:add("*.xlc", "application/vnd.ms-excel") end
	do self:add("*.xld", "application/vnd.ms-excel") end
	do self:add("*.xlf", "application/x-xliff") end
	do self:add("*.cdr", "application/vnd.corel-draw") end
	do self:add("*.xll", "application/vnd.ms-excel") end
	do self:add("*.xlm", "application/vnd.ms-excel") end
	do self:add("*.602", "application/x-t602") end
	do self:add("*.mxf", "application/mxf") end
	do self:add("*.xls", "application/vnd.ms-excel") end
	do self:add("*.xlt", "application/vnd.ms-excel") end
	do self:add("*.aac", "audio/mp4") end
	do self:add("*.xlsm", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") end
	do self:add("*.xlw", "application/vnd.ms-excel") end
	do self:add("*.docbook", "application/docbook+xml") end
	do self:add("*.raf", "image/x-fuji-raf") end
	do self:add("*.fits", "image/fits") end
	do self:add("*.epsi.gz", "image/x-gzeps") end
	do self:add("*.xlsx", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") end
	do self:add("*.rdfs", "application/rdf+xml") end
	do self:add("*.ram", "application/ram") end
	do self:add("*.eif", "text/x-eiffel") end
	do self:add("*.scm", "text/x-scheme") end
	do self:add("*.ac3", "audio/ac3") end
	do self:add("*.rar", "application/x-rar") end
	do self:add("*.xmf", "audio/x-xmf") end
	do self:add("*.ras", "image/x-cmu-raster") end
	do self:add("*.cer", "application/x-x509-ca-cert") end
	do self:add("*.ldif", "text/x-ldif") end
	do self:add("*.kud", "application/x-kugar") end
	do self:add("*.rax", "audio/vnd.rn-realaudio") end
	do self:add("*.xml", "application/xml") end
	do self:add("*.gmo", "application/x-gettext-translation") end
	do self:add("*.xmi", "text/x-xmi") end
	do self:add("*.CSSL", "text/css") end
	do self:add("*.wks", "application/vnd.lotus-1-2-3") end
	do self:add("*.wks", "application/vnd.ms-works") end
	do self:add("*.tbz2", "application/x-bzip-compressed-tar") end
	do self:add("*.tex", "text/x-tex") end
	do self:add("*.raw", "image/x-panasonic-raw") end
	do self:add("*.sda", "application/vnd.stardivision.draw") end
	do self:add("*.sdc", "application/vnd.stardivision.calc") end
	do self:add("*.sdd", "application/vnd.stardivision.impress") end
	do self:add("*.bdf", "application/x-font-bdf") end
	do self:add("*.lwo", "image/x-lwo") end
	do self:add("*.lws", "image/x-lws") end
	do self:add("*.minipsf", "audio/x-minipsf") end
	do self:add("*.flc", "video/x-flic") end
	do self:add("*.gnc", "application/x-gnucash") end
	do self:add("*.gnd", "application/gnunet-directory") end
	do self:add("*.theme", "application/x-theme") end
	do self:add("*.sdp", "application/vnd.stardivision.impress") end
	do self:add("*.sdp", "application/sdp") end
	do self:add("*.fli", "video/x-flic") end
	do self:add("install", "text/x-install") end
	do self:add("*.sds", "application/vnd.stardivision.chart") end
	do self:add("*.abw", "application/x-abiword") end
	do self:add("*.j2k", "image/jp2") end
	do self:add("core", "application/x-core") end
	do self:add("*.sdw", "application/vnd.stardivision.writer") end
	do self:add("*.viv", "video/vivo") end
	do self:add("*.pdf.gz", "application/x-gzpdf") end
	do self:add("*.hpp", "text/x-c++hdr") end
	do self:add("*.flv", "video/x-flv") end
	do self:add("*.tiff", "image/tiff") end
	do self:add("*.flw", "application/x-kivio") end
	do self:add("*.ace", "application/x-ace") end
	do self:add("*.dvi.bz2", "application/x-bzdvi") end
	do self:add("*.dia", "application/x-dia-diagram") end
	do self:add("*.pcf.Z", "application/x-font-pcf") end
	do self:add("*.gnuplot", "application/x-gnuplot") end
	do self:add("*.wma", "audio/x-ms-wma") end
	do self:add("*.tga", "image/x-tga") end
	do self:add("*.cgm", "image/cgm") end
	do self:add("*.wmf", "image/x-wmf") end
	do self:add("*.torrent", "application/x-bittorrent") end
	do self:add("*.uil", "text/x-uil") end
	do self:add("*.vala", "text/x-vala") end
	do self:add("*.lwob", "image/x-lwo") end
	do self:add("*.kwd", "application/x-kword") end
	do self:add("*.wml", "text/vnd.wap.wml") end
	do self:add("*.iso", "application/x-cd-image") end
	do self:add("*.tgz", "application/x-compressed-tar") end
	do self:add("*.adb", "text/x-adasrc") end
	do self:add("*.wmv", "video/x-ms-wmv") end
	do self:add("*.wmx", "audio/x-ms-asx") end
	do self:add("*.rdf", "application/rdf+xml") end
	do self:add("*.kwt", "application/x-kword") end
	do self:add("*.vlc", "audio/x-mpegurl") end
	do self:add("*.lyx", "application/x-lyx") end
	do self:add("*.pdf.bz2", "application/x-bzpdf") end
	do self:add("*.chm", "application/x-chm") end
	do self:add("*.ufraw", "application/x-ufraw") end
	do self:add("*.gpg", "application/pgp-encrypted") end
	do self:add("*.ads", "text/x-adasrc") end
	do self:add("*.tar.Z", "application/x-tarz") end
	do self:add("*.xpm", "image/x-xpixmap") end
	do self:add("*.djv", "image/vnd.djvu") end
	do self:add("*.wp4", "application/vnd.wordperfect") end
	do self:add("*.wp5", "application/vnd.wordperfect") end
	do self:add("*.wp6", "application/vnd.wordperfect") end
	do self:add("*.xps", "application/vnd.ms-xpsdocument") end
	do self:add("*.lzh", "application/x-lha") end
	do self:add("*.lzo", "application/x-lzop") end
	do self:add("*.pak", "application/x-pak") end
	do self:add("*.sgf", "application/x-go-sgf") end
	do self:add("*.sylk", "text/spreadsheet") end
	do self:add("*.tif", "image/tiff") end
	do self:add("*.par2", "application/x-par2") end
	do self:add("*.sgi", "image/x-sgi") end
	do self:add("*.rej", "application/x-reject") end
	do self:add("*.sgl", "application/vnd.stardivision.writer") end
	do self:add("*.sgm", "text/sgml") end
	do self:add("*.xcf.bz2", "image/x-compressed-xcf") end
	do self:add("*.reg", "text/x-ms-regedit") end
	do self:add("*.pas", "text/x-pascal") end
	do self:add("*.emf", "image/x-emf") end
	do self:add("*.emp", "application/vnd.emusic-emusic_package") end
	do self:add("*.for", "text/x-fortran") end
	do self:add("*.pbm", "image/x-portable-bitmap") end
	do self:add("*.xbel", "application/x-xbel") end
	do self:add("*.gra", "application/x-graphite") end
	do self:add("*.afm", "application/x-font-afm") end
	do self:add("*.wpd", "application/vnd.wordperfect") end
	do self:add("*.shn", "application/x-shorten") end
	do self:add("*.wpg", "application/x-wpg") end
	do self:add("*.svgz", "image/svg+xml-compressed") end
	do self:add("*.cmake", "text/x-cmake") end
	do self:add("*.tar.bz2", "application/x-bzip-compressed-tar") end
	do self:add("*.wpl", "application/vnd.ms-wpl") end
	do self:add("*.dll", "application/x-sharedlib") end
	do self:add("*.ult", "audio/x-mod") end
	do self:add("*.wpp", "application/vnd.wordperfect") end
	do self:add("*.ent", "application/xml-external-parsed-entity") end
	do self:add("*.wps", "application/vnd.ms-works") end
	do self:add("*.669", "audio/x-mod") end
	do self:add("*.jnlp", "application/x-java-jnlp-file") end
	do self:add("*.pcf", "application/x-font-pcf") end
	do self:add("*.pcf", "application/x-cisco-vpn-settings") end
	do self:add("*.pcd", "image/x-photo-cd") end
	do self:add("*.bib", "text/x-bibtex") end
	do self:add("*.rgb", "image/x-rgb") end
	do self:add("*.sid", "audio/prs.sid") end
	do self:add("*.pcl", "application/vnd.hp-pcl") end
	do self:add("*.c++", "text/x-c++src") end
	do self:add("*.htm", "text/html") end
	do self:add("*.voc", "audio/x-voc") end
	do self:add("*.sik", "application/x-trash") end
	do self:add("*.vapi", "text/x-vala") end
	do self:add("*.bin", "application/octet-stream") end
	do self:add("*.vob", "video/mpeg") end
	do self:add("*.gsf", "application/x-font-type1") end
	do self:add("*.sk1", "image/x-skencil") end
	do self:add("*.ag", "image/x-applix-graphics") end
	do self:add("*.ai", "application/illustrator") end
	do self:add("*.sis", "application/vnd.symbian.install") end
	do self:add("*.sit", "application/x-stuffit") end
	do self:add("*.al", "application/x-perl") end
	do self:add("*.gsm", "audio/x-gsm") end
	do self:add("*.siv", "application/sieve") end
	do self:add("*.vor", "application/vnd.stardivision.writer") end
	do self:add("*.xsl", "application/xml") end
	do self:add("*.diff", "text/x-patch") end
	do self:add("*.pdb", "application/x-aportisdoc") end
	do self:add("*.pdb", "application/x-palm-database") end
	do self:add("*.pdc", "application/x-aportisdoc") end
	do self:add("*.as", "application/x-applix-spreadsheet") end
	do self:add("*.au", "audio/basic") end
	do self:add("*.pdf", "application/pdf") end
	do self:add("*.aw", "application/x-applix-word") end
	do self:add("*.obj", "application/x-tgif") end
	do self:add("*.sgml", "text/sgml") end
	do self:add("*.pcx", "image/x-pcx") end
	do self:add("*.dng", "image/x-adobe-dng") end
	do self:add("*.uni", "audio/x-mod") end
	do self:add("*.wbmp", "image/vnd.wap.wbmp") end
	do self:add("*.wri", "application/x-mswrite") end
	do self:add("*.java", "text/x-java") end
	do self:add("*.wrl", "model/vrml") end
	do self:add("*.flac", "audio/x-flac") end
	do self:add("*.cls", "text/x-tex") end
	do self:add("*.eps", "image/x-eps") end
	do self:add("*.kexi", "application/x-kexiproject-sqlite2") end
	do self:add("*.kexi", "application/x-kexiproject-sqlite3") end
	do self:add("*.tlz", "application/x-lzma-compressed-tar") end
	do self:add("*.pef", "image/x-pentax-pef") end
	do self:add("*.aif", "audio/x-aiff") end
	do self:add("*.ocl", "text/x-ocl") end
	do self:add("*.class", "application/x-java") end
	do self:add("*.doc", "application/msword") end
	do self:add("*.pem", "application/x-x509-ca-cert") end
	do self:add("*.bz", "application/x-bzip") end
	do self:add("makefile", "text/x-makefile") end
	do self:add("*.x3f", "image/x-sigma-x3f") end
	do self:add("*.cc", "text/x-c++src") end
	do self:add("*.skr", "application/pgp-keys") end
	do self:add("*.xul", "application/vnd.mozilla.xul+xml") end
	do self:add("*.xul", "application/vnd.mozilla.xul+xml") end
	do self:add("*.dot", "application/msword-template") end
	do self:add("*.dot", "text/vnd.graphviz") end
	do self:add("*.oda", "application/oda") end
	do self:add("*.odb", "application/vnd.oasis.opendocument.database") end
	do self:add("*.odc", "application/vnd.oasis.opendocument.chart") end
	do self:add("*.pict", "image/x-pict") end
	do self:add("*.pfb", "application/x-font-type1") end
	do self:add("*.odf", "application/vnd.oasis.opendocument.formula") end
	do self:add("*.odg", "application/vnd.oasis.opendocument.graphics") end
	do self:add("*.karbon", "application/x-karbon") end
	do self:add("*.odi", "application/vnd.oasis.opendocument.image") end
	do self:add("*.hwp", "application/x-hwp") end
	do self:add("*.xhtml", "application/xhtml+xml") end
	do self:add("*.odm", "application/vnd.oasis.opendocument.text-master") end
	do self:add("*.hwt", "application/x-hwt") end
	do self:add("credits", "text/x-credits") end
	do self:add("*.odp", "application/vnd.oasis.opendocument.presentation") end
	do self:add("*.tnf", "application/vnd.ms-tnef") end
	do self:add("*.pfa", "application/x-font-type1") end
	do self:add("*.ods", "application/vnd.oasis.opendocument.spreadsheet") end
	do self:add("*.odt", "application/vnd.oasis.opendocument.text") end
	do self:add("*.dc", "application/x-dc-rom") end
	do self:add("*.slk", "text/spreadsheet") end
	do self:add("*.erl", "text/x-erlang") end
	do self:add("*.pfx", "application/x-pkcs12") end
	do self:add("*.mab", "application/x-markaby") end
	do self:add("*.sisx", "x-epoc/x-sisx-app") end
	do self:add("*.ustar", "application/x-ustar") end
	do self:add("*.gvp", "text/x-google-video-pointer") end
	do self:add("*.dv", "video/dv") end
	do self:add("*.man", "application/x-troff-man") end
	do self:add("*.qif", "application/x-qw") end
	do self:add("*.qif", "image/x-quicktime") end
	do self:add("*.smd", "application/vnd.stardivision.mail") end
	do self:add("*.toc", "application/x-cdrdao-toc") end
	do self:add("*.smf", "application/vnd.stardivision.math") end
	do self:add("*.pgm", "image/x-portable-graymap") end
	do self:add("*.pgn", "application/x-chess-pgn") end
	do self:add("*.smi", "application/smil") end
	do self:add("*.smi", "application/x-sami") end
	do self:add("*.pgp", "application/pgp-encrypted") end
	do self:add("*.cs", "text/x-csharp") end
	do self:add("*.cs", "text/x-csharp") end
	do self:add("*.sml", "application/smil") end
	do self:add("*.smc", "application/x-snes-rom") end
	do self:add("*.xwd", "image/x-xwindowdump") end
	do self:add("*.bmp", "image/bmp") end
	do self:add("*.blend", "application/x-blender") end
	do self:add("*.com", "application/x-ms-dos-executable") end
	do self:add("*.atom", "application/atom+xml") end
	do self:add("*.sms", "application/x-sms-rom") end
	do self:add("*.el", "text/x-emacs-lisp") end
	do self:add("*.hxx", "text/x-c++hdr") end
	do self:add("*.g3", "image/fax-g3") end
	do self:add("*.vst", "image/x-tga") end
	do self:add("*.es", "application/ecmascript") end
	do self:add("*.PAR2", "application/x-par2") end
	do self:add("*.eps.gz", "image/x-gzeps") end
	do self:add("*.rle", "image/rle") end
	do self:add("*.snd", "audio/basic") end
	do self:add("*.ez", "application/andrew-inset") end
	do self:add("*.psflib", "audio/x-psflib") end
	do self:add("*.nds", "application/x-nintendo-ds-rom") end
	do self:add("*.php", "application/x-php") end
	do self:add("*.wvc", "audio/x-wavpack-correction") end
	do self:add("*.123", "application/vnd.lotus-1-2-3") end
	do self:add("*.uri", "text/x-uri") end
	do self:add("*.url", "text/x-uri") end
	do self:add("*.abw.CRASHED", "application/x-abiword") end
	do self:add("*.cr2", "image/x-canon-cr2") end
	do self:add("*.tar.xz", "application/x-xz-compressed-tar") end
	do self:add("*.roff", "text/troff") end
	do self:add("*.fl", "application/x-fluid") end
	do self:add("*.alz", "application/x-alz") end
	do self:add("*.oga", "audio/ogg") end
	do self:add("*.wvp", "audio/x-wavpack") end
	do self:add("*.nef", "image/x-nikon-nef") end
	do self:add("*,v", "text/plain") end
	do self:add("*.C", "text/x-c++src") end
	do self:add("*.themepack", "application/x-windows-themepack") end
	do self:add("*.ogg", "audio/ogg") end
	do self:add("*.ogg", "audio/x-vorbis+ogg") end
	do self:add("*.ogg", "audio/x-flac+ogg") end
	do self:add("*.ogg", "audio/x-speex+ogg") end
	do self:add("*.ogg", "video/x-theora+ogg") end
	do self:add("*.wvx", "audio/x-ms-asx") end
	do self:add("*.fo", "text/x-xslfo") end
	do self:add("*.etx", "text/x-setext") end
	do self:add("*.pptm", "application/vnd.openxmlformats-officedocument.presentationml.presentation") end
	do self:add("readme", "text/x-readme") end
	do self:add("todo", "text/x-todo") end
	do self:add("license", "text/x-license") end
	do self:add("*.version", "text/x-version") end
	do self:add("Makefile.*", "text/x-makefile") end
	do self:add("*.dmg", "application/x-apple-diskimage") end
	do self:add("*.swp", "application/x-igelle-software-package") end
	do self:add("*.squashfs", "application/x-igelle-diskimage-squashfs") end
	do self:add("*.img", "application/x-igelle-diskimage") end
	do self:add("*.eq", "text/x-eqela-src") end
	do self:add("*.equity", "text/x-eqela-equity-src") end
	do self:add("*.eqic", "text/x-eqela-eqic-config") end
	do self:add("*.config", "text/x-config") end
	do self:add("*.eqlib", "application/x-eqela-library") end
	do self:add("*.eqlibx", "application/x-eqela-library-encrypted") end
	do self:add("*.apk", "application/vnd.android.package-archive") end
	do self:add("*.eo", "application/x-eqela-object") end
	do self:add("*.eo1", "application/x-eqela-object-level-1") end
	do self:add("*.eo2", "application/x-eqela-object-level-2") end
	do self:add("*.eo3", "application/x-eqela-object-level-3") end
	do self:add("*.eo4", "application/x-eqela-object-level-4") end
	do self:add("*.eo5", "application/x-eqela-object-level-5") end
	do self:add("*.iga", "application/x-igelle-archive") end
	do self:add("*.ipa", "application/octet-stream") end
	do self:add("*.xap", "application/x-silverlight-app") end
	do self:add("*.webapp", "application/x-web-app-manifest+json") end
	do self:add("*.json", "application/json") end
	do self:add("*.properties", "application/properties") end
	do self:add(".classpath", "application/xml") end
	do self:add(".project", "application/xml") end
	do self:add("*.bat", "application/x-msdos-program") end
	do self:add("*.yml", "text/yaml") end
	do self:add("*.yaml", "text/yaml") end
	do self:add("*.scss", "text/x-scss") end
	do self:add("*.gradle", "application/x-gradle") end
	do self:add("manifest.mf", "application/x-manifest") end
	do self:add("*.vm", "application/x-velocity") end
	do self:add("*.jade", "application/x-jade") end
	do self:add("*.xsd", "application/xml") end
	do self:add("*.eot", "application/vnd.ms-fontobject") end
	do self:add("*.woff", "application/x-font-woff") end
	do self:add("*.woff2", "application/x-font-woff") end
	do self:add("*.svf", "application/x-font-svf") end
	do self:add("*.fnt", "application/x-font-fnt") end
	do self:add("*.wsdl", "application/wsdl+xml") end
	do self:add("*.jsx", "application/javascript") end
	do self:add("*.ts", "application/x-typescript") end
	do self:add("*.tsx", "application/x-typescript") end
	do self:add("*.jks", "application/x-jks") end
	do self:add("*.jsp", "application/x-jsp") end
	do self:add("*.pom", "application/x-maven-pom") end
	do self:add(".gitignore", "application/x-gitignore") end
	do self:add("org.eclipse.jdt.core.prefs", "application/x-eclipse-prefs") end
	do self:add("org.eclipse.buildship.core.prefs", "application/x-eclipse-prefs") end
	do self:add("*.vsd", "application/vnd.visio") end
	do self:add(".editorconfig", "application/x-editorconfig") end
	do self:add(".htaccess", "application/x-htaccess") end
	do self:add("*.mxml", "application/xml") end
	do self:add("*.tld", "application/xml") end
	do self:add("*.csproj", "application/csproj+xml") end
	do self:add("*.sln", "application/x-sln") end
	do self:add("*.elm", "application/x-elm") end
	do self:add("*.scala", "application/x-scala") end
	do self:add("dockerfile", "application/x-docker-dockerfile") end
	do self:add("gemfile", "application/x-gem-gemfile") end
	do self:add("*.sbt", "application/x-scala-sbt") end
end

function jk.mime.MimeTypeRegistry:getTypeForExtension(ext)
	if not (ext ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.htMime, _g.jk.lang.String:toLowerCase(ext)) end
end

function jk.mime.MimeTypeRegistry:getTypeForFile(f)
	if not (f ~= nil) then
		do return "application/unknown" end
	end
	do return self:getMimeType(f:getBasename()) end
end

function jk.mime.MimeTypeRegistry:getMimeType(str)
	local v = nil
	if str ~= nil then
		local mime = nil
		local ld = _g.jk.lang.String:getLastIndexOfCharacter(str, 46, -1)
		if ld >= 0 then
			mime = _g.jk.lang.String:getEndOfString(str, ld + 1)
		end
		v = _g.jk.lang.Map:get(self.htMime, _g.jk.lang.String:toLowerCase(mime))
		if _g.jk.lang.String:isEmpty(v) then
			v = _g.jk.lang.Map:get(self.htMime, _g.jk.lang.String:toLowerCase(str))
		end
	end
	if _g.jk.lang.String:isEmpty(v) then
		v = "application/unknown"
	end
	do return v end
end

function jk.mime.MimeTypeRegistry:getExtension(mimeType)
	do return _g.jk.lang.Map:get(self.htExt, mimeType) end
end

function jk.mime.MimeTypeRegistry:add(pattern, mimeType)
	local v = false
	if pattern == nil or mimeType == nil then
	elseif _g.jk.lang.String:startsWith(pattern, ".", 0) == true then
		local key = _g.jk.lang.String:getSubString(pattern, 1, _g.jk.lang.String:getLength(pattern) - 1)
		do _g.jk.lang.Map:set(self.htMime, key, mimeType) end
		do _g.jk.lang.Map:set(self.htExt, mimeType, key) end
		v = true
	elseif _g.jk.lang.String:startsWith(pattern, "*.", 0) == true then
		local key = _g.jk.lang.String:getSubString(pattern, 2, _g.jk.lang.String:getLength(pattern) - 2)
		do _g.jk.lang.Map:set(self.htMime, key, mimeType) end
		do _g.jk.lang.Map:set(self.htExt, mimeType, key) end
		v = true
	elseif _g.jk.lang.String:startsWith(pattern, "#", 0) == true then
	else
		do _g.jk.lang.Map:set(self.htMime, pattern, mimeType) end
		do _g.jk.lang.Map:set(self.htExt, mimeType, pattern) end
		v = true
	end
	do return v end
end

function jk.mime.MimeTypeRegistry:read(file)
	if not (file ~= nil) then
		do return false end
	end
	do
		local buf = _g.jk.io.PrintReader:forReader(file:read())
		if not (buf ~= nil) then
			do return false end
		end
		do
			local n = 0
			while true do
				local line = buf:readLine()
				if not (line ~= nil) then
					do break end
				end
				do
					local va = _g.jk.lang.String:split(line, 58, 0)
					local val = _g.jk.lang.Vector:iterate(va)
					if val ~= nil then
						local front = val:next()
						local back = val:next()
						if front ~= nil then
							front = _g.jk.lang.String:strip(front)
						end
						if back ~= nil then
							back = _g.jk.lang.String:strip(back)
						end
						if self:add(front, back) then
							do n = n + 1 end
						end
					end
				end
			end
			do return true end
		end
	end
end
jk = jk or {}

jk.base64 = jk.base64 or {}

jk.base64.Base64Decoder = {}
jk.base64.Base64Decoder.__index = jk.base64.Base64Decoder
_vm:set_metatable(jk.base64.Base64Decoder, {})

function jk.base64.Base64Decoder._create()
	local v = _vm:set_metatable({}, jk.base64.Base64Decoder)
	return v
end

function jk.base64.Base64Decoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.base64.Base64Decoder'
	self['_isType.jk.base64.Base64Decoder'] = true
end

function jk.base64.Base64Decoder:_construct0()
	jk.base64.Base64Decoder._init(self)
	return self
end

function jk.base64.Base64Decoder:fromUrlSafeFormat(str)
	local v = str
	if not (v ~= nil) then
		do return nil end
	end
	v = _g.jk.lang.String:replaceCharacter(v, 45, 43)
	v = _g.jk.lang.String:replaceCharacter(v, 95, 47)
	do
		local mod = _util:convert_to_integer(_g.jk.lang.String:getLength(v) % 4)
		if mod == 1 then
			v = _g.jk.lang.String:safeString(v) .. "==="
		elseif mod == 2 then
			v = _g.jk.lang.String:safeString(v) .. "=="
		elseif mod == 3 then
			v = _g.jk.lang.String:safeString(v) .. "="
		end
		do return v end
	end
end

function jk.base64.Base64Decoder:appendByte(buffer, byte)
	local nbyte = _g.jk.lang.Buffer:allocate(1)
	do _g.jk.lang.Buffer:setByte(nbyte, 0, byte) end
	do return _g.jk.lang.Buffer:append(buffer, nbyte, _g.jk.lang.Buffer:getSize(nbyte)) end
end

function jk.base64.Base64Decoder:fromLookupChar(ascii)
	local c = 0
	if ascii == 43 then
		c = 62
	elseif ascii == 47 then
		c = 63
	elseif ascii >= 48 and ascii <= 57 then
		c = ascii + 4
	elseif ascii >= 65 and ascii <= 90 then
		c = ascii - 65
	elseif ascii >= 97 and ascii <= 122 then
		c = ascii - 71
	end
	do return c end
end

function jk.base64.Base64Decoder:decode(text)
	if not (text ~= nil) then
		do return nil end
	end
	do
		local data = _util:allocate_buffer(0)
		local iter = _g.jk.lang.String:iterate(text)
		if iter ~= nil then
			local ch = 0
			while (function()
				ch = iter:getNextChar()
				do return ch end
			end)() > 0 do
				local c1 = 0
				local c2 = 0
				local c3 = 0
				local c4 = 0
				local byte1 = 0
				local byte2 = 0
				local byte3 = 0
				c1 = _g.jk.base64.Base64Decoder:fromLookupChar(ch)
				c2 = _g.jk.base64.Base64Decoder:fromLookupChar((function()
					ch = iter:getNextChar()
					do return ch end
				end)())
				byte1 = _vm:bitwise_left_shift(c1, 2) + _vm:bitwise_right_shift(c2, 4)
				data = _g.jk.base64.Base64Decoder:appendByte(data, byte1)
				ch = iter:getNextChar()
				if ch == 61 then
					do break end
				else
					c3 = _g.jk.base64.Base64Decoder:fromLookupChar(ch)
				end
				byte2 = _vm:bitwise_left_shift(_vm:bitwise_and(c2, 15), 4) + _vm:bitwise_right_shift(c3, 2)
				data = _g.jk.base64.Base64Decoder:appendByte(data, byte2)
				ch = iter:getNextChar()
				if ch == 61 then
					do break end
				else
					c4 = _g.jk.base64.Base64Decoder:fromLookupChar(ch)
				end
				byte3 = _vm:bitwise_left_shift(_vm:bitwise_and(c3, 3), 6) + c4
				data = _g.jk.base64.Base64Decoder:appendByte(data, byte3)
			end
		end
		do return data end
	end
end

jk.base64.Base64Encoder = {}
jk.base64.Base64Encoder.__index = jk.base64.Base64Encoder
_vm:set_metatable(jk.base64.Base64Encoder, {})

function jk.base64.Base64Encoder._create()
	local v = _vm:set_metatable({}, jk.base64.Base64Encoder)
	return v
end

function jk.base64.Base64Encoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.base64.Base64Encoder'
	self['_isType.jk.base64.Base64Encoder'] = true
end

function jk.base64.Base64Encoder:_construct0()
	jk.base64.Base64Encoder._init(self)
	return self
end

function jk.base64.Base64Encoder:toUrlSafeFormat(str)
	local v = str
	if not (v ~= nil) then
		do return nil end
	end
	v = _g.jk.lang.String:replaceString(v, "=", "")
	v = _g.jk.lang.String:replaceCharacter(v, 43, 45)
	v = _g.jk.lang.String:replaceCharacter(v, 47, 95)
	do return v end
end

function jk.base64.Base64Encoder:encodeString(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _g.jk.base64.Base64Encoder:encode(_g.jk.lang.String:toUTF8Buffer(str)) end
end

function jk.base64.Base64Encoder:encode(buffer)
	if not (buffer ~= nil) then
		do return nil end
	end
	do
		local length = _g.jk.lang.Buffer:getSize(buffer)
		local dst = _g.jk.lang.Buffer:allocate(_util:convert_to_integer((length + 2) / 3) * 4)
		local x = 0
		local dstIndex = 0
		local state = 0
		local old = 0
		do
			local srcIndex = 0
			while srcIndex < length do
				x = buffer[srcIndex + 1]
				do
					local v = (function() state = state + 1 return state end)()
					if v == 1 then
						dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_and(_vm:bitwise_right_shift(x, 2), 63)))
					elseif v == 2 then
						dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_or(_vm:bitwise_and(_vm:bitwise_left_shift(old, 4), 48), _vm:bitwise_and(_vm:bitwise_right_shift(x, 4), 15))))
					elseif v == 3 then
						dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_or(_vm:bitwise_and(_vm:bitwise_left_shift(old, 2), 60), _vm:bitwise_and(_vm:bitwise_right_shift(x, 6), 3))))
						dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_and(x, 63)))
						state = 0
					end
				end
				old = x
				do srcIndex = srcIndex + 1 end
			end
		end
		do
			local v2 = state
			if v2 == 1 then
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_and(_vm:bitwise_left_shift(old, 4), 48)))
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(61)
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(61)
			elseif v2 == 2 then
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_and(_vm:bitwise_left_shift(old, 2), 60)))
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(61)
			end
		end
		do return _g.jk.lang.String:forBuffer(dst, "ASCII") end
	end
end

function jk.base64.Base64Encoder:toASCIIChar(lookup)
	local c = 0
	if lookup < 0 or lookup > 63 then
		do return c end
	end
	if lookup <= 25 then
		c = lookup + 65
	elseif lookup <= 51 then
		c = lookup + 71
	elseif lookup <= 61 then
		c = lookup - 4
	elseif lookup == 62 then
		c = _util:convert_to_integer(43)
	elseif lookup == 63 then
		c = _util:convert_to_integer(47)
	end
	do return c end
end
jk = jk or {}

jk.thread = jk.thread or {}

jk.thread.CurrentThread = {}
jk.thread.CurrentThread.__index = jk.thread.CurrentThread
_vm:set_metatable(jk.thread.CurrentThread, {})

function jk.thread.CurrentThread._create()
	local v = _vm:set_metatable({}, jk.thread.CurrentThread)
	return v
end

function jk.thread.CurrentThread:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.CurrentThread'
	self['_isType.jk.thread.CurrentThread'] = true
end

function jk.thread.CurrentThread:_construct0()
	jk.thread.CurrentThread._init(self)
	return self
end

function jk.thread.CurrentThread:sleepSeconds(seconds)
	do _os:sleep_seconds(seconds) end
end

function jk.thread.CurrentThread:sleepMicroSeconds(uSeconds)
	do _os:sleep_microseconds(uSeconds) end
end

function jk.thread.CurrentThread:sleepMilliSeconds(mSeconds)
	do _os:sleep_milliseconds(mSeconds) end
end

jk.thread.ThreadPool = {}
jk.thread.ThreadPool.__index = jk.thread.ThreadPool
_vm:set_metatable(jk.thread.ThreadPool, {})

function jk.thread.ThreadPool._create()
	local v = _vm:set_metatable({}, jk.thread.ThreadPool)
	return v
end

function jk.thread.ThreadPool:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.ThreadPool'
	self['_isType.jk.thread.ThreadPool'] = true
	self.maximumPoolSize = 0
	self.queue = nil
	self.runningThreadsCount = 0
	self.mutex = nil
end

function jk.thread.ThreadPool:forMaxPoolSize(maximumPoolSize)
	local v = _g.jk.thread.ThreadPool._construct0(_g.jk.thread.ThreadPool._create())
	v.maximumPoolSize = maximumPoolSize
	do return v end
end

function jk.thread.ThreadPool:_construct0()
	jk.thread.ThreadPool._init(self)
	self.queue = {}
	self.mutex = _g.jk.thread.Mutex:create()
	return self
end

function jk.thread.ThreadPool:getRunningThreadsCount()
	do return self.runningThreadsCount end
end

function jk.thread.ThreadPool:submitTask(task)
	do self:execute(task) end
end

function jk.thread.ThreadPool:submitTasks(tasks)
	if tasks ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(tasks)
		do
			n = 0
			while n < m do
				local task = tasks[n + 1]
				if task ~= nil then
					do self:execute(task) end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.thread.ThreadPool:execute(task)
	if not (task ~= nil) then
		do return end
	end
	do self.mutex:lockMutex() end
	if self.runningThreadsCount < self.maximumPoolSize then
		local runner = _g.jk.thread.ThreadPool.TaskRunner._construct0(_g.jk.thread.ThreadPool.TaskRunner._create())
		do runner:setMyParent(self) end
		do runner:setRunnable(task) end
		if _g.jk.thread.Thread:start(runner) ~= nil then
			do self.runningThreadsCount = self.runningThreadsCount + 1 end
		else
			do _g.jk.lang.Vector:append(self.queue, task) end
		end
	else
		do _g.jk.lang.Vector:append(self.queue, task) end
	end
	do self.mutex:unlockMutex() end
end

function jk.thread.ThreadPool:getTaskFromQueue()
	do self.mutex:lockMutex() end
	do
		local item = _vm:to_table_with_key(_g.jk.lang.Vector:popFirst(self.queue), '_isType.jk.lang.Runnable')
		if not (item ~= nil) then
			do self.runningThreadsCount = self.runningThreadsCount - 1 end
		end
		do self.mutex:unlockMutex() end
		do return item end
	end
end

jk.thread.ThreadPool.TaskRunner = {}
jk.thread.ThreadPool.TaskRunner.__index = jk.thread.ThreadPool.TaskRunner
_vm:set_metatable(jk.thread.ThreadPool.TaskRunner, {})

function jk.thread.ThreadPool.TaskRunner._create()
	local v = _vm:set_metatable({}, jk.thread.ThreadPool.TaskRunner)
	return v
end

function jk.thread.ThreadPool.TaskRunner:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.ThreadPool.TaskRunner'
	self['_isType.jk.thread.ThreadPool.TaskRunner'] = true
	self['_isType.jk.lang.Runnable'] = true
	self.runnable = nil
	self.myParent = nil
end

function jk.thread.ThreadPool.TaskRunner:_construct0()
	jk.thread.ThreadPool.TaskRunner._init(self)
	return self
end

function jk.thread.ThreadPool.TaskRunner:run()
	while true do
		do self.runnable:run() end
		do
			local next = self.myParent:getTaskFromQueue()
			if not (next ~= nil) then
				do break end
			end
			self.runnable = next
		end
	end
end

function jk.thread.ThreadPool.TaskRunner:getRunnable()
	do return self.runnable end
end

function jk.thread.ThreadPool.TaskRunner:setRunnable(v)
	self.runnable = v
	do return self end
end

function jk.thread.ThreadPool.TaskRunner:getMyParent()
	do return self.myParent end
end

function jk.thread.ThreadPool.TaskRunner:setMyParent(v)
	self.myParent = v
	do return self end
end

jk.thread.Thread = {}
jk.thread.Thread.__index = jk.thread.Thread
_vm:set_metatable(jk.thread.Thread, {})

jk.thread.Thread.localValues = {}

function jk.thread.Thread._create()
	local v = _vm:set_metatable({}, jk.thread.Thread)
	return v
end

function jk.thread.Thread:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.Thread'
	self['_isType.jk.thread.Thread'] = true
end

function jk.thread.Thread:_construct0()
	jk.thread.Thread._init(self)
	return self
end

function jk.thread.Thread:setLocalValue(id, value)
	if id ~= nil then
		_g.jk.thread.Thread.localValues[id] = value
	end
end

function jk.thread.Thread:getLocalValue(id)
	if not (id ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(_g.jk.thread.Thread.localValues, id) end
end

function jk.thread.Thread:removeLocalValue(id)
	if id ~= nil then
		do _g.jk.lang.Map:remove(_g.jk.thread.Thread.localValues, id) end
	end
end

function jk.thread.Thread:start(runnable)
	if not (runnable ~= nil) then
		do return nil end
	end
	_io:write_to_stdout("[jk.thread.Thread.start] (Thread.sling:360:3): Not implemented" .. "\n")
	do return nil end
end

jk.thread.SushiThread = {}
jk.thread.SushiThread.__index = jk.thread.SushiThread
_vm:set_metatable(jk.thread.SushiThread, {})

function jk.thread.SushiThread._create()
	local v = _vm:set_metatable({}, jk.thread.SushiThread)
	return v
end

function jk.thread.SushiThread:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.SushiThread'
	self['_isType.jk.thread.SushiThread'] = true
	self.interpreter = nil
	self.reuseInterpreter = false
end

function jk.thread.SushiThread:_construct0()
	jk.thread.SushiThread._init(self)
	return self
end

function jk.thread.SushiThread:getOutputWriter()
	local fd = _pipefd
	if fd < 0 then
		do return nil end
	end
	do return _g.jk.io.FileDescriptorWriter:forFileDescriptor(fd) end
end

function jk.thread.SushiThread:getInputBuffer()
	do return _input end
end

function jk.thread.SushiThread:forThisProgram()
	local interpreter = _vm:prepare_interpreter(_code)
	if not (interpreter ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.thread.SushiThread._construct0(_g.jk.thread.SushiThread._create())
		do v:setInterpreter(interpreter) end
		do return v end
	end
end

function jk.thread.SushiThread:forCode(code)
	if not (code ~= nil) then
		do return nil end
	end
	do
		local interpreter = _vm:prepare_interpreter(code)
		if not (interpreter ~= nil) then
			do return nil end
		end
		do
			local v = _g.jk.thread.SushiThread._construct0(_g.jk.thread.SushiThread._create())
			do v:setInterpreter(interpreter) end
			do return v end
		end
	end
end

function jk.thread.SushiThread:start(fname, input)
	local interpreter = self.interpreter
	if not (interpreter ~= nil) then
		do return false end
	end
	do
		local ff = fname
		if _g.jk.lang.String:isEmpty(ff) then
			ff = "_main()"
		end
		do
			local reuse = 0
			if self.reuseInterpreter then
				reuse = 1
			end
			do
				local v = _os:execute_in_thread(interpreter, ff, input, 0, reuse)
				if v < 0 then
					do return false end
				end
				if not self.reuseInterpreter then
					interpreter = nil
				end
				do return true end
			end
		end
	end
end

function jk.thread.SushiThread:startPiped(fname, input)
	local interpreter = self.interpreter
	if not (interpreter ~= nil) then
		do return nil end
	end
	do
		local ff = fname
		if _g.jk.lang.String:isEmpty(ff) then
			ff = "_main()"
		end
		do
			local reuse = 0
			if self.reuseInterpreter then
				reuse = 1
			end
			do
				local v = _os:execute_in_thread(interpreter, ff, input, 1, reuse)
				if v < 0 then
					do return nil end
				end
				do
					local reader = _g.jk.io.FileDescriptorReader._construct0(_g.jk.io.FileDescriptorReader._create())
					do reader:setFd(v) end
					do return reader end
				end
			end
		end
	end
end

function jk.thread.SushiThread:getInterpreter()
	do return self.interpreter end
end

function jk.thread.SushiThread:setInterpreter(v)
	self.interpreter = v
	do return self end
end

function jk.thread.SushiThread:getReuseInterpreter()
	do return self.reuseInterpreter end
end

function jk.thread.SushiThread:setReuseInterpreter(v)
	self.reuseInterpreter = v
	do return self end
end

jk.thread.CriticalSection = {}
jk.thread.CriticalSection.__index = jk.thread.CriticalSection
_vm:set_metatable(jk.thread.CriticalSection, {})

function jk.thread.CriticalSection._create()
	local v = _vm:set_metatable({}, jk.thread.CriticalSection)
	return v
end

function jk.thread.CriticalSection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.CriticalSection'
	self['_isType.jk.thread.CriticalSection'] = true
end

function jk.thread.CriticalSection:_construct0()
	jk.thread.CriticalSection._init(self)
	return self
end

function jk.thread.CriticalSection:execute(object, block)
	local mutex = _g.jk.thread.Mutex:forObject(object)
	if mutex ~= nil then
		do mutex:lockMutex() end
	end
	if block ~= nil then
		do block() end
	end
	if mutex ~= nil then
		do mutex:unlockMutex() end
	end
end

jk.thread.RunningThread = {}

jk.thread.Mutex = {}
jk.thread.Mutex.__index = jk.thread.Mutex
_vm:set_metatable(jk.thread.Mutex, {})

function jk.thread.Mutex._create()
	local v = _vm:set_metatable({}, jk.thread.Mutex)
	return v
end

function jk.thread.Mutex:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.Mutex'
	self['_isType.jk.thread.Mutex'] = true
end

function jk.thread.Mutex:_construct0()
	jk.thread.Mutex._init(self)
	return self
end

function jk.thread.Mutex:create()
	_io:write_to_stdout("[jk.thread.Mutex.create] (Mutex.sling:49:3): Not implemented" .. "\n")
	do return nil end
end

function jk.thread.Mutex:forObject(object)
	_io:write_to_stdout("[jk.thread.Mutex.forObject] (Mutex.sling:56:2): Not implemented" .. "\n")
	do return nil end
end

function jk.thread.Mutex:lockMutex()
end

function jk.thread.Mutex:unlockMutex()
end
jk = jk or {}

jk.socket = jk.socket or {}

jk.socket.io = jk.socket.io or {}

jk.socket.io.IOManager = {}
jk.socket.io.IOManager.__index = jk.socket.io.IOManager
_vm:set_metatable(jk.socket.io.IOManager, {})

function jk.socket.io.IOManager._create()
	local v = _vm:set_metatable({}, jk.socket.io.IOManager)
	return v
end

function jk.socket.io.IOManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.io.IOManager'
	self['_isType.jk.socket.io.IOManager'] = true
	self['_isType.jk.lang.EventLoop'] = true
end

function jk.socket.io.IOManager:_construct0()
	jk.socket.io.IOManager._init(self)
	return self
end

function jk.socket.io.IOManager:createDefault()
	do return _g.jk.socket.io.IOManagerForSushi._construct0(_g.jk.socket.io.IOManagerForSushi._create()) end
end

function jk.socket.io.IOManager:setCurrent(iomgr)
	do _g.jk.thread.Thread:setLocalValue("__IOManager", iomgr) end
end

function jk.socket.io.IOManager:getCurrent()
	do return _vm:to_table_with_key(_g.jk.thread.Thread:getLocalValue("__IOManager"), '_isType.jk.socket.io.IOManager') end
end

function jk.socket.io.IOManager:addWithReadListener(o, rrl)
	local v = self:add(o)
	if v ~= nil then
		do v:setReadListener(rrl) end
	end
	do return v end
end

function jk.socket.io.IOManager:addWithWriteListener(o, wrl)
	local v = self:add(o)
	if v ~= nil then
		do v:setWriteListener(wrl) end
	end
	do return v end
end

function jk.socket.io.IOManager:execute(ctx)
	do _g.jk.socket.io.IOManager:setCurrent(self) end
	do
		local v = self:doExecute(ctx)
		do _g.jk.thread.Thread:removeLocalValue("__IOManager") end
		do return v end
	end
end

function jk.socket.io.IOManager:add(o)
end

function jk.socket.io.IOManager:startTimer(delay, handler)
end

function jk.socket.io.IOManager:stop()
end

function jk.socket.io.IOManager:doExecute(ctx)
end

function jk.socket.io.IOManager:runScheduled(timeout, runnable)
	if not (timeout >= 0) then
		do return end
	end
	do
		local rr = runnable
		if not (rr ~= nil) then
			do return end
		end
		do self:startTimer(timeout, function()
			do rr:run() end
			do return false end
		end) end
	end
end

function jk.socket.io.IOManager:runInBackground(runnable)
	if not (runnable ~= nil) then
		do return end
	end
	do _g.jk.thread.Thread:start(runnable) end
end

jk.socket.io.IOManagerEntry = {}

jk.socket.io.IOManagerTimer = {}

jk.socket.io.IOManagerForSushi = _g.jk.socket.io.IOManager._create()
jk.socket.io.IOManagerForSushi.__index = jk.socket.io.IOManagerForSushi
_vm:set_metatable(jk.socket.io.IOManagerForSushi, {
	__index = _g.jk.socket.io.IOManager
})

function jk.socket.io.IOManagerForSushi._create()
	local v = _vm:set_metatable({}, jk.socket.io.IOManagerForSushi)
	return v
end

function jk.socket.io.IOManagerForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.io.IOManagerForSushi'
	self['_isType.jk.socket.io.IOManagerForSushi'] = true
	self.exitflag = false
	self.running = false
	self.mgrfd = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

jk.socket.io.IOManagerForSushi.MyEntry = {}
jk.socket.io.IOManagerForSushi.MyEntry.__index = jk.socket.io.IOManagerForSushi.MyEntry
_vm:set_metatable(jk.socket.io.IOManagerForSushi.MyEntry, {})

function jk.socket.io.IOManagerForSushi.MyEntry._create()
	local v = _vm:set_metatable({}, jk.socket.io.IOManagerForSushi.MyEntry)
	return v
end

function jk.socket.io.IOManagerForSushi.MyEntry:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.io.IOManagerForSushi.MyEntry'
	self['_isType.jk.socket.io.IOManagerForSushi.MyEntry'] = true
	self['_isType.jk.socket.io.IOManagerEntry'] = true
	self.mgrfd = nil
	self.fd = 0
	self.objref = 0
	self.rrl = nil
	self.wrl = nil
end

function jk.socket.io.IOManagerForSushi.MyEntry:_construct0()
	jk.socket.io.IOManagerForSushi.MyEntry._init(self)
	return self
end

function jk.socket.io.IOManagerForSushi.MyEntry:onReadReady()
	local rrl = self.rrl
	if not (rrl ~= nil) then
		do return end
	end
	do rrl() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:onWriteReady()
	local wrl = self.wrl
	if not (wrl ~= nil) then
		do return end
	end
	do wrl() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:onReadWriteReady()
	local rrl = self.rrl
	local wrl = self.wrl
	if rrl ~= nil then
		do rrl() end
	end
	if wrl ~= nil then
		do wrl() end
	end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setListeners(rrl, wrl)
	self.rrl = rrl
	self.wrl = wrl
	do return self:update() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setReadListener(rrl)
	self.rrl = rrl
	do return self:update() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setWriteListener(wrl)
	self.wrl = wrl
	do return self:update() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:update()
	local mgrfd = self.mgrfd
	local fd = self.fd
	local myself = self
	local mode = -1
	if self.rrl ~= nil and self.wrl ~= nil then
		mode = 2
	elseif self.wrl ~= nil then
		mode = 1
	elseif self.rrl ~= nil then
		mode = 0
	end
	do
		local v = true
		if mode < 0 then
			v = self:remove()
		elseif self.objref > 0 then
			local objref = self.objref
			local r = _net:update_io_listener(mgrfd, fd, mode, objref)
			if r ~= 0 then
				v = false
			end
		else
			local objref = 0
			do objref = _net:register_io_listener(mgrfd, fd, mode, myself) end
			self.objref = objref
			if objref < 1 then
				v = false
			end
		end
		do return v end
	end
end

function jk.socket.io.IOManagerForSushi.MyEntry:remove()
	if not (self.objref > 0) then
		do return false end
	end
	do
		local mgrfd = self.mgrfd
		local fd = self.fd
		local objref = self.objref
		local r = _net:remove_io_listener(mgrfd, fd, objref)
		self.objref = 0
		if r ~= 0 then
			do return false end
		end
		do return true end
	end
end

function jk.socket.io.IOManagerForSushi.MyEntry:getMgrfd()
	do return self.mgrfd end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setMgrfd(v)
	self.mgrfd = v
	do return self end
end

function jk.socket.io.IOManagerForSushi.MyEntry:getFd()
	do return self.fd end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setFd(v)
	self.fd = v
	do return self end
end

function jk.socket.io.IOManagerForSushi:_construct0()
	jk.socket.io.IOManagerForSushi._init(self)
	do _g.jk.socket.io.IOManager._construct0(self) end
	self.mgrfd = _net:create_io_manager()
	return self
end

function jk.socket.io.IOManagerForSushi:_destruct()
	do self:close() end
end

function jk.socket.io.IOManagerForSushi:close()
	local mgrfd = self.mgrfd
	if mgrfd ~= nil then
		do _net:close_io_manager(mgrfd) end
		mgrfd = nil
	end
end

function jk.socket.io.IOManagerForSushi:doExecute(ctx)
	local mgrfd = self.mgrfd
	if not (mgrfd ~= nil) then
		do _g.jk.log.Log:error(ctx, "IOManagerForSushi" .. ": Failed to initialize IO manager file descriptor") end
		do return false end
	end
	self.exitflag = false
	self.running = true
	do _g.jk.log.Log:debug(ctx, "IOManagerForSushi" .. " started") end
	do
		local trap2 = _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGINT, true)
		local trap15 = _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGTERM, true)
		while self.exitflag == false do
			local r = _net:execute_io_manager(mgrfd, -1)
			if r < 0 then
				do _g.jk.log.Log:error(ctx, "_net:execute_io_manager returned error status " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(r)) .. ". Exiting loop.") end
				do break end
			end
			if _g.jk.posix.PosixSignal:checkSignalState(_g.jk.posix.PosixSignal.SIGINT) or _g.jk.posix.PosixSignal:checkSignalState(_g.jk.posix.PosixSignal.SIGTERM) then
				do _g.jk.log.Log:debug(ctx, "Signal received. Exiting IOManager.") end
				do break end
			end
		end
		self.running = false
		do _g.jk.log.Log:debug(ctx, "IOManagerForSushi" .. " ended") end
		do _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGINT, trap2) end
		do _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGTERM, trap15) end
		do return true end
	end
end

function jk.socket.io.IOManagerForSushi:stop()
	self.exitflag = true
end

function jk.socket.io.IOManagerForSushi:isRunning()
	do return self.running end
end

function jk.socket.io.IOManagerForSushi:add(o)
	if not (self.mgrfd ~= nil) then
		do return nil end
	end
	do
		local fdo = _vm:to_table_with_key(o, '_isType.jk.io.FileDescriptor')
		if not (fdo ~= nil) then
			do return nil end
		end
		do
			local fd = fdo:getFileDescriptor()
			if not (fd >= 0) then
				do return nil end
			end
			do
				local v = _g.jk.socket.io.IOManagerForSushi.MyEntry._construct0(_g.jk.socket.io.IOManagerForSushi.MyEntry._create())
				do v:setMgrfd(self.mgrfd) end
				do v:setFd(fd) end
				do return v end
			end
		end
	end
end

function jk.socket.io.IOManagerForSushi:startTimer(delay, handler)
	_io:write_to_stdout("[jk.socket.io.IOManagerForSushi.startTimer] (IOManagerForSushi@target_sushi.sling:209:2): Not implemented" .. "\n")
	do return nil end
end
jk = jk or {}

jk.socket = jk.socket or {}

jk.socket.ConnectedSocket = {}

jk.socket.TCPSocket = {}
jk.socket.TCPSocket.__index = jk.socket.TCPSocket
_vm:set_metatable(jk.socket.TCPSocket, {})

function jk.socket.TCPSocket._create()
	local v = _vm:set_metatable({}, jk.socket.TCPSocket)
	return v
end

function jk.socket.TCPSocket:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.TCPSocket'
	self['_isType.jk.socket.TCPSocket'] = true
	self['_isType.jk.socket.ConnectedSocket'] = true
	self.lastErrorDescription = nil
end

function jk.socket.TCPSocket:_construct0()
	jk.socket.TCPSocket._init(self)
	return self
end

function jk.socket.TCPSocket:create()
	do return _g.jk.socket.TCPSocketForSushi._construct0(_g.jk.socket.TCPSocketForSushi._create()) end
end

function jk.socket.TCPSocket:createAndConnect(address, port)
	local v = _g.jk.socket.TCPSocket:create()
	if not (v ~= nil) then
		do return nil end
	end
	if v:connect(address, port) == false then
		v = nil
	end
	do return v end
end

function jk.socket.TCPSocket:createAndListen(port)
	local v = _g.jk.socket.TCPSocket:create()
	if not (v ~= nil) then
		do return nil end
	end
	if v:listen(port) == false then
		v = nil
	end
	do return v end
end

function jk.socket.TCPSocket:getRemoteAddress()
end

function jk.socket.TCPSocket:getRemotePort()
end

function jk.socket.TCPSocket:getLocalAddress()
end

function jk.socket.TCPSocket:getLocalPort()
end

function jk.socket.TCPSocket:connect(address, port)
end

function jk.socket.TCPSocket:listen(port)
end

function jk.socket.TCPSocket:accept()
end

function jk.socket.TCPSocket:setBlocking(blocking)
end

function jk.socket.TCPSocket:getBlocking()
end

function jk.socket.TCPSocket:close()
end

function jk.socket.TCPSocket:read(buffer)
end

function jk.socket.TCPSocket:readWithTimeout(buffer, timeout)
	do return self:read(buffer) end
end

function jk.socket.TCPSocket:write(buffer, size)
end

function jk.socket.TCPSocket:getLastErrorDescription()
	do return self.lastErrorDescription end
end

function jk.socket.TCPSocket:setLastErrorDescription(v)
	self.lastErrorDescription = v
	do return self end
end

jk.socket.TCPSocketForSushi = _g.jk.socket.TCPSocket._create()
jk.socket.TCPSocketForSushi.__index = jk.socket.TCPSocketForSushi
_vm:set_metatable(jk.socket.TCPSocketForSushi, {
	__index = _g.jk.socket.TCPSocket
})

function jk.socket.TCPSocketForSushi._create()
	local v = _vm:set_metatable({}, jk.socket.TCPSocketForSushi)
	return v
end

function jk.socket.TCPSocketForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.TCPSocketForSushi'
	self['_isType.jk.socket.TCPSocketForSushi'] = true
	self['_isType.jk.io.FileDescriptor'] = true
	self.fd = -1
	self.isBlocking = true
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.socket.TCPSocketForSushi:_construct0()
	jk.socket.TCPSocketForSushi._init(self)
	do _g.jk.socket.TCPSocket._construct0(self) end
	return self
end

function jk.socket.TCPSocketForSushi:_destruct()
	do self:close() end
end

function jk.socket.TCPSocketForSushi:getFileDescriptor()
	do return self.fd end
end

function jk.socket.TCPSocketForSushi:createSocket()
	if self.fd >= 0 then
		do self:close() end
	end
	self.fd = _net:create_tcp_socket()
	if self.fd < 0 then
		do return false end
	end
	do return true end
end

function jk.socket.TCPSocketForSushi:close()
	local fd = self.fd
	if not (fd >= 0) then
		do return end
	end
	do _net:close_tcp_socket(fd) end
	self.fd = -1
end

function jk.socket.TCPSocketForSushi:getRemoteAddress()
	if not (self.fd >= 0) then
		do return nil end
	end
	do
		local fd = self.fd
		do return _net:get_tcp_socket_peer_address(fd) end
	end
end

function jk.socket.TCPSocketForSushi:getRemotePort()
	if not (self.fd >= 0) then
		do return 0 end
	end
	do
		local fd = self.fd
		do return _net:get_tcp_socket_peer_port(fd) end
	end
end

function jk.socket.TCPSocketForSushi:getLocalAddress()
	_io:write_to_stdout("[jk.socket.TCPSocketForSushi.getLocalAddress] (TCPSocketForSushi@target_sushi.sling:77:2): Not implemented" .. "\n")
	do return nil end
end

function jk.socket.TCPSocketForSushi:getLocalPort()
	_io:write_to_stdout("[jk.socket.TCPSocketForSushi.getLocalPort] (TCPSocketForSushi@target_sushi.sling:83:2): Not implemented" .. "\n")
	do return 0 end
end

function jk.socket.TCPSocketForSushi:connect(address, port)
	if not self:createSocket() then
		do return false end
	end
	do
		local fd = self.fd
		if _net:connect_tcp_socket(fd, address, port) ~= 0 then
			do self:close() end
			do return false end
		end
		do return true end
	end
end

function jk.socket.TCPSocketForSushi:listen(port)
	if not self:createSocket() then
		do return false end
	end
	do
		local fd = self.fd
		if _net:listen_tcp_socket(fd, port) ~= 0 then
			do self:close() end
			do return false end
		end
		do return true end
	end
end

function jk.socket.TCPSocketForSushi:accept()
	if not (self.fd >= 0) then
		do return nil end
	end
	do
		local r = 0
		local error = nil
		local fd = self.fd
		do r, error = _net:accept_tcp_socket(fd) end
		if error ~= nil then
			_vm:throw_error(_g.jk.lang.ExceptionWithError:forCode("failedToAcceptSocket", error))
		end
		if not (r >= 0) then
			do return nil end
		end
		do
			local v = _g.jk.socket.TCPSocketForSushi._construct0(_g.jk.socket.TCPSocketForSushi._create())
			do v:setFd(r) end
			do return v end
		end
	end
end

function jk.socket.TCPSocketForSushi:setBlocking(blocking)
	if not (self.fd >= 0) then
		do return false end
	end
	do
		local r = 0
		local fd = self.fd
		if blocking then
			do r = _net:set_socket_blocking(fd) end
		else
			do r = _net:set_socket_non_blocking(fd) end
		end
		if r ~= 0 then
			do return false end
		end
		self.isBlocking = blocking
		do return true end
	end
end

function jk.socket.TCPSocketForSushi:getBlocking()
	do return self.isBlocking end
end

function jk.socket.TCPSocketForSushi:read(buffer)
	do return self:readWithTimeout(buffer, -1) end
end

function jk.socket.TCPSocketForSushi:readWithTimeout(buffer, timeout)
	if self.fd < 0 then
		do return -1 end
	end
	if buffer == nil then
		do return -1 end
	end
	do
		local v = 0
		local fd = self.fd
		do v = _net:read_from_tcp_socket(fd, buffer, #buffer, timeout) end
		do return v end
	end
end

function jk.socket.TCPSocketForSushi:write(buffer, size)
	if self.fd < 0 then
		do return -1 end
	end
	if buffer == nil then
		do return -1 end
	end
	do
		local sz = size
		if sz < 0 then
			sz = #buffer
		end
		do
			local v = 0
			local fd = self.fd
			do v = _net:write_to_tcp_socket(fd, buffer, sz) end
			do return v end
		end
	end
end

function jk.socket.TCPSocketForSushi:getFd()
	do return self.fd end
end

function jk.socket.TCPSocketForSushi:setFd(v)
	self.fd = v
	do return self end
end

jk.socket.UDPSocket = {}
jk.socket.UDPSocket.__index = jk.socket.UDPSocket
_vm:set_metatable(jk.socket.UDPSocket, {})

function jk.socket.UDPSocket._create()
	local v = _vm:set_metatable({}, jk.socket.UDPSocket)
	return v
end

function jk.socket.UDPSocket:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.UDPSocket'
	self['_isType.jk.socket.UDPSocket'] = true
end

function jk.socket.UDPSocket:_construct0()
	jk.socket.UDPSocket._init(self)
	return self
end

function jk.socket.UDPSocket:create()
	_io:write_to_stdout("[jk.socket.UDPSocket.create] (UDPSocket.sling:40:3): Not implemented." .. "\n")
	do return nil end
end

function jk.socket.UDPSocket:send(message, address, port)
end

function jk.socket.UDPSocket:sendBroadcast(message, address, port)
end

function jk.socket.UDPSocket:receive(message, timeout)
end

function jk.socket.UDPSocket:bind(port)
end

function jk.socket.UDPSocket:close()
end

function jk.socket.UDPSocket:getLocalAddress()
end

function jk.socket.UDPSocket:getLocalPort()
end
jk = jk or {}

jk.socket = jk.socket or {}

jk.socket.ssl = jk.socket.ssl or {}

jk.socket.ssl.SSLSocket = {}
jk.socket.ssl.SSLSocket.__index = jk.socket.ssl.SSLSocket
_vm:set_metatable(jk.socket.ssl.SSLSocket, {})

function jk.socket.ssl.SSLSocket._create()
	local v = _vm:set_metatable({}, jk.socket.ssl.SSLSocket)
	return v
end

function jk.socket.ssl.SSLSocket:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.ssl.SSLSocket'
	self['_isType.jk.socket.ssl.SSLSocket'] = true
	self['_isType.jk.socket.ConnectedSocket'] = true
end

function jk.socket.ssl.SSLSocket:_construct0()
	jk.socket.ssl.SSLSocket._init(self)
	return self
end

function jk.socket.ssl.SSLSocket:createInstance(cSocket, serverAddress, ctx, certFile, keyFile, isServer, acceptInvalidCertificate, passphrase)
	if not (cSocket ~= nil) then
		do return nil end
	end
	do
		local v = nil
		local ss = _g.jk.socket.ssl.SSLSocketForSushi._construct0(_g.jk.socket.ssl.SSLSocketForSushi._create())
		do ss:setAcceptInvalidCertificate(acceptInvalidCertificate) end
		do ss:setCtx(ctx) end
		do ss:setServerAddress(serverAddress) end
		if ss:open(cSocket, certFile, keyFile, isServer, passphrase) then
			v = ss
		end
		do return v end
	end
end

function jk.socket.ssl.SSLSocket:forClient(cSocket, hostAddress, ctx, acceptInvalidCertificate, passphrase)
	do return _g.jk.socket.ssl.SSLSocket:createInstance(cSocket, hostAddress, ctx, nil, nil, false, acceptInvalidCertificate, passphrase) end
end

function jk.socket.ssl.SSLSocket:forServer(cSocket, certFile, keyFile, ctx, acceptInvalidCertificate, passphrase)
	do return _g.jk.socket.ssl.SSLSocket:createInstance(cSocket, nil, ctx, certFile, keyFile, true, acceptInvalidCertificate, passphrase) end
end

function jk.socket.ssl.SSLSocket:setAcceptInvalidCertificate(accept)
end

function jk.socket.ssl.SSLSocket:setRequireClientCertificate(require)
end

function jk.socket.ssl.SSLSocket:close()
end

function jk.socket.ssl.SSLSocket:read(buffer)
end

function jk.socket.ssl.SSLSocket:readWithTimeout(buffer, timeout)
end

function jk.socket.ssl.SSLSocket:write(buffer, size)
end

function jk.socket.ssl.SSLSocket:getSocket()
end

jk.socket.ssl.SSLSocketForSushi = _g.jk.socket.ssl.SSLSocket._create()
jk.socket.ssl.SSLSocketForSushi.__index = jk.socket.ssl.SSLSocketForSushi
_vm:set_metatable(jk.socket.ssl.SSLSocketForSushi, {
	__index = _g.jk.socket.ssl.SSLSocket
})

function jk.socket.ssl.SSLSocketForSushi._create()
	local v = _vm:set_metatable({}, jk.socket.ssl.SSLSocketForSushi)
	return v
end

function jk.socket.ssl.SSLSocketForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.ssl.SSLSocketForSushi'
	self['_isType.jk.socket.ssl.SSLSocketForSushi'] = true
	self.ctx = nil
	self.socket = nil
	self.serverAddress = nil
	self.acceptInvalidCertificate = false
	self.requireClientCertificate = false
	self.ssl = nil
end

function jk.socket.ssl.SSLSocketForSushi:_construct0()
	jk.socket.ssl.SSLSocketForSushi._init(self)
	do _g.jk.socket.ssl.SSLSocket._construct0(self) end
	return self
end

function jk.socket.ssl.SSLSocketForSushi:setAcceptInvalidCertificate(v)
	self.acceptInvalidCertificate = v
end

function jk.socket.ssl.SSLSocketForSushi:setRequireClientCertificate(v)
	self.requireClientCertificate = v
end

function jk.socket.ssl.SSLSocketForSushi:open(cSocket, certFile, keyFile, isServer, passphrase)
	if not ((function()
		self.socket = _vm:to_table_with_key(cSocket, '_isType.jk.socket.TCPSocketForSushi')
		do return self.socket end
	end)() ~= nil) then
		do return false end
	end
	if isServer then
		do return false end
	end
	do
		local address = self.serverAddress
		if _g.jk.lang.String:isEmpty(address) then
			address = self.socket:getRemoteAddress()
		end
		if not _g.jk.lang.String:isNotEmpty(address) then
			do return false end
		end
		do
			local port = self.socket:getRemotePort()
			if port < 1 then
				port = 443
			end
			do
				local fd = self.socket:getFileDescriptor()
				local ssl = _crypto:ssl_connect(fd, address)
				if not (ssl ~= nil) then
					do return false end
				end
				self.ssl = ssl
				do return true end
			end
		end
	end
end

function jk.socket.ssl.SSLSocketForSushi:read(buffer)
	do return self:readWithTimeout(buffer, -1) end
end

function jk.socket.ssl.SSLSocketForSushi:close()
	if self.ssl ~= nil then
		local ssl = self.ssl
		self.ssl = nil
		do _crypto:ssl_close(ssl) end
	end
	if self.socket ~= nil then
		do self.socket:close() end
		self.socket = nil
	end
end

function jk.socket.ssl.SSLSocketForSushi:readWithTimeout(buffer, timeout)
	local ssl = self.ssl
	if not (ssl ~= nil) then
		do return 0 end
	end
	if not (buffer ~= nil) then
		do return -1 end
	end
	do
		local v = _crypto:ssl_read(ssl, buffer)
		if v < 1 then
			do self:close() end
			v = -1
		end
		do return v end
	end
end

function jk.socket.ssl.SSLSocketForSushi:write(buffer, size)
	local ssl = self.ssl
	if not (ssl ~= nil) then
		do return 0 end
	end
	if not (buffer ~= nil) then
		do return -1 end
	end
	do
		local v = _crypto:ssl_write(ssl, buffer, size)
		if v < 1 then
			do self:close() end
			v = -1
		end
		do return v end
	end
end

function jk.socket.ssl.SSLSocketForSushi:getSocket()
	do return self.socket end
end

function jk.socket.ssl.SSLSocketForSushi:getCtx()
	do return self.ctx end
end

function jk.socket.ssl.SSLSocketForSushi:setCtx(v)
	self.ctx = v
	do return self end
end

function jk.socket.ssl.SSLSocketForSushi:setSocket(v)
	self.socket = v
	do return self end
end

function jk.socket.ssl.SSLSocketForSushi:getServerAddress()
	do return self.serverAddress end
end

function jk.socket.ssl.SSLSocketForSushi:setServerAddress(v)
	self.serverAddress = v
	do return self end
end
jk = jk or {}

jk.json = jk.json or {}

jk.json.JSONEncoder = {}
jk.json.JSONEncoder.__index = jk.json.JSONEncoder
_vm:set_metatable(jk.json.JSONEncoder, {})

function jk.json.JSONEncoder._create()
	local v = _vm:set_metatable({}, jk.json.JSONEncoder)
	return v
end

function jk.json.JSONEncoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.json.JSONEncoder'
	self['_isType.jk.json.JSONEncoder'] = true
	self.niceFormatting = true
	self.stringFormattedBoolean = false
	self.stringFormattedNumber = false
	self.newJSONFormat = true
	self.encodeNullAsNull = false
	self.isNewLine = true
	self.mysb = nil
end

function jk.json.JSONEncoder:_construct0()
	jk.json.JSONEncoder._init(self)
	return self
end

function jk.json.JSONEncoder:print(line, indent, startline, endline, sb)
	if startline and self.isNewLine == false then
		if self.niceFormatting then
			do sb:appendCharacter(10) end
		end
		self.isNewLine = true
	end
	if self.isNewLine and self.niceFormatting then
		do
			local n = 0
			while n < indent do
				do sb:appendCharacter(9) end
				do n = n + 1 end
			end
		end
	end
	do sb:appendString(line) end
	if endline then
		if self.niceFormatting then
			do sb:appendCharacter(10) end
		end
		self.isNewLine = true
	else
		self.isNewLine = false
	end
end

function jk.json.JSONEncoder:encodeArray(cc, indent, sb)
	do self:print("[", indent, false, true, sb) end
	do
		local first = true
		if cc ~= nil then
			local n = 0
			local m = #cc
			do
				n = 0
				while n < m do
					local o = cc[n + 1]
					if o ~= nil then
						if first == false then
							do self:print(",", indent, false, true, sb) end
						end
						do self:encodeObject(o, indent + 1, sb) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do self:print("]", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeDynamicVector(cc, indent, sb)
	do self:print("[", indent, false, true, sb) end
	do
		local first = true
		local array = cc:toVector()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local o = array[n + 1]
					if o ~= nil then
						if first == false then
							do self:print(",", indent, false, true, sb) end
						end
						do self:encodeObject(o, indent + 1, sb) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do self:print("]", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeVector(cc, indent, sb)
	do self:print("[", indent, false, true, sb) end
	do
		local first = true
		if cc ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(cc)
			do
				n = 0
				while n < m do
					local o = cc[n + 1]
					if o ~= nil then
						if first == false then
							do self:print(",", indent, false, true, sb) end
						end
						do self:encodeObject(o, indent + 1, sb) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do self:print("]", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeMap(map, indent, sb)
	do self:print("{", indent, false, true, sb) end
	do
		local first = true
		local it = _g.jk.lang.Map:iterateKeys(map)
		while it ~= nil do
			local keyo = it:next()
			if not (keyo ~= nil) then
				do break end
			end
			do
				local key = _g.jk.lang.String:asString(keyo)
				if not (key ~= nil) then
					goto _continue1
				end
				if not first then
					do self:print(",", indent, false, true, sb) end
				end
				do self:encodeString(key, indent + 1, sb) end
				if self.niceFormatting then
					do sb:appendString(" : ") end
				else
					do sb:appendCharacter(58) end
				end
				do self:encodeObject(map[keyo], indent + 1, sb) end
				first = false
			end
			::_continue1::
		end
		do self:print("}", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeDynamicMap(map, indent, sb)
	do self:print("{", indent, false, true, sb) end
	do
		local first = true
		local it = map:iterateKeys()
		while it ~= nil do
			local key = it:next()
			if not (key ~= nil) then
				do break end
			end
			if first == false then
				do self:print(",", indent, false, true, sb) end
			end
			do self:encodeString(key, indent + 1, sb) end
			if self.niceFormatting then
				do sb:appendString(" : ") end
			else
				do sb:appendCharacter(58) end
			end
			do self:encodeObject(map:get(key), indent + 1, sb) end
			first = false
		end
		do self:print("}", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeKeyValueList(list, indent, sb)
	do self:print("{", indent, false, true, sb) end
	do
		local first = true
		local it = list:iterate()
		while it ~= nil do
			local pair = it:next()
			if pair == nil then
				do break end
			end
			if first == false then
				do self:print(",", indent, false, true, sb) end
			end
			do self:encodeString(pair.key, indent + 1, sb) end
			if self.niceFormatting then
				do sb:appendString(" : ") end
			else
				do sb:appendCharacter(58) end
			end
			do self:encodeString(pair.value, indent + 1, sb) end
			first = false
		end
		do self:print("}", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeString(s, indent, sb)
	if self.mysb == nil then
		self.mysb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	else
		do self.mysb:clear() end
	end
	do self.mysb:appendCharacter(34) end
	do
		local it = _g.jk.lang.String:iterate(s)
		while true do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if self.newJSONFormat then
				if c == 9 then
					do self.mysb:appendString("\\t") end
					goto _continue2
				end
				if c == 10 then
					do self.mysb:appendString("\\n") end
					goto _continue2
				end
				if c == 13 then
					do self.mysb:appendString("\\r") end
					goto _continue2
				end
				if c == 8 then
					do self.mysb:appendString("\\b") end
					goto _continue2
				end
				if c == 12 then
					do self.mysb:appendString("\\f") end
					goto _continue2
				end
			end
			if c == 34 then
				do self.mysb:appendCharacter(92) end
			elseif c == 92 then
				do self.mysb:appendCharacter(92) end
			end
			do self.mysb:appendCharacter(c) end
			::_continue2::
		end
		do self.mysb:appendCharacter(34) end
		do self:print(self.mysb:toString(), indent, false, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeBoolean(b, indent, sb)
	if self.mysb == nil then
		self.mysb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	else
		do self.mysb:clear() end
	end
	if self.stringFormattedBoolean then
		do self.mysb:appendCharacter(34) end
		do self.mysb:appendString(_g.jk.lang.String:forBoolean(b)) end
		do self.mysb:appendCharacter(34) end
	else
		do self.mysb:appendString(_g.jk.lang.String:forBoolean(b)) end
	end
	do self:print(self.mysb:toString(), indent, false, false, sb) end
end

function jk.json.JSONEncoder:encodeNumber(o, indent, sb)
	if self.mysb == nil then
		self.mysb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	else
		do self.mysb:clear() end
	end
	if self.stringFormattedNumber then
		do self.mysb:appendCharacter(34) end
		do self.mysb:appendString(_g.jk.lang.String:asString(o)) end
		do self.mysb:appendCharacter(34) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.IntegerObject') ~= nil) then
		do self.mysb:appendInteger(_g.jk.lang.Integer:asInteger(o)) end
	elseif _vm:to_table_with_key(o, '_isType.jk.lang.LongIntegerObject') ~= nil then
		do self.mysb:appendLong(_g.jk.lang.LongInteger:asLong(o)) end
	elseif _vm:to_table_with_key(o, '_isType.jk.lang.DoubleObject') ~= nil then
		do self.mysb:appendDouble(_g.jk.lang.Double:asDouble(o)) end
	else
		do self.mysb:appendString("") end
	end
	do self:print(self.mysb:toString(), indent, false, false, sb) end
end

function jk.json.JSONEncoder:encodeObject(o, indent, sb)
	if not (o ~= nil) then
		if self.encodeNullAsNull then
			do self:print("null", indent, false, false, sb) end
		else
			do self:encodeString("", indent, sb) end
		end
	elseif (_vm:to_table_with_key(o, '_isType.jk.json.JSONObject') ~= nil) then
		do self:encodeObject(o:toJsonObject(), indent, sb) end
	elseif (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
		do self:encodeArray(o, indent, sb) end
	elseif (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
		do self:encodeVector(o, indent, sb) end
	elseif (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x < 1 end)(o) then
		do self:encodeMap(o, indent, sb) end
	elseif _util:is_buffer(o) then
		do self:encodeString(_g.jk.base64.Base64Encoder:encode(o), indent, sb) end
	elseif (_vm:get_variable_type(o) == 'string') then
		do self:encodeString(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.DynamicMap') ~= nil) then
		do self:encodeDynamicMap(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.DynamicVector') ~= nil) then
		do self:encodeDynamicVector(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.KeyValueListForStrings') ~= nil) then
		do self:encodeKeyValueList(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.StringObject') ~= nil) then
		do self:encodeString(o:toString(), indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.BufferObject') ~= nil) then
		do self:encodeString(_g.jk.base64.Base64Encoder:encode(o:toBuffer()), indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.ArrayObject') ~= nil) then
		local aa = o:toArray()
		do self:encodeArray(aa, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.VectorObject') ~= nil) then
		local vv = o:toVector()
		do self:encodeVector(vv, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.IntegerObject') ~= nil) or (_vm:to_table_with_key(o, '_isType.jk.lang.LongIntegerObject') ~= nil) or (_vm:to_table_with_key(o, '_isType.jk.lang.DoubleObject') ~= nil) then
		do self:encodeNumber(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.CharacterObject') ~= nil) then
		do self:encodeString(_g.jk.lang.String:asString(o), indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.BooleanObject') ~= nil) then
		do self:encodeBoolean(_g.jk.lang.Boolean:asBoolean(o, false), indent, sb) end
	else
		do self:encodeString("", indent, sb) end
	end
end

function jk.json.JSONEncoder:encode(o, niceFormatting, stringFormattedNumber)
	local v = _g.jk.json.JSONEncoder._construct0(_g.jk.json.JSONEncoder._create())
	do v:setStringFormattedBoolean(true) end
	do v:setStringFormattedNumber(stringFormattedNumber) end
	do v:setNiceFormatting(niceFormatting) end
	do return v:execute(o) end
end

function jk.json.JSONEncoder:execute(o)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do self:encodeObject(o, 0, sb) end
	do return sb:toString() end
end

function jk.json.JSONEncoder:encodeToBuilder(o, sb)
	if not (sb ~= nil) then
		do return end
	end
	do
		local str = _g.jk.json.JSONEncoder._construct0(_g.jk.json.JSONEncoder._create()):setEncodeNullAsNull(true):execute(o)
		if str ~= nil then
			do sb:appendString(str) end
		end
	end
end

function jk.json.JSONEncoder:getNiceFormatting()
	do return self.niceFormatting end
end

function jk.json.JSONEncoder:setNiceFormatting(v)
	self.niceFormatting = v
	do return self end
end

function jk.json.JSONEncoder:getStringFormattedBoolean()
	do return self.stringFormattedBoolean end
end

function jk.json.JSONEncoder:setStringFormattedBoolean(v)
	self.stringFormattedBoolean = v
	do return self end
end

function jk.json.JSONEncoder:getStringFormattedNumber()
	do return self.stringFormattedNumber end
end

function jk.json.JSONEncoder:setStringFormattedNumber(v)
	self.stringFormattedNumber = v
	do return self end
end

function jk.json.JSONEncoder:getNewJSONFormat()
	do return self.newJSONFormat end
end

function jk.json.JSONEncoder:setNewJSONFormat(v)
	self.newJSONFormat = v
	do return self end
end

function jk.json.JSONEncoder:getEncodeNullAsNull()
	do return self.encodeNullAsNull end
end

function jk.json.JSONEncoder:setEncodeNullAsNull(v)
	self.encodeNullAsNull = v
	do return self end
end

jk.json.JSONObject = {}

jk.json.JSONObjectAdapter = {}
jk.json.JSONObjectAdapter.__index = jk.json.JSONObjectAdapter
_vm:set_metatable(jk.json.JSONObjectAdapter, {})

function jk.json.JSONObjectAdapter._create()
	local v = _vm:set_metatable({}, jk.json.JSONObjectAdapter)
	return v
end

function jk.json.JSONObjectAdapter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.json.JSONObjectAdapter'
	self['_isType.jk.json.JSONObjectAdapter'] = true
	self['_isType.jk.json.JSONObject'] = true
end

function jk.json.JSONObjectAdapter:_construct0()
	jk.json.JSONObjectAdapter._init(self)
	return self
end

function jk.json.JSONObjectAdapter:asJsonValue(value)
	if not (value ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(value, '_isType.jk.json.JSONObject') ~= nil) then
		local oj = value
		do return oj:toJsonObject() end
	end
	do return value end
end

function jk.json.JSONObjectAdapter:toDynamicMap()
	do return _vm:to_table_with_key(self:toJsonObject(), '_isType.jk.lang.DynamicMap') end
end

function jk.json.JSONObjectAdapter:toObjectMap()
	local dm = self:toDynamicMap()
	if not (dm ~= nil) then
		do return nil end
	end
	do return dm:toObjectMap() end
end

function jk.json.JSONObjectAdapter:toJsonObject()
end

function jk.json.JSONObjectAdapter:fromJsonObject(o)
end

jk.json.JSONParser = {}
jk.json.JSONParser.__index = jk.json.JSONParser
_vm:set_metatable(jk.json.JSONParser, {})

function jk.json.JSONParser._create()
	local v = _vm:set_metatable({}, jk.json.JSONParser)
	return v
end

function jk.json.JSONParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.json.JSONParser'
	self['_isType.jk.json.JSONParser'] = true
	self.iterator = nil
end

function jk.json.JSONParser:_construct0()
	jk.json.JSONParser._init(self)
	return self
end

jk.json.JSONParser.NullObject = {}
jk.json.JSONParser.NullObject.__index = jk.json.JSONParser.NullObject
_vm:set_metatable(jk.json.JSONParser.NullObject, {})

function jk.json.JSONParser.NullObject._create()
	local v = _vm:set_metatable({}, jk.json.JSONParser.NullObject)
	return v
end

function jk.json.JSONParser.NullObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.json.JSONParser.NullObject'
	self['_isType.jk.json.JSONParser.NullObject'] = true
end

function jk.json.JSONParser.NullObject:_construct0()
	jk.json.JSONParser.NullObject._init(self)
	return self
end

function jk.json.JSONParser:parse(data)
	if not (data ~= nil) then
		do return nil end
	end
	if _util:is_buffer(data) then
		do return _g.jk.json.JSONParser:parseBuffer(data) end
	end
	if (_vm:get_variable_type(data) == 'string') then
		do return _g.jk.json.JSONParser:parseString(data) end
	end
	if (_vm:to_table_with_key(data, '_isType.jk.fs.File') ~= nil) then
		do return _g.jk.json.JSONParser:parseFile(data) end
	end
	do return nil end
end

function jk.json.JSONParser:parseBuffer(buffer)
	if buffer == nil then
		do return nil end
	end
	do return _g.jk.json.JSONParser:forBuffer(buffer):acceptObject() end
end

function jk.json.JSONParser:parseString(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return nil end
	end
	do return _g.jk.json.JSONParser:forString(str):acceptObject() end
end

function jk.json.JSONParser:parseFile(file)
	if file == nil then
		do return nil end
	end
	do return _g.jk.json.JSONParser:parseString(file:getContentsUTF8()) end
end

function jk.json.JSONParser:forString(str)
	local v = _g.jk.json.JSONParser._construct0(_g.jk.json.JSONParser._create())
	do v:setDataString(str) end
	do return v end
end

function jk.json.JSONParser:forBuffer(buffer)
	local v = _g.jk.json.JSONParser._construct0(_g.jk.json.JSONParser._create())
	do v:setDataBuffer(buffer) end
	do return v end
end

function jk.json.JSONParser:setDataString(str)
	self.iterator = _g.jk.lang.CharacterIteratorForString:forString(str)
	do self.iterator:moveToNextChar() end
end

function jk.json.JSONParser:setDataBuffer(buffer)
	self.iterator = _g.jk.lang.CharacterIteratorForBuffer:forBuffer(buffer)
	do self.iterator:moveToNextChar() end
end

function jk.json.JSONParser:skipSpaces()
	while true do
		if self.iterator:hasEnded() then
			do break end
		end
		do
			local c = self.iterator:getCurrentChar()
			if c == 32 or c == 9 or c == 13 or c == 10 then
				do self.iterator:moveToNextChar() end
				goto _continue3
			end
			do break end
		end
		::_continue3::
	end
end

function jk.json.JSONParser:acceptChar(c)
	do self:skipSpaces() end
	if self.iterator:getCurrentChar() == c then
		do self.iterator:moveToNextChar() end
		do return true end
	end
	do return false end
end

function jk.json.JSONParser:acceptString()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss ~= 39 and ss ~= 34 then
			do return nil end
		end
		do
			local i = 0
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			while true do
				local c = self.iterator:getNextChar()
				do i = i + 1 end
				if _g.jk.lang.Character:isEOF(c) then
					do
						local n = 0
						while n < i do
							do self.iterator:moveToPreviousChar() end
							do n = n + 1 end
						end
					end
					do return nil end
				end
				if c == ss then
					do self.iterator:moveToNextChar() end
					do break end
				end
				if c == 92 then
					c = self.iterator:getNextChar()
					if c == 117 then
						local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						local x = 0
						while x < 4 do
							if self.iterator:hasEnded() then
								do break end
							end
							do v:appendCharacter(self.iterator:getNextChar()) end
							do x = x + 1 end
						end
						c = _g.jk.lang.String:toIntegerFromHex(v:toString())
					elseif c == 116 then
						c = 9
					elseif c == 114 then
						c = 13
					elseif c == 110 then
						c = 10
					elseif c == 98 then
						c = 8
					elseif c == 102 then
						c = 12
					end
				end
				do sb:appendCharacter(c) end
			end
			do return sb:toString() end
		end
	end
end

function jk.json.JSONParser:acceptBoolean()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss ~= 116 and ss ~= 102 then
			do return nil end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendCharacter(ss) end
			do
				local li = 5
				if ss == 116 then
					li = 4
				end
				do
					local btc = 0
					while true do
						local c = self.iterator:getNextChar()
						do btc = btc + 1 end
						if c ~= 97 and c ~= 108 and c ~= 115 and c ~= 101 and c ~= 114 and c ~= 117 then
							do self.iterator:moveToNextChar() end
							do btc = btc + 1 end
							do break end
						end
						do sb:appendCharacter(c) end
						if sb:count() == li then
							do self.iterator:moveToNextChar() end
							do btc = btc + 1 end
							do break end
						end
					end
					do
						local v = sb:toString()
						if li == 4 and "true" == v then
							do return _g.jk.lang.Boolean:asObject(true) end
						end
						if li == 5 and "false" == v then
							do return _g.jk.lang.Boolean:asObject(false) end
						end
						do
							local i = 0
							while i < btc do
								do self.iterator:moveToPreviousChar() end
								do i = i + 1 end
							end
							do return nil end
						end
					end
				end
			end
		end
	end
end

function jk.json.JSONParser:acceptNumber()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss ~= 45 and ss ~= 43 and ss ~= 46 and (ss < 48 or ss > 57) then
			do return nil end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendCharacter(ss) end
			while true do
				local c = self.iterator:getNextChar()
				if c ~= 46 and c ~= 101 and c ~= 69 and c ~= 45 and (c < 48 or c > 57) then
					do break end
				end
				do sb:appendCharacter(c) end
			end
			do
				local s = sb:toString()
				if _g.jk.lang.String:getIndexOfCharacter(s, 46, 0) > -1 then
					do return _g.jk.lang.Double:asObject(_g.jk.lang.Double:asDouble(s)) end
				end
				do
					local value = _g.jk.lang.String:toLong(s)
					if value >= -2147483648 and value <= 2147483647 then
						do return _g.jk.lang.Integer:asObject(value) end
					end
					do return _g.jk.lang.LongInteger:asObject(value) end
				end
			end
		end
	end
end

function jk.json.JSONParser:acceptNull()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss ~= 110 then
			do return nil end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendCharacter(ss) end
			do
				local btc = 0
				while true do
					local c = self.iterator:getNextChar()
					do btc = btc + 1 end
					if c ~= 117 and c ~= 108 then
						do self.iterator:moveToNextChar() end
						do btc = btc + 1 end
						do break end
					end
					do sb:appendCharacter(c) end
					if sb:count() == 4 then
						do self.iterator:moveToNextChar() end
						do btc = btc + 1 end
						do break end
					end
				end
				if "null" == sb:toString() then
					do return _g.jk.json.JSONParser.NullObject._construct0(_g.jk.json.JSONParser.NullObject._create()) end
				end
				do
					local i = 0
					while i < btc do
						do self.iterator:moveToPreviousChar() end
						do i = i + 1 end
					end
					do return nil end
				end
			end
		end
	end
end

function jk.json.JSONParser:acceptObject()
	if self:acceptChar(91) then
		local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		while true do
			if self:acceptChar(93) then
				do break end
			end
			do
				local o = self:acceptObject()
				if o == nil then
					do return nil end
				end
				do v:appendObject(o) end
				do self:acceptChar(44) end
			end
		end
		do return v end
	end
	if self:acceptChar(123) then
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		while true do
			if self:acceptChar(125) then
				do break end
			end
			do
				local key = self:acceptString()
				if key == nil then
					do return nil end
				end
				if self:acceptChar(58) == false then
					do return nil end
				end
				do
					local val = self:acceptObject()
					if val == nil then
						do return nil end
					end
					if (_vm:to_table_with_key(val, '_isType.jk.json.JSONParser.NullObject') ~= nil) then
						do v:setObject(key, nil) end
					else
						do v:setObject(key, val) end
					end
					do self:acceptChar(44) end
				end
			end
		end
		do return v end
	end
	do
		local s = self:acceptString()
		if s ~= nil then
			do return s end
		end
		do
			local b = self:acceptBoolean()
			if b ~= nil then
				do return b end
			end
			do
				local n = self:acceptNull()
				if n ~= nil then
					do return n end
				end
				do
					local v = self:acceptNumber()
					if v ~= nil then
						do return v end
					end
					do return nil end
				end
			end
		end
	end
end

function jk.json.JSONParser:getNextToken()
	if self:acceptChar(91) then
		do return "[" end
	end
	if self:acceptChar(93) then
		do return "]" end
	end
	if self:acceptChar(123) then
		do return "{" end
	end
	if self:acceptChar(125) then
		do return "}" end
	end
	if self:acceptChar(44) then
		do return "," end
	end
	do
		local s = self:acceptString()
		if s ~= nil then
			do return s end
		end
		do
			local b = self:acceptBoolean()
			if b ~= nil then
				do return b end
			end
			do
				local n = self:acceptNull()
				if n ~= nil then
					do return n end
				end
				do
					local v = self:acceptNumber()
					if v ~= nil then
						do return v end
					end
					do return nil end
				end
			end
		end
	end
end

function jk.json.JSONParser:pushData(string)
	if not (string ~= nil) then
		do return end
	end
	if self.iterator == nil then
		do self:setDataString(string) end
		do return end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local c = self.iterator:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			do sb:appendCharacter(c) end
		end
		do sb:appendString(string) end
		do self:setDataString(sb:toString()) end
	end
end
jk = jk or {}

jk.server = jk.server or {}

jk.server.NetworkConnectionManager = {}
jk.server.NetworkConnectionManager.__index = jk.server.NetworkConnectionManager
_vm:set_metatable(jk.server.NetworkConnectionManager, {})

function jk.server.NetworkConnectionManager._create()
	local v = _vm:set_metatable({}, jk.server.NetworkConnectionManager)
	return v
end

function jk.server.NetworkConnectionManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkConnectionManager'
	self['_isType.jk.server.NetworkConnectionManager'] = true
	self.logContext = nil
	self.ioManager = nil
	self.maxConnections = 100000
	self.recvBufferSize = 32768
	self.keyFile = nil
	self.certFile = nil
	self.acceptInvalidCertificate = false
	self.passphrase = nil
	self.connections = nil
	self.recvBuffer = nil
end

function jk.server.NetworkConnectionManager:_construct0()
	jk.server.NetworkConnectionManager._init(self)
	return self
end

jk.server.NetworkConnectionManager.ConnectionPool = {}
jk.server.NetworkConnectionManager.ConnectionPool.__index = jk.server.NetworkConnectionManager.ConnectionPool
_vm:set_metatable(jk.server.NetworkConnectionManager.ConnectionPool, {})

function jk.server.NetworkConnectionManager.ConnectionPool._create()
	local v = _vm:set_metatable({}, jk.server.NetworkConnectionManager.ConnectionPool)
	return v
end

function jk.server.NetworkConnectionManager.ConnectionPool:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkConnectionManager.ConnectionPool'
	self['_isType.jk.server.NetworkConnectionManager.ConnectionPool'] = true
	self.connections = nil
	self.nConnection = 0
end

function jk.server.NetworkConnectionManager.ConnectionPool:_construct0()
	jk.server.NetworkConnectionManager.ConnectionPool._init(self)
	return self
end

function jk.server.NetworkConnectionManager.ConnectionPool:initialize(logContext, maxConnections)
	self.connections = _vm:allocate_array(maxConnections)
	do return true end
end

function jk.server.NetworkConnectionManager.ConnectionPool:add(logContext, conn)
	if self.nConnection >= #self.connections then
		do _g.jk.log.Log:error(logContext, "Maximum number of connections exceeded.") end
		do return -1 end
	end
	self.connections[self.nConnection + 1] = conn
	do
		local v = self.nConnection
		do self.nConnection = self.nConnection + 1 end
		do _g.jk.log.Log:debug(logContext, "Added connection to connection pool: Now " .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.nConnection))) .. " connections") end
		do return v end
	end
end

function jk.server.NetworkConnectionManager.ConnectionPool:remove(logContext, index)
	if index < 0 or index >= self.nConnection then
		do return false end
	end
	if not (self.connections[index + 1] ~= nil) then
		do return false end
	end
	do
		local last = self.nConnection - 1
		if last == index then
			self.connections[index + 1] = nil
			do self.nConnection = self.nConnection - 1 end
		else
			self.connections[index + 1] = self.connections[last + 1]
			self.connections[last + 1] = nil
			do
				local ci = self.connections[index + 1]
				do ci:setStorageIndex(index) end
				do self.nConnection = self.nConnection - 1 end
			end
		end
		do _g.jk.log.Log:debug(logContext, "Removed connection from connection pool: Now " .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.nConnection))) .. " connections") end
		do return true end
	end
end

jk.server.NetworkConnectionManager.ConnectionIterator = {}
jk.server.NetworkConnectionManager.ConnectionIterator.__index = jk.server.NetworkConnectionManager.ConnectionIterator
_vm:set_metatable(jk.server.NetworkConnectionManager.ConnectionIterator, {})

function jk.server.NetworkConnectionManager.ConnectionIterator._create()
	local v = _vm:set_metatable({}, jk.server.NetworkConnectionManager.ConnectionIterator)
	return v
end

function jk.server.NetworkConnectionManager.ConnectionIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkConnectionManager.ConnectionIterator'
	self['_isType.jk.server.NetworkConnectionManager.ConnectionIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.pool = nil
	self.current = -1
end

function jk.server.NetworkConnectionManager.ConnectionIterator:_construct0()
	jk.server.NetworkConnectionManager.ConnectionIterator._init(self)
	return self
end

function jk.server.NetworkConnectionManager.ConnectionIterator:next()
	if not (self.pool ~= nil) then
		do return nil end
	end
	do
		local nn = self.current + 1
		if nn >= self.pool.nConnection then
			do return nil end
		end
		do
			local connection = _vm:to_table_with_key(self.pool.connections[nn + 1], '_isType.jk.server.NetworkConnection')
			if not (connection ~= nil) then
				do return nil end
			end
			self.current = nn
			do return connection end
		end
	end
end

function jk.server.NetworkConnectionManager.ConnectionIterator:hasNext()
	if not (self.pool ~= nil) then
		do return false end
	end
	if not (self.current + 1 < self.pool.nConnection - 1) then
		do return false end
	end
	do return true end
end

function jk.server.NetworkConnectionManager.ConnectionIterator:getPool()
	do return self.pool end
end

function jk.server.NetworkConnectionManager.ConnectionIterator:setPool(v)
	self.pool = v
	do return self end
end

function jk.server.NetworkConnectionManager:createConnectionObject()
end

function jk.server.NetworkConnectionManager:setLogContext(ctx)
	self.logContext = ctx
	do return self end
end

function jk.server.NetworkConnectionManager:getLogContext()
	do return self.logContext end
end

function jk.server.NetworkConnectionManager:setIoManager(io)
	self.ioManager = io
	do return self end
end

function jk.server.NetworkConnectionManager:getIoManager()
	do return self.ioManager end
end

function jk.server.NetworkConnectionManager:iterateConnections()
	do return _g.jk.server.NetworkConnectionManager.ConnectionIterator._construct0(_g.jk.server.NetworkConnectionManager.ConnectionIterator._create()):setPool(self.connections) end
end

function jk.server.NetworkConnectionManager:forEachConnection(_function)
	local it = self:iterateConnections()
	if not (it ~= nil) then
		do return end
	end
	while true do
		local cc = it:next()
		if cc == nil then
			do break end
		end
		do _function(cc) end
	end
end

function jk.server.NetworkConnectionManager:isInitialized()
	do return self.connections ~= nil end
end

function jk.server.NetworkConnectionManager:initialize1(ioManager, logContext)
	if not (ioManager ~= nil) then
		do return false end
	end
	do self:setLogContext(logContext) end
	do self:setIoManager(ioManager) end
	do return self:initialize2() end
end

function jk.server.NetworkConnectionManager:initialize2()
	if self.connections ~= nil then
		do _g.jk.log.Log:error(self.logContext, "Already initialized") end
		do return false end
	end
	if not (self.ioManager ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "No IO manager configured for connection server") end
		do return false end
	end
	self.recvBuffer = _util:allocate_buffer(self.recvBufferSize)
	if not (self.recvBuffer ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "Failed to allocate recv buffer") end
		do return false end
	end
	self.connections = _g.jk.server.NetworkConnectionManager.ConnectionPool._construct0(_g.jk.server.NetworkConnectionManager.ConnectionPool._create())
	if not self.connections:initialize(self.logContext, self.maxConnections) then
		do _g.jk.log.Log:error(self.logContext, "Failed to initialize connection pool") end
		self.connections = nil
		self.recvBuffer = nil
		do return false end
	end
	do return true end
end

function jk.server.NetworkConnectionManager:cleanup()
	self.connections = nil
end

function jk.server.NetworkConnectionManager:onNewSocket(socket)
	local s = socket
	if not (s ~= nil) then
		do return end
	end
	if self.certFile ~= nil then
		local sslSocket = _g.jk.socket.ssl.SSLSocket:forServer(s, self.certFile, self.keyFile, self.logContext, self.acceptInvalidCertificate, self.passphrase)
		if not (sslSocket ~= nil) then
			do _g.jk.log.Log:error(self.logContext, "Failed to create SSL socket") end
			do s:close() end
			do return end
		end
		s = sslSocket
		do _g.jk.log.Log:debug(self.logContext, "SSL socket created successfully") end
	end
	do
		local connection = self:createConnectionObject()
		if not (connection ~= nil) then
			do _g.jk.log.Log:error(self.logContext, "Failed to create TCP server connection object instance for incoming connection") end
			do s:close() end
			do return end
		end
		if not connection:doInitialize(self.logContext, s, self) then
			do _g.jk.log.Log:error(self.logContext, "Failed to initialize the new connection instance. Closing connection.") end
			do s:close() end
			do return end
		end
		if not self:addConnection(connection) then
			do _g.jk.log.Log:error(self.logContext, "Failed to add a new connection instance. Closing connection.") end
			do connection:close() end
			do return end
		end
		do connection:onOpened() end
	end
end

function jk.server.NetworkConnectionManager:addConnection(connection)
	if not (connection ~= nil and self.ioManager ~= nil) then
		do return false end
	end
	do
		local es = self.ioManager:add(connection:getSocket())
		if not (es ~= nil) then
			do return false end
		end
		if not connection:setIoEntry(es) then
			do es:remove() end
			do return false end
		end
		do
			local idx = self.connections:add(self.logContext, connection)
			if idx < 0 then
				do return false end
			end
			do connection:setStorageIndex(idx) end
			do return true end
		end
	end
end

function jk.server.NetworkConnectionManager:onConnectionClosed(connection)
	if not (connection ~= nil) then
		do return end
	end
	do connection:closeSocket() end
	do
		local es = connection:getIoEntry()
		if es ~= nil then
			do es:remove() end
			do connection:setIoEntry(nil) end
		end
		do
			local si = connection:getStorageIndex()
			if si >= 0 then
				do self.connections:remove(self.logContext, si) end
				do connection:setStorageIndex(-1) end
			end
		end
	end
end

function jk.server.NetworkConnectionManager:getReceiveBuffer()
	do return self.recvBuffer end
end

function jk.server.NetworkConnectionManager:getMaxConnections()
	do return self.maxConnections end
end

function jk.server.NetworkConnectionManager:setMaxConnections(v)
	self.maxConnections = v
	do return self end
end

function jk.server.NetworkConnectionManager:getRecvBufferSize()
	do return self.recvBufferSize end
end

function jk.server.NetworkConnectionManager:setRecvBufferSize(v)
	self.recvBufferSize = v
	do return self end
end

function jk.server.NetworkConnectionManager:getKeyFile()
	do return self.keyFile end
end

function jk.server.NetworkConnectionManager:setKeyFile(v)
	self.keyFile = v
	do return self end
end

function jk.server.NetworkConnectionManager:getCertFile()
	do return self.certFile end
end

function jk.server.NetworkConnectionManager:setCertFile(v)
	self.certFile = v
	do return self end
end

function jk.server.NetworkConnectionManager:getAcceptInvalidCertificate()
	do return self.acceptInvalidCertificate end
end

function jk.server.NetworkConnectionManager:setAcceptInvalidCertificate(v)
	self.acceptInvalidCertificate = v
	do return self end
end

function jk.server.NetworkConnectionManager:getPassphrase()
	do return self.passphrase end
end

function jk.server.NetworkConnectionManager:setPassphrase(v)
	self.passphrase = v
	do return self end
end

jk.server.DirectoryLoggingContext = {}
jk.server.DirectoryLoggingContext.__index = jk.server.DirectoryLoggingContext
_vm:set_metatable(jk.server.DirectoryLoggingContext, {})

function jk.server.DirectoryLoggingContext._create()
	local v = _vm:set_metatable({}, jk.server.DirectoryLoggingContext)
	return v
end

function jk.server.DirectoryLoggingContext:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.DirectoryLoggingContext'
	self['_isType.jk.server.DirectoryLoggingContext'] = true
	self['_isType.jk.log.LoggingContext'] = true
	self.logDir = nil
	self.logIdPrefix = "messages"
	self.currentLogIdName = nil
	self.os = nil
	self.ctx = nil
	self.enableDebugMessages = true
	self.alsoPrintOnConsole = false
	self.errorCount = 0
	self.warningCount = 0
	self.infoCount = 0
	self.debugCount = 0
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.server.DirectoryLoggingContext:_construct0()
	jk.server.DirectoryLoggingContext._init(self)
	return self
end

function jk.server.DirectoryLoggingContext:create(logDir, logIdPrefix, dbg)
	local v = _g.jk.server.DirectoryLoggingContext._construct0(_g.jk.server.DirectoryLoggingContext._create())
	do v:setLogDir(logDir) end
	do v:setEnableDebugMessages(dbg) end
	if _g.jk.lang.String:isNotEmpty(logIdPrefix) then
		do v:setLogIdPrefix(logIdPrefix) end
	end
	do return v end
end

function jk.server.DirectoryLoggingContext:setEnableDebugMessages(value)
	self.enableDebugMessages = value
	do
		local cac = _vm:to_table_with_key(self.ctx, '_isType.jk.console.ConsoleApplicationContext')
		if cac ~= nil then
			do cac:setEnableDebugMessages(self.enableDebugMessages) end
		end
	end
end

function jk.server.DirectoryLoggingContext:setAlsoPrintOnConsole(value)
	self.alsoPrintOnConsole = value
	if self.alsoPrintOnConsole then
		self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create()):setEnableDebugMessages(self.enableDebugMessages)
		do return end
	end
	self.ctx = nil
end

function jk.server.DirectoryLoggingContext:logError(text)
	do self:message("ERROR", text) end
	do self.errorCount = self.errorCount + 1 end
end

function jk.server.DirectoryLoggingContext:logWarning(text)
	do self:message("WARNING", text) end
	do self.warningCount = self.warningCount + 1 end
end

function jk.server.DirectoryLoggingContext:logInfo(text)
	do self:message("INFO", text) end
	do self.infoCount = self.infoCount + 1 end
end

function jk.server.DirectoryLoggingContext:logDebug(text)
	do self:message("DEBUG", text) end
	do self.debugCount = self.debugCount + 1 end
end

function jk.server.DirectoryLoggingContext:logStatus(text)
	do self:message("STATUS", text) end
end

function jk.server.DirectoryLoggingContext:message(type, text)
	if not self.enableDebugMessages and _g.jk.lang.String:equalsIgnoreCase("debug", type) then
		do return end
	end
	do
		local dt = _g.jk.time.SystemClock:asDateTimeUTC()
		local logTime = nil
		if dt ~= nil then
			logTime = _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getYear())) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getMonth(), 2, nil)) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getDayOfMonth(), 2, nil)) .. " " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getHours(), 2, nil)) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getMinutes(), 2, nil)) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getSeconds(), 2, nil)) .. " UTC"
		else
			logTime = "DATE/TIME"
		end
		do
			local logLine = "[" .. _g.jk.lang.String:safeString(logTime) .. "]: " .. _g.jk.lang.String:safeString(text)
			if self.alsoPrintOnConsole then
				if "ERROR" == type then
					do _g.jk.log.Log:error(self.ctx, logLine) end
				elseif "WARNING" == type then
					do _g.jk.log.Log:warning(self.ctx, logLine) end
				elseif "INFO" == type then
					do _g.jk.log.Log:info(self.ctx, logLine) end
				elseif "DEBUG" == type then
					do _g.jk.log.Log:debug(self.ctx, logLine) end
				elseif "STATUS" == type then
					do _g.jk.log.Log:status(self.ctx, logLine) end
				end
			end
			logLine = "[" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:padToLength(type, 7, -1, 32)) .. "] " .. _g.jk.lang.String:safeString(logLine)
			if self.logDir ~= nil then
				local logIdName = nil
				if dt ~= nil then
					logIdName = _g.jk.lang.String:safeString(self.logIdPrefix) .. "_" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getYear())) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getMonth(), 2, nil)) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getDayOfMonth(), 2, nil)) .. ".log"
				else
					logIdName = _g.jk.lang.String:safeString(self.logIdPrefix) .. ".log"
				end
				if not (self.os ~= nil) or not (self.currentLogIdName == logIdName) then
					self.currentLogIdName = logIdName
					self.os = _g.jk.io.PrintWriterWrapper:forWriter(self.logDir:entry(self.currentLogIdName):append())
					if not (self.os ~= nil) and not self.logDir:isDirectory() then
						do self.logDir:createDirectoryRecursive() end
						self.os = _g.jk.io.PrintWriterWrapper:forWriter(self.logDir:entry(self.currentLogIdName):append())
					end
				end
				if self.os ~= nil then
					if not self.os:println(logLine) then
						do return end
					end
					if (_vm:to_table_with_key(self.os, '_isType.jk.io.FlushableWriter') ~= nil) then
						do self.os:flush() end
					end
				end
			end
		end
	end
end

function jk.server.DirectoryLoggingContext:isInDebugMode()
	do return self.enableDebugMessages end
end

function jk.server.DirectoryLoggingContext:getErrorCount()
	do return self.errorCount end
end

function jk.server.DirectoryLoggingContext:getWarningCount()
	do return self.warningCount end
end

function jk.server.DirectoryLoggingContext:getInfoCount()
	do return self.infoCount end
end

function jk.server.DirectoryLoggingContext:getDebugCount()
	do return self.debugCount end
end

function jk.server.DirectoryLoggingContext:resetCounters()
	self.errorCount = 0
	self.warningCount = 0
	self.infoCount = 0
	self.debugCount = 0
end

function jk.server.DirectoryLoggingContext:_destruct()
	if self.os ~= nil then
		if (_vm:to_table_with_key(self.os, '_isType.jk.lang.Closable') ~= nil) then
			do self.os:close() end
		end
		self.os = nil
	end
end

function jk.server.DirectoryLoggingContext:getLogDir()
	do return self.logDir end
end

function jk.server.DirectoryLoggingContext:setLogDir(v)
	self.logDir = v
	do return self end
end

function jk.server.DirectoryLoggingContext:getLogIdPrefix()
	do return self.logIdPrefix end
end

function jk.server.DirectoryLoggingContext:setLogIdPrefix(v)
	self.logIdPrefix = v
	do return self end
end

jk.server.CommonServer = {}
jk.server.CommonServer.__index = jk.server.CommonServer
_vm:set_metatable(jk.server.CommonServer, {})

function jk.server.CommonServer._create()
	local v = _vm:set_metatable({}, jk.server.CommonServer)
	return v
end

function jk.server.CommonServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.CommonServer'
	self['_isType.jk.server.CommonServer'] = true
	self.listenPort = 0
	self.loggingDirectory = nil
	self.configFile = nil
	self.enableDebugMessages = false
	self.duplicateLoggingOnConsole = false
	self.ctx = nil
	self.configuration = {}
end

function jk.server.CommonServer:_construct0()
	jk.server.CommonServer._init(self)
	self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	do self:initConfigValue("LISTEN_PORT", "8080") end
	do self:initConfigValue("LOGGING_DIRECTORY", nil) end
	do self:initConfigValue("ENABLE_DEBUG_MESSAGES", "false") end
	do self:initConfigValue("DUPLICATE_LOGGING_ON_CONSOLE", "false") end
	return self
end

function jk.server.CommonServer:getLoggingDirectory()
	do return self.loggingDirectory end
end

function jk.server.CommonServer:getListenPort()
	do return self.listenPort end
end

function jk.server.CommonServer:getConfigfromEnvironment(name)
	if not (name ~= nil) then
		do return nil end
	end
	do
		local depvar = "SYMPATHY_" .. _g.jk.lang.String:safeString(name)
		local v = _g.jk.env.EnvironmentVariable:get(depvar)
		if v ~= nil then
			do _g.jk.log.Log:warning(self.ctx, "Accepting deprecated configuration variable `" .. _g.jk.lang.String:safeString(depvar) .. "'. Use `" .. _g.jk.lang.String:safeString(name) .. "' instead.") end
			do return v end
		end
		do return _g.jk.env.EnvironmentVariable:get(name) end
	end
end

function jk.server.CommonServer:getConfigFileDirectory()
	if self.configFile == nil then
		do return nil end
	end
	do return self.configFile:getParent() end
end

function jk.server.CommonServer:onMaintenance()
end

function jk.server.CommonServer:initConfigValue(key, defaultValue)
	if not (key ~= nil) then
		do return end
	end
	do
		local vv = self:getConfigfromEnvironment(key)
		if not (vv ~= nil) then
			vv = defaultValue
		end
		do self:doConfigure(key, vv, nil) end
	end
end

function jk.server.CommonServer:setConfigValue(key, value)
	do self:doConfigure(key, value, nil) end
	do return self end
end

function jk.server.CommonServer:configure(key, value, relativeTo, error)
	if key == "LISTEN_PORT" or key == "listenPort" then
		self.listenPort = _g.jk.lang.Integer:asInteger(value)
		do return true end
	end
	if key == "LOGGING_DIRECTORY" or key == "loggingDirectory" then
		if _g.jk.lang.String:isNotEmpty(value) then
			self.loggingDirectory = _g.jk.fs.File:forRelativePath(value, relativeTo, false)
		else
			self.loggingDirectory = nil
		end
		do return true end
	end
	if key == "ENABLE_DEBUG_MESSAGES" or key == "enableDebugMessages" then
		self.enableDebugMessages = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	if key == "DUPLICATE_LOGGING_ON_CONSOLE" or key == "duplicateLoggingOnConsole" then
		self.duplicateLoggingOnConsole = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	do return false end
end

function jk.server.CommonServer:doConfigure(key, value, relativeTo)
	local error = _g.jk.lang.Error._construct0(_g.jk.lang.Error._create())
	local vv = value
	if not (vv ~= nil) then
		vv = ""
	end
	if self:configure(key, vv, relativeTo, error) == false then
		if _g.jk.lang.String:isEmpty(error:getCode()) then
			do error:setCode("unsupportedConfigurationOption") end
			do error:setDetail(key) end
		end
		do _g.jk.log.Log:error(self.ctx, _g.jk.log.Log:asString(self.ctx, error)) end
		do return false end
	end
	do _g.jk.lang.Map:set(self.configuration, key, vv) end
	do return true end
end

function jk.server.CommonServer:printUsage(stdout)
	local flags = {
		{
			"debug",
			"Enable debug messages in logging"
		},
		{
			"v|version|vv",
			"Display version information"
		},
		{
			"h|help",
			"Usage information"
		}
	}
	local options = {
		{
			"config",
			"Specify a configuration file to use"
		},
		{
			"listen",
			"Specify the TCP port to listen to"
		},
		{
			"O<option>",
			"Manually specify configuration parameters (key/value pairs)"
		}
	}
	do _g.jk.console.ConsoleApplicationUtil:printUsage(stdout, nil, nil, flags, options) end
end

function jk.server.CommonServer:printHeader(stdout)
end

function jk.server.CommonServer:printVersion(stdout, longFormat)
end

function jk.server.CommonServer:logServerConfiguration()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("Server configuration:") end
	do
		local keys = _g.jk.lang.Map:getKeys(self.configuration)
		do _g.jk.lang.Vector:sortAsStrings(keys) end
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = keys[n + 1]
					if key ~= nil then
						do sb:appendString("\n  ") end
						do sb:appendString(key) end
						do sb:appendString(": ") end
						do sb:appendString(_g.jk.lang.Map:get(self.configuration, key)) end
					end
					do n = n + 1 end
				end
			end
		end
		do _g.jk.log.Log:info(self.ctx, sb:toString()) end
	end
end

function jk.server.CommonServer:acceptCommandLineArgument(arg)
	do return false end
end

function jk.server.CommonServer:execute(args)
	local stdout = _g.jk.console.Stdout:instance()
	local arguments = _g.jk.console.ConsoleApplicationUtil:parseCommandLineArguments(args)
	if arguments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(arguments)
		do
			n = 0
			while n < m do
				local arg = arguments[n + 1]
				if arg ~= nil then
					if arg:isFlag2("v") or arg:isFlag2("version") then
						do self:printVersion(stdout, false) end
						do return true end
					elseif arg:isFlag2("vv") then
						do self:printVersion(stdout, true) end
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do self:printHeader(stdout) end
	do
		local showHelp = false
		local options = _g.jk.lang.KeyValueListForStrings._construct0(_g.jk.lang.KeyValueListForStrings._create())
		if arguments ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(arguments)
			do
				n2 = 0
				while n2 < m2 do
					local arg = arguments[n2 + 1]
					if arg ~= nil then
						if arg:isOption2("config") then
							if self.configFile ~= nil then
								do _g.jk.log.Log:error(self.ctx, "Duplicate config file parameter supplied: `" .. _g.jk.lang.String:safeString(arg:getComplete()) .. "'") end
								do return false end
							end
							self.configFile = _g.jk.fs.File:forPath(arg:getStringValue())
						elseif arg:isFlag2("help") or arg:isFlag2("h") then
							showHelp = true
						elseif arg:isFlag2("debug") then
							self.enableDebugMessages = true
						elseif arg:isOption2("listen") then
							self.listenPort = arg:getIntegerValue()
						elseif arg.key ~= nil and _g.jk.lang.String:startsWith(arg.key, "O", 0) then
							local key = _g.jk.lang.String:getEndOfString(arg.key, 1)
							if _g.jk.lang.String:isEmpty(key) then
								do _g.jk.log.Log:error(self.ctx, "Invalid option parameter: `" .. _g.jk.lang.String:safeString(arg:getComplete()) .. "'") end
								do return false end
							end
							do options:add(key, arg:getStringValue()) end
						elseif self:acceptCommandLineArgument(arg) then
						else
							do arg:reportAsUnsupported(self.ctx) end
							do return false end
						end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		if showHelp then
			do self:printUsage(stdout) end
			do return true end
		end
		if self.configFile ~= nil then
			local config = _g.jk.server.SimpleConfigFile:forFile(self.configFile)
			if config == nil then
				do _g.jk.log.Log:error(self.ctx, "Failed to read configuration file: `" .. _g.jk.lang.String:safeString(self.configFile:getPath()) .. "'") end
				do return false end
			end
			do
				local it = config:iterate()
				while it ~= nil do
					local kvp = it:next()
					if kvp == nil then
						do break end
					end
					do
						local key = kvp.key
						local value = kvp.value
						if self:doConfigure(key, value, self.configFile:getParent()) == false then
							do return false end
						end
					end
				end
			end
		end
		do
			local oit = options:iterate()
			while oit ~= nil do
				local kvp = oit:next()
				if kvp == nil then
					do break end
				end
				do
					local key = kvp.key
					local value = kvp.value
					if self:doConfigure(key, value, nil) == false then
						do return false end
					end
				end
			end
			if self.loggingDirectory ~= nil then
				do _g.jk.log.Log:debug(self.ctx, "Configuring logging to directory: `" .. _g.jk.lang.String:safeString(self.loggingDirectory:getPath()) .. "'") end
				do
					local dlc = _g.jk.server.DirectoryLoggingContext:create(self.loggingDirectory, nil, true)
					if self.enableDebugMessages then
						do dlc:setEnableDebugMessages(true) end
					end
					do dlc:setAlsoPrintOnConsole(self.duplicateLoggingOnConsole) end
					self.ctx = dlc
				end
			else
				local cac = _vm:to_table_with_key(self.ctx, '_isType.jk.console.ConsoleApplicationContext')
				if cac ~= nil and self.enableDebugMessages then
					do cac:setEnableDebugMessages(true) end
				end
			end
			do return self:executeServer() end
		end
	end
end

function jk.server.CommonServer:executeMain(args)
	do return (function(a, b, c)
		if a then
			do return b() end
		end
		do return c() end
	end)(self:execute(args), function()
		do return 0 end
	end, function()
		do return 1 end
	end) end
end

function jk.server.CommonServer:initializeWithIOManager(ioManager, ctx)
	do return true end
end

function jk.server.CommonServer:initializeNetworkServer(server)
	do return true end
end

function jk.server.CommonServer:initializeApplication()
	do return true end
end

function jk.server.CommonServer:createServer()
end

function jk.server.CommonServer:executeServer()
	do self:logServerConfiguration() end
	if not self:initializeApplication() then
		do _g.jk.log.Log:error(self.ctx, "Failed to initialize application") end
		do return false end
	end
	do
		local server = self:createServer()
		if not (server ~= nil) then
			do _g.jk.log.Log:error(self.ctx, "Failed to create server object") end
			do return false end
		end
		if not self:initializeNetworkServer(server) then
			do _g.jk.log.Log:error(self.ctx, "Failed to configure HTTP server") end
			do return false end
		end
		do
			local ioManager = _g.jk.socket.io.IOManager:createDefault()
			if not (ioManager ~= nil) then
				do _g.jk.log.Log:error(self.ctx, "FAILED to create IO manager") end
				do return false end
			end
			do _g.jk.socket.io.IOManager:setCurrent(ioManager) end
			if not server:initialize1(ioManager, self.ctx) then
				do _g.jk.log.Log:error(self.ctx, "Failed to initialize HTTP server.") end
				do return false end
			end
			if not self:initializeWithIOManager(ioManager, self.ctx) then
				do _g.jk.log.Log:error(self.ctx, "Failed to initialize with IOManager") end
				do return false end
			end
			if not ioManager:execute(self.ctx) then
				do _g.jk.log.Log:error(self.ctx, "Failed to execute IO manager") end
				do return false end
			end
			do _g.jk.log.Log:info(self.ctx, "Exiting normally.") end
			do return true end
		end
	end
end

jk.server.SimpleConfigFile = {}
jk.server.SimpleConfigFile.__index = jk.server.SimpleConfigFile
_vm:set_metatable(jk.server.SimpleConfigFile, {})

function jk.server.SimpleConfigFile._create()
	local v = _vm:set_metatable({}, jk.server.SimpleConfigFile)
	return v
end

function jk.server.SimpleConfigFile:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.SimpleConfigFile'
	self['_isType.jk.server.SimpleConfigFile'] = true
	self.data = nil
	self.mapData = nil
	self.file = nil
end

function jk.server.SimpleConfigFile:forFile(file)
	local v = _g.jk.server.SimpleConfigFile._construct0(_g.jk.server.SimpleConfigFile._create())
	if not v:read(file) then
		do return nil end
	end
	do return v end
end

function jk.server.SimpleConfigFile:forMap(map)
	local v = _g.jk.server.SimpleConfigFile._construct0(_g.jk.server.SimpleConfigFile._create())
	do v:setDataAsMap(map) end
	do return v end
end

function jk.server.SimpleConfigFile:readFileAsMap(file)
	local cf = _g.jk.server.SimpleConfigFile:forFile(file)
	if not (cf ~= nil) then
		do return nil end
	end
	do return cf:getDataAsMap() end
end

function jk.server.SimpleConfigFile:_construct0()
	jk.server.SimpleConfigFile._init(self)
	self.data = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	return self
end

function jk.server.SimpleConfigFile:getFile()
	do return self.file end
end

function jk.server.SimpleConfigFile:getRelativeFile(fileName)
	if not (self.file ~= nil) then
		do return nil end
	end
	if not (fileName ~= nil) then
		do return nil end
	end
	do
		local p = self.file:getParent()
		if not (p ~= nil) then
			do return nil end
		end
		do return p:entry(fileName) end
	end
end

function jk.server.SimpleConfigFile:clear()
	do self.data:clear() end
	self.mapData = nil
end

function jk.server.SimpleConfigFile:setDataAsMap(map)
	do self:clear() end
	do
		local keys = map:iterateKeys()
		while keys ~= nil do
			local key = keys:next()
			if not (key ~= nil) then
				do break end
			end
			do self.data:add(key, map:getString(key, nil)) end
		end
		do return self end
	end
end

function jk.server.SimpleConfigFile:getDataAsMap()
	if not (self.mapData ~= nil) then
		self.mapData = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do
			local it = self.data:iterate()
			while it ~= nil do
				local kvp = it:next()
				if not (kvp ~= nil) then
					do break end
				end
				do self.mapData:setString(kvp.key, kvp.value) end
			end
		end
	end
	do return self.mapData end
end

function jk.server.SimpleConfigFile:getDynamicMapValue(key, defval)
	local str = self:getStringValue(key, nil)
	if not (str ~= nil) then
		do return defval end
	end
	do
		local v = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(str), '_isType.jk.lang.DynamicMap')
		if not (v ~= nil) then
			do return defval end
		end
		do return v end
	end
end

function jk.server.SimpleConfigFile:getDynamicVectorValue(key, defval)
	local str = self:getStringValue(key, nil)
	if not (str ~= nil) then
		do return defval end
	end
	do
		local v = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(str), '_isType.jk.lang.DynamicVector')
		if not (v ~= nil) then
			do return defval end
		end
		do return v end
	end
end

function jk.server.SimpleConfigFile:getStringValue(key, defval)
	local map = self:getDataAsMap()
	if not (map ~= nil) then
		do return defval end
	end
	do
		local v = map:getString(key, nil)
		if not (v ~= nil) then
			do return defval end
		end
		if _g.jk.lang.String:startsWith(v, "\"\"\"\n", 0) and _g.jk.lang.String:endsWith(v, "\n\"\"\"") then
			v = _g.jk.lang.String:getSubString(v, 4, _g.jk.lang.String:getLength(v) - 8)
		end
		do return v end
	end
end

function jk.server.SimpleConfigFile:getIntegerValue(key, defval)
	local map = self:getDataAsMap()
	if not (map ~= nil) then
		do return defval end
	end
	do return map:getInteger(key, defval) end
end

function jk.server.SimpleConfigFile:getDoubleValue(key, defval)
	local map = self:getDataAsMap()
	if not (map ~= nil) then
		do return defval end
	end
	do return map:getDouble(key, defval) end
end

function jk.server.SimpleConfigFile:getBooleanValue(key, defval)
	local map = self:getDataAsMap()
	if not (map ~= nil) then
		do return defval end
	end
	do return map:getBoolean(key, defval) end
end

function jk.server.SimpleConfigFile:getFileValue(key, defval)
	local v = self:getRelativeFile(self:getStringValue(key, nil))
	if not (v ~= nil) then
		do return defval end
	end
	do return v end
end

function jk.server.SimpleConfigFile:iterate()
	if not (self.data ~= nil) then
		do return nil end
	end
	do return self.data:iterate() end
end

function jk.server.SimpleConfigFile:read(file)
	if not (file ~= nil) then
		do return false end
	end
	do
		local reader = file:read()
		if not (reader ~= nil) then
			do return false end
		end
		do
			local ins = _g.jk.io.PrintReader:forReader(reader)
			local line = nil
			local tag = nil
			local lineBuffer = nil
			local terminator = nil
			while (function()
				line = ins:readLine()
				do return line end
			end)() ~= nil do
				if lineBuffer ~= nil then
					do lineBuffer:appendString(line) end
					if line == terminator then
						line = lineBuffer:toString()
						lineBuffer = nil
						terminator = nil
					else
						do lineBuffer:appendCharacter(10) end
						goto _continue1
					end
				end
				line = _g.jk.lang.String:strip(line)
				if _g.jk.lang.String:isEmpty(line) or _g.jk.lang.String:startsWith(line, "#", 0) then
					goto _continue1
				end
				if _g.jk.lang.String:endsWith(line, "{") then
					if _g.jk.lang.String:getIndexOfCharacter(line, 58, 0) < 0 then
						if not (tag ~= nil) then
							tag = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 0, _g.jk.lang.String:getLength(line) - 1))
						end
						goto _continue1
					else
						lineBuffer = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						do lineBuffer:appendString(line) end
						do lineBuffer:appendCharacter(10) end
						terminator = "}"
						goto _continue1
					end
				end
				if _g.jk.lang.String:endsWith(line, "[") then
					lineBuffer = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do lineBuffer:appendString(line) end
					do lineBuffer:appendCharacter(10) end
					terminator = "]"
					goto _continue1
				end
				if _g.jk.lang.String:endsWith(line, "\"\"\"") then
					lineBuffer = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do lineBuffer:appendString(line) end
					do lineBuffer:appendCharacter(10) end
					terminator = "\"\"\""
					goto _continue1
				end
				if tag ~= nil and line == "}" then
					tag = nil
					goto _continue1
				end
				do
					local sp = _g.jk.lang.String:split(line, 58, 2)
					if not (sp ~= nil) then
						goto _continue1
					end
					do
						local key = _g.jk.lang.String:strip(_g.jk.lang.Vector:get(sp, 0))
						local val = _g.jk.lang.String:strip(_g.jk.lang.Vector:get(sp, 1))
						if _g.jk.lang.String:startsWith(val, "\"", 0) and _g.jk.lang.String:endsWith(val, "\"") then
							val = _g.jk.lang.String:getSubString(val, 1, _g.jk.lang.String:getLength(val) - 2)
						end
						if _g.jk.lang.String:isEmpty(key) then
							goto _continue1
						end
						if tag ~= nil then
							key = _g.jk.lang.String:safeString(key) .. "[" .. _g.jk.lang.String:safeString(tag) .. "]"
						end
						do self.data:add(key, val) end
					end
				end
				::_continue1::
			end
			self.file = file
			do reader:close() end
			do return true end
		end
	end
end

function jk.server.SimpleConfigFile:write(outfile)
	if not (outfile ~= nil) then
		do return false end
	end
	if not (self.data ~= nil) then
		do return false end
	end
	do
		local wr = outfile:write()
		if not (wr ~= nil) then
			do return false end
		end
		do
			local os = _g.jk.io.PrintWriterWrapper:forWriter(wr)
			if os ~= nil then
				local it = self.data:iterate()
				while it ~= nil do
					local kvp = it:next()
					if not (kvp ~= nil) then
						do break end
					end
					do os:println(_g.jk.lang.String:safeString(kvp.key) .. ": " .. _g.jk.lang.String:safeString(kvp.value)) end
				end
			end
			do wr:close() end
			do return true end
		end
	end
end

jk.server.NetworkServer = _g.jk.server.NetworkConnectionManager._create()
jk.server.NetworkServer.__index = jk.server.NetworkServer
_vm:set_metatable(jk.server.NetworkServer, {
	__index = _g.jk.server.NetworkConnectionManager
})

function jk.server.NetworkServer._create()
	local v = _vm:set_metatable({}, jk.server.NetworkServer)
	return v
end

function jk.server.NetworkServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkServer'
	self['_isType.jk.server.NetworkServer'] = true
	self.port = 0
	self.socket = nil
	self.esocket = nil
	self.acceptBatchSize = 0
end

function jk.server.NetworkServer:_construct0()
	jk.server.NetworkServer._init(self)
	do _g.jk.server.NetworkConnectionManager._construct0(self) end
	return self
end

function jk.server.NetworkServer:initialize2()
	if not _g.jk.server.NetworkConnectionManager.initialize2(self) then
		do return false end
	end
	if not ((function()
		self.socket = _g.jk.socket.TCPSocket:createAndListen(self.port)
		do return self.socket end
	end)() ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "Failed to listen on TCP port " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.port))) end
		do self:cleanup() end
		do return false end
	end
	if self.socket:setBlocking(false) == true then
		self.acceptBatchSize = 1024
	else
		self.acceptBatchSize = 1
	end
	if not ((function()
		self.esocket = self.ioManager:addWithReadListener(self.socket, function()
			do self:onIncomingConnection() end
		end)
		do return self.esocket end
	end)() ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "Failed to register with event loop") end
		do self:cleanup() end
		do return false end
	end
	do _g.jk.log.Log:info(self.logContext, "TCP server initialized, listening on port " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.port))) end
	do return true end
end

function jk.server.NetworkServer:cleanup()
	if self.esocket ~= nil then
		do self.esocket:remove() end
		self.esocket = nil
	end
	if self.socket ~= nil then
		do self.socket:close() end
		self.socket = nil
	end
	do _g.jk.server.NetworkConnectionManager.cleanup(self) end
end

function jk.server.NetworkServer:onIncomingConnection()
	do
		local _status, _err = _vm:execute_protected_call(function()
			local n = 0
			while true do
				if n >= self.acceptBatchSize then
					do break end
				end
				do
					local nn = self.socket:accept()
					if not (nn ~= nil) then
						do break end
					end
					do self:onNewSocket(nn) end
					do n = n + 1 end
				end
			end
		end)
		if _err then
			local e = _err
			do _g.jk.log.Log:error(self.logContext, "onIncomingConnection: " .. _g.jk.lang.String:safeString(_g.jk.log.Log:asString(self.logContext, e))) end
		end
	end
end

function jk.server.NetworkServer:getPort()
	do return self.port end
end

function jk.server.NetworkServer:setPort(v)
	self.port = v
	do return self end
end

jk.server.NetworkConnection = {}
jk.server.NetworkConnection.__index = jk.server.NetworkConnection
_vm:set_metatable(jk.server.NetworkConnection, {})

jk.server.NetworkConnection.idcounter = 0

function jk.server.NetworkConnection._create()
	local v = _vm:set_metatable({}, jk.server.NetworkConnection)
	return v
end

function jk.server.NetworkConnection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkConnection'
	self['_isType.jk.server.NetworkConnection'] = true
	self.storageIndex = 0
	self.ioEntry = nil
	self.id = 0
	self.logContext = nil
	self.socket = nil
	self.lastActivity = 0
	self.remoteAddress = nil
	self.currentListenMode = -1
	self.manager = nil
	self.defaultListenMode = 1
end

function jk.server.NetworkConnection:_construct0()
	jk.server.NetworkConnection._init(self)
	self.id = (function() local v = _g.jk.server.NetworkConnection.idcounter _g.jk.server.NetworkConnection.idcounter = _g.jk.server.NetworkConnection.idcounter + 1 return v end)()
	return self
end

function jk.server.NetworkConnection:getId()
	do return self.id end
end

function jk.server.NetworkConnection:exportSocket()
	local v = self.socket
	self.socket = nil
	do return v end
end

function jk.server.NetworkConnection:getSocket()
	do return self.socket end
end

function jk.server.NetworkConnection:getManager()
	do return self.manager end
end

function jk.server.NetworkConnection:getLastActivity()
	do return self.lastActivity end
end

function jk.server.NetworkConnection:getRemoteAddress()
	if self.remoteAddress == nil then
		local ts = _vm:to_table_with_key(self.socket, '_isType.jk.socket.TCPSocket')
		if ts ~= nil then
			self.remoteAddress = _g.jk.lang.String:safeString(ts:getRemoteAddress()) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(ts:getRemotePort()))
		end
	end
	do return self.remoteAddress end
end

function jk.server.NetworkConnection:logDebug(text)
	do _g.jk.log.Log:debug(self.logContext, "[Connection:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self:getId())) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function jk.server.NetworkConnection:logInfo(text)
	do _g.jk.log.Log:info(self.logContext, "[Connection:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self:getId())) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function jk.server.NetworkConnection:logWarning(text)
	do _g.jk.log.Log:warning(self.logContext, "[Connection:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self:getId())) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function jk.server.NetworkConnection:logError(text)
	do _g.jk.log.Log:error(self.logContext, "[Connection:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self:getId())) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function jk.server.NetworkConnection:onActivity()
	self.lastActivity = _g.jk.time.SystemClock:asSeconds()
end

function jk.server.NetworkConnection:initialize()
	do return true end
end

function jk.server.NetworkConnection:cleanup()
end

function jk.server.NetworkConnection:doInitialize(logContext, socket, manager)
	self.logContext = logContext
	self.socket = socket
	self.manager = manager
	if not self:initialize() then
		do return false end
	end
	do self:onActivity() end
	do return true end
end

function jk.server.NetworkConnection:getIoEntry()
	do return self.ioEntry end
end

function jk.server.NetworkConnection:setIoEntry(entry)
	local v = false
	self.ioEntry = entry
	self.currentListenMode = -1
	if entry ~= nil then
		v = self:setListenMode(self:getDefaultListenMode())
	end
	do return v end
end

function jk.server.NetworkConnection:sendData(data, size)
	if self.socket == nil then
		do return 0 end
	end
	do
		local v = self.socket:write(data, size)
		if v < 0 then
			do self:close() end
		end
		do self:onActivity() end
		do return v end
	end
end

function jk.server.NetworkConnection:close()
	local ss = self.socket
	self.socket = nil
	if self.ioEntry ~= nil then
		do self.ioEntry:remove() end
		self.ioEntry = nil
	end
	if ss ~= nil then
		do ss:close() end
	end
	if self.manager ~= nil then
		do self.manager:onConnectionClosed(self) end
	end
	do self:cleanup() end
	do self:onClosed() end
	self.socket = nil
	self.manager = nil
end

function jk.server.NetworkConnection:closeSocket()
	if self.socket ~= nil then
		do self.socket:close() end
	end
end

function jk.server.NetworkConnection:onReadReady()
	if not (self.socket ~= nil) then
		do return end
	end
	do
		local recvBuffer = nil
		if self.manager ~= nil then
			recvBuffer = self.manager:getReceiveBuffer()
		end
		if recvBuffer == nil then
			recvBuffer = _util:allocate_buffer(1024)
		end
		do
			local n = self.socket:read(recvBuffer)
			if n < 0 then
				do self:close() end
			else
				do self:onDataReceived(recvBuffer, n) end
			end
			do self:onActivity() end
		end
	end
end

function jk.server.NetworkConnection:onWriteReady()
end

function jk.server.NetworkConnection:enableIdleMode()
	do return self:setListenMode(0) end
end

function jk.server.NetworkConnection:enableReadMode()
	do return self:setListenMode(1) end
end

function jk.server.NetworkConnection:enableWriteMode()
	do return self:setListenMode(2) end
end

function jk.server.NetworkConnection:enableReadWriteMode()
	do return self:setListenMode(3) end
end

function jk.server.NetworkConnection:setListenMode(n)
	if self.ioEntry == nil then
		self.defaultListenMode = n
		do return true end
	end
	if n == self.currentListenMode then
		do return true end
	end
	self.currentListenMode = n
	do
		local v = false
		if n == 0 then
			v = self.ioEntry:setListeners(nil, nil)
		elseif n == 1 then
			v = self.ioEntry:setListeners(function()
				do self:onReadReady() end
			end, nil)
		elseif n == 2 then
			v = self.ioEntry:setListeners(nil, function()
				do self:onWriteReady() end
			end)
		elseif n == 3 then
			v = self.ioEntry:setListeners(function()
				do self:onReadReady() end
			end, function()
				do self:onWriteReady() end
			end)
		end
		if not v then
			do _g.jk.log.Log:error(self.logContext, "Failed to set socket listening mode to " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(n))) end
		end
		do return v end
	end
end

function jk.server.NetworkConnection:onOpened()
end

function jk.server.NetworkConnection:onDataReceived(data, size)
end

function jk.server.NetworkConnection:onClosed()
end

function jk.server.NetworkConnection:onError(message)
end

function jk.server.NetworkConnection:getStorageIndex()
	do return self.storageIndex end
end

function jk.server.NetworkConnection:setStorageIndex(v)
	self.storageIndex = v
	do return self end
end

function jk.server.NetworkConnection:getDefaultListenMode()
	do return self.defaultListenMode end
end

function jk.server.NetworkConnection:setDefaultListenMode(v)
	self.defaultListenMode = v
	do return self end
end
jk = jk or {}

jk.md5 = jk.md5 or {}

jk.md5.MD5EncoderGeneric = {}
jk.md5.MD5EncoderGeneric.__index = jk.md5.MD5EncoderGeneric
_vm:set_metatable(jk.md5.MD5EncoderGeneric, {})

function jk.md5.MD5EncoderGeneric._create()
	local v = _vm:set_metatable({}, jk.md5.MD5EncoderGeneric)
	return v
end

function jk.md5.MD5EncoderGeneric:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.md5.MD5EncoderGeneric'
	self['_isType.jk.md5.MD5EncoderGeneric'] = true
end

function jk.md5.MD5EncoderGeneric:_construct0()
	jk.md5.MD5EncoderGeneric._init(self)
	return self
end

function jk.md5.MD5EncoderGeneric:encode(buf)
	do return self:stringToHex(self:toMD5(buf)) end
end

function jk.md5.MD5EncoderGeneric:toMD5(input)
	do return self:binl2rstr(self:md5(self:rstr2binl(input), _g.jk.lang.Buffer:getSize(input) * 8)) end
end

function jk.md5.MD5EncoderGeneric:stringToHex(input)
	local hexTab = {
		48,
		49,
		50,
		51,
		52,
		53,
		54,
		55,
		56,
		57,
		65,
		66,
		67,
		68,
		69,
		70
	}
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do
		local i = 0
		while i < _g.jk.lang.Buffer:getSize(input) do
			local x = input[i + 1]
			local value1 = hexTab[_vm:bitwise_and(_vm:bitwise_right_shift(x, 4), 15) + 1]
			local value2 = hexTab[_vm:bitwise_and(x, 15) + 1]
			do sb:appendCharacter(value1) end
			do sb:appendCharacter(value2) end
			do i = i + 1 end
		end
	end
	do return _g.jk.lang.String:toLowerCase(sb:toString()) end
end

function jk.md5.MD5EncoderGeneric:md5(input, len)
	if not (input ~= nil) then
		do return nil end
	end
	do
		local x = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do
			local i = 0
			while i < #input do
				do x:setInteger(_g.jk.lang.String:forInteger(i), input[i + 1]) end
				do i = i + 1 end
			end
		end
		do
			local lenValue = _util:convert_to_integer(len % 32)
			local n = 0
			local value = n + _vm:bitwise_left_shift(128, lenValue)
			local v = _vm:bitwise_or(self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(_vm:bitwise_right_shift(len, 5)), 0), 0), value)
			do x:setInteger(_g.jk.lang.String:forInteger(_vm:bitwise_right_shift(len, 5)), v) end
			do
				local slen = _vm:bitwise_right_shift(len + 64, 9)
				local index = _vm:bitwise_left_shift(slen, 4) + 14
				do x:setInteger(_g.jk.lang.String:forInteger(index), self:unwrap(_vm:bitwise_or(x:getInteger(_g.jk.lang.String:forInteger(index), 0), len), 0)) end
				do
					local a = 1732584193
					local b = -271733879
					local c = -1732584194
					local d = 271733878
					local aa = 0
					local bb = 0
					local cc = 0
					local dd = 0
					do
						local i = 0
						while i < self:getMaxLength(x) do
							aa = a
							bb = b
							cc = c
							dd = d
							a = self:ff(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 0), 0), 0), 7, -680876936)
							d = self:ff(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 1), 0), 0), 12, -389564586)
							c = self:ff(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 2), 0), 0), 17, 606105819)
							b = self:ff(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 3), 0), 0), 22, -1044525330)
							a = self:ff(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 4), 0), 0), 7, -176418897)
							d = self:ff(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 5), 0), 0), 12, 1200080426)
							c = self:ff(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 6), 0), 0), 17, -1473231341)
							b = self:ff(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 7), 0), 0), 22, -45705983)
							a = self:ff(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 8), 0), 0), 7, 1770035416)
							d = self:ff(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 9), 0), 0), 12, -1958414417)
							c = self:ff(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 10), 0), 0), 17, -42063)
							b = self:ff(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 11), 0), 0), 22, -1990404162)
							a = self:ff(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 12), 0), 0), 7, 1804603682)
							d = self:ff(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 13), 0), 0), 12, -40341101)
							c = self:ff(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 14), 0), 0), 17, -1502002290)
							b = self:ff(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 15), 0), 0), 22, 1236535329)
							a = self:gg(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 1), 0), 0), 5, -165796510)
							d = self:gg(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 6), 0), 0), 9, -1069501632)
							c = self:gg(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 11), 0), 0), 14, 643717713)
							b = self:gg(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 0), 0), 0), 20, -373897302)
							a = self:gg(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 5), 0), 0), 5, -701558691)
							d = self:gg(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 10), 0), 0), 9, 38016083)
							c = self:gg(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 15), 0), 0), 14, -660478335)
							b = self:gg(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 4), 0), 0), 20, -405537848)
							a = self:gg(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 9), 0), 0), 5, 568446438)
							d = self:gg(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 14), 0), 0), 9, -1019803690)
							c = self:gg(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 3), 0), 0), 14, -187363961)
							b = self:gg(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 8), 0), 0), 20, 1163531501)
							a = self:gg(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 13), 0), 0), 5, -1444681467)
							d = self:gg(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 2), 0), 0), 9, -51403784)
							c = self:gg(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 7), 0), 0), 14, 1735328473)
							b = self:gg(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 12), 0), 0), 20, -1926607734)
							a = self:hh(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 5), 0), 0), 4, -378558)
							d = self:hh(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 8), 0), 0), 11, -2022574463)
							c = self:hh(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 11), 0), 0), 16, 1839030562)
							b = self:hh(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 14), 0), 0), 23, -35309556)
							a = self:hh(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 1), 0), 0), 4, -1530992060)
							d = self:hh(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 4), 0), 0), 11, 1272893353)
							c = self:hh(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 7), 0), 0), 16, -155497632)
							b = self:hh(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 10), 0), 0), 23, -1094730640)
							a = self:hh(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 13), 0), 0), 4, 681279174)
							d = self:hh(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 0), 0), 0), 11, -358537222)
							c = self:hh(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 3), 0), 0), 16, -722521979)
							b = self:hh(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 6), 0), 0), 23, 76029189)
							a = self:hh(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 9), 0), 0), 4, -640364487)
							d = self:hh(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 12), 0), 0), 11, -421815835)
							c = self:hh(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 15), 0), 0), 16, 530742520)
							b = self:hh(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 2), 0), 0), 23, -995338651)
							a = self:ii(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 0), 0), 0), 6, -198630844)
							d = self:ii(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 7), 0), 0), 10, 1126891415)
							c = self:ii(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 14), 0), 0), 15, -1416354905)
							b = self:ii(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 5), 0), 0), 21, -57434055)
							a = self:ii(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 12), 0), 0), 6, 1700485571)
							d = self:ii(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 3), 0), 0), 10, -1894986606)
							c = self:ii(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 10), 0), 0), 15, -1051523)
							b = self:ii(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 1), 0), 0), 21, -2054922799)
							a = self:ii(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 8), 0), 0), 6, 1873313359)
							d = self:ii(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 15), 0), 0), 10, -30611744)
							c = self:ii(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 6), 0), 0), 15, -1560198380)
							b = self:ii(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 13), 0), 0), 21, 1309151649)
							a = self:ii(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 4), 0), 0), 6, -145523070)
							d = self:ii(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 11), 0), 0), 10, -1120210379)
							c = self:ii(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 2), 0), 0), 15, 718787259)
							b = self:ii(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 9), 0), 0), 21, -343485551)
							a = self:addUnsigned(a, aa)
							b = self:addUnsigned(b, bb)
							c = self:addUnsigned(c, cc)
							d = self:addUnsigned(d, dd)
							i = i + 16
						end
					end
					do
						local ret = _vm:allocate_array(4)
						ret[0 + 1] = a
						ret[1 + 1] = b
						ret[2 + 1] = c
						ret[3 + 1] = d
						do return ret end
					end
				end
			end
		end
	end
end

function jk.md5.MD5EncoderGeneric:getMaxLength(dm)
	local i = 0
	local keys = dm:getKeys()
	if keys ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(keys)
		do
			n = 0
			while n < m do
				local v = keys[n + 1]
				if v ~= nil then
					local key = _g.jk.lang.String:toInteger(v)
					if key > i then
						i = key
					end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local v = i + 1
		do return v end
	end
end

function jk.md5.MD5EncoderGeneric:rstr2binl(input)
	if not (input ~= nil) then
		do return nil end
	end
	do
		local output = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do
			local i = 0
			while i < _g.jk.lang.Buffer:getSize(input) * 8 do
				local value = _vm:bitwise_left_shift(_vm:bitwise_and(input[_util:convert_to_integer(i / 8) + 1], 255), _util:convert_to_integer(i % 32))
				local x = _vm:bitwise_right_shift(i, 5)
				local y = 0
				if output:containsKey(_g.jk.lang.String:forInteger(x)) then
					y = output:getInteger(_g.jk.lang.String:forInteger(x), 0)
				end
				do output:setInteger(_g.jk.lang.String:forInteger(x), _vm:bitwise_or(self:unwrap(y, 0), value)) end
				i = i + 8
			end
		end
		do return self:dictionary2array(output) end
	end
end

function jk.md5.MD5EncoderGeneric:binl2rstr(input)
	local output = _vm:allocate_array(16)
	do
		local i = 0
		while i < #input * 32 do
			local value = self:zeroFillRightShift(input[_vm:bitwise_right_shift(i, 5) + 1], _vm:bitwise_and(_util:convert_to_integer(i % 32), 255))
			output[_util:convert_to_integer(i / 8) + 1] = value
			i = i + 8
		end
	end
	do
		local ret = _util:allocate_buffer(16)
		do
			local i = 0
			while i < #output do
				ret[i + 1] = output[i + 1]
				do i = i + 1 end
			end
		end
		do return ret end
	end
end

function jk.md5.MD5EncoderGeneric:addUnsigned(x, y)
	do return x + y end
end

function jk.md5.MD5EncoderGeneric:rotateLeft(num, cnt)
	local value = _vm:bitwise_or(_vm:bitwise_and(_vm:bitwise_left_shift(num, cnt), 4294967295), self:zeroFillRightShift(num, 32 - cnt))
	do return value end
end

function jk.md5.MD5EncoderGeneric:cmn(q, a, b, x, s, t)
	do return self:addUnsigned(self:rotateLeft(self:addUnsigned(self:addUnsigned(a, q), self:addUnsigned(x, t)), s), b) end
end

function jk.md5.MD5EncoderGeneric:ff(a, b, c, d, x, s, t)
	do return self:cmn(_vm:bitwise_or(_vm:bitwise_and(b, c), _vm:bitwise_and(_vm:bitwise_not(b), d)), a, b, x, s, t) end
end

function jk.md5.MD5EncoderGeneric:gg(a, b, c, d, x, s, t)
	do return self:cmn(_vm:bitwise_or(_vm:bitwise_and(b, d), _vm:bitwise_and(c, _vm:bitwise_not(d))), a, b, x, s, t) end
end

function jk.md5.MD5EncoderGeneric:hh(a, b, c, d, x, s, t)
	do return self:cmn(_vm:bitwise_xor(_vm:bitwise_xor(b, c), d), a, b, x, s, t) end
end

function jk.md5.MD5EncoderGeneric:ii(a, b, c, d, x, s, t)
	do return self:cmn(_vm:bitwise_xor(c, _vm:bitwise_or(b, _vm:bitwise_not(d))), a, b, x, s, t) end
end

function jk.md5.MD5EncoderGeneric:dictionary2array(dic)
	local arr = _vm:allocate_array(dic:getCount())
	do
		local i = 0
		while i < dic:getCount() do
			arr[i + 1] = self:unwrap(dic:getInteger(_g.jk.lang.String:forInteger(i), 0), 0)
			do i = i + 1 end
		end
	end
	do return arr end
end

function jk.md5.MD5EncoderGeneric:unwrap(value, fallback)
	if value ~= 0 then
		do return value end
	end
	do return fallback end
end

function jk.md5.MD5EncoderGeneric:zeroFillRightShift(num, count)
	local value = _vm:bitwise_right_shift(_vm:bitwise_and(num, 4294967295), count)
	do return value end
end

jk.md5.MD5Encoder = {}
jk.md5.MD5Encoder.__index = jk.md5.MD5Encoder
_vm:set_metatable(jk.md5.MD5Encoder, {})

function jk.md5.MD5Encoder._create()
	local v = _vm:set_metatable({}, jk.md5.MD5Encoder)
	return v
end

function jk.md5.MD5Encoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.md5.MD5Encoder'
	self['_isType.jk.md5.MD5Encoder'] = true
end

function jk.md5.MD5Encoder:_construct0()
	jk.md5.MD5Encoder._init(self)
	return self
end

function jk.md5.MD5Encoder:encodeBuffer(buffer)
	if buffer == nil or _g.jk.lang.Buffer:getSize(buffer) < 1 then
		do return nil end
	end
	do
		local md5 = _g.jk.md5.MD5EncoderGeneric._construct0(_g.jk.md5.MD5EncoderGeneric._create())
		do return md5:encode(buffer) end
	end
end

function jk.md5.MD5Encoder:encodeString(string)
	do return _g.jk.md5.MD5Encoder:encodeBuffer(_g.jk.lang.String:toUTF8Buffer(string)) end
end

function jk.md5.MD5Encoder:encodeObject(obj)
	local bb = _g.jk.lang.Buffer:asBuffer(obj)
	if bb ~= nil then
		do return _g.jk.md5.MD5Encoder:encodeBuffer(bb) end
	end
	do
		local ss = _g.jk.lang.String:asString(obj)
		if ss ~= nil then
			do return _g.jk.md5.MD5Encoder:encodeString(ss) end
		end
		do return nil end
	end
end
jk = jk or {}

jk.time = jk.time or {}

jk.time.format = jk.time.format or {}

jk.time.format.VerboseDateTimeString = {}
jk.time.format.VerboseDateTimeString.__index = jk.time.format.VerboseDateTimeString
_vm:set_metatable(jk.time.format.VerboseDateTimeString, {})

function jk.time.format.VerboseDateTimeString._create()
	local v = _vm:set_metatable({}, jk.time.format.VerboseDateTimeString)
	return v
end

function jk.time.format.VerboseDateTimeString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.time.format.VerboseDateTimeString'
	self['_isType.jk.time.format.VerboseDateTimeString'] = true
end

function jk.time.format.VerboseDateTimeString:_construct0()
	jk.time.format.VerboseDateTimeString._init(self)
	return self
end

function jk.time.format.VerboseDateTimeString:forUTCNow()
	do return _g.jk.time.format.VerboseDateTimeString:forDateTime(_g.jk.time.SystemClock:asDateTimeUTC()) end
end

function jk.time.format.VerboseDateTimeString:forNow()
	do return _g.jk.time.format.VerboseDateTimeString:forDateTime(_g.jk.time.SystemClock:asDateTimeLocal()) end
end

function jk.time.format.VerboseDateTimeString:forDateTime(dd)
	if not (dd ~= nil) then
		do return "NODATE" end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString(_g.jk.time.format.VerboseDateTimeString:getShortDayName(dd:getWeekDay())) end
		do sb:appendString(", ") end
		do sb:appendString(_g.jk.lang.String:forInteger(dd:getDayOfMonth())) end
		do sb:appendCharacter(32) end
		do sb:appendString(_g.jk.time.format.VerboseDateTimeString:getShortMonthName(dd:getMonth())) end
		do sb:appendCharacter(32) end
		do sb:appendString(_g.jk.lang.String:forInteger(dd:getYear())) end
		do sb:appendCharacter(32) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getHours(), 2, "0")) end
		do sb:appendCharacter(58) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getMinutes(), 2, "0")) end
		do sb:appendCharacter(58) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getSeconds(), 2, "0")) end
		do
			local offset = dd:getTimezoneOffset()
			if offset == 0 then
				do sb:appendString(" +0000") end
			else
				local hr = _util:convert_to_integer(offset / 3600)
				local mm = _util:convert_to_integer((offset - hr * 3600) / 60)
				if hr <= 0 then
					do sb:appendString(" +") end
					hr = -hr
				else
					do sb:appendString(" -") end
				end
				do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(hr, 2, "0")) end
				do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(mm, 2, "0")) end
			end
			do return sb:toString() end
		end
	end
end

function jk.time.format.VerboseDateTimeString:getTimeStringForDateTime(dd, includeTimeZone)
	if not (dd ~= nil) then
		do return "NOTIME" end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getHours(), 2, "0")) end
		do sb:appendCharacter(58) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getMinutes(), 2, "0")) end
		do sb:appendCharacter(58) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getSeconds(), 2, "0")) end
		if includeTimeZone then
			do sb:appendString(" GMT") end
		end
		do return sb:toString() end
	end
end

function jk.time.format.VerboseDateTimeString:getDateStringForDateTime(dd)
	if not (dd ~= nil) then
		do return "NODATE" end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString(_g.jk.time.format.VerboseDateTimeString:getLongMonthName(dd:getMonth())) end
		do sb:appendCharacter(32) end
		do sb:appendString(_g.jk.lang.String:forInteger(dd:getDayOfMonth())) end
		do sb:appendString(", ") end
		do sb:appendString(_g.jk.lang.String:forInteger(dd:getYear())) end
		do return sb:toString() end
	end
end

function jk.time.format.VerboseDateTimeString:getShortDayName(n)
	do
		local v = n
		if v == 1 then
			do return "Sun" end
		elseif v == 2 then
			do return "Mon" end
		elseif v == 3 then
			do return "Tue" end
		elseif v == 4 then
			do return "Wed" end
		elseif v == 5 then
			do return "Thu" end
		elseif v == 6 then
			do return "Fri" end
		elseif v == 7 then
			do return "Sat" end
		end
	end
	do return nil end
end

function jk.time.format.VerboseDateTimeString:getLongDayName(n)
	do
		local v = n
		if v == 1 then
			do return "Sunday" end
		elseif v == 2 then
			do return "Monday" end
		elseif v == 3 then
			do return "Tuesday" end
		elseif v == 4 then
			do return "Wednesday" end
		elseif v == 5 then
			do return "Thursday" end
		elseif v == 6 then
			do return "Friday" end
		elseif v == 7 then
			do return "Saturday" end
		end
	end
	do return nil end
end

function jk.time.format.VerboseDateTimeString:getShortMonthName(n)
	do
		local v = n
		if v == 1 then
			do return "Jan" end
		elseif v == 2 then
			do return "Feb" end
		elseif v == 3 then
			do return "Mar" end
		elseif v == 4 then
			do return "Apr" end
		elseif v == 5 then
			do return "May" end
		elseif v == 6 then
			do return "Jun" end
		elseif v == 7 then
			do return "Jul" end
		elseif v == 8 then
			do return "Aug" end
		elseif v == 9 then
			do return "Sep" end
		elseif v == 10 then
			do return "Oct" end
		elseif v == 11 then
			do return "Nov" end
		elseif v == 12 then
			do return "Dec" end
		end
	end
	do return nil end
end

function jk.time.format.VerboseDateTimeString:getLongMonthName(n)
	do
		local v = n
		if v == 1 then
			do return "January" end
		elseif v == 2 then
			do return "February" end
		elseif v == 3 then
			do return "March" end
		elseif v == 4 then
			do return "April" end
		elseif v == 5 then
			do return "May" end
		elseif v == 6 then
			do return "June" end
		elseif v == 7 then
			do return "July" end
		elseif v == 8 then
			do return "August" end
		elseif v == 9 then
			do return "September" end
		elseif v == 10 then
			do return "October" end
		elseif v == 11 then
			do return "November" end
		elseif v == 12 then
			do return "December" end
		end
	end
	do return nil end
end
jk = jk or {}

jk.mypacket = jk.mypacket or {}

jk.mypacket.MyPacketParser = {}
jk.mypacket.MyPacketParser.__index = jk.mypacket.MyPacketParser
_vm:set_metatable(jk.mypacket.MyPacketParser, {})

function jk.mypacket.MyPacketParser._create()
	local v = _vm:set_metatable({}, jk.mypacket.MyPacketParser)
	return v
end

function jk.mypacket.MyPacketParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mypacket.MyPacketParser'
	self['_isType.jk.mypacket.MyPacketParser'] = true
	self.buffer = nil
	self.position = 0
end

function jk.mypacket.MyPacketParser:_construct0()
	jk.mypacket.MyPacketParser._init(self)
	return self
end

function jk.mypacket.MyPacketParser:forBuffer(buffer)
	local v = _g.jk.mypacket.MyPacketParser._construct0(_g.jk.mypacket.MyPacketParser._create())
	do v:setBuffer(buffer) end
	do return v end
end

function jk.mypacket.MyPacketParser:isValid(length)
	if not (self.buffer ~= nil) then
		do return false end
	end
	do
		local sz = #self.buffer
		if not (self.position + length <= sz) then
			do return false end
		end
		do return true end
	end
end

function jk.mypacket.MyPacketParser:skipBytes(count)
	self.position = self.position + count
end

function jk.mypacket.MyPacketParser:getInt8()
	if not self:isValid(1) then
		do return 0 end
	end
	do return self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1] end
end

function jk.mypacket.MyPacketParser:getFloat()
	if not self:isValid(4) then
		do return 0.0 end
	end
	do
		local bb = _util:allocate_buffer(4)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getFloatLE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getDouble()
	if not self:isValid(8) then
		do return 0.0 end
	end
	do
		local bb = _util:allocate_buffer(8)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[4 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[5 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[6 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[7 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getDoubleLE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getInt16()
	if not self:isValid(2) then
		do return 0 end
	end
	do
		local bb = _util:allocate_buffer(2)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getInt16LE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getInt24()
	if not self:isValid(3) then
		do return 0 end
	end
	do
		local bb = _util:allocate_buffer(4)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = 0
		do return _g.jk.lang.Buffer:getInt32LE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getInt32()
	if not self:isValid(4) then
		do return 0 end
	end
	do
		local bb = _util:allocate_buffer(4)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getInt32LE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getInt64()
	if not self:isValid(8) then
		do return 0 end
	end
	do
		local bb = _util:allocate_buffer(8)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[4 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[5 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[6 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[7 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getInt64LE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getLengthEncodedInteger()
	if not self:isValid(1) then
		do return 0 end
	end
	do
		local first = self.buffer[self.position + 1]
		if first < 251 then
			do self.position = self.position + 1 end
			do return first end
		end
		if first == 252 then
			if not self:isValid(3) then
				do return 0 end
			end
			do self.position = self.position + 1 end
			do
				local bb = _util:allocate_buffer(2)
				bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				do return _g.jk.lang.Buffer:getInt16LE(bb, 0) end
			end
		end
		if first == 253 then
			if not self:isValid(4) then
				do return 0 end
			end
			do self.position = self.position + 1 end
			do
				local bb = _util:allocate_buffer(4)
				bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[3 + 1] = 0
				do return _g.jk.lang.Buffer:getInt32LE(bb, 0) end
			end
		end
		if first == 254 then
			if not self:isValid(9) then
				do return 0 end
			end
			do self.position = self.position + 1 end
			do
				local bb = _util:allocate_buffer(8)
				bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[4 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[5 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[6 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[7 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				do return _g.jk.lang.Buffer:getInt64LE(bb, 0) end
			end
		end
		_io:write_to_stdout("[jk.mypacket.MyPacketParser.getLengthEncodedInteger] (MyPacketParser.sling:167:2): Invalid byte as first byte of length encoded integer." .. "\n")
		do return 0 end
	end
end

function jk.mypacket.MyPacketParser:getNullTerminatedString()
	if not (self.buffer ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local sz = #self.buffer
		while self.position < sz do
			local c = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
			if c < 1 then
				do break end
			end
			do sb:appendCharacter(c) end
		end
		do return sb:toString() end
	end
end

function jk.mypacket.MyPacketParser:getEofTerminatedString()
	if not (self.buffer ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local sz = #self.buffer
		while self.position < sz do
			local c = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
			do sb:appendCharacter(c) end
		end
		do return sb:toString() end
	end
end

function jk.mypacket.MyPacketParser:getStaticLengthString(length)
	if not (length > 0) then
		do return nil end
	end
	if not self:isValid(length) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do
			local n = 0
			while n < length do
				do sb:appendCharacter(self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]) end
				do n = n + 1 end
			end
		end
		do return sb:toString() end
	end
end

function jk.mypacket.MyPacketParser:getLengthEncodedString()
	local length = self:getLengthEncodedInteger()
	if length < 1 then
		do return "" end
	end
	do return self:getStaticLengthString(length) end
end

function jk.mypacket.MyPacketParser:getLengthEncodedBuffer()
	local length = self:getLengthEncodedInteger()
	if length < 1 then
		do return nil end
	end
	do return self:getBuffer(length) end
end

function jk.mypacket.MyPacketParser:getBuffer(length)
	if not self:isValid(length) then
		do return nil end
	end
	do
		local v = _util:allocate_buffer(length)
		do _g.jk.lang.Buffer:copyFrom(v, self.buffer, self.position, 0, length) end
		self.position = self.position + length
		do return v end
	end
end

function jk.mypacket.MyPacketParser:setBuffer(v)
	self.buffer = v
	do return self end
end

function jk.mypacket.MyPacketParser:getPosition()
	do return self.position end
end

function jk.mypacket.MyPacketParser:setPosition(v)
	self.position = v
	do return self end
end

jk.mypacket.MyPacketBuilder = {}
jk.mypacket.MyPacketBuilder.__index = jk.mypacket.MyPacketBuilder
_vm:set_metatable(jk.mypacket.MyPacketBuilder, {})

function jk.mypacket.MyPacketBuilder._create()
	local v = _vm:set_metatable({}, jk.mypacket.MyPacketBuilder)
	return v
end

function jk.mypacket.MyPacketBuilder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mypacket.MyPacketBuilder'
	self['_isType.jk.mypacket.MyPacketBuilder'] = true
	self.buffer = nil
	self.position = 0
end

function jk.mypacket.MyPacketBuilder:_construct0()
	jk.mypacket.MyPacketBuilder._init(self)
	return self
end

function jk.mypacket.MyPacketBuilder:ensureAvailablesize(count)
	local sz = 0
	if self.buffer ~= nil then
		sz = #self.buffer
	end
	if sz < self.position + count then
		local nsz = sz
		while nsz < self.position + count do
			nsz = nsz + 65536
		end
		self.buffer = _g.jk.lang.Buffer:resize(self.buffer, nsz)
	end
end

function jk.mypacket.MyPacketBuilder:appendByte(byte)
	do self:ensureAvailablesize(1) end
	self.buffer[self.position + 1] = _vm:bitwise_and(byte, 255)
	do self.position = self.position + 1 end
end

function jk.mypacket.MyPacketBuilder:appendMultipleBytes(byte, count)
	if not (count > 0) then
		do return end
	end
	do self:ensureAvailablesize(count) end
	do
		local n = 0
		while n < count do
			self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1] = _vm:bitwise_and(byte, 255)
			do n = n + 1 end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendBuffer(newdata)
	if not (newdata ~= nil) then
		do return end
	end
	do
		local nds = #newdata
		do self:ensureAvailablesize(nds) end
		do _g.jk.lang.Buffer:copyFrom(self.buffer, newdata, 0, self.position, nds) end
		self.position = self.position + nds
	end
end

function jk.mypacket.MyPacketBuilder:appendInt16(number)
	do self:ensureAvailablesize(2) end
	do
		local bb = _g.jk.lang.Buffer:forInt16LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 2) end
		self.position = self.position + 2
	end
end

function jk.mypacket.MyPacketBuilder:appendInt24(number)
	do self:ensureAvailablesize(3) end
	do
		local bb = _g.jk.lang.Buffer:forInt32LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 3) end
		self.position = self.position + 3
	end
end

function jk.mypacket.MyPacketBuilder:appendInt32(number)
	do self:ensureAvailablesize(4) end
	do
		local bb = _g.jk.lang.Buffer:forInt32LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 4) end
		self.position = self.position + 4
	end
end

function jk.mypacket.MyPacketBuilder:appendInt64(number)
	do self:ensureAvailablesize(8) end
	do
		local bb = _g.jk.lang.Buffer:forInt64LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 8) end
		self.position = self.position + 8
	end
end

function jk.mypacket.MyPacketBuilder:appendDouble(number)
	do self:ensureAvailablesize(8) end
	do
		local bb = _g.jk.lang.Buffer:forDouble64LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 8) end
		self.position = self.position + 8
	end
end

function jk.mypacket.MyPacketBuilder:appendNullTerminatedString(string)
	if not (string ~= nil) then
		do self:appendByte(0) end
		do return end
	end
	do
		local it = _g.jk.lang.String:iterate(string)
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do self:appendByte(0) end
				do break end
			end
			do self:appendByte(_util:convert_to_integer(c)) end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendFixedLengthString(string, length)
	if not (length > 0) then
		do return end
	end
	do
		local it = _g.jk.lang.String:iterate(string)
		do
			local n = 0
			while n < length do
				local c = it:getNextChar()
				if _g.jk.lang.Character:isEOF(c) then
					do self:appendByte(0) end
				else
					do self:appendByte(_util:convert_to_integer(c)) end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendEofTerminatedString(string)
	if not (string ~= nil) then
		do return end
	end
	do
		local it = _g.jk.lang.String:iterate(string)
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			do self:appendByte(_util:convert_to_integer(c)) end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendLengthEncodedInteger(value)
	if value < 251 then
		do self:appendByte(value) end
	elseif value < 65536 then
		do self:appendByte(252) end
		do self:appendInt16(value) end
	elseif value < 16777216 then
		do self:appendByte(253) end
		do self:appendInt24(value) end
	else
		do self:appendByte(254) end
		do self:appendInt64(value) end
	end
end

function jk.mypacket.MyPacketBuilder:appendLengthEncodedString(value)
	if not (value ~= nil) then
		do self:appendLengthEncodedInteger(0) end
		do return end
	end
	do
		local bb = _g.jk.lang.String:toUTF8Buffer(value)
		if not (bb ~= nil) then
			do self:appendLengthEncodedInteger(0) end
			do return end
		end
		do
			local sz = #bb
			do self:appendLengthEncodedInteger(sz) end
			if sz > 0 then
				do self:appendBuffer(bb) end
			end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendLengthEncodedBuffer(value)
	if not (value ~= nil) then
		do self:appendLengthEncodedInteger(0) end
		do return end
	end
	do
		local sz = #value
		do self:appendLengthEncodedInteger(sz) end
		if sz > 0 then
			do self:appendBuffer(value) end
		end
	end
end

function jk.mypacket.MyPacketBuilder:finalize()
	if not (self.buffer ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Buffer:getSubBuffer(self.buffer, 0, self.position, false) end
end
jk = jk or {}

jk.http = jk.http or {}

jk.http.server = jk.http.server or {}

jk.http.server.HTTPServerResponseWorker = {}
jk.http.server.HTTPServerResponseWorker.__index = jk.http.server.HTTPServerResponseWorker
_vm:set_metatable(jk.http.server.HTTPServerResponseWorker, {})

function jk.http.server.HTTPServerResponseWorker._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerResponseWorker)
	return v
end

function jk.http.server.HTTPServerResponseWorker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerResponseWorker'
	self['_isType.jk.http.server.HTTPServerResponseWorker'] = true
	self.context = nil
	self.session = nil
	self.startTime = nil
end

function jk.http.server.HTTPServerResponseWorker:_construct0()
	jk.http.server.HTTPServerResponseWorker._init(self)
	return self
end

function jk.http.server.HTTPServerResponseWorker:setContext(v)
	self.context = v
	do return self end
end

function jk.http.server.HTTPServerResponseWorker:getContext()
	do return self.context end
end

function jk.http.server.HTTPServerResponseWorker:setSession(v)
	self.session = v
	do return self end
end

function jk.http.server.HTTPServerResponseWorker:getSession()
	do return self.session end
end

function jk.http.server.HTTPServerResponseWorker:getMimeType()
end

function jk.http.server.HTTPServerResponseWorker:getWorkerDescription()
end

function jk.http.server.HTTPServerResponseWorker:onStart()
	self.startTime = _g.jk.time.SystemClock:asTimeValue()
	do _g.jk.log.Log:debug(self.context, "Response worker `" .. _g.jk.lang.String:safeString(self:getWorkerDescription()) .. "' started.") end
	do self.session:writeHeader() end
end

function jk.http.server.HTTPServerResponseWorker:tick()
	do self:execute() end
	do return false end
end

function jk.http.server.HTTPServerResponseWorker:execute()
end

function jk.http.server.HTTPServerResponseWorker:onEnd()
	do self.session:_end() end
	do
		local diff = _g.jk.text.StringUtil:formatLongInteger(_g.jk.lang.TimeValue:diff(_g.jk.time.SystemClock:asTimeValue(), self.startTime), 44)
		do _g.jk.log.Log:debug(self.context, "Response worker `" .. _g.jk.lang.String:safeString(self:getWorkerDescription()) .. "' ended. Wrote " .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:formatInteger(self.session:getTotalBytes(), 44)) .. " bytes. Duration=" .. _g.jk.lang.String:safeString(diff) .. " us") end
	end
end

function jk.http.server.HTTPServerResponseWorker:abort()
	if self.session ~= nil then
		do self.session:_end() end
	end
end

jk.http.server.HTTPServerExternalCommandResponseWorker = _g.jk.http.server.HTTPServerResponseWorker._create()
jk.http.server.HTTPServerExternalCommandResponseWorker.__index = jk.http.server.HTTPServerExternalCommandResponseWorker
_vm:set_metatable(jk.http.server.HTTPServerExternalCommandResponseWorker, {
	__index = _g.jk.http.server.HTTPServerResponseWorker
})

function jk.http.server.HTTPServerExternalCommandResponseWorker._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerExternalCommandResponseWorker)
	return v
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerExternalCommandResponseWorker'
	self['_isType.jk.http.server.HTTPServerExternalCommandResponseWorker'] = true
	self.launcher = nil
	self.mimeType = nil
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:forProcessLauncher(launcher)
	local v = _g.jk.http.server.HTTPServerExternalCommandResponseWorker._construct0(_g.jk.http.server.HTTPServerExternalCommandResponseWorker._create())
	do v:setLauncher(launcher) end
	do return v end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:forFile(file)
	do return _g.jk.http.server.HTTPServerExternalCommandResponseWorker:forProcessLauncher(_g.jk.process.ProcessLauncher:forFile(file, nil)) end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:forCommand(command)
	do return _g.jk.http.server.HTTPServerExternalCommandResponseWorker:forProcessLauncher(_g.jk.process.ProcessLauncher:forCommand(command, nil)) end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:_construct0()
	jk.http.server.HTTPServerExternalCommandResponseWorker._init(self)
	do _g.jk.http.server.HTTPServerResponseWorker._construct0(self) end
	self.mimeType = "text/plain"
	return self
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:setMimeType(value)
	self.mimeType = value
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:getMimeType()
	do return self.mimeType end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:getWorkerDescription()
	do return "HTTPServerExternalCommandResponseWorker" end
end

jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver = {}
jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver.__index = jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver
_vm:set_metatable(jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver, {})

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver)
	return v
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver'
	self['_isType.jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver'] = true
	self['_isType.jk.lang.BufferDataReceiver'] = true
	self.session = nil
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:_construct0()
	jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver._init(self)
	return self
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:onBufferData(data, size)
	if not self.session:writeData(data, size) then
		do return false end
	end
	do return true end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:getSession()
	do return self.session end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:setSession(v)
	self.session = v
	do return self end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:execute()
	if not (self.launcher ~= nil) then
		do return end
	end
	do
		local md = _g.jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver._construct0(_g.jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver._create())
		do md:setSession(self.session) end
		do self.launcher:executeToPipe(md) end
	end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:getLauncher()
	do return self.launcher end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:setLauncher(v)
	self.launcher = v
	do return self end
end

jk.http.server.HTTPServerRequestHandler = {}

jk.http.server.HTTPServerComponent = {}

jk.http.server.HTTPServerJSONResponse = {}
jk.http.server.HTTPServerJSONResponse.__index = jk.http.server.HTTPServerJSONResponse
_vm:set_metatable(jk.http.server.HTTPServerJSONResponse, {})

function jk.http.server.HTTPServerJSONResponse._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerJSONResponse)
	return v
end

function jk.http.server.HTTPServerJSONResponse:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerJSONResponse'
	self['_isType.jk.http.server.HTTPServerJSONResponse'] = true
end

function jk.http.server.HTTPServerJSONResponse:_construct0()
	jk.http.server.HTTPServerJSONResponse._init(self)
	return self
end

function jk.http.server.HTTPServerJSONResponse:forError(eo)
	if (_vm:to_table_with_key(eo, '_isType.jk.lang.Error') ~= nil) then
		local error = eo
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do v:setString("status", "error") end
		if error ~= nil then
			local code = error:getCode()
			local detail = _g.jk.lang.String:asString(error:getDetail())
			if _g.jk.lang.String:isNotEmpty(code) then
				do v:setString("code", code) end
			end
			if _g.jk.lang.String:isNotEmpty(detail) then
				do v:setString("detail", detail) end
			end
		end
		do return v end
	end
	if (_vm:get_variable_type(eo) == 'string') then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorCode(eo) end
	end
	do
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do v:setString("status", "error") end
		do return v end
	end
end

function jk.http.server.HTTPServerJSONResponse:forErrorCode(code)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("status", "error") end
	do v:setString("code", code) end
	do return v end
end

function jk.http.server.HTTPServerJSONResponse:forErrorMessage(message, code)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("status", "error") end
	if _g.jk.lang.String:isNotEmpty(message) then
		do v:setString("message", message) end
	end
	if _g.jk.lang.String:isNotEmpty(code) then
		do v:setString("code", code) end
	end
	do return v end
end

function jk.http.server.HTTPServerJSONResponse:forOk(data)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("status", "ok") end
	if data ~= nil then
		do v:setObject("data", data) end
	end
	do return v end
end

function jk.http.server.HTTPServerJSONResponse:forDetails(status, code, message)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if _g.jk.lang.String:isNotEmpty(status) then
		do v:setString("status", status) end
	end
	if _g.jk.lang.String:isNotEmpty(code) then
		do v:setString("code", code) end
	end
	if _g.jk.lang.String:isNotEmpty(message) then
		do v:setString("message", message) end
	end
	do return v end
end

function jk.http.server.HTTPServerJSONResponse:forMissingData(type)
	if _g.jk.lang.String:isNotEmpty(type) then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Missing data: " .. _g.jk.lang.String:safeString(type), "missing_data") end
	end
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Missing data", "missing_data") end
end

function jk.http.server.HTTPServerJSONResponse:forInvalidData(type)
	if _g.jk.lang.String:isNotEmpty(type) then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Invalid data: " .. _g.jk.lang.String:safeString(type), "invalid_data") end
	end
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Invalid data", "invalid_data") end
end

function jk.http.server.HTTPServerJSONResponse:forAlreadyExists()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Already exists", "already_exists") end
end

function jk.http.server.HTTPServerJSONResponse:forInvalidRequest(type)
	if _g.jk.lang.String:isNotEmpty(type) then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Invalid request: " .. _g.jk.lang.String:safeString(type), "invalid_request") end
	end
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Invalid request", "invalid_request") end
end

function jk.http.server.HTTPServerJSONResponse:forNotAllowed()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Not allowed", "not_allowed") end
end

function jk.http.server.HTTPServerJSONResponse:forNotAuthenticated()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Not authenticated", "not_authenticated") end
end

function jk.http.server.HTTPServerJSONResponse:forFailedToCreate()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Failed to create", "failed_to_create") end
end

function jk.http.server.HTTPServerJSONResponse:forNotFound()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Not found", "not_found") end
end

function jk.http.server.HTTPServerJSONResponse:forAuthenticationFailed()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Authentication failed", "authentication_failed") end
end

function jk.http.server.HTTPServerJSONResponse:forIncorrectUsernamePassword()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Incorrect username and/or password", "authentication_failed") end
end

function jk.http.server.HTTPServerJSONResponse:forInternalError(details)
	if _g.jk.lang.String:isNotEmpty(details) then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Internal error: " .. _g.jk.lang.String:safeString(details), "internal_error") end
	end
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Internal error", "internal_error") end
end

jk.http.server.HTTPServerRequestHandlerAdapter = {}
jk.http.server.HTTPServerRequestHandlerAdapter.__index = jk.http.server.HTTPServerRequestHandlerAdapter
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerAdapter, {})

function jk.http.server.HTTPServerRequestHandlerAdapter._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerAdapter)
	return v
end

function jk.http.server.HTTPServerRequestHandlerAdapter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerAdapter'
	self['_isType.jk.http.server.HTTPServerRequestHandlerAdapter'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandler'] = true
	self['_isType.jk.http.server.HTTPServerComponent'] = true
	self.server = nil
	self.logContext = nil
end

function jk.http.server.HTTPServerRequestHandlerAdapter:_construct0()
	jk.http.server.HTTPServerRequestHandlerAdapter._init(self)
	return self
end

function jk.http.server.HTTPServerRequestHandlerAdapter:getServer()
	do return self.server end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:isInitialized()
	if self.server == nil then
		do return false end
	end
	do return true end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:initialize(server)
	self.server = server
	if server ~= nil then
		self.logContext = server:getLogContext()
	else
		self.logContext = nil
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onMaintenance()
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onRefresh()
end

function jk.http.server.HTTPServerRequestHandlerAdapter:cleanup()
	self.server = nil
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onGET1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onGET2(req, next)
	if self:onGET1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPOST1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPOST2(req, next)
	if self:onPOST1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPUT1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPUT2(req, next)
	if self:onPUT1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onDELETE1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onDELETE2(req, next)
	if self:onDELETE1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPATCH1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPATCH2(req, next)
	if self:onPATCH1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:handleRequest(req, next)
	if req == nil then
		do next() end
	elseif req:isGET() then
		do self:onGET2(req, next) end
	elseif req:isPOST() then
		do self:onPOST2(req, next) end
	elseif req:isPUT() then
		do self:onPUT2(req, next) end
	elseif req:isDELETE() then
		do self:onDELETE2(req, next) end
	elseif req:isPATCH() then
		do self:onPATCH2(req, next) end
	else
		do next() end
	end
end

jk.http.server.HTTPServerRequestHandlerMap = _g.jk.http.server.HTTPServerRequestHandlerAdapter._create()
jk.http.server.HTTPServerRequestHandlerMap.__index = jk.http.server.HTTPServerRequestHandlerMap
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerMap, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerAdapter
})

function jk.http.server.HTTPServerRequestHandlerMap._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerMap)
	return v
end

function jk.http.server.HTTPServerRequestHandlerMap:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerMap'
	self['_isType.jk.http.server.HTTPServerRequestHandlerMap'] = true
	self.getHandlerFunctions = nil
	self.postHandlerFunctions = nil
	self.putHandlerFunctions = nil
	self.deleteHandlerFunctions = nil
	self.patchHandlerFunctions = nil
	self.childObjects = nil
end

function jk.http.server.HTTPServerRequestHandlerMap:_construct0()
	jk.http.server.HTTPServerRequestHandlerMap._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter._construct0(self) end
	return self
end

function jk.http.server.HTTPServerRequestHandlerMap:initialize(server)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.initialize(self, server) end
	do
		local it = _g.jk.lang.Map:iterateValues(self.childObjects)
		while true do
			local child = it:next()
			if child == nil then
				do break end
			end
			if (_vm:to_table_with_key(child, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do child:initialize(server) end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:onMaintenance()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.onMaintenance(self) end
	do
		local it = _g.jk.lang.Map:iterateValues(self.childObjects)
		while true do
			local child = it:next()
			if child == nil then
				do break end
			end
			if (_vm:to_table_with_key(child, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do child:onMaintenance() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:onRefresh()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.onRefresh(self) end
	do
		local it = _g.jk.lang.Map:iterateValues(self.childObjects)
		while true do
			local child = it:next()
			if child == nil then
				do break end
			end
			if (_vm:to_table_with_key(child, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do child:onRefresh() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:cleanup()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.cleanup(self) end
	do
		local it = _g.jk.lang.Map:iterateValues(self.childObjects)
		while true do
			local child = it:next()
			if child == nil then
				do break end
			end
			if (_vm:to_table_with_key(child, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do child:cleanup() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:onHTTPMethod(req, functions)
	local rsc = req:peekResource()
	if not (rsc ~= nil) then
		rsc = ""
	end
	do
		local handler = nil
		local rsccount = req:getRemainingResourceCount()
		local pop = true
		if rsccount < 1 then
			handler = _g.jk.lang.Map:get(functions, rsc)
			if not (handler ~= nil) then
				handler = _g.jk.lang.Map:get(functions, "*")
				if handler ~= nil then
					pop = false
				end
			end
		elseif rsccount == 1 then
			handler = _g.jk.lang.Map:get(functions, _g.jk.lang.String:safeString(rsc) .. "/*")
			if not (handler ~= nil) then
				handler = _g.jk.lang.Map:get(functions, _g.jk.lang.String:safeString(rsc) .. "/**")
			end
		else
			handler = _g.jk.lang.Map:get(functions, _g.jk.lang.String:safeString(rsc) .. "/**")
		end
		if handler ~= nil then
			if pop then
				do req:popResource() end
			end
			do handler(req) end
			do return true end
		end
		do return false end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:onGET1(req)
	do return self:onHTTPMethod(req, self.getHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:onPOST1(req)
	do return self:onHTTPMethod(req, self.postHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:onPUT1(req)
	do return self:onHTTPMethod(req, self.putHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:onDELETE1(req)
	do return self:onHTTPMethod(req, self.deleteHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:onPATCH1(req)
	do return self:onHTTPMethod(req, self.patchHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:tryHandleRequest(req)
	local v = false
	if not (req ~= nil) then
	elseif req:isGET() then
		v = self:onGET1(req)
	elseif req:isPOST() then
		v = self:onPOST1(req)
	elseif req:isPUT() then
		v = self:onPUT1(req)
	elseif req:isDELETE() then
		v = self:onDELETE1(req)
	elseif req:isPATCH() then
		v = self:onPATCH1(req)
	end
	do return v end
end

function jk.http.server.HTTPServerRequestHandlerMap:handleRequest(req, next)
	if self:tryHandleRequest(req) then
		do return end
	end
	do
		local rsc = req:peekResource()
		if not (rsc ~= nil) then
			rsc = ""
		end
		do
			local sub = _g.jk.lang.Map:get(self.childObjects, rsc)
			if not (sub ~= nil) then
				sub = _g.jk.lang.Map:get(self.childObjects, "*")
			end
			if not (sub ~= nil) then
				sub = _g.jk.lang.Map:get(self.childObjects, _g.jk.lang.String:safeString(rsc) .. "/**")
			end
			if sub ~= nil then
				do req:popResource() end
				do sub:handleRequest(req, next) end
				do return end
			end
			do next() end
			do return end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:child(path, handler)
	if path ~= nil then
		if not (self.childObjects ~= nil) then
			self.childObjects = {}
		end
		self.childObjects[path] = handler
		if handler ~= nil and (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) and self:isInitialized() then
			do handler:initialize(self:getServer()) end
		end
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:get(path, handler)
	if path ~= nil then
		if not (self.getHandlerFunctions ~= nil) then
			self.getHandlerFunctions = {}
		end
		self.getHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:post(path, handler)
	if path ~= nil then
		if not (self.postHandlerFunctions ~= nil) then
			self.postHandlerFunctions = {}
		end
		self.postHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:put(path, handler)
	if path ~= nil then
		if not (self.putHandlerFunctions ~= nil) then
			self.putHandlerFunctions = {}
		end
		self.putHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:delete(path, handler)
	if path ~= nil then
		if not (self.deleteHandlerFunctions ~= nil) then
			self.deleteHandlerFunctions = {}
		end
		self.deleteHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:patch(path, handler)
	if path ~= nil then
		if not (self.patchHandlerFunctions ~= nil) then
			self.patchHandlerFunctions = {}
		end
		self.patchHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:getOrPost(path, handler)
	do self:get(path, handler) end
	do self:post(path, handler) end
	do return self end
end

jk.http.server.HTTPServerRequestHandlerListener = {}

jk.http.server.HTTPServerConnection = _g.jk.server.NetworkConnection._create()
jk.http.server.HTTPServerConnection.__index = jk.http.server.HTTPServerConnection
_vm:set_metatable(jk.http.server.HTTPServerConnection, {
	__index = _g.jk.server.NetworkConnection
})

function jk.http.server.HTTPServerConnection._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerConnection)
	return v
end

function jk.http.server.HTTPServerConnection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerConnection'
	self['_isType.jk.http.server.HTTPServerConnection'] = true
	self.requests = 0
	self.responses = 0
	self.parser = nil
	self.currentRequest = nil
	self.closeAfterSend = false
	self.sendWritten = 0
	self.sendBodyBuffer = nil
	self.sendBody = nil
	self.sendBuffer = nil
	self.responseToSend = nil
	self.requestQueue = nil
	self.isWaitingForBodyReceiver = false
end

jk.http.server.HTTPServerConnection.ParserState = {}
jk.http.server.HTTPServerConnection.ParserState.__index = jk.http.server.HTTPServerConnection.ParserState
_vm:set_metatable(jk.http.server.HTTPServerConnection.ParserState, {})

function jk.http.server.HTTPServerConnection.ParserState._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerConnection.ParserState)
	return v
end

function jk.http.server.HTTPServerConnection.ParserState:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerConnection.ParserState'
	self['_isType.jk.http.server.HTTPServerConnection.ParserState'] = true
	self.method = nil
	self.uri = nil
	self.version = nil
	self.key = nil
	self.headers = nil
	self.headersDone = false
	self.bodyDone = false
	self.hdr = nil
	self.contentLength = 0
	self.bodyIsChunked = false
	self.dataCounter = 0
	self.bodyStream = nil
	self.savedBodyChunk = nil
	self.bodyBuffer = nil
end

function jk.http.server.HTTPServerConnection.ParserState:_construct0()
	jk.http.server.HTTPServerConnection.ParserState._init(self)
	return self
end

function jk.http.server.HTTPServerConnection:_construct0()
	jk.http.server.HTTPServerConnection._init(self)
	do _g.jk.server.NetworkConnection._construct0(self) end
	self.parser = _g.jk.http.server.HTTPServerConnection.ParserState._construct0(_g.jk.http.server.HTTPServerConnection.ParserState._create())
	return self
end

function jk.http.server.HTTPServerConnection:getIsWaitingForBodyReceiver()
	do return self.isWaitingForBodyReceiver end
end

function jk.http.server.HTTPServerConnection:getHTTPServer()
	do return _vm:to_table_with_key(self:getManager(), '_isType.jk.http.server.HTTPServerBase') end
end

function jk.http.server.HTTPServerConnection:getWriteBufferSize()
	local server = self:getHTTPServer()
	if server == nil then
		do return 1024 * 512 end
	end
	do return server:getWriteBufferSize() end
end

function jk.http.server.HTTPServerConnection:getSmallBodyLimit()
	local server = self:getHTTPServer()
	if server == nil then
		do return 1024 * 32 end
	end
	do return server:getSmallBodyLimit() end
end

function jk.http.server.HTTPServerConnection:resetParser()
	self.parser.method = nil
	self.parser.uri = nil
	self.parser.version = nil
	self.parser.key = nil
	self.parser.headers = nil
	self.parser.headersDone = false
	if self.parser.bodyStream ~= nil then
		do self.parser.bodyStream:onDataStreamAbort() end
	end
	self.parser.bodyStream = nil
	self.parser.bodyDone = false
	self.parser.hdr = nil
	self.parser.contentLength = 0
	self.parser.bodyIsChunked = false
	self.parser.dataCounter = 0
end

function jk.http.server.HTTPServerConnection:initialize()
	if not _g.jk.server.NetworkConnection.initialize(self) then
		do return false end
	end
	do self:updateListeningMode() end
	do return true end
end

function jk.http.server.HTTPServerConnection:updateListeningMode()
	local writeFlag = false
	local readFlag = true
	if self.responseToSend ~= nil then
		writeFlag = true
	end
	if self.isWaitingForBodyReceiver or self.closeAfterSend then
		readFlag = false
	end
	do
		local v = true
		if readFlag and writeFlag then
			v = self:enableReadWriteMode()
		elseif readFlag then
			v = self:enableReadMode()
		elseif writeFlag then
			v = self:enableWriteMode()
		else
			v = self:enableIdleMode()
		end
		if not v then
			do _g.jk.log.Log:error(self.logContext, "HTTPServerConnection updateListeningMode failed. Disconnecting client.") end
			do self:close() end
		end
	end
end

function jk.http.server.HTTPServerConnection:setBodyReceiver(stream)
	if self.isWaitingForBodyReceiver == false then
		if stream ~= nil then
			if stream:onDataStreamStart(0) then
				do stream:onDataStreamEnd() end
			end
		end
		do return end
	end
	self.parser.bodyStream = stream
	if stream ~= nil then
		self.isWaitingForBodyReceiver = false
		do self:updateListeningMode() end
		do
			local ll = self.parser.contentLength
			if self.parser.bodyIsChunked then
				ll = -1
			end
			if stream:onDataStreamStart(ll) == false then
				self.parser.bodyStream = nil
				do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
				do self:resetParser() end
				do return end
			end
			do
				local sbc = self.parser.savedBodyChunk
				self.parser.savedBodyChunk = nil
				if sbc ~= nil then
					do self:onBodyData(sbc, 0, #sbc) end
				end
			end
		end
	end
end

function jk.http.server.HTTPServerConnection:isExpectingBody()
	if self.parser.method == "POST" or self.parser.method == "PUT" or self.parser.method == "PATCH" or self.parser.contentLength > 0 or self.parser.bodyIsChunked then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerConnection:onHeadersDone()
	local hasBody = self:isExpectingBody()
	if hasBody then
		local sbl = self:getSmallBodyLimit()
		if sbl > 0 and self.parser.contentLength > 0 and self.parser.contentLength < sbl then
			self.parser.bodyBuffer = _util:allocate_buffer(self.parser.contentLength)
			do return end
		end
		self.isWaitingForBodyReceiver = true
	end
	do
		local req = _g.jk.http.server.HTTPServerRequest:forDetails(self.parser.method, self.parser.uri, self.parser.version, self.parser.headers)
		do self:onCompleteRequest(req) end
		if hasBody == false then
			do self:resetParser() end
		end
		do self:updateListeningMode() end
	end
end

function jk.http.server.HTTPServerConnection:onHeaderData(inputBuffer, offset, sz)
	if not (inputBuffer ~= nil) then
		do return end
	end
	do
		local p = 0
		while p < sz do
			local c = inputBuffer[p + offset + 1]
			do p = p + 1 end
			if c == 13 then
				goto _continue1
			end
			if self.parser.method == nil then
				if c == 10 then
					goto _continue1
				end
				if c == 32 then
					if self.parser.hdr ~= nil then
						self.parser.method = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					goto _continue1
				end
			elseif self.parser.uri == nil then
				if c == 32 then
					if self.parser.hdr ~= nil then
						self.parser.uri = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					goto _continue1
				elseif c == 10 then
					if self.parser.hdr ~= nil then
						self.parser.uri = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					self.parser.version = "HTTP/0.9"
					self.parser.headersDone = true
					do self:onHeadersDone() end
					if p < sz then
						do self:onData(inputBuffer, offset + p, sz - p) end
					end
					do return end
				end
			elseif self.parser.version == nil then
				if c == 10 then
					if self.parser.hdr ~= nil then
						self.parser.version = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					goto _continue1
				end
			elseif self.parser.key == nil then
				if c == 58 then
					if self.parser.hdr ~= nil then
						self.parser.key = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					goto _continue1
				elseif c == 10 then
					if self.parser.hdr ~= nil then
						do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
						do self:resetParser() end
						do return end
					end
					self.parser.headersDone = true
					do self:onHeadersDone() end
					if p < sz then
						do self:onData(inputBuffer, offset + p, sz - p) end
					end
					do return end
				end
				if c >= 65 and c <= 90 then
					c = 97 + c - 65
				end
			elseif c == 32 and self.parser.hdr == nil then
				goto _continue1
			elseif c == 10 then
				local value = nil
				if self.parser.hdr ~= nil then
					value = self.parser.hdr:toString()
					self.parser.hdr = nil
				end
				if self.parser.headers == nil then
					self.parser.headers = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
				end
				do self.parser.headers:add(self.parser.key, value) end
				if _g.jk.lang.String:equalsIgnoreCase(self.parser.key, "content-length") and value ~= nil then
					self.parser.contentLength = _g.jk.lang.String:toInteger(value)
				elseif _g.jk.lang.String:equalsIgnoreCase(self.parser.key, "transfer-encoding") and value ~= nil and _g.jk.lang.String:contains(value, "chunked") then
					self.parser.bodyIsChunked = true
				end
				self.parser.key = nil
				goto _continue1
			end
			if self.parser.hdr == nil then
				self.parser.hdr = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			do self.parser.hdr:appendCharacter(c) end
			if self.parser.hdr:count() > 32 * 1024 then
				do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
				do self:resetParser() end
				do return end
			end
			::_continue1::
		end
	end
end

function jk.http.server.HTTPServerConnection:onBodyData(inputBuffer, offset, sz)
	if not (inputBuffer ~= nil) then
		do return end
	end
	if not (sz > 0) then
		do return end
	end
	if self.parser.bodyBuffer == nil and self.parser.bodyStream == nil then
		do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
		do self:resetParser() end
		do return end
	end
	if self.parser.contentLength > 0 then
		local p = 0
		if self.parser.dataCounter + sz <= self.parser.contentLength then
			p = sz
		else
			p = self.parser.contentLength - self.parser.dataCounter
		end
		if self.parser.bodyBuffer ~= nil then
			do _g.jk.lang.Buffer:copyFrom(self.parser.bodyBuffer, inputBuffer, offset, self.parser.dataCounter, p) end
		elseif self.parser.bodyStream:onDataStreamContent(_g.jk.lang.Buffer:getSubBuffer(inputBuffer, offset, p, false), p) == false then
			do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
			self.parser.bodyStream = nil
			do self:resetParser() end
			do return end
		end
		self.parser.dataCounter = self.parser.dataCounter + p
		if self.parser.dataCounter >= self.parser.contentLength then
			self.parser.bodyDone = true
			if self.parser.bodyBuffer ~= nil then
				local req = _g.jk.http.server.HTTPServerRequest:forDetails(self.parser.method, self.parser.uri, self.parser.version, self.parser.headers)
				do req:setBodyBuffer(self.parser.bodyBuffer) end
				self.parser.bodyBuffer = nil
				do self:onCompleteRequest(req) end
				do self:resetParser() end
			else
				if self.parser.bodyStream:onDataStreamEnd() == false then
					do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
					self.parser.bodyStream = nil
					do self:resetParser() end
					do return end
				end
				self.parser.bodyStream = nil
			end
			if p < sz then
				do self:onData(inputBuffer, offset + p, sz - p) end
			end
		end
		do return end
	elseif self.parser.bodyIsChunked then
		do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest("Chunked content body is not supported.")) end
		do self:resetParser() end
		do return end
	else
		do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
		do self:resetParser() end
	end
end

function jk.http.server.HTTPServerConnection:onData(buffer, offset, asz)
	if not (buffer ~= nil) then
		do return end
	end
	do
		local sz = asz
		if sz < 0 then
			sz = _g.jk.lang.Buffer:getSize(buffer) - offset
		end
		if self.isWaitingForBodyReceiver then
			self.parser.savedBodyChunk = _g.jk.lang.Buffer:getSubBuffer(buffer, offset, sz, false)
			do return end
		end
		if self.parser.headersDone and self.parser.bodyDone then
			do self:resetParser() end
		end
		if self.parser.headersDone == false then
			do self:onHeaderData(buffer, offset, sz) end
		elseif self.parser.bodyDone == false then
			do self:onBodyData(buffer, offset, sz) end
		end
	end
end

function jk.http.server.HTTPServerConnection:onOpened()
end

function jk.http.server.HTTPServerConnection:onClosed()
	do self:resetParser() end
end

function jk.http.server.HTTPServerConnection:onError(message)
	do _g.jk.log.Log:error(self.logContext, message) end
end

function jk.http.server.HTTPServerConnection:onDataReceived(data, size)
	do self:onData(data, 0, size) end
end

function jk.http.server.HTTPServerConnection:onWriteReady()
	do self:sendData1() end
end

function jk.http.server.HTTPServerConnection:onCompleteRequest(req)
	if not (req ~= nil) then
		do return end
	end
	do self.requests = self.requests + 1 end
	do req:setServer(self:getHTTPServer()) end
	do req:setConnection(self) end
	if self.currentRequest == nil then
		self.currentRequest = req
		do self:handleCurrentRequest() end
	else
		if self.requestQueue == nil then
			self.requestQueue = _g.jk.lang.Queue._construct0(_g.jk.lang.Queue._create())
		end
		do self.requestQueue:push(req) end
	end
end

function jk.http.server.HTTPServerConnection:handleNextRequest()
	if not (self.currentRequest == nil) then
		do return end
	end
	if not (self.requestQueue ~= nil) then
		do return end
	end
	do
		local req = _vm:to_table_with_key(self.requestQueue:pop(), '_isType.jk.http.server.HTTPServerRequest')
		if not (req ~= nil) then
			do return end
		end
		self.currentRequest = req
		do self:handleCurrentRequest() end
	end
end

function jk.http.server.HTTPServerConnection:sendErrorResponse(response)
	self.closeAfterSend = true
	do self:sendResponse(nil, response) end
end

function jk.http.server.HTTPServerConnection:handleCurrentRequest()
	if not (self.currentRequest ~= nil) then
		do return end
	end
	do
		local server = self:getHTTPServer()
		if not (server ~= nil) then
			do return end
		end
		do
			local method = self.currentRequest:getMethod()
			local url = self.currentRequest:getUrlString()
			if _g.jk.lang.String:isEmpty(method) or _g.jk.lang.String:isEmpty(url) then
				self.closeAfterSend = true
				do self:sendResponse(self.currentRequest, _g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
				do return end
			end
			if self.currentRequest:getVersion() == "HTTP/0.9" and not (method == "GET") then
				self.closeAfterSend = true
				do self:sendResponse(self.currentRequest, _g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
				do return end
			end
			do server:handleIncomingRequest(self.currentRequest) end
		end
	end
end

function jk.http.server.HTTPServerConnection:getStatusCode(status)
	if not (status ~= nil) then
		do return nil end
	end
	do
		local comps = _g.jk.lang.Vector:iterate(_g.jk.lang.String:split(status, 32, 0))
		if comps ~= nil then
			do return (function(o)
				if (_vm:get_variable_type(o) == 'string') then
					do return o end
				end
				do return nil end
			end)(comps:next()) end
		end
		do return nil end
	end
end

function jk.http.server.HTTPServerConnection:validateCurrentRequest(req)
	if not (req ~= nil) then
		do return false end
	end
	if self.currentRequest == nil then
		do _g.jk.log.Log:error(self.logContext, "Sending a response, but no current request!") end
		do _g.jk.log.Log:error(self.logContext, _g.jk.lang.StackTrace:generate()) end
		do self:close() end
		do return false end
	end
	if self.currentRequest ~= req then
		do _g.jk.log.Log:error(self.logContext, "Sending a response for an incorrect request") end
		do self:close() end
		do return false end
	end
	do return true end
end

function jk.http.server.HTTPServerConnection:startResponse(req, resp)
	if not (self.socket ~= nil) then
		do return nil end
	end
	if req ~= nil then
		if not self:validateCurrentRequest(req) then
			do return nil end
		end
	end
	do
		local server = self:getHTTPServer()
		if server ~= nil then
			do server:onRequestComplete(req, resp, 0, self:getRemoteAddress()) end
		end
		do
			local v = _g.jk.http.server.HTTPServerResponseSession._construct0(_g.jk.http.server.HTTPServerResponseSession._create())
			do v:setSocket(self:exportSocket()) end
			do v:setRequest(req) end
			do v:setResponse(resp) end
			do v:setServer(server) end
			self.currentRequest = nil
			do self:close() end
			do return v end
		end
	end
end

function jk.http.server.HTTPServerConnection:sendResponse(req, aresp)
	if not (self.socket ~= nil) then
		do return end
	end
	if req ~= nil then
		if not self:validateCurrentRequest(req) then
			do return end
		end
	end
	if self.isWaitingForBodyReceiver then
		self.closeAfterSend = true
	end
	do self.responses = self.responses + 1 end
	do
		local resp = aresp
		if resp == nil then
			resp = _g.jk.http.server.HTTPServerResponse:forTextString("")
		end
		do
			local inm = nil
			if req ~= nil then
				inm = req:getETag()
			end
			if inm ~= nil then
				if _g.jk.lang.String:equals(inm, resp:getETag()) then
					resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
					do resp:setStatus("304") end
					do resp:setETag(aresp:getETag()) end
				end
			end
			do
				local status = resp:getStatus()
				local bod = resp:getBody()
				local ver = nil
				local met = nil
				if req ~= nil then
					ver = req:getVersion()
					met = req:getMethod()
				end
				do
					local headers = resp:getHeaders()
					local server = self:getHTTPServer()
					if _g.jk.lang.String:equals("HTTP/0.9", ver) then
						self.closeAfterSend = true
					else
						if status == nil or _g.jk.lang.String:getLength(status) < 1 then
							status = "200"
							do resp:setStatus(status) end
						end
						if req ~= nil and req:getConnectionClose() then
							self.closeAfterSend = true
						end
						do
							local fs = _g.jk.http.server.HTTPServerResponse:getFullStatus(status)
							do
								local reply = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
								if ver == nil or _g.jk.lang.String:getLength(ver) < 1 then
									do reply:appendString("HTTP/1.1") end
								else
									do reply:appendString(ver) end
								end
								do reply:appendCharacter(32) end
								do reply:appendString(fs) end
								do reply:appendCharacter(13) end
								do reply:appendCharacter(10) end
								if _g.jk.lang.String:startsWith(fs, "400 ", 0) then
									self.closeAfterSend = true
								end
								if headers ~= nil then
									local it = headers:iterate()
									while it ~= nil do
										local kvp = it:next()
										if kvp == nil then
											do break end
										end
										do reply:appendString(kvp.key) end
										do reply:appendCharacter(58) end
										do reply:appendCharacter(32) end
										do reply:appendString(kvp.value) end
										do reply:appendCharacter(13) end
										do reply:appendCharacter(10) end
									end
								end
								if self.closeAfterSend then
									do reply:appendString("Connection: close\r\n") end
								end
								if server ~= nil then
									do reply:appendString("Server: ") end
									do reply:appendString(server:getServerName()) end
								end
								do reply:appendCharacter(13) end
								do reply:appendCharacter(10) end
								do reply:appendString("Date: ") end
								do reply:appendString(_g.jk.time.format.VerboseDateTimeString:forUTCNow()) end
								do reply:appendCharacter(13) end
								do reply:appendCharacter(10) end
								do reply:appendCharacter(13) end
								do reply:appendCharacter(10) end
								self.sendBuffer = _g.jk.lang.String:toUTF8Buffer(reply:toString())
							end
						end
					end
					self.sendWritten = 0
					if bod ~= nil then
						if _g.jk.lang.String:equals("HEAD", met) == false then
							self.sendBody = bod
						end
					end
					self.responseToSend = resp
					do self:updateListeningMode() end
				end
			end
		end
	end
end

function jk.http.server.HTTPServerConnection:sendData1()
	if not (self.socket ~= nil) then
		do return end
	end
	do
		local remoteAddress = self:getRemoteAddress()
		if _g.jk.lang.Buffer:getSize(self.sendBuffer) == 0 then
			if self.sendBody ~= nil then
				if (_vm:to_table_with_key(self.sendBody, '_isType.jk.io.BufferReader') ~= nil) then
					self.sendBuffer = self.sendBody:getBuffer()
					self.sendBody = nil
				else
					if self.sendBodyBuffer == nil then
						self.sendBodyBuffer = _util:allocate_buffer(self:getWriteBufferSize())
					end
					do
						local n = self.sendBody:read(self.sendBodyBuffer)
						if n < 1 then
							self.sendBody = nil
						elseif n == #self.sendBodyBuffer then
							self.sendBuffer = self.sendBodyBuffer
						else
							self.sendBuffer = _g.jk.lang.Buffer:getSubBuffer(self.sendBodyBuffer, 0, n, false)
						end
					end
				end
			end
		end
		if _g.jk.lang.Buffer:getSize(self.sendBuffer) > 0 then
			local socket = self.socket
			local r = socket:write(self.sendBuffer, _g.jk.lang.Buffer:getSize(self.sendBuffer))
			if r < 0 then
				self.sendBuffer = nil
				self.sendBody = nil
				do self:close() end
				do return end
			elseif r == 0 then
			else
				self.sendWritten = self.sendWritten + r
				do
					local osz = _g.jk.lang.Buffer:getSize(self.sendBuffer)
					if r < osz then
						self.sendBuffer = _g.jk.lang.Buffer:getSubBuffer(self.sendBuffer, r, osz - r, false)
					else
						self.sendBuffer = nil
					end
				end
			end
		end
		if _g.jk.lang.Buffer:getSize(self.sendBuffer) == 0 and self.sendBody == nil then
			local server = self:getHTTPServer()
			if server ~= nil then
				do server:onRequestComplete(self.currentRequest, self.responseToSend, self.sendWritten, remoteAddress) end
			end
			self.currentRequest = nil
			self.responseToSend = nil
			if self.closeAfterSend then
				do self:close() end
			else
				do self:updateListeningMode() end
				do self:handleNextRequest() end
			end
		end
		self.lastActivity = _g.jk.time.SystemClock:asSeconds()
	end
end

function jk.http.server.HTTPServerConnection:getRequests()
	do return self.requests end
end

function jk.http.server.HTTPServerConnection:setRequests(v)
	self.requests = v
	do return self end
end

function jk.http.server.HTTPServerConnection:getResponses()
	do return self.responses end
end

function jk.http.server.HTTPServerConnection:setResponses(v)
	self.responses = v
	do return self end
end

jk.http.server.HTTPServerResponseSession = {}
jk.http.server.HTTPServerResponseSession.__index = jk.http.server.HTTPServerResponseSession
_vm:set_metatable(jk.http.server.HTTPServerResponseSession, {})

function jk.http.server.HTTPServerResponseSession._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerResponseSession)
	return v
end

function jk.http.server.HTTPServerResponseSession:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerResponseSession'
	self['_isType.jk.http.server.HTTPServerResponseSession'] = true
	self.socket = nil
	self.server = nil
	self.request = nil
	self.response = nil
	self.totalBytes = 0
end

function jk.http.server.HTTPServerResponseSession:_construct0()
	jk.http.server.HTTPServerResponseSession._init(self)
	return self
end

function jk.http.server.HTTPServerResponseSession:createHeaderBuffer()
	local ver = nil
	local met = nil
	if self.request ~= nil then
		ver = self.request:getVersion()
		met = self.request:getMethod()
	end
	if ver == "HTTP/0.9" then
		do return nil end
	end
	do
		local resp = self.response
		if resp == nil then
			resp = _g.jk.http.server.HTTPServerResponse:forTextString("")
		end
		do
			local status = resp:getStatus()
			local headers = resp:getHeaders()
			if status == nil or _g.jk.lang.String:getLength(status) < 1 then
				status = "200"
				do resp:setStatus(status) end
			end
			do
				local fs = _g.jk.http.server.HTTPServerResponse:getFullStatus(status)
				local reply = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				if ver == nil or _g.jk.lang.String:getLength(ver) < 1 then
					do reply:appendString("HTTP/1.1") end
				else
					do reply:appendString(ver) end
				end
				do reply:appendCharacter(32) end
				do reply:appendString(fs) end
				do reply:appendCharacter(13) end
				do reply:appendCharacter(10) end
				if headers ~= nil then
					local it = headers:iterate()
					while it ~= nil do
						local kvp = it:next()
						if kvp == nil then
							do break end
						end
						do reply:appendString(kvp.key) end
						do reply:appendCharacter(58) end
						do reply:appendCharacter(32) end
						do reply:appendString(kvp.value) end
						do reply:appendCharacter(13) end
						do reply:appendCharacter(10) end
					end
				end
				do reply:appendString("Connection: close\r\n") end
				do reply:appendString("Cache-Control: no-store\r\n") end
				if self.server ~= nil then
					do reply:appendString("Server: ") end
					do reply:appendString(self.server:getServerName()) end
				end
				do reply:appendCharacter(13) end
				do reply:appendCharacter(10) end
				do reply:appendString("Date: ") end
				do reply:appendString(_g.jk.time.format.VerboseDateTimeString:forUTCNow()) end
				do reply:appendCharacter(13) end
				do reply:appendCharacter(10) end
				do reply:appendCharacter(13) end
				do reply:appendCharacter(10) end
				do return _g.jk.lang.String:toUTF8Buffer(reply:toString()) end
			end
		end
	end
end

function jk.http.server.HTTPServerResponseSession:writeHeader()
	local bb = self:createHeaderBuffer()
	if not (bb ~= nil) then
		do return true end
	end
	do return self:writeData(bb, -1) end
end

function jk.http.server.HTTPServerResponseSession:writeData(data, size)
	if not (self.socket ~= nil) then
		do return false end
	end
	if not (data ~= nil) then
		do return true end
	end
	do
		local sz = size
		if sz < 0 then
			sz = #data
		end
		do
			local r = self.socket:write(data, sz)
			if r > 0 then
				self.totalBytes = self.totalBytes + r
			end
			if r < sz then
				do return false end
			end
			do return true end
		end
	end
end

function jk.http.server.HTTPServerResponseSession:_end()
	if not (self.socket ~= nil) then
		do return end
	end
	do self.socket:close() end
	self.socket = nil
end

function jk.http.server.HTTPServerResponseSession:getSocket()
	do return self.socket end
end

function jk.http.server.HTTPServerResponseSession:setSocket(v)
	self.socket = v
	do return self end
end

function jk.http.server.HTTPServerResponseSession:getServer()
	do return self.server end
end

function jk.http.server.HTTPServerResponseSession:setServer(v)
	self.server = v
	do return self end
end

function jk.http.server.HTTPServerResponseSession:getRequest()
	do return self.request end
end

function jk.http.server.HTTPServerResponseSession:setRequest(v)
	self.request = v
	do return self end
end

function jk.http.server.HTTPServerResponseSession:getResponse()
	do return self.response end
end

function jk.http.server.HTTPServerResponseSession:setResponse(v)
	self.response = v
	do return self end
end

function jk.http.server.HTTPServerResponseSession:getTotalBytes()
	do return self.totalBytes end
end

function jk.http.server.HTTPServerResponseSession:setTotalBytes(v)
	self.totalBytes = v
	do return self end
end

jk.http.server.HTTPServerResponse = {}
jk.http.server.HTTPServerResponse.__index = jk.http.server.HTTPServerResponse
_vm:set_metatable(jk.http.server.HTTPServerResponse, {})

function jk.http.server.HTTPServerResponse._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerResponse)
	return v
end

function jk.http.server.HTTPServerResponse:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerResponse'
	self['_isType.jk.http.server.HTTPServerResponse'] = true
	self.headers = nil
	self.message = nil
	self.status = nil
	self.statusIsOk = false
	self.body = nil
	self.eTag = nil
end

function jk.http.server.HTTPServerResponse:_construct0()
	jk.http.server.HTTPServerResponse._init(self)
	return self
end

function jk.http.server.HTTPServerResponse:forMyPacket(packet)
	if not (packet ~= nil) then
		do return nil end
	end
	do
		local parser = _g.jk.mypacket.MyPacketParser:forBuffer(packet)
		local v = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
		do v:setStatus(parser:getLengthEncodedString()) end
		do
			local nheaders = parser:getLengthEncodedInteger()
			do
				local n = 0
				while n < nheaders do
					local key = parser:getLengthEncodedString()
					local val = parser:getLengthEncodedString()
					if not (key ~= nil) then
						key = ""
					end
					do v:addHeader(key, val) end
					do n = n + 1 end
				end
			end
			do v:setBody1(parser:getLengthEncodedBuffer()) end
			do return v end
		end
	end
end

function jk.http.server.HTTPServerResponse:parseBuffer(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local version = nil
		local statusCode = nil
		local statusMessage = nil
		local key = nil
		local headers = nil
		local hdr = nil
		local contentLength = 0
		local bodyBuffer = nil
		local sz = _g.jk.lang.Buffer:getSize(data)
		local p = 0
		while p < sz do
			local c = _vm:bitwise_and(_g.jk.lang.Buffer:getByte(data, p), 255)
			do p = p + 1 end
			if c == 13 then
				goto _continue2
			end
			if version == nil then
				if c == 32 then
					if hdr ~= nil then
						version = hdr:toString()
						hdr = nil
					end
					goto _continue2
				end
			elseif statusCode == nil then
				if c == 32 then
					if hdr ~= nil then
						statusCode = hdr:toString()
						hdr = nil
					end
					goto _continue2
				end
			elseif statusMessage == nil then
				if c == 10 then
					if hdr ~= nil then
						statusMessage = hdr:toString()
						hdr = nil
					end
					goto _continue2
				end
			elseif key == nil then
				if c == 58 then
					if hdr ~= nil then
						key = hdr:toString()
						hdr = nil
					end
					goto _continue2
				elseif c == 10 then
					if hdr ~= nil then
						do return nil end
					end
					do break end
				end
			elseif c == 32 and hdr == nil then
				goto _continue2
			elseif c == 10 then
				local value = nil
				if hdr ~= nil then
					value = hdr:toString()
					hdr = nil
				end
				if headers == nil then
					headers = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
				end
				do headers:add(key, value) end
				if _g.jk.lang.String:equalsIgnoreCase(key, "content-length") and not (value == nil) then
					contentLength = _g.jk.lang.Integer:asInteger(value)
				elseif _g.jk.lang.String:equalsIgnoreCase(key, "transfer-encoding") and not (value == nil) and _g.jk.lang.String:contains(value, "chunked") then
					do return nil end
				end
				key = nil
				goto _continue2
			end
			if hdr == nil then
				hdr = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			do hdr:appendCharacter(c) end
			if hdr:count() > 32 * 1024 then
				do return nil end
			end
			::_continue2::
		end
		if contentLength > 0 then
			bodyBuffer = _g.jk.lang.Buffer:getSubBuffer(data, p, -1, false)
		end
		do
			local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
			do resp:setStatus(statusCode) end
			do resp:setMessage(statusMessage) end
			do resp:setHeaders(headers) end
			do resp:setBody1(bodyBuffer) end
			do return resp end
		end
	end
end

function jk.http.server.HTTPServerResponse:forFile(file, maxCachedSize)
	if file == nil or file:isFile() == false then
		do return _g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil) end
	end
	do
		local bodyset = false
		local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
		do resp:setStatus("200") end
		do resp:addHeader("Content-Type", _g.jk.mime.MimeTypeRegistry:getSharedInstance():getTypeForFile(file)) end
		do
			local st = file:stat()
			if st ~= nil then
				local lm = st:getModifyTimeUTC()
				if lm > 0 then
					local dts = _g.jk.time.format.VerboseDateTimeString:forDateTime(_g.jk.lang.DateTime:forSeconds(lm))
					do resp:addHeader("Last-Modified", dts) end
					do resp:setETag(_g.jk.md5.MD5Encoder:encodeString(dts)) end
				end
				do
					local mcs = maxCachedSize
					if mcs < 0 then
						mcs = 32 * 1024
					end
					if st:getSize() < mcs then
						do resp:setBody1(file:getContentsBuffer()) end
						bodyset = true
					end
				end
			end
			if bodyset == false then
				do resp:setBody3(file) end
			end
			do return resp end
		end
	end
end

function jk.http.server.HTTPServerResponse:forBuffer(data, mimetype)
	local mt = mimetype
	if _g.jk.lang.String:isEmpty(mt) then
		mt = "application/binary"
	end
	do
		local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
		do resp:setStatus("200") end
		do resp:addHeader("Content-Type", mt) end
		do resp:setBody1(data) end
		do return resp end
	end
end

function jk.http.server.HTTPServerResponse:forOk(mimetype)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	if _g.jk.lang.String:isEmpty(mimetype) == false then
		do resp:addHeader("Content-Type", mimetype) end
	end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forString(text, mimetype)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	if _g.jk.lang.String:isEmpty(mimetype) == false then
		do resp:addHeader("Content-Type", mimetype) end
	end
	do resp:setBody2(text) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forTextString(text)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	do resp:addHeader("Content-Type", "text/plain; charset=\"UTF-8\"") end
	do resp:setBody2(text) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTMLString(html)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	do resp:addHeader("Content-Type", "text/html; charset=\"UTF-8\"") end
	do resp:setBody2(html) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forXMLString(xml)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	do resp:addHeader("Content-Type", "text/xml; charset=\"UTF-8\"") end
	do resp:setBody2(xml) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forJSONObject(o)
	do return _g.jk.http.server.HTTPServerResponse:forJSONString(_g.jk.json.JSONEncoder:encode(o, true, false)) end
end

function jk.http.server.HTTPServerResponse:forJSONString(json)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	do resp:addHeader("Content-Type", "application/json; charset=\"UTF-8\"") end
	do resp:setBody2(json) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:stringWithMessage(str, message)
	if _g.jk.lang.String:isEmpty(message) then
		do return str end
	end
	do return _g.jk.lang.String:safeString(str) .. ": " .. _g.jk.lang.String:safeString(message) end
end

function jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Invalid request", message))
	do resp:setStatus("400") end
	do resp:addHeader("Connection", "close") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPInternalError(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Internal server error", message))
	do resp:setStatus("500") end
	do resp:addHeader("Connection", "close") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPNotImplemented(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Not implemented", message))
	do resp:setStatus("501") end
	do resp:addHeader("Connection", "close") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPNotAllowed(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Not allowed", message))
	do resp:setStatus("405") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPNotFound(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Not found", message))
	do resp:setStatus("404") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPForbidden(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Forbidden", message))
	do resp:setStatus("403") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forRedirect(url)
	do return _g.jk.http.server.HTTPServerResponse:forHTTPMovedTemporarily(url) end
end

function jk.http.server.HTTPServerResponse:forHTTPMovedPermanently(url)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("301") end
	do resp:addHeader("Location", url) end
	do resp:setBody2(url) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPMovedTemporarily(url)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("303") end
	do resp:addHeader("Location", url) end
	do resp:setBody2(url) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPTemporaryRedirect(url)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("307") end
	do resp:addHeader("Location", url) end
	do resp:setBody2(url) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:getFullStatus(status)
	local v = nil
	if status ~= nil and _g.jk.lang.String:getIndexOfString(status, " ", 0) < 1 then
		if _g.jk.lang.String:equals("200", status) then
			v = "200 OK"
		elseif _g.jk.lang.String:equals("301", status) then
			v = "301 Moved Permanently"
		elseif _g.jk.lang.String:equals("303", status) then
			v = "303 See Other"
		elseif _g.jk.lang.String:equals("304", status) then
			v = "304 Not Modified"
		elseif _g.jk.lang.String:equals("400", status) then
			v = "400 Bad Request"
		elseif _g.jk.lang.String:equals("401", status) then
			v = "401 Unauthorized"
		elseif _g.jk.lang.String:equals("403", status) then
			v = "403 Forbidden"
		elseif _g.jk.lang.String:equals("404", status) then
			v = "404 Not found"
		elseif _g.jk.lang.String:equals("405", status) then
			v = "405 Method not allowed"
		elseif _g.jk.lang.String:equals("500", status) then
			v = "500 Internal server error"
		elseif _g.jk.lang.String:equals("501", status) then
			v = "501 Not implemented"
		elseif _g.jk.lang.String:equals("503", status) then
			v = "503 Service unavailable"
		else
			v = _g.jk.lang.String:safeString(status) .. " Unknown"
		end
	else
		v = status
	end
	do return v end
end

function jk.http.server.HTTPServerResponse:forException(e)
	local v = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do v:setStatus("500") end
	do v:setBody2(_g.jk.lang.String:asString(e)) end
	do return v end
end

function jk.http.server.HTTPServerResponse:setETag(eTag)
	self.eTag = eTag
	do self:addHeader("ETag", eTag) end
	do return self end
end

function jk.http.server.HTTPServerResponse:getETag()
	do return self.eTag end
end

function jk.http.server.HTTPServerResponse:setStatus(status)
	self.status = status
	if status == "200" then
		self.statusIsOk = true
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:getStatus()
	do return self.status end
end

function jk.http.server.HTTPServerResponse:enableCORS(req)
	do self:addHeader("Access-Control-Allow-Origin", "*") end
	if req ~= nil then
		local rqm = req:getHeader("access-control-request-method")
		if _g.jk.lang.String:isNotEmpty(rqm) then
			do self:addHeader("Access-Control-Allow-Methods", rqm) end
		end
		do
			local rqh = req:getHeader("access-control-request-headers")
			if _g.jk.lang.String:isNotEmpty(rqh) then
				do self:addHeader("Access-Control-Allow-Headers", rqh) end
			end
		end
	end
	do self:addHeader("Access-Control-Max-Age", "1728000") end
	do return self end
end

function jk.http.server.HTTPServerResponse:addHeader(key, value)
	if not (self.headers ~= nil) then
		self.headers = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	end
	do self.headers:add(key, value) end
	do return self end
end

function jk.http.server.HTTPServerResponse:addCookie(cookie)
	if not (cookie ~= nil) then
		do return end
	end
	do self:addHeader("Set-Cookie", cookie:toString()) end
end

function jk.http.server.HTTPServerResponse:setBody1(buf)
	if not (buf ~= nil) then
		self.body = nil
		do self:addHeader("Content-Length", "0") end
	else
		self.body = _g.jk.io.BufferReader:forBuffer(buf)
		do self:addHeader("Content-Length", _g.jk.lang.String:forInteger(#buf)) end
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:setBody2(str)
	if not (str ~= nil) then
		self.body = nil
		do self:addHeader("Content-Length", "0") end
	else
		local buf = _g.jk.lang.String:toUTF8Buffer(str)
		self.body = _g.jk.io.BufferReader:forBuffer(buf)
		do self:addHeader("Content-Length", _g.jk.lang.String:forInteger(_g.jk.lang.Buffer:getSize(buf))) end
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:setBody3(file)
	if file == nil or file:isFile() == false then
		self.body = nil
		do self:addHeader("Content-Length", "0") end
	else
		self.body = file:read()
		do self:addHeader("Content-Length", _g.jk.lang.String:forInteger(file:getSize())) end
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:setBody4(reader)
	if reader == nil then
		self.body = nil
		do self:addHeader("Content-Length", "0") end
	else
		self.body = reader
		do self:addHeader("Content-Length", _g.jk.lang.String:forInteger(reader:getSize())) end
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:getBody()
	do return self.body end
end

function jk.http.server.HTTPServerResponse:getHeaders()
	do return self.headers end
end

function jk.http.server.HTTPServerResponse:setHeaders(v)
	self.headers = v
	do return self end
end

function jk.http.server.HTTPServerResponse:getMessage()
	do return self.message end
end

function jk.http.server.HTTPServerResponse:setMessage(v)
	self.message = v
	do return self end
end

jk.http.server.HTTPServerBinaryReaderResponseWorker = _g.jk.http.server.HTTPServerResponseWorker._create()
jk.http.server.HTTPServerBinaryReaderResponseWorker.__index = jk.http.server.HTTPServerBinaryReaderResponseWorker
_vm:set_metatable(jk.http.server.HTTPServerBinaryReaderResponseWorker, {
	__index = _g.jk.http.server.HTTPServerResponseWorker
})

function jk.http.server.HTTPServerBinaryReaderResponseWorker._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerBinaryReaderResponseWorker)
	return v
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerBinaryReaderResponseWorker'
	self['_isType.jk.http.server.HTTPServerBinaryReaderResponseWorker'] = true
	self.reader = nil
	self.packetSize = 8192 * 2
	self.mimeType = nil
	self.workBuffer = nil
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:forReader(reader)
	local v = _g.jk.http.server.HTTPServerBinaryReaderResponseWorker._construct0(_g.jk.http.server.HTTPServerBinaryReaderResponseWorker._create())
	do v:setReader(reader) end
	do return v end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:_construct0()
	jk.http.server.HTTPServerBinaryReaderResponseWorker._init(self)
	do _g.jk.http.server.HTTPServerResponseWorker._construct0(self) end
	self.mimeType = "application/octet-stream"
	return self
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:setMimeType(value)
	self.mimeType = value
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:getMimeType()
	do return self.mimeType end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:getWorkerDescription()
	do return "HTTPServerBinaryReaderResponseWorker" end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:onStart()
	do _g.jk.http.server.HTTPServerResponseWorker.onStart(self) end
	self.workBuffer = _util:allocate_buffer(self.packetSize)
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:tick()
	if not (self.workBuffer ~= nil) then
		do return false end
	end
	if not (self.reader ~= nil) then
		do return false end
	end
	do
		local r = self.reader:read(self.workBuffer)
		if r < 1 then
			do return false end
		end
		if not self.session:writeData(self.workBuffer, r) then
			do _g.jk.log.Log:debug(self.context, "Remote connection closed. " .. "HTTPServerBinaryReaderResponseWorker" .. " aborted.") end
			do return false end
		end
		do return true end
	end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:getReader()
	do return self.reader end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:setReader(v)
	self.reader = v
	do return self end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:getPacketSize()
	do return self.packetSize end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:setPacketSize(v)
	self.packetSize = v
	do return self end
end

jk.http.server.HTTPServerBase = _g.jk.server.NetworkServer._create()
jk.http.server.HTTPServerBase.__index = jk.http.server.HTTPServerBase
_vm:set_metatable(jk.http.server.HTTPServerBase, {
	__index = _g.jk.server.NetworkServer
})

function jk.http.server.HTTPServerBase._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerBase)
	return v
end

function jk.http.server.HTTPServerBase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerBase'
	self['_isType.jk.http.server.HTTPServerBase'] = true
	self.writeBufferSize = 1024 * 512
	self.smallBodyLimit = 32 * 1024
	self.timeoutDelay = 30
	self.maintenanceTimerDelay = 60
	self.serverName = nil
	self.allowCORS = true
	self.workerThreadPool = nil
	self.timeoutTimer = nil
	self.maintenanceTimer = nil
end

function jk.http.server.HTTPServerBase:_construct0()
	jk.http.server.HTTPServerBase._init(self)
	do _g.jk.server.NetworkServer._construct0(self) end
	do self:setPort(8080) end
	do self:setServerName("Jkop" .. "/" .. "20200428") end
	return self
end

function jk.http.server.HTTPServerBase:createConnectionObject()
	do return _g.jk.http.server.HTTPServerConnection._construct0(_g.jk.http.server.HTTPServerConnection._create()) end
end

function jk.http.server.HTTPServerBase:onRefresh()
end

function jk.http.server.HTTPServerBase:onTimeoutTimer()
	local cfc = {}
	local now = _g.jk.time.SystemClock:asSeconds()
	do self:forEachConnection(function(connection)
		local httpc = _vm:to_table_with_key(connection, '_isType.jk.http.server.HTTPServerConnection')
		if httpc == nil then
			do return end
		end
		if httpc:getResponses() >= httpc:getRequests() or httpc:getIsWaitingForBodyReceiver() and now - httpc:getLastActivity() >= self.timeoutDelay then
			do _g.jk.lang.Vector:append(cfc, httpc) end
		end
	end) end
	if cfc ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(cfc)
		do
			n = 0
			while n < m do
				local wsc = cfc[n + 1]
				if wsc ~= nil then
					do wsc:close() end
				end
				do n = n + 1 end
			end
		end
	end
	do return true end
end

function jk.http.server.HTTPServerBase:onMaintenanceTimer()
	do self:onMaintenance() end
	do return true end
end

function jk.http.server.HTTPServerBase:onMaintenance()
end

function jk.http.server.HTTPServerBase:startTimer(delay, handler)
	if not (self.ioManager ~= nil) then
		do return nil end
	end
	do return self.ioManager:startTimer(delay, handler) end
end

function jk.http.server.HTTPServerBase:initialize2()
	if not _g.jk.server.NetworkServer.initialize2(self) then
		do return false end
	end
	if self.timeoutDelay < 1 then
		do _g.jk.log.Log:debug(self.logContext, "HTTPServerBase" .. ": Timeout timer disabled") end
	else
		do _g.jk.log.Log:debug(self.logContext, "HTTPServerBase" .. ": Starting a timeout timer with a " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.timeoutDelay)) .. " second delay.") end
		self.timeoutTimer = self.ioManager:startTimer(self.timeoutDelay * 1000000, function()
			do self:onTimeoutTimer() end
		end)
		if self.timeoutTimer == nil then
			do _g.jk.log.Log:error(self.logContext, "HTTPServerBase" .. ": Failed to start timeout timer") end
		end
	end
	if self.maintenanceTimerDelay < 1 then
		do _g.jk.log.Log:debug(self.logContext, "Maintenance timer disabled") end
	else
		do _g.jk.log.Log:debug(self.logContext, "HTTPServerBase" .. ": Starting a maintenance timer with a " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maintenanceTimerDelay)) .. " second delay.") end
		self.maintenanceTimer = self.ioManager:startTimer(self.maintenanceTimerDelay * 1000000, function()
			do self:onMaintenanceTimer() end
		end)
		if self.maintenanceTimer == nil then
			do _g.jk.log.Log:error(self.logContext, "HTTPServerBase" .. ": Failed to start maintenance timer") end
		end
	end
	do _g.jk.log.Log:info(self.logContext, "HTTPServerBase" .. ": initialized: `" .. _g.jk.lang.String:safeString(self:getServerName()) .. "'") end
	do return true end
end

function jk.http.server.HTTPServerBase:cleanup()
	do _g.jk.server.NetworkServer.cleanup(self) end
	if self.maintenanceTimer ~= nil then
		do self.maintenanceTimer:stop() end
		self.maintenanceTimer = nil
	end
	if self.timeoutTimer ~= nil then
		do self.timeoutTimer:stop() end
		self.timeoutTimer = nil
	end
end

function jk.http.server.HTTPServerBase:createOptionsResponse(req)
	do return _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create()):setStatus("200"):addHeader("Content-Length", "0") end
end

function jk.http.server.HTTPServerBase:onRequest(req)
	do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil)) end
end

function jk.http.server.HTTPServerBase:handleIncomingRequest(req)
	if not (req ~= nil) then
		do return end
	end
	if req:getMethod() == "OPTIONS" then
		local resp = self:createOptionsResponse(req)
		if resp ~= nil then
			do req:sendResponse(resp) end
			do return end
		end
	end
	do self:onRequest(req) end
end

function jk.http.server.HTTPServerBase:sendResponse(connection, req, resp)
	if not (connection ~= nil) then
		do return end
	end
	if self.allowCORS then
		do resp:enableCORS(req) end
	end
	do connection:sendResponse(req, resp) end
end

function jk.http.server.HTTPServerBase:startResponse(connection, req, resp)
	if not (connection ~= nil) then
		do return nil end
	end
	if self.allowCORS then
		do resp:enableCORS(req) end
	end
	do return connection:startResponse(req, resp) end
end

jk.http.server.HTTPServerBase.WorkerThread = {}
jk.http.server.HTTPServerBase.WorkerThread.__index = jk.http.server.HTTPServerBase.WorkerThread
_vm:set_metatable(jk.http.server.HTTPServerBase.WorkerThread, {})

function jk.http.server.HTTPServerBase.WorkerThread._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerBase.WorkerThread)
	return v
end

function jk.http.server.HTTPServerBase.WorkerThread:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerBase.WorkerThread'
	self['_isType.jk.http.server.HTTPServerBase.WorkerThread'] = true
	self['_isType.jk.lang.Runnable'] = true
	self.worker = nil
end

function jk.http.server.HTTPServerBase.WorkerThread:_construct0()
	jk.http.server.HTTPServerBase.WorkerThread._init(self)
	return self
end

function jk.http.server.HTTPServerBase.WorkerThread:run()
	if not (self.worker ~= nil) then
		do return end
	end
	do self.worker:onStart() end
	while true do
		if self.worker:tick() == false then
			do break end
		end
	end
	do self.worker:onEnd() end
end

function jk.http.server.HTTPServerBase.WorkerThread:getWorker()
	do return self.worker end
end

function jk.http.server.HTTPServerBase.WorkerThread:setWorker(v)
	self.worker = v
	do return self end
end

function jk.http.server.HTTPServerBase:startResponseWorker(worker)
	if not (worker ~= nil) then
		do return false end
	end
	do worker:setContext(self.logContext) end
	if not (self.workerThreadPool ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "Trying to start a response worker, but no thread pool has been initialized") end
		do worker:abort() end
		do return false end
	end
	do self.workerThreadPool:submitTask(_g.jk.http.server.HTTPServerBase.WorkerThread._construct0(_g.jk.http.server.HTTPServerBase.WorkerThread._create()):setWorker(worker)) end
	do _g.jk.log.Log:debug(self.logContext, "HTTPServerBase" .. ": Starting a new worker thread. We now have " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.workerThreadPool:getRunningThreadsCount())) .. " thread(s).") end
	do return true end
end

function jk.http.server.HTTPServerBase:onRequestComplete(request, resp, bytesSent, remoteAddress)
end

function jk.http.server.HTTPServerBase:getWriteBufferSize()
	do return self.writeBufferSize end
end

function jk.http.server.HTTPServerBase:setWriteBufferSize(v)
	self.writeBufferSize = v
	do return self end
end

function jk.http.server.HTTPServerBase:getSmallBodyLimit()
	do return self.smallBodyLimit end
end

function jk.http.server.HTTPServerBase:setSmallBodyLimit(v)
	self.smallBodyLimit = v
	do return self end
end

function jk.http.server.HTTPServerBase:getTimeoutDelay()
	do return self.timeoutDelay end
end

function jk.http.server.HTTPServerBase:setTimeoutDelay(v)
	self.timeoutDelay = v
	do return self end
end

function jk.http.server.HTTPServerBase:getMaintenanceTimerDelay()
	do return self.maintenanceTimerDelay end
end

function jk.http.server.HTTPServerBase:setMaintenanceTimerDelay(v)
	self.maintenanceTimerDelay = v
	do return self end
end

function jk.http.server.HTTPServerBase:getServerName()
	do return self.serverName end
end

function jk.http.server.HTTPServerBase:setServerName(v)
	self.serverName = v
	do return self end
end

function jk.http.server.HTTPServerBase:getAllowCORS()
	do return self.allowCORS end
end

function jk.http.server.HTTPServerBase:setAllowCORS(v)
	self.allowCORS = v
	do return self end
end

function jk.http.server.HTTPServerBase:getWorkerThreadPool()
	do return self.workerThreadPool end
end

function jk.http.server.HTTPServerBase:setWorkerThreadPool(v)
	self.workerThreadPool = v
	do return self end
end

jk.http.server.HTTPServer = _g.jk.http.server.HTTPServerBase._create()
jk.http.server.HTTPServer.__index = jk.http.server.HTTPServer
_vm:set_metatable(jk.http.server.HTTPServer, {
	__index = _g.jk.http.server.HTTPServerBase
})

function jk.http.server.HTTPServer._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServer)
	return v
end

function jk.http.server.HTTPServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServer'
	self['_isType.jk.http.server.HTTPServer'] = true
	self.createOptionsResponseHandler = nil
	self.requestHandlerListenerFunctions = nil
	self.requestHandlerListenerObjects = nil
	self.handlerStack = nil
end

function jk.http.server.HTTPServer:_construct0()
	jk.http.server.HTTPServer._init(self)
	do _g.jk.http.server.HTTPServerBase._construct0(self) end
	self.handlerStack = _g.jk.http.server.HTTPServerRequestHandlerStack._construct0(_g.jk.http.server.HTTPServerRequestHandlerStack._create())
	return self
end

function jk.http.server.HTTPServer:initialize2()
	if not _g.jk.http.server.HTTPServerBase.initialize2(self) then
		do return false end
	end
	do self.handlerStack:initialize(self) end
	if self.requestHandlerListenerObjects ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n = 0
			while n < m do
				local listener = self.requestHandlerListenerObjects[n + 1]
				if listener ~= nil then
					if (_vm:to_table_with_key(listener, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
						do listener:initialize(self) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return true end
end

function jk.http.server.HTTPServer:onRefresh()
	do _g.jk.http.server.HTTPServerBase.onRefresh(self) end
	do self.handlerStack:onRefresh() end
	if self.requestHandlerListenerObjects ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n = 0
			while n < m do
				local listener = self.requestHandlerListenerObjects[n + 1]
				if listener ~= nil then
					if (_vm:to_table_with_key(listener, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
						do listener:onRefresh() end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.http.server.HTTPServer:onMaintenance()
	do _g.jk.http.server.HTTPServerBase.onMaintenance(self) end
	do self.handlerStack:onMaintenance() end
	if self.requestHandlerListenerObjects ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n = 0
			while n < m do
				local listener = self.requestHandlerListenerObjects[n + 1]
				if listener ~= nil then
					if (_vm:to_table_with_key(listener, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
						do listener:onMaintenance() end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.http.server.HTTPServer:cleanup()
	do _g.jk.http.server.HTTPServerBase.cleanup(self) end
	do self.handlerStack:cleanup() end
	if self.requestHandlerListenerObjects ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n = 0
			while n < m do
				local listener = self.requestHandlerListenerObjects[n + 1]
				if listener ~= nil then
					if (_vm:to_table_with_key(listener, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
						do listener:cleanup() end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.http.server.HTTPServer:pushRequestHandler1(handler)
	do self.handlerStack:pushRequestHandler1(handler) end
end

function jk.http.server.HTTPServer:pushRequestHandler2(handler)
	do self.handlerStack:pushRequestHandler2(handler) end
end

function jk.http.server.HTTPServer:addRequestHandlerListener1(handler)
	if self.requestHandlerListenerFunctions == nil then
		self.requestHandlerListenerFunctions = {}
	end
	do _g.jk.lang.Vector:append(self.requestHandlerListenerFunctions, handler) end
end

function jk.http.server.HTTPServer:addRequestHandlerListener2(handler)
	if self.requestHandlerListenerObjects == nil then
		self.requestHandlerListenerObjects = {}
	end
	do _g.jk.lang.Vector:append(self.requestHandlerListenerObjects, handler) end
	if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) and self:isInitialized() then
		do handler:initialize(self) end
	end
end

function jk.http.server.HTTPServer:createOptionsResponse(req)
	if self.createOptionsResponseHandler ~= nil then
		do return self.createOptionsResponseHandler(req) end
	end
	do return _g.jk.http.server.HTTPServerBase.createOptionsResponse(self, req) end
end

function jk.http.server.HTTPServer:onRequest(req)
	local rq = req
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self.handlerStack:handleRequest(_vm:to_table_with_key(req, '_isType.jk.http.server.HTTPServerRequest'), function()
				do rq:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil)) end
			end) end
		end)
		if _err then
			local e = _err
			do _g.jk.log.Log:error(self.logContext, "Exception while processing request: " .. _g.jk.lang.String:safeString(_g.jk.log.Log:asString(self.logContext, e))) end
			do rq:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
		end
	end
end

function jk.http.server.HTTPServer:onRequestComplete(request, resp, bytesSent, remoteAddress)
	do _g.jk.http.server.HTTPServerBase.onRequestComplete(self, request, resp, bytesSent, remoteAddress) end
	if self.requestHandlerListenerFunctions ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerFunctions)
		do
			n = 0
			while n < m do
				local handler = self.requestHandlerListenerFunctions[n + 1]
				if handler ~= nil then
					do handler(request, resp, bytesSent, remoteAddress) end
				end
				do n = n + 1 end
			end
		end
	end
	if self.requestHandlerListenerObjects ~= nil then
		local n2 = 0
		local m2 = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n2 = 0
			while n2 < m2 do
				local handler = self.requestHandlerListenerObjects[n2 + 1]
				if handler ~= nil then
					do handler:onRequestHandled(request, resp, bytesSent, remoteAddress) end
				end
				do n2 = n2 + 1 end
			end
		end
	end
end

function jk.http.server.HTTPServer:getCreateOptionsResponseHandler()
	do return self.createOptionsResponseHandler end
end

function jk.http.server.HTTPServer:setCreateOptionsResponseHandler(v)
	self.createOptionsResponseHandler = v
	do return self end
end

jk.http.server.HTTPServerRequestLogger = {}
jk.http.server.HTTPServerRequestLogger.__index = jk.http.server.HTTPServerRequestLogger
_vm:set_metatable(jk.http.server.HTTPServerRequestLogger, {})

function jk.http.server.HTTPServerRequestLogger._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestLogger)
	return v
end

function jk.http.server.HTTPServerRequestLogger:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestLogger'
	self['_isType.jk.http.server.HTTPServerRequestLogger'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandlerListener'] = true
	self.logdir = nil
	self.logContext = nil
end

function jk.http.server.HTTPServerRequestLogger:_construct0()
	jk.http.server.HTTPServerRequestLogger._init(self)
	return self
end

function jk.http.server.HTTPServerRequestLogger:onRequestHandled(request, resp, written, aremoteAddress)
	local remoteAddress = aremoteAddress
	if _g.jk.lang.String:isEmpty(remoteAddress) then
		remoteAddress = "-"
	end
	do
		local username = nil
		if _g.jk.lang.String:isEmpty(username) then
			username = "-"
		end
		do
			local sessionid = nil
			if _g.jk.lang.String:isEmpty(sessionid) then
				sessionid = "-"
			end
			do
				local dt = _g.jk.time.SystemClock:asDateTimeUTC()
				local logTime = nil
				if dt ~= nil then
					logTime = _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getDayOfMonth())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getMonth())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getYear())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getHours())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getMinutes())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getSeconds())) .. " UTC"
				else
					logTime = "[DATE/TIME]"
				end
				do
					local rf = request:getHeader("referer")
					if _g.jk.lang.String:isEmpty(rf) then
						rf = "-"
					end
					do
						local logLine = _g.jk.lang.String:safeString(remoteAddress) .. " " .. _g.jk.lang.String:safeString(username) .. " " .. _g.jk.lang.String:safeString(sessionid) .. " [" .. _g.jk.lang.String:safeString(logTime) .. "] \"" .. _g.jk.lang.String:safeString(request:getMethod()) .. " " .. _g.jk.lang.String:safeString(request:getURLPath()) .. " " .. _g.jk.lang.String:safeString(request:getVersion()) .. "\" " .. _g.jk.lang.String:safeString(resp:getStatus()) .. " " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(written)) .. " \"" .. _g.jk.lang.String:safeString(rf) .. "\" \"" .. _g.jk.lang.String:safeString(request:getHeader("user-agent")) .. "\""
						if self.logdir ~= nil then
							local logidname = nil
							if dt ~= nil then
								logidname = "accesslog_" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getYear())) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getMonth())) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getDayOfMonth())) .. ".log"
							else
								logidname = "accesslog.log"
							end
							do
								local os = _g.jk.io.PrintWriterWrapper:forWriter(self.logdir:entry(logidname):append())
								if os == nil and self.logdir:isDirectory() == false then
									do self.logdir:createDirectoryRecursive() end
									os = _g.jk.io.PrintWriterWrapper:forWriter(self.logdir:entry(logidname):append())
								end
								if os ~= nil then
									do os:println(logLine) end
								end
								do _g.jk.log.Log:debug(self.logContext, logLine) end
							end
						elseif self.logContext ~= nil then
							do _g.jk.log.Log:info(self.logContext, logLine) end
						else
							_io:write_to_stdout(logLine .. "\n")
						end
					end
				end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestLogger:getLogdir()
	do return self.logdir end
end

function jk.http.server.HTTPServerRequestLogger:setLogdir(v)
	self.logdir = v
	do return self end
end

function jk.http.server.HTTPServerRequestLogger:getLogContext()
	do return self.logContext end
end

function jk.http.server.HTTPServerRequestLogger:setLogContext(v)
	self.logContext = v
	do return self end
end

jk.http.server.HTTPServerRequestHandlerContainer = _g.jk.http.server.HTTPServerRequestHandlerAdapter._create()
jk.http.server.HTTPServerRequestHandlerContainer.__index = jk.http.server.HTTPServerRequestHandlerContainer
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerContainer, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerAdapter
})

function jk.http.server.HTTPServerRequestHandlerContainer._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerContainer)
	return v
end

function jk.http.server.HTTPServerRequestHandlerContainer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerContainer'
	self['_isType.jk.http.server.HTTPServerRequestHandlerContainer'] = true
end

function jk.http.server.HTTPServerRequestHandlerContainer:_construct0()
	jk.http.server.HTTPServerRequestHandlerContainer._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter._construct0(self) end
	return self
end

function jk.http.server.HTTPServerRequestHandlerContainer:iterateRequestHandlers()
end

function jk.http.server.HTTPServerRequestHandlerContainer:initialize(server)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.initialize(self, server) end
	do
		local it = self:iterateRequestHandlers()
		while it ~= nil do
			local handler = it:next()
			if handler == nil then
				do break end
			end
			if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do handler:initialize(server) end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerContainer:onRefresh()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.onRefresh(self) end
	do
		local it = self:iterateRequestHandlers()
		while it ~= nil do
			local handler = it:next()
			if handler == nil then
				do break end
			end
			if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do handler:onRefresh() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerContainer:onMaintenance()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.onMaintenance(self) end
	do
		local it = self:iterateRequestHandlers()
		while it ~= nil do
			local handler = it:next()
			if handler == nil then
				do break end
			end
			if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do handler:onMaintenance() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerContainer:cleanup()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.cleanup(self) end
	do
		local it = self:iterateRequestHandlers()
		while it ~= nil do
			local handler = it:next()
			if handler == nil then
				do break end
			end
			if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do handler:cleanup() end
			end
		end
	end
end

jk.http.server.HTTPServerRequest = {}
jk.http.server.HTTPServerRequest.__index = jk.http.server.HTTPServerRequest
_vm:set_metatable(jk.http.server.HTTPServerRequest, {})

function jk.http.server.HTTPServerRequest._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequest)
	return v
end

function jk.http.server.HTTPServerRequest:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequest'
	self['_isType.jk.http.server.HTTPServerRequest'] = true
	self['_isType.jk.io.DataStreamSource'] = true
	self.method = nil
	self.urlString = nil
	self.version = nil
	self.rawHeaders = nil
	self.headers = nil
	self.url = nil
	self.connection = nil
	self.server = nil
	self.data = nil
	self.session = nil
	self.cookies = nil
	self.bodyBuffer = nil
	self.bodyString = nil
	self.postParameters = nil
	self.resources = nil
	self.currentResource = 0
	self.relativeResourcePath = nil
	self.responseSent = false
	self.responseCookies = nil
end

function jk.http.server.HTTPServerRequest:_construct0()
	jk.http.server.HTTPServerRequest._init(self)
	return self
end

function jk.http.server.HTTPServerRequest:forDetails(method, url, version, headers)
	local v = _g.jk.http.server.HTTPServerRequest._construct0(_g.jk.http.server.HTTPServerRequest._create())
	v.method = method
	v.urlString = url
	v.version = version
	do v:setHeaders(headers) end
	do return v end
end

function jk.http.server.HTTPServerRequest:asBuffer()
	if _g.jk.lang.String:isEmpty(self.method) or _g.jk.lang.String:isEmpty(self.urlString) or _g.jk.lang.String:isEmpty(self.version) or self.rawHeaders == nil then
		do return nil end
	end
	do
		local hdr = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do hdr:appendString(self.method) end
		do hdr:appendCharacter(32) end
		do hdr:appendString(self.urlString) end
		do hdr:appendCharacter(32) end
		do hdr:appendString(self.version) end
		do hdr:appendCharacter(13) end
		do hdr:appendCharacter(10) end
		do
			local itr = self:iterateHeaders()
			if not (itr ~= nil) then
				do return nil end
			end
			while true do
				local kvp = _vm:to_table_with_key(itr:next(), '_isType.jk.lang.KeyValuePair')
				if kvp == nil then
					do break end
				end
				do hdr:appendString(kvp.key) end
				do hdr:appendCharacter(58) end
				do hdr:appendCharacter(32) end
				do hdr:appendString(kvp.value) end
				do hdr:appendCharacter(13) end
				do hdr:appendCharacter(10) end
			end
			do hdr:appendCharacter(13) end
			do hdr:appendCharacter(10) end
			do
				local v = _g.jk.lang.String:toUTF8Buffer(hdr:toString())
				if not (v ~= nil) then
					do return nil end
				end
				if self.bodyBuffer ~= nil then
					v = _g.jk.lang.Buffer:append(v, self.bodyBuffer, -1)
				end
				do return v end
			end
		end
	end
end

function jk.http.server.HTTPServerRequest:setReceiverDataStream(stream)
	do self:setBodyReceiver(stream) end
end

function jk.http.server.HTTPServerRequest:setBodyReceiver(receiver)
	if not (receiver ~= nil) then
		do return end
	end
	if self.bodyBuffer ~= nil then
		local sz = #self.bodyBuffer
		if not receiver:onDataStreamStart(sz) then
			do return end
		end
		if not receiver:onDataStreamContent(self.bodyBuffer, sz) then
			do return end
		end
		do receiver:onDataStreamEnd() end
		do return end
	end
	if not (self.connection ~= nil) then
		do return end
	end
	do self.connection:setBodyReceiver(receiver) end
end

function jk.http.server.HTTPServerRequest:clearHeaders()
	self.rawHeaders = nil
	self.headers = nil
end

function jk.http.server.HTTPServerRequest:addHeader(key, value)
	if not (key ~= nil) then
		do return end
	end
	if not (self.rawHeaders ~= nil) then
		self.rawHeaders = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	end
	if not (self.headers ~= nil) then
		self.headers = {}
	end
	do self.rawHeaders:add(key, value) end
	self.headers[_g.jk.lang.String:toLowerCase(key)] = value
end

function jk.http.server.HTTPServerRequest:setHeaders(headers)
	do self:clearHeaders() end
	if not (headers ~= nil) then
		do return end
	end
	do
		local it = headers:iterate()
		if not (it ~= nil) then
			do return end
		end
		while true do
			local kvp = it:next()
			if not (kvp ~= nil) then
				do break end
			end
			do self:addHeader(kvp.key, kvp.value) end
		end
	end
end

function jk.http.server.HTTPServerRequest:getHeader(name)
	if not _g.jk.lang.String:isNotEmpty(name) then
		do return nil end
	end
	if not (self.headers ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.headers, name) end
end

function jk.http.server.HTTPServerRequest:iterateHeaders()
	if not (self.rawHeaders ~= nil) then
		do return nil end
	end
	do return self.rawHeaders:iterate() end
end

function jk.http.server.HTTPServerRequest:getHeaders()
	do return self.headers end
end

function jk.http.server.HTTPServerRequest:getURL()
	if self.url == nil then
		self.url = _g.jk.url.URL:forString(self.urlString, true)
	end
	do return self.url end
end

function jk.http.server.HTTPServerRequest:getQueryParameters()
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do return url:getQueryParameters() end
end

function jk.http.server.HTTPServerRequest:iterateQueryParameters()
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do
		local list = url:getRawQueryParameters()
		if not (list ~= nil) then
			do return nil end
		end
		do return list:iterate() end
	end
end

function jk.http.server.HTTPServerRequest:getQueryParameter(key)
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do return url:getQueryParameter(key) end
end

function jk.http.server.HTTPServerRequest:getURLPath()
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do return url:getPath() end
end

function jk.http.server.HTTPServerRequest:getRemoteIPAddress()
	local rr = self:getRemoteAddress()
	if not (rr ~= nil) then
		do return nil end
	end
	do
		local colon = _g.jk.lang.String:getIndexOfCharacter(rr, 58, 0)
		if colon < 0 then
			do return rr end
		end
		do return _g.jk.lang.String:getSubString(rr, 0, colon) end
	end
end

function jk.http.server.HTTPServerRequest:getRemoteAddress()
	if not (self.connection ~= nil) then
		do return nil end
	end
	do return self.connection:getRemoteAddress() end
end

function jk.http.server.HTTPServerRequest:getConnectionClose()
	local hdr = self:getHeader("connection")
	if self.version == "HTTP/1.0" then
		if hdr == "keep-alive" then
			do return false end
		end
		do return true end
	end
	if hdr == "close" then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:getETag()
	do return self:getHeader("if-none-match") end
end

function jk.http.server.HTTPServerRequest:getCookieValues()
	if self.cookies == nil then
		local v = {}
		local cvals = self:getHeader("cookie")
		if cvals ~= nil then
			local sp = _g.jk.lang.String:split(cvals, 59, 0)
			if sp ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(sp)
				do
					n = 0
					while n < m do
						local ck = sp[n + 1]
						if ck ~= nil then
							ck = _g.jk.lang.String:strip(ck)
							if _g.jk.lang.String:isEmpty(ck) then
								goto _continue3
							end
							do
								local e = _g.jk.lang.String:getIndexOfCharacter(ck, 61, 0)
								if e < 0 then
									do _g.jk.lang.Map:set(v, ck, "") end
								else
									do _g.jk.lang.Map:set(v, _g.jk.lang.String:getSubString(ck, 0, e), _g.jk.lang.String:getEndOfString(ck, e + 1)) end
								end
							end
						end
						::_continue3::
						do n = n + 1 end
					end
				end
			end
		end
		self.cookies = v
	end
	do return self.cookies end
end

function jk.http.server.HTTPServerRequest:getCookieValue(name)
	local c = self:getCookieValues()
	if not (c ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(c, name) end
end

function jk.http.server.HTTPServerRequest:getBodyString()
	if self.bodyString == nil then
		local buffer = self:getBodyBuffer()
		if buffer ~= nil then
			self.bodyString = _g.jk.lang.String:forUTF8Buffer(buffer)
		end
		self.bodyBuffer = nil
	end
	do return self.bodyString end
end

function jk.http.server.HTTPServerRequest:getBodyJSONObject()
	do return _g.jk.json.JSONParser:parseString(self:getBodyString()) end
end

function jk.http.server.HTTPServerRequest:getBodyJSONVector()
	do return _vm:to_table_with_key(self:getBodyJSONObject(), '_isType.jk.lang.DynamicVector') end
end

function jk.http.server.HTTPServerRequest:getBodyJSONMap()
	do return _vm:to_table_with_key(self:getBodyJSONObject(), '_isType.jk.lang.DynamicMap') end
end

function jk.http.server.HTTPServerRequest:getBodyJSONMapValue(key)
	local map = self:getBodyJSONMap()
	if not (map ~= nil) then
		do return nil end
	end
	do return map:getString(key, nil) end
end

function jk.http.server.HTTPServerRequest:getPostParameters()
	if self.postParameters == nil then
		local bs = self:getBodyString()
		if _g.jk.lang.String:isEmpty(bs) then
			do return nil end
		end
		self.postParameters = _g.jk.url.QueryString:parse(bs)
	end
	do return self.postParameters end
end

function jk.http.server.HTTPServerRequest:getPostParameter(key)
	local pps = self:getPostParameters()
	if not (pps ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(pps, key) end
end

function jk.http.server.HTTPServerRequest:getParameterAsString(key)
	local qp = self:getQueryParameter(key)
	if qp ~= nil then
		do return qp end
	end
	do
		local pp = self:getPostParameter(key)
		if pp ~= nil then
			do return pp end
		end
		do
			local mv = self:getBodyJSONMapValue(key)
			if mv ~= nil then
				do return mv end
			end
			do return nil end
		end
	end
end

function jk.http.server.HTTPServerRequest:getParameterAsDynamicMap(key)
	local mm = self:getBodyJSONMap()
	if mm ~= nil then
		do return mm:getDynamicMap(key) end
	end
	do return nil end
end

function jk.http.server.HTTPServerRequest:getParameterAsDynamicVector(key)
	local mm = self:getBodyJSONMap()
	if mm ~= nil then
		do return mm:getDynamicVector(key) end
	end
	do
		local pp = self:getParameterAsString(key)
		if pp ~= nil then
			local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
			local array = _g.jk.lang.String:split(pp, 44, 0)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local comp = array[n + 1]
						if comp ~= nil then
							do v:appendObject(comp) end
						end
						do n = n + 1 end
					end
				end
			end
			do return v end
		end
		do return nil end
	end
end

function jk.http.server.HTTPServerRequest:getParameterAsVector(key)
	local dv = self:getParameterAsDynamicVector(key)
	if not (dv ~= nil) then
		do return nil end
	end
	do return dv:toVector() end
end

function jk.http.server.HTTPServerRequest:getRelativeRequestPath(relativeTo)
	local path = self:getURLPath()
	if not (path ~= nil) then
		do return nil end
	end
	if relativeTo ~= nil and _g.jk.lang.String:startsWith(path, relativeTo, 0) then
		path = _g.jk.lang.String:getEndOfString(path, _g.jk.lang.String:getLength(relativeTo))
	else
		do return nil end
	end
	if _g.jk.lang.String:isEmpty(path) then
		path = "/"
	end
	do return path end
end

function jk.http.server.HTTPServerRequest:initResources()
	local path = self:getURLPath()
	if not (path ~= nil) then
		do return end
	end
	self.resources = _g.jk.lang.String:split(path, 47, 0)
	do _g.jk.lang.Vector:removeFirst(self.resources) end
	do
		local vsz = _g.jk.lang.Vector:getSize(self.resources)
		if vsz > 0 then
			local last = _g.jk.lang.Vector:get(self.resources, vsz - 1)
			if _g.jk.lang.String:isEmpty(last) then
				do _g.jk.lang.Vector:removeLast(self.resources) end
			end
		end
		self.currentResource = 0
	end
end

function jk.http.server.HTTPServerRequest:hasMoreResources()
	if not (self.resources ~= nil) then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return false end
	end
	if self.currentResource < _g.jk.lang.Vector:getSize(self.resources) then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:getRemainingResourceCount()
	if not (self.resources ~= nil) then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Vector:getSize(self.resources) - self.currentResource - 1 end
end

function jk.http.server.HTTPServerRequest:acceptMethodAndResource(methodToAccept, resource, mustBeLastResource)
	if not (resource ~= nil) then
		do return false end
	end
	if methodToAccept == nil or self.method == methodToAccept then
		local cc = self:peekResource()
		if not (cc ~= nil) then
			do return false end
		end
		if not (cc == resource) then
			do return false end
		end
		do self:popResource() end
		if mustBeLastResource and self:hasMoreResources() then
			do self:unpopResource() end
			do return false end
		end
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:acceptResource(resource, mustBeLastResource)
	if not (resource ~= nil) then
		do return false end
	end
	do
		local cc = self:peekResource()
		if not (cc ~= nil) then
			do return false end
		end
		if not (cc == resource) then
			do return false end
		end
		do self:popResource() end
		if mustBeLastResource and self:hasMoreResources() then
			do self:unpopResource() end
			do return false end
		end
		do return true end
	end
end

function jk.http.server.HTTPServerRequest:peekResource()
	if self.resources == nil then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return nil end
	end
	if self.currentResource < _g.jk.lang.Vector:getSize(self.resources) then
		do return self.resources[self.currentResource + 1] end
	end
	do return nil end
end

function jk.http.server.HTTPServerRequest:getCurrentResource()
	do return self.currentResource end
end

function jk.http.server.HTTPServerRequest:setCurrentResource(value)
	self.currentResource = value
	self.relativeResourcePath = nil
end

function jk.http.server.HTTPServerRequest:popResource()
	if self.resources == nil then
		do self:initResources() end
	end
	do
		local v = self:peekResource()
		if v ~= nil then
			do self.currentResource = self.currentResource + 1 end
			self.relativeResourcePath = nil
		end
		do return v end
	end
end

function jk.http.server.HTTPServerRequest:unpopResource()
	if self.currentResource > 0 then
		do self.currentResource = self.currentResource - 1 end
		self.relativeResourcePath = nil
	end
end

function jk.http.server.HTTPServerRequest:resetResources()
	self.resources = nil
	self.currentResource = 0
	self.relativeResourcePath = nil
end

function jk.http.server.HTTPServerRequest:getRelativeResources()
	if not (self.resources ~= nil) then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return nil end
	end
	if self.currentResource < 1 then
		do return self.resources end
	end
	do
		local v = {}
		local cr = self.currentResource
		while cr < _g.jk.lang.Vector:getSize(self.resources) do
			do _g.jk.lang.Vector:append(v, self.resources[cr + 1]) end
			do cr = cr + 1 end
		end
		do return v end
	end
end

function jk.http.server.HTTPServerRequest:getResourcePathComponent(index, nTrailingComponents)
	if index < 0 then
		do return nil end
	end
	if not (self.resources ~= nil) then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return nil end
	end
	do
		local max = nTrailingComponents
		local vsz = _g.jk.lang.Vector:getSize(self.resources)
		if max < 0 then
			max = vsz
		end
		if max > vsz then
			max = vsz
		end
		if index >= max then
			do return nil end
		end
		if max < vsz then
			do return _g.jk.lang.Vector:get(self.resources, index + vsz - max) end
		end
		do return _g.jk.lang.Vector:get(self.resources, index) end
	end
end

function jk.http.server.HTTPServerRequest:getRelativeResourcePath()
	if self.resources == nil then
		do return self:getURLPath() end
	end
	if self.relativeResourcePath == nil then
		local rrs = self:getRelativeResources()
		if rrs ~= nil then
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			if rrs ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(rrs)
				do
					n = 0
					while n < m do
						local rr = rrs[n + 1]
						if rr ~= nil then
							if _g.jk.lang.String:isEmpty(rr) == false then
								do sb:appendCharacter(47) end
								do sb:appendString(rr) end
							end
						end
						do n = n + 1 end
					end
				end
			end
			if sb:count() < 1 then
				do sb:appendCharacter(47) end
			end
			self.relativeResourcePath = sb:toString()
		end
	end
	do return self.relativeResourcePath end
end

function jk.http.server.HTTPServerRequest:isForResource(res)
	if not (res ~= nil) then
		do return false end
	end
	do
		local rrp = self:getRelativeResourcePath()
		if not (rrp ~= nil) then
			do return false end
		end
		if rrp == res then
			do return true end
		end
		do return false end
	end
end

function jk.http.server.HTTPServerRequest:isForDirectory()
	local path = self:getURLPath()
	if path ~= nil and _g.jk.lang.String:endsWith(path, "/") then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:isForPrefix(res)
	if not (res ~= nil) then
		do return false end
	end
	do
		local rr = self:getRelativeResourcePath()
		if rr ~= nil and _g.jk.lang.String:startsWith(rr, res, 0) then
			do return true end
		end
		do return false end
	end
end

function jk.http.server.HTTPServerRequest:isForMethod(mm)
	if not (mm ~= nil) then
		do return false end
	end
	if mm == self.method then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:isGET()
	do return self.method == "GET" end
end

function jk.http.server.HTTPServerRequest:isPOST()
	do return self.method == "POST" end
end

function jk.http.server.HTTPServerRequest:isDELETE()
	do return self.method == "DELETE" end
end

function jk.http.server.HTTPServerRequest:isPUT()
	do return self.method == "PUT" end
end

function jk.http.server.HTTPServerRequest:isPATCH()
	do return self.method == "PATCH" end
end

function jk.http.server.HTTPServerRequest:sendJSONObject(o)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forJSONString(_g.jk.json.JSONEncoder:encode(o, true, false))) end
end

function jk.http.server.HTTPServerRequest:sendJSONString(json)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forJSONString(json)) end
end

function jk.http.server.HTTPServerRequest:sendJSONError(error)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forJSONString(_g.jk.json.JSONEncoder:encode(_g.jk.http.server.HTTPServerJSONResponse:forError(error), true, false))) end
end

function jk.http.server.HTTPServerRequest:sendJSONOK(data)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forJSONString(_g.jk.json.JSONEncoder:encode(_g.jk.http.server.HTTPServerJSONResponse:forOk(data), true, false))) end
end

function jk.http.server.HTTPServerRequest:sendInternalError(text)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(text)) end
end

function jk.http.server.HTTPServerRequest:sendNotAllowed()
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotAllowed(nil)) end
end

function jk.http.server.HTTPServerRequest:sendNotFound()
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil)) end
end

function jk.http.server.HTTPServerRequest:sendInvalidRequest(text)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(text)) end
end

function jk.http.server.HTTPServerRequest:sendTextString(text)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forTextString(text)) end
end

function jk.http.server.HTTPServerRequest:sendHTMLString(html)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTMLString(html)) end
end

function jk.http.server.HTTPServerRequest:sendXMLString(xml)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forXMLString(xml)) end
end

function jk.http.server.HTTPServerRequest:sendFile(file)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forFile(file, -1)) end
end

function jk.http.server.HTTPServerRequest:sendBuffer(buffer, mimeType)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forBuffer(buffer, mimeType)) end
end

function jk.http.server.HTTPServerRequest:sendRedirect(url)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPMovedTemporarily(url)) end
end

function jk.http.server.HTTPServerRequest:sendRedirectAsDirectory()
	local path = self:getURLPath()
	if path == nil then
		path = ""
	end
	do self:sendRedirect(_g.jk.lang.String:safeString(path) .. "/") end
end

function jk.http.server.HTTPServerRequest:sendFromDirectory(resourceDir)
	if not (resourceDir ~= nil and resourceDir:isDirectory()) then
		do self:sendNotFound() end
		do return end
	end
	do
		local name = self:popResource()
		if not _g.jk.lang.String:isNotEmpty(name) then
			do self:sendNotFound() end
			do return end
		end
		do
			local ff = resourceDir:entry(name)
			if not ff:isFile() then
				do self:sendNotFound() end
				do return end
			end
			do self:sendFile(ff) end
		end
	end
end

function jk.http.server.HTTPServerRequest:isResponseSent()
	do return self.responseSent end
end

function jk.http.server.HTTPServerRequest:addResponseCookie(cookie)
	if not (cookie ~= nil) then
		do return end
	end
	if self.responseCookies == nil then
		self.responseCookies = {}
	end
	do _g.jk.lang.Vector:append(self.responseCookies, cookie) end
end

function jk.http.server.HTTPServerRequest:sendResponse(resp)
	if not (self.server ~= nil) then
		do return end
	end
	if self.responseSent then
		do return end
	end
	if self.responseCookies ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.responseCookies)
		do
			n = 0
			while n < m do
				local cookie = self.responseCookies[n + 1]
				if cookie ~= nil then
					do resp:addCookie(cookie) end
				end
				do n = n + 1 end
			end
		end
	end
	self.responseCookies = nil
	do self.server:sendResponse(self.connection, self, resp) end
	self.responseSent = true
end

function jk.http.server.HTTPServerRequest:startBufferResponseWorker(buffer, mimeType)
	local worker = _g.jk.http.server.HTTPServerBinaryReaderResponseWorker:forReader(_g.jk.io.BufferReader:forBuffer(buffer))
	if not (worker ~= nil) then
		do return false end
	end
	do worker:setMimeType(mimeType) end
	do return self:startResponseWorker(worker) end
end

function jk.http.server.HTTPServerRequest:startResponse(resp)
	if not (self.server ~= nil) then
		do return nil end
	end
	if not (self.responseSent == false) then
		do return nil end
	end
	if self.responseCookies ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.responseCookies)
		do
			n = 0
			while n < m do
				local cookie = self.responseCookies[n + 1]
				if cookie ~= nil then
					do resp:addCookie(cookie) end
				end
				do n = n + 1 end
			end
		end
	end
	self.responseCookies = nil
	self.responseSent = true
	do return self.server:startResponse(self.connection, self, resp) end
end

function jk.http.server.HTTPServerRequest:startResponseWorker(worker)
	if not (worker ~= nil) then
		do return false end
	end
	do
		local rs = self:startResponse(_g.jk.http.server.HTTPServerResponse:forOk(worker:getMimeType()))
		if not (rs ~= nil) then
			do return false end
		end
		do worker:setSession(rs) end
		do return self.server:startResponseWorker(worker) end
	end
end

function jk.http.server.HTTPServerRequest:toMyPacket()
	local builder = _g.jk.mypacket.MyPacketBuilder._construct0(_g.jk.mypacket.MyPacketBuilder._create())
	do builder:appendLengthEncodedString(self:getMethod()) end
	do builder:appendLengthEncodedString(self:getUrlString()) end
	do
		local nheaders = 0
		if self.rawHeaders ~= nil then
			nheaders = self.rawHeaders:count()
		end
		do builder:appendLengthEncodedInteger(nheaders) end
		do
			local n = 0
			while n < nheaders do
				local key = self.rawHeaders:getKey(n)
				local val = self.rawHeaders:getValue(n)
				if not (key ~= nil) then
					key = ""
				end
				if not (val ~= nil) then
					val = ""
				end
				do builder:appendLengthEncodedString(key) end
				do builder:appendLengthEncodedString(val) end
				do n = n + 1 end
			end
		end
		do builder:appendLengthEncodedBuffer(self:getBodyBuffer()) end
		do return builder:finalize() end
	end
end

function jk.http.server.HTTPServerRequest:getMethod()
	do return self.method end
end

function jk.http.server.HTTPServerRequest:setMethod(v)
	self.method = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getUrlString()
	do return self.urlString end
end

function jk.http.server.HTTPServerRequest:setUrlString(v)
	self.urlString = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getVersion()
	do return self.version end
end

function jk.http.server.HTTPServerRequest:setVersion(v)
	self.version = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getConnection()
	do return self.connection end
end

function jk.http.server.HTTPServerRequest:setConnection(v)
	self.connection = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getServer()
	do return self.server end
end

function jk.http.server.HTTPServerRequest:setServer(v)
	self.server = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getData()
	do return self.data end
end

function jk.http.server.HTTPServerRequest:setData(v)
	self.data = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getSession()
	do return self.session end
end

function jk.http.server.HTTPServerRequest:setSession(v)
	self.session = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getBodyBuffer()
	do return self.bodyBuffer end
end

function jk.http.server.HTTPServerRequest:setBodyBuffer(v)
	self.bodyBuffer = v
	do return self end
end

jk.http.server.HTTPServerRequestHandlerStack = _g.jk.http.server.HTTPServerRequestHandlerContainer._create()
jk.http.server.HTTPServerRequestHandlerStack.__index = jk.http.server.HTTPServerRequestHandlerStack
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerStack, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerContainer
})

function jk.http.server.HTTPServerRequestHandlerStack._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerStack)
	return v
end

function jk.http.server.HTTPServerRequestHandlerStack:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerStack'
	self['_isType.jk.http.server.HTTPServerRequestHandlerStack'] = true
	self.requestHandlers = nil
end

function jk.http.server.HTTPServerRequestHandlerStack:_construct0()
	jk.http.server.HTTPServerRequestHandlerStack._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerContainer._construct0(self) end
	return self
end

jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler = {}
jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler.__index = jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler, {})

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler)
	return v
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler'
	self['_isType.jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandler'] = true
	self.handler = nil
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:_construct0()
	jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler._init(self)
	return self
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:handleRequest(req, next)
	do self.handler(req, next) end
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:getHandler()
	do return self.handler end
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:setHandler(v)
	self.handler = v
	do return self end
end

jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor = {}
jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor.__index = jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor, {})

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor)
	return v
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor'
	self['_isType.jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor'] = true
	self.requestHandlers = nil
	self.request = nil
	self.last = nil
	self.current = 0
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:_construct0()
	jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor._init(self)
	return self
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:start()
	self.current = -1
	do self:next() end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:next()
	do self.current = self.current + 1 end
	do
		local handler = _g.jk.lang.Vector:get(self.requestHandlers, self.current)
		if handler == nil then
			if self.last == nil then
				do self:defaultLast() end
			else
				do self.last() end
			end
			do return end
		end
		do handler:handleRequest(self.request, function()
			do self:next() end
		end) end
		do self.request:resetResources() end
	end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:defaultLast()
	do self.request:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil)) end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:getRequestHandlers()
	do return self.requestHandlers end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:setRequestHandlers(v)
	self.requestHandlers = v
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:getRequest()
	do return self.request end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:setRequest(v)
	self.request = v
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:getLast()
	do return self.last end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:setLast(v)
	self.last = v
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerStack:iterateRequestHandlers()
	if not (self.requestHandlers ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Vector:iterate(self.requestHandlers) end
end

function jk.http.server.HTTPServerRequestHandlerStack:pushRequestHandler1(handler)
	if not (handler ~= nil) then
		do return end
	end
	do self:pushRequestHandler2(_g.jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler._construct0(_g.jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler._create()):setHandler(handler)) end
end

function jk.http.server.HTTPServerRequestHandlerStack:pushRequestHandler2(handler)
	if not (handler ~= nil) then
		do return end
	end
	if self.requestHandlers == nil then
		self.requestHandlers = {}
	end
	do _g.jk.lang.Vector:append(self.requestHandlers, handler) end
	if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) and self:isInitialized() then
		do handler:initialize(self:getServer()) end
	end
end

function jk.http.server.HTTPServerRequestHandlerStack:handleRequest(req, next)
	local rp = _g.jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor._construct0(_g.jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor._create())
	do rp:setRequestHandlers(self.requestHandlers) end
	do rp:setRequest(req) end
	do rp:setLast(next) end
	do rp:start() end
end

jk.http.server.HTTPServerStaticContentHandler = {}
jk.http.server.HTTPServerStaticContentHandler.__index = jk.http.server.HTTPServerStaticContentHandler
_vm:set_metatable(jk.http.server.HTTPServerStaticContentHandler, {})

function jk.http.server.HTTPServerStaticContentHandler._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerStaticContentHandler)
	return v
end

function jk.http.server.HTTPServerStaticContentHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerStaticContentHandler'
	self['_isType.jk.http.server.HTTPServerStaticContentHandler'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandler'] = true
	self.content = nil
	self.mimeType = nil
	self.redirectUrl = nil
end

function jk.http.server.HTTPServerStaticContentHandler:_construct0()
	jk.http.server.HTTPServerStaticContentHandler._init(self)
	return self
end

function jk.http.server.HTTPServerStaticContentHandler:forContent(content, mimeType)
	local v = _g.jk.http.server.HTTPServerStaticContentHandler._construct0(_g.jk.http.server.HTTPServerStaticContentHandler._create())
	do v:setContent(content) end
	do v:setMimeType(mimeType) end
	do return v end
end

function jk.http.server.HTTPServerStaticContentHandler:forHTMLContent(content)
	local v = _g.jk.http.server.HTTPServerStaticContentHandler._construct0(_g.jk.http.server.HTTPServerStaticContentHandler._create())
	do v:setContent(content) end
	do v:setMimeType("text/html") end
	do return v end
end

function jk.http.server.HTTPServerStaticContentHandler:forJSONContent(content)
	local v = _g.jk.http.server.HTTPServerStaticContentHandler._construct0(_g.jk.http.server.HTTPServerStaticContentHandler._create())
	do v:setContent(content) end
	do v:setMimeType("application/json") end
	do return v end
end

function jk.http.server.HTTPServerStaticContentHandler:forRedirect(url)
	local v = _g.jk.http.server.HTTPServerStaticContentHandler._construct0(_g.jk.http.server.HTTPServerStaticContentHandler._create())
	do v:setRedirectUrl(url) end
	do return v end
end

function jk.http.server.HTTPServerStaticContentHandler:handleRequest(req, next)
	if self.redirectUrl ~= nil then
		do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forRedirect(self.redirectUrl)) end
	else
		do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forString(self.content, self.mimeType)) end
	end
end

function jk.http.server.HTTPServerStaticContentHandler:getContent()
	do return self.content end
end

function jk.http.server.HTTPServerStaticContentHandler:setContent(v)
	self.content = v
	do return self end
end

function jk.http.server.HTTPServerStaticContentHandler:getMimeType()
	do return self.mimeType end
end

function jk.http.server.HTTPServerStaticContentHandler:setMimeType(v)
	self.mimeType = v
	do return self end
end

function jk.http.server.HTTPServerStaticContentHandler:getRedirectUrl()
	do return self.redirectUrl end
end

function jk.http.server.HTTPServerStaticContentHandler:setRedirectUrl(v)
	self.redirectUrl = v
	do return self end
end
jk = jk or {}

jk.xml = jk.xml or {}

jk.xml.MarkupLanguageParser = {}
jk.xml.MarkupLanguageParser.__index = jk.xml.MarkupLanguageParser
_vm:set_metatable(jk.xml.MarkupLanguageParser, {})

function jk.xml.MarkupLanguageParser._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser)
	return v
end

function jk.xml.MarkupLanguageParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser'
	self['_isType.jk.xml.MarkupLanguageParser'] = true
	self.it = nil
	self.nextQueue = nil
	self.cdataStart = "![CDATA["
	self.commentStart = "!--"
	self.tag = nil
	self.def = nil
	self.cdata = nil
	self.comment = nil
	self.ignoreWhiteSpace = false
	self.currentPosition = 0
end

function jk.xml.MarkupLanguageParser:_construct0()
	jk.xml.MarkupLanguageParser._init(self)
	return self
end

jk.xml.MarkupLanguageParser.Value = {}
jk.xml.MarkupLanguageParser.Value.__index = jk.xml.MarkupLanguageParser.Value
_vm:set_metatable(jk.xml.MarkupLanguageParser.Value, {})

function jk.xml.MarkupLanguageParser.Value._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.Value)
	return v
end

function jk.xml.MarkupLanguageParser.Value:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.Value'
	self['_isType.jk.xml.MarkupLanguageParser.Value'] = true
	self.position = 0
end

function jk.xml.MarkupLanguageParser.Value:_construct0()
	jk.xml.MarkupLanguageParser.Value._init(self)
	return self
end

function jk.xml.MarkupLanguageParser.Value:getPosition()
	do return self.position end
end

function jk.xml.MarkupLanguageParser.Value:setPosition(v)
	self.position = v
	do return self end
end

jk.xml.MarkupLanguageParser.StartElement = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.StartElement.__index = jk.xml.MarkupLanguageParser.StartElement
_vm:set_metatable(jk.xml.MarkupLanguageParser.StartElement, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.StartElement._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.StartElement)
	return v
end

function jk.xml.MarkupLanguageParser.StartElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.StartElement'
	self['_isType.jk.xml.MarkupLanguageParser.StartElement'] = true
	self.name = nil
	self.params = nil
end

function jk.xml.MarkupLanguageParser.StartElement:_construct0()
	jk.xml.MarkupLanguageParser.StartElement._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.StartElement:getParam(pname)
	if not (self.params ~= nil) then
		do return nil end
	end
	do return self.params:getString(pname, nil) end
end

function jk.xml.MarkupLanguageParser.StartElement:getName()
	do return self.name end
end

function jk.xml.MarkupLanguageParser.StartElement:setName(v)
	self.name = v
	do return self end
end

function jk.xml.MarkupLanguageParser.StartElement:getParams()
	do return self.params end
end

function jk.xml.MarkupLanguageParser.StartElement:setParams(v)
	self.params = v
	do return self end
end

jk.xml.MarkupLanguageParser.EndElement = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.EndElement.__index = jk.xml.MarkupLanguageParser.EndElement
_vm:set_metatable(jk.xml.MarkupLanguageParser.EndElement, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.EndElement._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.EndElement)
	return v
end

function jk.xml.MarkupLanguageParser.EndElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.EndElement'
	self['_isType.jk.xml.MarkupLanguageParser.EndElement'] = true
	self.name = nil
end

function jk.xml.MarkupLanguageParser.EndElement:_construct0()
	jk.xml.MarkupLanguageParser.EndElement._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.EndElement:getName()
	do return self.name end
end

function jk.xml.MarkupLanguageParser.EndElement:setName(v)
	self.name = v
	do return self end
end

jk.xml.MarkupLanguageParser.CharacterData = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.CharacterData.__index = jk.xml.MarkupLanguageParser.CharacterData
_vm:set_metatable(jk.xml.MarkupLanguageParser.CharacterData, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.CharacterData._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.CharacterData)
	return v
end

function jk.xml.MarkupLanguageParser.CharacterData:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.CharacterData'
	self['_isType.jk.xml.MarkupLanguageParser.CharacterData'] = true
	self.data = nil
end

function jk.xml.MarkupLanguageParser.CharacterData:_construct0()
	jk.xml.MarkupLanguageParser.CharacterData._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.CharacterData:getData()
	do return self.data end
end

function jk.xml.MarkupLanguageParser.CharacterData:setData(v)
	self.data = v
	do return self end
end

jk.xml.MarkupLanguageParser.TextData = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.TextData.__index = jk.xml.MarkupLanguageParser.TextData
_vm:set_metatable(jk.xml.MarkupLanguageParser.TextData, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.TextData._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.TextData)
	return v
end

function jk.xml.MarkupLanguageParser.TextData:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.TextData'
	self['_isType.jk.xml.MarkupLanguageParser.TextData'] = true
	self.data = nil
end

function jk.xml.MarkupLanguageParser.TextData:_construct0()
	jk.xml.MarkupLanguageParser.TextData._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.TextData:getData()
	do return self.data end
end

function jk.xml.MarkupLanguageParser.TextData:setData(v)
	self.data = v
	do return self end
end

jk.xml.MarkupLanguageParser.Comment = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.Comment.__index = jk.xml.MarkupLanguageParser.Comment
_vm:set_metatable(jk.xml.MarkupLanguageParser.Comment, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.Comment._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.Comment)
	return v
end

function jk.xml.MarkupLanguageParser.Comment:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.Comment'
	self['_isType.jk.xml.MarkupLanguageParser.Comment'] = true
	self.text = nil
end

function jk.xml.MarkupLanguageParser.Comment:_construct0()
	jk.xml.MarkupLanguageParser.Comment._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.Comment:getText()
	do return self.text end
end

function jk.xml.MarkupLanguageParser.Comment:setText(v)
	self.text = v
	do return self end
end

function jk.xml.MarkupLanguageParser:onTagString(tagstring, pos)
	if _g.jk.lang.String:getChar(tagstring, 0) == 47 then
		local v = _g.jk.xml.MarkupLanguageParser.EndElement._construct0(_g.jk.xml.MarkupLanguageParser.EndElement._create())
		do v:setPosition(pos) end
		do v:setName(_g.jk.lang.String:getEndOfString(tagstring, 1)) end
		do return v end
	end
	do
		local element = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local params = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		local it = _g.jk.lang.CharacterIteratorForString:forString(tagstring)
		local c = 0
		while (function()
			c = it:getNextChar()
			do return c end
		end)() > 0 do
			if c == 32 or c == 9 or c == 10 or c == 13 or c == 47 then
				if element:count() > 0 then
					do break end
				end
			else
				do element:appendCharacter(c) end
			end
		end
		while c > 0 and c ~= 47 do
			if c == 32 or c == 9 or c == 10 or c == 13 then
				c = it:getNextChar()
				goto _continue7
			end
			do
				local pname = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				local pval = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				while c > 0 and c ~= 32 and c ~= 9 and c ~= 10 and c ~= 13 and c ~= 61 do
					do pname:appendCharacter(c) end
					c = it:getNextChar()
				end
				while c == 32 or c == 9 or c == 10 or c == 13 do
					c = it:getNextChar()
				end
				if c ~= 61 then
				else
					c = it:getNextChar()
					while c == 32 or c == 9 or c == 10 or c == 13 do
						c = it:getNextChar()
					end
					if c ~= 34 then
						while c > 0 and c ~= 32 and c ~= 9 and c ~= 10 and c ~= 13 do
							do pval:appendCharacter(c) end
							c = it:getNextChar()
						end
						while c == 32 or c == 9 or c == 10 or c == 13 do
							c = it:getNextChar()
						end
					else
						c = it:getNextChar()
						while c > 0 and c ~= 34 do
							do pval:appendCharacter(c) end
							c = it:getNextChar()
						end
						if c ~= 34 then
						else
							c = it:getNextChar()
						end
						while c == 32 or c == 9 or c == 10 or c == 13 do
							c = it:getNextChar()
						end
					end
				end
				do
					local pnamestr = pname:toString()
					local pvalstr = self:sanitizeAttributeValue(pval:toString())
					do params:setString(pnamestr, pvalstr) end
				end
			end
			::_continue7::
		end
		do
			local els = element:toString()
			if c == 47 then
				local e = _g.jk.xml.MarkupLanguageParser.EndElement._construct0(_g.jk.xml.MarkupLanguageParser.EndElement._create())
				do e:setName(els) end
				do e:setPosition(pos) end
				self.nextQueue = e
			end
			do
				local v = _g.jk.xml.MarkupLanguageParser.StartElement._construct0(_g.jk.xml.MarkupLanguageParser.StartElement._create())
				do v:setPosition(pos) end
				do v:setName(els) end
				do v:setParams(params) end
				do return v end
			end
		end
	end
end

function jk.xml.MarkupLanguageParser:sanitizeAttributeValue(str)
	if not _g.jk.lang.String:contains(str, "&quot;") then
		do return str end
	end
	do return _g.jk.lang.String:replaceString(str, "&quot;", "\"") end
end

function jk.xml.MarkupLanguageParser:isOnlyWhiteSpace(str)
	if str == nil then
		do return true end
	end
	do
		local array = _g.jk.lang.String:toCharArray(str)
		if array ~= nil then
			local n = 0
			local m = #array
			do
				n = 0
				while n < m do
					local c = array[n + 1]
					if c == 32 or c == 9 or c == 10 or c == 13 then
					else
						do return false end
					end
					do n = n + 1 end
				end
			end
		end
		do return true end
	end
end

function jk.xml.MarkupLanguageParser:getNextChar()
	if not (self.it ~= nil) then
		do return 0 end
	end
	do
		local v = self.it:getNextChar()
		if v > 0 then
			do self.currentPosition = self.currentPosition + 1 end
		end
		do return v end
	end
end

function jk.xml.MarkupLanguageParser:moveToPreviousChar()
	if not (self.it ~= nil) then
		do return end
	end
	if self.currentPosition > 0 then
		do self.currentPosition = self.currentPosition - 1 end
		do self.it:moveToPreviousChar() end
	end
end

function jk.xml.MarkupLanguageParser:peek()
	if self.nextQueue ~= nil then
		do return self.nextQueue end
	end
	self.nextQueue = self:next()
	do return self.nextQueue end
end

function jk.xml.MarkupLanguageParser:next()
	if self.nextQueue ~= nil then
		local v = self.nextQueue
		self.nextQueue = nil
		do return v end
	end
	do
		local pos = self.currentPosition
		local qot = false
		while self.it:hasEnded() == false do
			local cbp = self.currentPosition
			local nxb = self:getNextChar()
			if nxb < 1 then
				goto _continue8
			end
			if self.tag ~= nil then
				if nxb == 62 and not qot then
					local ts = self.tag:toString()
					self.tag = nil
					do
						local st = self:onTagString(ts, pos)
						if (_vm:to_table_with_key(st, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) and self.nextQueue == nil and self:isSelfClosing(st:getName()) then
							local e = _g.jk.xml.MarkupLanguageParser.EndElement._construct0(_g.jk.xml.MarkupLanguageParser.EndElement._create())
							do e:setName(st:getName()) end
							do e:setPosition(self.it:getCurrentPosition()) end
							self.nextQueue = e
						end
						do return st end
					end
				end
				do self.tag:appendCharacter(nxb) end
				if nxb == 34 then
					if qot then
						qot = false
					else
						qot = true
					end
				end
				if nxb == 91 and self.tag:count() == _g.jk.lang.String:getLength(self.cdataStart) and _g.jk.lang.String:equals(self.cdataStart, self.tag:toString()) then
					self.tag = nil
					self.cdata = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				elseif nxb == 45 and self.tag:count() == _g.jk.lang.String:getLength(self.commentStart) and _g.jk.lang.String:equals(self.commentStart, self.tag:toString()) then
					self.tag = nil
					self.comment = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
			elseif self.cdata ~= nil then
				local c0 = nxb
				local c1 = 0
				local c2 = 0
				if c0 == 93 then
					c1 = self:getNextChar()
					if c1 == 93 then
						c2 = self:getNextChar()
						if c2 == 62 then
							local dd = self.cdata:toString()
							self.cdata = nil
							do
								local v = _g.jk.xml.MarkupLanguageParser.CharacterData._construct0(_g.jk.xml.MarkupLanguageParser.CharacterData._create())
								do v:setPosition(pos) end
								do v:setData(dd) end
								do return v end
							end
						else
							do self:moveToPreviousChar() end
							do self:moveToPreviousChar() end
							do self.cdata:appendCharacter(c0) end
						end
					else
						do self:moveToPreviousChar() end
						do self.cdata:appendCharacter(c0) end
					end
				else
					do self.cdata:appendCharacter(c0) end
				end
			elseif self.comment ~= nil then
				local c0 = nxb
				local c1 = 0
				local c2 = 0
				if c0 == 45 then
					c1 = self:getNextChar()
					if c1 == 45 then
						c2 = self:getNextChar()
						if c2 == 62 then
							local ct = self.comment:toString()
							self.comment = nil
							do
								local v = _g.jk.xml.MarkupLanguageParser.Comment._construct0(_g.jk.xml.MarkupLanguageParser.Comment._create())
								do v:setPosition(pos) end
								do v:setText(ct) end
								do return v end
							end
						else
							do self:moveToPreviousChar() end
							do self:moveToPreviousChar() end
							do self.comment:appendCharacter(c0) end
						end
					else
						do self:moveToPreviousChar() end
						do self.comment:appendCharacter(c0) end
					end
				else
					do self.comment:appendCharacter(c0) end
				end
			elseif nxb == 60 then
				if self.def ~= nil then
					local cd = self.def:toString()
					self.def = nil
					if self.ignoreWhiteSpace and cd ~= nil then
						if self:isOnlyWhiteSpace(cd) then
							cd = nil
							pos = cbp
						end
					end
					if cd ~= nil then
						do self:moveToPreviousChar() end
						do
							local v = _g.jk.xml.MarkupLanguageParser.TextData._construct0(_g.jk.xml.MarkupLanguageParser.TextData._create())
							do v:setPosition(pos) end
							do v:setData(cd) end
							do return v end
						end
					end
				end
				self.tag = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			else
				if self.def == nil then
					self.def = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
				do self.def:appendCharacter(nxb) end
			end
			::_continue8::
		end
		do return nil end
	end
end

function jk.xml.MarkupLanguageParser:isSelfClosing(tag)
	do return false end
end

function jk.xml.MarkupLanguageParser:getIgnoreWhiteSpace()
	do return self.ignoreWhiteSpace end
end

function jk.xml.MarkupLanguageParser:setIgnoreWhiteSpace(v)
	self.ignoreWhiteSpace = v
	do return self end
end

jk.xml.XMLParserAdapter = {}
jk.xml.XMLParserAdapter.__index = jk.xml.XMLParserAdapter
_vm:set_metatable(jk.xml.XMLParserAdapter, {})

function jk.xml.XMLParserAdapter._create()
	local v = _vm:set_metatable({}, jk.xml.XMLParserAdapter)
	return v
end

function jk.xml.XMLParserAdapter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLParserAdapter'
	self['_isType.jk.xml.XMLParserAdapter'] = true
	self.fileName = nil
	self.xmlString = nil
	self.values = nil
	self.lines = nil
	self.currentPosition = 0
	self.autoSkipTextAndComments = true
	self.skipCommentsInText = true
end

function jk.xml.XMLParserAdapter:_construct0()
	jk.xml.XMLParserAdapter._init(self)
	return self
end

jk.xml.XMLParserAdapter.StringElement = {}
jk.xml.XMLParserAdapter.StringElement.__index = jk.xml.XMLParserAdapter.StringElement
_vm:set_metatable(jk.xml.XMLParserAdapter.StringElement, {})

function jk.xml.XMLParserAdapter.StringElement._create()
	local v = _vm:set_metatable({}, jk.xml.XMLParserAdapter.StringElement)
	return v
end

function jk.xml.XMLParserAdapter.StringElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLParserAdapter.StringElement'
	self['_isType.jk.xml.XMLParserAdapter.StringElement'] = true
	self.name = nil
	self.params = nil
	self.content = nil
end

function jk.xml.XMLParserAdapter.StringElement:_construct0()
	jk.xml.XMLParserAdapter.StringElement._init(self)
	return self
end

function jk.xml.XMLParserAdapter.StringElement:getName()
	do return self.name end
end

function jk.xml.XMLParserAdapter.StringElement:setName(v)
	self.name = v
	do return self end
end

function jk.xml.XMLParserAdapter.StringElement:getParams()
	do return self.params end
end

function jk.xml.XMLParserAdapter.StringElement:setParams(v)
	self.params = v
	do return self end
end

function jk.xml.XMLParserAdapter.StringElement:getContent()
	do return self.content end
end

function jk.xml.XMLParserAdapter.StringElement:setContent(v)
	self.content = v
	do return self end
end

jk.xml.XMLParserAdapter.Position = {}
jk.xml.XMLParserAdapter.Position.__index = jk.xml.XMLParserAdapter.Position
_vm:set_metatable(jk.xml.XMLParserAdapter.Position, {})

function jk.xml.XMLParserAdapter.Position._create()
	local v = _vm:set_metatable({}, jk.xml.XMLParserAdapter.Position)
	return v
end

function jk.xml.XMLParserAdapter.Position:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLParserAdapter.Position'
	self['_isType.jk.xml.XMLParserAdapter.Position'] = true
	self.row = 0
	self.column = 0
end

function jk.xml.XMLParserAdapter.Position:_construct0()
	jk.xml.XMLParserAdapter.Position._init(self)
	return self
end

function jk.xml.XMLParserAdapter.Position:getRow()
	do return self.row end
end

function jk.xml.XMLParserAdapter.Position:setRow(v)
	self.row = v
	do return self end
end

function jk.xml.XMLParserAdapter.Position:getColumn()
	do return self.column end
end

function jk.xml.XMLParserAdapter.Position:setColumn(v)
	self.column = v
	do return self end
end

function jk.xml.XMLParserAdapter:initializeForFile(file, fileName)
	if not (file ~= nil) then
		do return false end
	end
	do
		local fn = fileName
		if fn == nil then
			fn = file:getPath()
		end
		do
			local text = file:getContentsWithBOM()
			if not (text ~= nil) then
				do return false end
			end
			do return self:initializeForString(text, fn) end
		end
	end
end

function jk.xml.XMLParserAdapter:initializeForString(text, fileName)
	if not (text ~= nil) then
		do return false end
	end
	do
		local pp = _g.jk.xml.XMLParser:forString(text)
		if not (pp ~= nil) then
			do return false end
		end
		do self:setFileName(fileName) end
		do self:setXmlString(text) end
		do self:initialize(pp) end
		do return true end
	end
end

function jk.xml.XMLParserAdapter:executeForFile(ctx, file, fileName)
	if not (file ~= nil) then
		do _g.jk.log.Log:error(ctx, "null file") end
		do return false end
	end
	if not self:initializeForFile(file, fileName) then
		do _g.jk.log.Log:error(ctx, "Failed to process XML file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
		do return false end
	end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:execute() end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.lang.ExceptionWithString') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(ctx, e:toString()) end
				do return false end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do return true end
end

function jk.xml.XMLParserAdapter:executeForString(ctx, text, fileName)
	if not (text ~= nil) then
		do _g.jk.log.Log:error(ctx, "null text") end
		do return false end
	end
	if not self:initializeForString(text, fileName) then
		do _g.jk.log.Log:error(ctx, "Failed to process XML string") end
		do return false end
	end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:execute() end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.lang.ExceptionWithString') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(ctx, e:toString()) end
				do return false end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do return true end
end

function jk.xml.XMLParserAdapter:initialize(parser)
	self.values = {}
	if parser ~= nil then
		local first = true
		while true do
			local vv = parser:next()
			if not (vv ~= nil) then
				do break end
			end
			if first then
				if (_vm:to_table_with_key(vv, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) or (_vm:to_table_with_key(vv, '_isType.jk.xml.MarkupLanguageParser.Comment') ~= nil) or (_vm:to_table_with_key(vv, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
				elseif (_vm:to_table_with_key(vv, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) and vv:getName() == "?xml" then
					first = false
					goto _continue2
				else
					first = false
				end
			end
			do _g.jk.lang.Vector:append(self.values, vv) end
			::_continue2::
		end
	end
	self.currentPosition = 0
end

function jk.xml.XMLParserAdapter:expect(text)
	do self:error("Expecting: " .. _g.jk.lang.String:safeString(text)) end
end

function jk.xml.XMLParserAdapter:unsupported(element)
	if element ~= nil then
		do self:error("Unsupported element inside `" .. _g.jk.lang.String:safeString(element:getName()) .. "'") end
	else
		do self:error("Unsupported element") end
	end
end

function jk.xml.XMLParserAdapter:error(message)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local value = self:parserPeek()
	if value ~= nil then
		local name = self:getFileName()
		local token = nil
		if (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) then
			token = value:getName()
		elseif (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.EndElement') ~= nil) then
			token = "/" .. _g.jk.lang.String:safeString(value:getName())
		elseif (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) then
			token = value:getData()
		elseif (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			token = value:getData()
		elseif (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.Comment') ~= nil) then
			token = "<!-- " .. _g.jk.lang.String:safeString(value:getText()) .. " -->"
		else
			token = "(unknown)"
		end
		do
			local pp = _g.jk.xml.XMLParserAdapter.Position._construct0(_g.jk.xml.XMLParserAdapter.Position._create())
			do self:calculatePosition(value:getPosition(), pp) end
			do
				local lineNumber = pp:getRow()
				local columnNumber = pp:getColumn()
				local contentLine = self:getContentLine(pp:getRow())
				do sb:appendString(name) end
				if lineNumber >= 0 then
					do sb:appendCharacter(58) end
					do sb:appendInteger(lineNumber + 1) end
					if columnNumber >= 0 then
						do sb:appendCharacter(58) end
						do sb:appendInteger(columnNumber + 1) end
					end
				end
				if _g.jk.lang.String:isEmpty(token) == false then
					do sb:appendString(" (`") end
					do sb:appendString(token) end
					do sb:appendString("')") end
				end
				do sb:appendString(": ") end
				do sb:appendString(message) end
				if contentLine ~= nil then
					do sb:appendCharacter(10) end
					do
						local it = _g.jk.lang.String:iterate(contentLine)
						local c = 0
						while (function()
							c = it:getNextChar()
							do return c end
						end)() > 0 do
							if c == 9 then
								do sb:appendCharacter(32) end
							else
								do sb:appendCharacter(c) end
							end
						end
						if columnNumber >= 0 then
							do sb:appendCharacter(10) end
							do
								local n = 0
								do
									n = 0
									while n < columnNumber do
										do sb:appendCharacter(32) end
										do n = n + 1 end
									end
								end
								do sb:appendCharacter(94) end
							end
						end
					end
				else
					do sb:appendString("\n\t(no reference content)\n") end
				end
			end
		end
	else
		do sb:appendString(message) end
	end
	_vm:throw_error(_g.jk.lang.ExceptionWithString:forString(sb:toString(), false))
end

function jk.xml.XMLParserAdapter:isEmptyString(string)
	if _g.jk.lang.String:isEmpty(string) then
		do return true end
	end
	do
		local it = _g.jk.lang.String:iterate(string)
		while it ~= nil do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if c == 32 or c == 9 or c == 13 or c == 10 then
				goto _continue3
			end
			do return false end
			::_continue3::
		end
		do return true end
	end
end

function jk.xml.XMLParserAdapter:parserPeek()
	if not (self.values ~= nil) then
		do return nil end
	end
	if not (self.currentPosition >= 0) then
		do return nil end
	end
	if not (self.currentPosition < _g.jk.lang.Vector:getSize(self.values)) then
		do return nil end
	end
	do return self.values[self.currentPosition + 1] end
end

function jk.xml.XMLParserAdapter:parserNext()
	local v = self:parserPeek()
	if v ~= nil then
		do self.currentPosition = self.currentPosition + 1 end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:parserPrev()
	if self.currentPosition < 1 then
		do return nil end
	end
	do self.currentPosition = self.currentPosition - 1 end
	do return self:parserPeek() end
end

function jk.xml.XMLParserAdapter:acceptStartElement(name)
	local oo = self:getCurrentPosition()
	if self.autoSkipTextAndComments then
		do self:skipTextAndComments() end
	end
	do
		local nn = _vm:to_table_with_key(self:parserPeek(), '_isType.jk.xml.MarkupLanguageParser.StartElement')
		if not (nn ~= nil) then
			do return nil end
		end
		if name == nil or nn:getName() == name then
			do self:parserNext() end
			do return nn end
		end
		do self:setCurrentPosition(oo) end
		do return nil end
	end
end

function jk.xml.XMLParserAdapter:parseStartElement(name)
	local v = self:acceptStartElement(name)
	if not (v ~= nil) then
		if name ~= nil then
			do self:expect("Start element `" .. _g.jk.lang.String:safeString(name) .. "'") end
		else
			do self:expect("Start element") end
		end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:acceptAnyEndElement()
	do return self:acceptEndElementWithName(nil) end
end

function jk.xml.XMLParserAdapter:acceptEndElementWithName(name)
	local oo = self:getCurrentPosition()
	if self.autoSkipTextAndComments then
		do self:skipTextAndComments() end
	end
	do
		local nn = _vm:to_table_with_key(self:parserPeek(), '_isType.jk.xml.MarkupLanguageParser.EndElement')
		if not (nn ~= nil) then
			do return nil end
		end
		if name == nil or nn:getName() == name then
			do self:parserNext() end
			do return nn end
		end
		do self:setCurrentPosition(oo) end
		do return nil end
	end
end

function jk.xml.XMLParserAdapter:acceptEndElement(element)
	if not (element ~= nil) then
		do return self:acceptEndElementWithName(nil) end
	end
	do return self:acceptEndElementWithName(element:getName()) end
end

function jk.xml.XMLParserAdapter:parseAnyEndElement()
	do return self:parseEndElementWithName(nil) end
end

function jk.xml.XMLParserAdapter:parseEndElementWithName(name)
	local v = self:acceptEndElementWithName(name)
	if not (v ~= nil) then
		if name ~= nil then
			do self:expect("End element `" .. _g.jk.lang.String:safeString(name) .. "'") end
		else
			do self:expect("End element") end
		end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:parseEndElement(element)
	if not (element ~= nil) then
		do return self:parseEndElementWithName(nil) end
	end
	do return self:parseEndElementWithName(element:getName()) end
end

function jk.xml.XMLParserAdapter:acceptSingleElement(name)
	local oo = self:getCurrentPosition()
	local element = self:acceptStartElement(name)
	if not (element ~= nil) then
		do return nil end
	end
	if not (self:acceptEndElementWithName(name) ~= nil) then
		do self:setCurrentPosition(oo) end
		do return nil end
	end
	do return element end
end

function jk.xml.XMLParserAdapter:parseSingleElement(name)
	local v = self:acceptSingleElement(name)
	if not (v ~= nil) then
		if name ~= nil then
			do self:expect("Single element: `" .. _g.jk.lang.String:safeString(name) .. "'") end
		else
			do self:expect("Single element") end
		end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:acceptStringElement(tagName)
	local oo = self:getCurrentPosition()
	local start = self:acceptStartElement(tagName)
	if not (start ~= nil) then
		do return nil end
	end
	do
		local str = self:acceptText(false)
		local _end = self:acceptEndElementWithName(start:getName())
		if not (_end ~= nil) then
			do self:setCurrentPosition(oo) end
			do return nil end
		end
		if not (str ~= nil) then
			str = ""
		end
		do
			local v = _g.jk.xml.XMLParserAdapter.StringElement._construct0(_g.jk.xml.XMLParserAdapter.StringElement._create())
			do v:setName(start:getName()) end
			do v:setParams(start:getParams()) end
			do v:setContent(str) end
			do return v end
		end
	end
end

function jk.xml.XMLParserAdapter:parseStringElement(tagName)
	local v = self:acceptStringElement(tagName)
	if not (v ~= nil) then
		do self:expect("String element") end
		do return nil end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:acceptStringElementData(tagName)
	local v = self:acceptStringElement(tagName)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:getContent() end
end

function jk.xml.XMLParserAdapter:parseStringElementData(tagName)
	local v = self:acceptStringElementData(tagName)
	if not (v ~= nil) then
		do self:expect("String element") end
		do return nil end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:acceptElementTree(name, startHandler, childHandler)
	local element = self:acceptStartElement(name)
	if not (element ~= nil) then
		do return false end
	end
	if startHandler ~= nil then
		do startHandler(element) end
	end
	while true do
		if childHandler ~= nil and childHandler() then
			goto _continue4
		end
		if self:acceptEndElement(element) ~= nil then
			do break end
		end
		do self:unsupported(element) end
		::_continue4::
	end
	do return true end
end

function jk.xml.XMLParserAdapter:acceptText(force)
	local sb = nil
	while true do
		local cc = self:parserPeek()
		if not (cc ~= nil) then
			do break end
		end
		if self.skipCommentsInText then
			if (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.Comment') ~= nil) then
				do self:parserNext() end
				goto _continue5
			end
		end
		if (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) or (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local txt = self:getTextData(cc)
			if _g.jk.lang.String:isNotEmpty(txt) then
				if sb == nil then
					sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
				do sb:appendString(txt) end
			end
			do self:parserNext() end
			goto _continue5
		end
		do break end
		::_continue5::
	end
	if sb == nil then
		if force then
			do return "" end
		end
		do return nil end
	end
	do
		local v = sb:toString()
		if v == nil and force then
			do return "" end
		end
		do return v end
	end
end

function jk.xml.XMLParserAdapter:parseText()
	local v = self:acceptText(false)
	if not (v ~= nil) then
		v = ""
	end
	do return v end
end

function jk.xml.XMLParserAdapter:skipTextAndComments()
	while true do
		local cc = self:parserPeek()
		if not (cc ~= nil) then
			do break end
		end
		if (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.Comment') ~= nil) then
			do self:parserNext() end
			goto _continue6
		end
		if (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) or (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local txt = self:getTextData(cc)
			if self:isEmptyString(txt) then
				do self:parserNext() end
				goto _continue6
			end
		end
		do break end
		::_continue6::
	end
end

function jk.xml.XMLParserAdapter:acceptKeyValuePair()
	local oo = self:getCurrentPosition()
	local ss = self:acceptStartElement(nil)
	if not (ss ~= nil) then
		do self:setCurrentPosition(oo) end
		do return nil end
	end
	do
		local tt = self:acceptText(false)
		if not (tt ~= nil) then
			do self:setCurrentPosition(oo) end
			do return nil end
		end
		do
			local ee = self:acceptEndElementWithName(ss:getName())
			if not (ee ~= nil) then
				do self:setCurrentPosition(oo) end
				do return nil end
			end
			do
				local v = _g.jk.lang.KeyValuePair._construct0(_g.jk.lang.KeyValuePair._create())
				v.key = ss:getName()
				v.value = tt
				do return v end
			end
		end
	end
end

function jk.xml.XMLParserAdapter:parseKeyValuePair()
	local v = self:acceptKeyValuePair()
	if not (v ~= nil) then
		do self:expect("Key/value pair") end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:calculatePosition(pos, result)
	if not (result ~= nil) then
		do return end
	end
	do result:setRow(0) end
	do result:setColumn(0) end
	do
		local text = self:getXmlString()
		if text ~= nil then
			local p = 0
			local nr = 0
			local nc = 0
			local it = _g.jk.lang.String:iterate(text)
			while it ~= nil do
				if p == pos then
					do result:setRow(nr) end
					do result:setColumn(nc) end
					do break end
				end
				do
					local c = it:getNextChar()
					if c < 1 then
						do break end
					end
					if c == 10 then
						do nr = nr + 1 end
						nc = 0
					else
						do nc = nc + 1 end
					end
					do p = p + 1 end
				end
			end
		end
	end
end

function jk.xml.XMLParserAdapter:getTextData(elem)
	if (_vm:to_table_with_key(elem, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) then
		do return elem:getData() end
	end
	if (_vm:to_table_with_key(elem, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
		do return elem:getData() end
	end
	do return nil end
end

function jk.xml.XMLParserAdapter:getLines()
	if not (self.lines ~= nil) then
		local text = self:getXmlString()
		if text ~= nil then
			self.lines = _g.jk.lang.String:split(text, 10, 0)
		end
	end
	do return self.lines end
end

function jk.xml.XMLParserAdapter:getContentLine(n)
	if n < 0 then
		do return nil end
	end
	do
		local lines = self:getLines()
		if not (lines ~= nil) then
			do return nil end
		end
		if n < 0 or n >= _g.jk.lang.Vector:getSize(lines) then
			do return nil end
		end
		do return lines[n + 1] end
	end
end

function jk.xml.XMLParserAdapter:execute()
end

function jk.xml.XMLParserAdapter:getFileName()
	do return self.fileName end
end

function jk.xml.XMLParserAdapter:setFileName(v)
	self.fileName = v
	do return self end
end

function jk.xml.XMLParserAdapter:getXmlString()
	do return self.xmlString end
end

function jk.xml.XMLParserAdapter:setXmlString(v)
	self.xmlString = v
	do return self end
end

function jk.xml.XMLParserAdapter:getCurrentPosition()
	do return self.currentPosition end
end

function jk.xml.XMLParserAdapter:setCurrentPosition(v)
	self.currentPosition = v
	do return self end
end

function jk.xml.XMLParserAdapter:getAutoSkipTextAndComments()
	do return self.autoSkipTextAndComments end
end

function jk.xml.XMLParserAdapter:setAutoSkipTextAndComments(v)
	self.autoSkipTextAndComments = v
	do return self end
end

function jk.xml.XMLParserAdapter:getSkipCommentsInText()
	do return self.skipCommentsInText end
end

function jk.xml.XMLParserAdapter:setSkipCommentsInText(v)
	self.skipCommentsInText = v
	do return self end
end

jk.xml.XMLMaker = {}
jk.xml.XMLMaker.__index = jk.xml.XMLMaker
_vm:set_metatable(jk.xml.XMLMaker, {})

function jk.xml.XMLMaker._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker)
	return v
end

function jk.xml.XMLMaker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker'
	self['_isType.jk.xml.XMLMaker'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.elements = nil
	self.customHeader = nil
	self.singleLine = false
	self.header = nil
	self.indentWithTab = false
end

jk.xml.XMLMaker.CData = {}
jk.xml.XMLMaker.CData.__index = jk.xml.XMLMaker.CData
_vm:set_metatable(jk.xml.XMLMaker.CData, {})

function jk.xml.XMLMaker.CData._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.CData)
	return v
end

function jk.xml.XMLMaker.CData:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.CData'
	self['_isType.jk.xml.XMLMaker.CData'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.text = nil
	self.simple = false
	self.singleLine = false
end

function jk.xml.XMLMaker.CData:_construct0()
	jk.xml.XMLMaker.CData._init(self)
	return self
end

function jk.xml.XMLMaker.CData:_construct1(t)
	jk.xml.XMLMaker.CData._init(self)
	self.text = t
	return self
end

function jk.xml.XMLMaker.CData:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.simple then
		do sb:appendString(self.text) end
	else
		do sb:appendString("<![CDATA[") end
		do sb:appendString(self.text) end
		do sb:appendString("]]>") end
	end
	do return sb:toString() end
end

function jk.xml.XMLMaker.CData:getText()
	do return self.text end
end

function jk.xml.XMLMaker.CData:setText(v)
	self.text = v
	do return self end
end

function jk.xml.XMLMaker.CData:getSimple()
	do return self.simple end
end

function jk.xml.XMLMaker.CData:setSimple(v)
	self.simple = v
	do return self end
end

function jk.xml.XMLMaker.CData:getSingleLine()
	do return self.singleLine end
end

function jk.xml.XMLMaker.CData:setSingleLine(v)
	self.singleLine = v
	do return self end
end

jk.xml.XMLMaker.StartElement = {}
jk.xml.XMLMaker.StartElement.__index = jk.xml.XMLMaker.StartElement
_vm:set_metatable(jk.xml.XMLMaker.StartElement, {})

function jk.xml.XMLMaker.StartElement._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.StartElement)
	return v
end

function jk.xml.XMLMaker.StartElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.StartElement'
	self['_isType.jk.xml.XMLMaker.StartElement'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.name = nil
	self.attributes = nil
	self.single = false
	self.singleLine = false
end

function jk.xml.XMLMaker.StartElement:_construct0()
	jk.xml.XMLMaker.StartElement._init(self)
	return self
end

function jk.xml.XMLMaker.StartElement:_construct1(n)
	jk.xml.XMLMaker.StartElement._init(self)
	self.name = n
	self.attributes = {}
	return self
end

function jk.xml.XMLMaker.StartElement:attribute(key, value)
	do _g.jk.lang.Map:setValue(self.attributes, key, value) end
	do return self end
end

function jk.xml.XMLMaker.StartElement:escapeAttribute(str)
	if str == nil then
		do return str end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local array = _g.jk.lang.String:toCharArray(str)
		if array ~= nil then
			local n = 0
			local m = #array
			do
				n = 0
				while n < m do
					local c = array[n + 1]
					if c == 38 then
						do sb:appendString("&amp;") end
					elseif c == 34 then
						do sb:appendString("&quot;") end
					elseif c == 60 then
						do sb:appendString("&lt;") end
					elseif c == 62 then
						do sb:appendString("&gt;") end
					else
						do sb:appendCharacter(c) end
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function jk.xml.XMLMaker.StartElement:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendCharacter(60) end
	do sb:appendString(self.name) end
	do
		local keys = _g.jk.lang.Map:getKeys(self.attributes)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = keys[n + 1]
					if key ~= nil then
						do sb:appendCharacter(32) end
						do sb:appendString(key) end
						do sb:appendCharacter(61) end
						do sb:appendCharacter(34) end
						do
							local val = self:escapeAttribute(_g.jk.lang.Map:getValue(self.attributes, key))
							do sb:appendString(val) end
							do sb:appendCharacter(34) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if self.single then
			do sb:appendCharacter(32) end
			do sb:appendCharacter(47) end
		end
		do sb:appendCharacter(62) end
		do return sb:toString() end
	end
end

function jk.xml.XMLMaker.StartElement:getName()
	do return self.name end
end

function jk.xml.XMLMaker.StartElement:setName(v)
	self.name = v
	do return self end
end

function jk.xml.XMLMaker.StartElement:getAttributes()
	do return self.attributes end
end

function jk.xml.XMLMaker.StartElement:setAttributes(v)
	self.attributes = v
	do return self end
end

function jk.xml.XMLMaker.StartElement:getSingle()
	do return self.single end
end

function jk.xml.XMLMaker.StartElement:setSingle(v)
	self.single = v
	do return self end
end

function jk.xml.XMLMaker.StartElement:getSingleLine()
	do return self.singleLine end
end

function jk.xml.XMLMaker.StartElement:setSingleLine(v)
	self.singleLine = v
	do return self end
end

jk.xml.XMLMaker.EndElement = {}
jk.xml.XMLMaker.EndElement.__index = jk.xml.XMLMaker.EndElement
_vm:set_metatable(jk.xml.XMLMaker.EndElement, {})

function jk.xml.XMLMaker.EndElement._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.EndElement)
	return v
end

function jk.xml.XMLMaker.EndElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.EndElement'
	self['_isType.jk.xml.XMLMaker.EndElement'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.name = nil
end

function jk.xml.XMLMaker.EndElement:_construct0()
	jk.xml.XMLMaker.EndElement._init(self)
	return self
end

function jk.xml.XMLMaker.EndElement:_construct1(n)
	jk.xml.XMLMaker.EndElement._init(self)
	self.name = n
	return self
end

function jk.xml.XMLMaker.EndElement:toString()
	do return "</" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(self:getName())) .. ">" end
end

function jk.xml.XMLMaker.EndElement:getName()
	do return self.name end
end

function jk.xml.XMLMaker.EndElement:setName(v)
	self.name = v
	do return self end
end

jk.xml.XMLMaker.Element = _g.jk.xml.XMLMaker.StartElement._create()
jk.xml.XMLMaker.Element.__index = jk.xml.XMLMaker.Element
_vm:set_metatable(jk.xml.XMLMaker.Element, {
	__index = _g.jk.xml.XMLMaker.StartElement
})

function jk.xml.XMLMaker.Element._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.Element)
	return v
end

function jk.xml.XMLMaker.Element:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.Element'
	self['_isType.jk.xml.XMLMaker.Element'] = true
end

function jk.xml.XMLMaker.Element:_construct0()
	jk.xml.XMLMaker.Element._init(self)
	do _g.jk.xml.XMLMaker.StartElement._construct0(self) end
	return self
end

function jk.xml.XMLMaker.Element:_construct1(name)
	jk.xml.XMLMaker.Element._init(self)
	do _g.jk.xml.XMLMaker.StartElement._construct1(self, name) end
	do self:setSingle(true) end
	return self
end

jk.xml.XMLMaker.CustomXML = {}
jk.xml.XMLMaker.CustomXML.__index = jk.xml.XMLMaker.CustomXML
_vm:set_metatable(jk.xml.XMLMaker.CustomXML, {})

function jk.xml.XMLMaker.CustomXML._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.CustomXML)
	return v
end

function jk.xml.XMLMaker.CustomXML:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.CustomXML'
	self['_isType.jk.xml.XMLMaker.CustomXML'] = true
	self.string = nil
end

function jk.xml.XMLMaker.CustomXML:_construct0()
	jk.xml.XMLMaker.CustomXML._init(self)
	return self
end

function jk.xml.XMLMaker.CustomXML:_construct1(s)
	jk.xml.XMLMaker.CustomXML._init(self)
	self.string = s
	return self
end

function jk.xml.XMLMaker.CustomXML:getString()
	do return self.string end
end

function jk.xml.XMLMaker.CustomXML:setString(v)
	self.string = v
	do return self end
end

function jk.xml.XMLMaker:_construct0()
	jk.xml.XMLMaker._init(self)
	self.elements = {}
	self.header = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
	return self
end

function jk.xml.XMLMaker:start1(element, singleLine)
	do self:add(_g.jk.xml.XMLMaker.StartElement._construct1(_g.jk.xml.XMLMaker.StartElement._create(), element):setSingleLine(singleLine)) end
	do return self end
end

function jk.xml.XMLMaker:start2(element, k1, v1, singleLine)
	local v = _g.jk.xml.XMLMaker.StartElement._construct1(_g.jk.xml.XMLMaker.StartElement._create(), element)
	do v:setSingleLine(singleLine) end
	if k1 ~= nil then
		do v:attribute(k1, v1) end
	end
	do self:add(v) end
	do return self end
end

function jk.xml.XMLMaker:start3(element, attrs, singleLine)
	local v = _g.jk.xml.XMLMaker.StartElement._construct1(_g.jk.xml.XMLMaker.StartElement._create(), element)
	do v:setSingleLine(singleLine) end
	if attrs ~= nil then
		local keys = _g.jk.lang.Map:getKeys(attrs)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(keys[n + 1])
					if key ~= nil then
						local val = attrs[key]
						do v:attribute(key, _g.jk.lang.String:asString(val)) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do self:add(v) end
	do return self end
end

function jk.xml.XMLMaker:start4(element, attrs, singleLine)
	if attrs == nil then
		do return self:start3(element, nil, singleLine) end
	end
	do return self:start3(element, attrs:toObjectMap(), singleLine) end
end

function jk.xml.XMLMaker:element(element, attrs)
	local v = _g.jk.xml.XMLMaker.Element._construct1(_g.jk.xml.XMLMaker.Element._create(), element)
	if attrs ~= nil then
		local keys = _g.jk.lang.Map:getKeys(attrs)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(keys[n + 1])
					if key ~= nil then
						local val = attrs[key]
						do v:attribute(key, _g.jk.lang.String:asString(val)) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do self:add(v) end
	do return self end
end

function jk.xml.XMLMaker:_end(element)
	do self:add(_g.jk.xml.XMLMaker.EndElement._construct1(_g.jk.xml.XMLMaker.EndElement._create(), element)) end
	do return self end
end

function jk.xml.XMLMaker:text(element)
	do self:add(element) end
	do return self end
end

function jk.xml.XMLMaker:cdata(element)
	do self:add(_g.jk.xml.XMLMaker.CData._construct1(_g.jk.xml.XMLMaker.CData._create(), element)) end
	do return self end
end

function jk.xml.XMLMaker:textElement(element, text, attrs)
	local se = _g.jk.xml.XMLMaker.StartElement._construct1(_g.jk.xml.XMLMaker.StartElement._create(), element)
	do se:setSingleLine(true) end
	if attrs ~= nil then
		local keys = _g.jk.lang.Map:getKeys(attrs)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(keys[n + 1])
					if key ~= nil then
						local val = attrs[key]
						do se:attribute(key, _g.jk.lang.String:asString(val)) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do self:add(se) end
	do self:add(text) end
	do self:add(_g.jk.xml.XMLMaker.EndElement._construct1(_g.jk.xml.XMLMaker.EndElement._create(), element)) end
	do return self end
end

function jk.xml.XMLMaker:add(o)
	if o ~= nil then
		do _g.jk.lang.Vector:append(self.elements, o) end
	end
	do return self end
end

function jk.xml.XMLMaker:append(sb, level, str, noIndent, noNewLine)
	local n = 0
	if self.singleLine == false and noIndent == false then
		do
			n = 0
			while n < level do
				if self.indentWithTab then
					do sb:appendCharacter(9) end
				else
					do sb:appendCharacter(32) end
					do sb:appendCharacter(32) end
				end
				do n = n + 1 end
			end
		end
	end
	do sb:appendString(str) end
	if self.singleLine == false and noNewLine == false then
		do sb:appendCharacter(10) end
	end
end

function jk.xml.XMLMaker:escapeString(str)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if str ~= nil then
		local array = _g.jk.lang.String:toCharArray(str)
		if array ~= nil then
			local n = 0
			local m = #array
			do
				n = 0
				while n < m do
					local c = array[n + 1]
					if c == 34 then
						do sb:appendString("&quot;") end
					elseif c == 39 then
						do sb:appendString("&apos;") end
					elseif c == 60 then
						do sb:appendString("&lt;") end
					elseif c == 62 then
						do sb:appendString("&gt;") end
					elseif c == 38 then
						do sb:appendString("&amp;") end
					else
						do sb:appendCharacter(c) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do return sb:toString() end
end

function jk.xml.XMLMaker:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local level = 0
	if self.header ~= nil then
		do self:append(sb, level, self.header, false, false) end
	end
	if self.customHeader ~= nil then
		do sb:appendString(self.customHeader) end
	end
	do
		local singleLine = false
		if self.elements ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.elements)
			do
				n = 0
				while n < m do
					local o = self.elements[n + 1]
					if o ~= nil then
						if (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.Element') ~= nil) then
							do self:append(sb, level, o:toString(), singleLine, singleLine) end
						elseif (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.StartElement') ~= nil) then
							singleLine = o:getSingleLine()
							do self:append(sb, level, o:toString(), false, singleLine) end
							if o:getSingle() == false then
								do level = level + 1 end
							end
						elseif (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.EndElement') ~= nil) then
							do level = level - 1 end
							do self:append(sb, level, o:toString(), singleLine, false) end
							singleLine = false
						elseif (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.CustomXML') ~= nil) then
							do self:append(sb, level, o:getString(), singleLine, singleLine) end
						elseif (_vm:get_variable_type(o) == 'string') then
							do self:append(sb, level, self:escapeString(o), singleLine, singleLine) end
						elseif (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.CData') ~= nil) then
							do self:append(sb, level, o:toString(), singleLine, o:getSingleLine()) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function jk.xml.XMLMaker:getElements()
	do return self.elements end
end

function jk.xml.XMLMaker:setElements(v)
	self.elements = v
	do return self end
end

function jk.xml.XMLMaker:getCustomHeader()
	do return self.customHeader end
end

function jk.xml.XMLMaker:setCustomHeader(v)
	self.customHeader = v
	do return self end
end

function jk.xml.XMLMaker:getSingleLine()
	do return self.singleLine end
end

function jk.xml.XMLMaker:setSingleLine(v)
	self.singleLine = v
	do return self end
end

function jk.xml.XMLMaker:getHeader()
	do return self.header end
end

function jk.xml.XMLMaker:setHeader(v)
	self.header = v
	do return self end
end

function jk.xml.XMLMaker:getIndentWithTab()
	do return self.indentWithTab end
end

function jk.xml.XMLMaker:setIndentWithTab(v)
	self.indentWithTab = v
	do return self end
end

jk.xml.HTMLParser = _g.jk.xml.MarkupLanguageParser._create()
jk.xml.HTMLParser.__index = jk.xml.HTMLParser
_vm:set_metatable(jk.xml.HTMLParser, {
	__index = _g.jk.xml.MarkupLanguageParser
})

function jk.xml.HTMLParser._create()
	local v = _vm:set_metatable({}, jk.xml.HTMLParser)
	return v
end

function jk.xml.HTMLParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.HTMLParser'
	self['_isType.jk.xml.HTMLParser'] = true
	self.emptyTags = nil
end

function jk.xml.HTMLParser:_construct0()
	jk.xml.HTMLParser._init(self)
	do _g.jk.xml.MarkupLanguageParser._construct0(self) end
	return self
end

function jk.xml.HTMLParser:forString(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.xml.HTMLParser._construct0(_g.jk.xml.HTMLParser._create())
		v.it = _g.jk.lang.CharacterIteratorForString:forString(string)
		do return v end
	end
end

function jk.xml.HTMLParser:parseAsVectorObject(xml, ignoreWhiteSpace)
	local root = nil
	local stack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	local pp = _g.jk.xml.HTMLParser:forString(xml)
	do pp:setIgnoreWhiteSpace(ignoreWhiteSpace) end
	while true do
		local o = pp:next()
		if o == nil then
			do break end
		end
		if (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) then
			local name = o:getName()
			if name == "?xml" then
				goto _continue1
			end
			do
				local nn = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
				do nn:setString("name", name) end
				do nn:setObject("attributes", o:getParams()) end
				if stack:isEmpty() then
					do stack:push(nn) end
				else
					local current = stack:peek()
					local children = current:getDynamicVector("children")
					if children == nil then
						children = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
						do current:setObject("children", children) end
					end
					do children:appendObject(nn) end
					do stack:push(nn) end
				end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.EndElement') ~= nil) then
			local e = stack:pop()
			if stack:isEmpty() then
				if root == nil then
					root = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
				end
				do root:appendObject(e) end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local current = stack:peek()
			if current ~= nil then
				local children = current:getDynamicVector("children")
				if children == nil then
					children = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
					do current:setObject("children", children) end
				end
				do children:appendObject(o:getData()) end
			end
		end
		::_continue1::
	end
	do return root end
end

function jk.xml.HTMLParser:isSelfClosing(tag)
	if self.emptyTags == nil then
		self.emptyTags = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		do self.emptyTags:add("!doctype") end
		do self.emptyTags:add("area") end
		do self.emptyTags:add("base") end
		do self.emptyTags:add("br") end
		do self.emptyTags:add("col") end
		do self.emptyTags:add("embed") end
		do self.emptyTags:add("hr") end
		do self.emptyTags:add("img") end
		do self.emptyTags:add("input") end
		do self.emptyTags:add("link") end
		do self.emptyTags:add("meta") end
		do self.emptyTags:add("param") end
		do self.emptyTags:add("source") end
		do self.emptyTags:add("track") end
		do self.emptyTags:add("wbr") end
	end
	do return self.emptyTags:contains(tag) end
end

jk.xml.XMLDOM = {}
jk.xml.XMLDOM.__index = jk.xml.XMLDOM
_vm:set_metatable(jk.xml.XMLDOM, {})

function jk.xml.XMLDOM._create()
	local v = _vm:set_metatable({}, jk.xml.XMLDOM)
	return v
end

function jk.xml.XMLDOM:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLDOM'
	self['_isType.jk.xml.XMLDOM'] = true
end

function jk.xml.XMLDOM:_construct0()
	jk.xml.XMLDOM._init(self)
	return self
end

function jk.xml.XMLDOM:parseAsTreeObject(xml, ignoreWhiteSpace)
	local root = nil
	local stack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	local pp = _g.jk.xml.XMLParser:forString(xml)
	do pp:setIgnoreWhiteSpace(ignoreWhiteSpace) end
	while true do
		local o = pp:next()
		if o == nil then
			do break end
		end
		if (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) then
			local name = o:getName()
			if root == nil and name == "?xml" then
				goto _continue9
			end
			do
				local dn = _g.jk.xml.XMLDOMNode._construct0(_g.jk.xml.XMLDOMNode._create())
				dn.name = name
				dn.attributes = o:getParams()
				if root == nil then
					root = dn
					do stack:push(dn) end
				else
					local current = stack:peek()
					if current == nil then
						current = root
					end
					do
						local children = current.children
						if children == nil then
							children = {}
							current.children = children
						end
						do _g.jk.lang.Vector:append(children, dn) end
						do stack:push(dn) end
					end
				end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.EndElement') ~= nil) then
			do stack:pop() end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) then
			local current = stack:peek()
			if current ~= nil then
				local children = current.children
				if children == nil then
					children = {}
					current.children = children
				end
				do
					local dn = _g.jk.xml.XMLDOMNode._construct0(_g.jk.xml.XMLDOMNode._create())
					dn.name = "cdata"
					dn.data = o:getData()
					do _g.jk.lang.Vector:append(children, dn) end
				end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local current = stack:peek()
			if current ~= nil then
				current.data = o:getData()
			end
		end
		::_continue9::
	end
	do return root end
end

jk.xml.XMLDOMNode = {}
jk.xml.XMLDOMNode.__index = jk.xml.XMLDOMNode
_vm:set_metatable(jk.xml.XMLDOMNode, {})

function jk.xml.XMLDOMNode._create()
	local v = _vm:set_metatable({}, jk.xml.XMLDOMNode)
	return v
end

function jk.xml.XMLDOMNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLDOMNode'
	self['_isType.jk.xml.XMLDOMNode'] = true
	self.name = nil
	self.data = nil
	self.attributes = nil
	self.children = nil
end

function jk.xml.XMLDOMNode:_construct0()
	jk.xml.XMLDOMNode._init(self)
	return self
end

function jk.xml.XMLDOMNode:getDOMNodesByName(name)
	if not (self.children ~= nil and _g.jk.lang.Vector:getSize(self.children) > 0) then
		do return nil end
	end
	do
		local elements = {}
		if self.children ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.children)
			do
				n = 0
				while n < m do
					local child = self.children[n + 1]
					if child ~= nil then
						if _g.jk.lang.String:equals(child.name, name) then
							do _g.jk.lang.Vector:append(elements, child) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return elements end
	end
end

function jk.xml.XMLDOMNode:getAttribute(name)
	if not (self.attributes ~= nil) then
		do return nil end
	end
	do return self.attributes:getString(name, nil) end
end

function jk.xml.XMLDOMNode:toString(tabCount)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local tb = tabCount
	if tb < 0 then
		tb = 0
	end
	do
		local i = 0
		while i < tb do
			do sb:appendString("\t") end
			do i = i + 1 end
		end
		if _g.jk.lang.String:equals(self.name, "cdata") then
			do sb:appendString("<![CDATA[") end
			do sb:appendString(self.data) end
			do sb:appendString("]]>") end
			do return sb:toString() end
		end
		do sb:appendString("<") end
		do sb:appendString(self.name) end
		if self.attributes ~= nil then
			local array = self.attributes:getKeys()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local name = array[n + 1]
						if name ~= nil then
							do sb:appendString(" " .. _g.jk.lang.String:safeString(name) .. "=\"" .. _g.jk.lang.String:safeString(self.attributes:getString(name, nil)) .. "\"") end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do sb:appendString(">") end
		if self.children ~= nil and _g.jk.lang.Vector:getSize(self.children) > 0 then
			if self.children ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(self.children)
				do
					n2 = 0
					while n2 < m2 do
						local child = self.children[n2 + 1]
						if child ~= nil then
							do sb:appendString("\n") end
							do sb:appendString(child:toString(tb + 1)) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do sb:appendString("\n") end
			i = 0
			while i < tb do
				do sb:appendString("\t") end
				do i = i + 1 end
			end
		else
			do sb:appendString(self.data) end
		end
		do sb:appendString("</") end
		do sb:appendString(self.name) end
		do sb:appendString(">") end
		do return sb:toString() end
	end
end

jk.xml.XMLParser = _g.jk.xml.MarkupLanguageParser._create()
jk.xml.XMLParser.__index = jk.xml.XMLParser
_vm:set_metatable(jk.xml.XMLParser, {
	__index = _g.jk.xml.MarkupLanguageParser
})

function jk.xml.XMLParser._create()
	local v = _vm:set_metatable({}, jk.xml.XMLParser)
	return v
end

function jk.xml.XMLParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLParser'
	self['_isType.jk.xml.XMLParser'] = true
end

function jk.xml.XMLParser:_construct0()
	jk.xml.XMLParser._init(self)
	do _g.jk.xml.MarkupLanguageParser._construct0(self) end
	return self
end

function jk.xml.XMLParser:forFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local reader = file:read()
		if not (reader ~= nil) then
			do return nil end
		end
		do
			local v = _g.jk.xml.XMLParser._construct0(_g.jk.xml.XMLParser._create())
			v.it = _g.jk.io.CharacterIteratorForReader._construct1(_g.jk.io.CharacterIteratorForReader._create(), reader)
			do return v end
		end
	end
end

function jk.xml.XMLParser:forString(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.xml.XMLParser._construct0(_g.jk.xml.XMLParser._create())
		v.it = _g.jk.lang.CharacterIteratorForString:forString(string)
		do return v end
	end
end

function jk.xml.XMLParser:forIterator(it)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.xml.XMLParser._construct0(_g.jk.xml.XMLParser._create())
		v.it = it
		do return v end
	end
end

function jk.xml.XMLParser:parseAsTreeObject(xml, ignoreWhiteSpace)
	local root = nil
	local stack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	local pp = _g.jk.xml.XMLParser:forString(xml)
	do pp:setIgnoreWhiteSpace(ignoreWhiteSpace) end
	while true do
		local o = pp:next()
		if o == nil then
			do break end
		end
		if (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) then
			local name = o:getName()
			if root == nil and name == "?xml" then
				goto _continue10
			end
			do
				local nn = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
				do nn:setString("name", name) end
				do nn:setObject("attributes", o:getParams()) end
				if root == nil then
					root = nn
					do stack:push(nn) end
				else
					local current = stack:peek()
					if current == nil then
						current = root
					end
					do
						local children = current:getDynamicVector("children")
						if children == nil then
							children = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
							do current:setObject("children", children) end
						end
						do children:appendObject(nn) end
						do stack:push(nn) end
					end
				end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.EndElement') ~= nil) then
			do stack:pop() end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) or (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local current = stack:peek()
			if current ~= nil then
				local children = current:getDynamicVector("children")
				if children == nil then
					children = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
					do current:setObject("children", children) end
				end
				do
					local data = nil
					if (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) then
						data = o:getData()
					else
						data = o:getData()
					end
					do children:appendObject(data) end
				end
			end
		end
		::_continue10::
	end
	do return root end
end

jk.xml.HTMLString = {}
jk.xml.HTMLString.__index = jk.xml.HTMLString
_vm:set_metatable(jk.xml.HTMLString, {})

function jk.xml.HTMLString._create()
	local v = _vm:set_metatable({}, jk.xml.HTMLString)
	return v
end

function jk.xml.HTMLString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.HTMLString'
	self['_isType.jk.xml.HTMLString'] = true
end

function jk.xml.HTMLString:_construct0()
	jk.xml.HTMLString._init(self)
	return self
end

function jk.xml.HTMLString:sanitize(str)
	if not (str ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:getIndexOfCharacter(str, 60, 0) < 0 and _g.jk.lang.String:getIndexOfCharacter(str, 62, 0) < 0 and _g.jk.lang.String:getIndexOfCharacter(str, 38, 0) < 0 then
		do return str end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		if not (it ~= nil) then
			do return nil end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			local c = 0
			while (function()
				c = it:getNextChar()
				do return c end
			end)() > 0 do
				if c == 60 then
					do sb:appendString("&lt;") end
				elseif c == 62 then
					do sb:appendString("&gt;") end
				elseif c == 38 then
					do sb:appendString("&amp;") end
				else
					do sb:appendCharacter(c) end
				end
			end
			do return sb:toString() end
		end
	end
end

function jk.xml.HTMLString:toQuotedString(str)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendCharacter(34) end
	if str ~= nil then
		local it = _g.jk.lang.String:iterate(str)
		while it ~= nil do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if c == 34 then
				do sb:appendCharacter(92) end
				do sb:appendCharacter(34) end
			else
				do sb:appendCharacter(c) end
			end
		end
	end
	do sb:appendCharacter(34) end
	do return sb:toString() end
end
jk = jk or {}

jk.template = jk.template or {}

jk.template.RichTextParagraph = {}
jk.template.RichTextParagraph.__index = jk.template.RichTextParagraph
_vm:set_metatable(jk.template.RichTextParagraph, {})

function jk.template.RichTextParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextParagraph)
	return v
end

function jk.template.RichTextParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextParagraph'
	self['_isType.jk.template.RichTextParagraph'] = true
end

function jk.template.RichTextParagraph:_construct0()
	jk.template.RichTextParagraph._init(self)
	return self
end

function jk.template.RichTextParagraph:toMarkup()
	do return nil end
end

function jk.template.RichTextParagraph:toText()
	do return nil end
end

function jk.template.RichTextParagraph:toJson()
	do return nil end
end

function jk.template.RichTextParagraph:toHtml(refs)
	do return nil end
end

jk.template.RichTextSeparatorParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextSeparatorParagraph.__index = jk.template.RichTextSeparatorParagraph
_vm:set_metatable(jk.template.RichTextSeparatorParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextSeparatorParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextSeparatorParagraph)
	return v
end

function jk.template.RichTextSeparatorParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextSeparatorParagraph'
	self['_isType.jk.template.RichTextSeparatorParagraph'] = true
end

function jk.template.RichTextSeparatorParagraph:_construct0()
	jk.template.RichTextSeparatorParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextSeparatorParagraph:toMarkup()
	do return "-" end
end

function jk.template.RichTextSeparatorParagraph:toText()
	do return "----------" end
end

function jk.template.RichTextSeparatorParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "separator") end
	do return v end
end

function jk.template.RichTextSeparatorParagraph:toHtml(refs)
	do return "<hr />\n" end
end

jk.template.RichTextReferenceParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextReferenceParagraph.__index = jk.template.RichTextReferenceParagraph
_vm:set_metatable(jk.template.RichTextReferenceParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextReferenceParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextReferenceParagraph)
	return v
end

function jk.template.RichTextReferenceParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextReferenceParagraph'
	self['_isType.jk.template.RichTextReferenceParagraph'] = true
	self.reference = nil
	self.text = nil
end

function jk.template.RichTextReferenceParagraph:_construct0()
	jk.template.RichTextReferenceParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextReferenceParagraph:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("@reference ") end
	do sb:appendString(self.reference) end
	if _g.jk.lang.String:isEmpty(self.text) == false then
		do sb:appendCharacter(32) end
		do sb:appendCharacter(34) end
		do sb:appendString(self.text) end
		do sb:appendCharacter(34) end
	end
	do return sb:toString() end
end

function jk.template.RichTextReferenceParagraph:toText()
	local v = self.text
	if _g.jk.lang.String:isEmpty(self.text) then
		v = self.reference
	end
	do return v end
end

function jk.template.RichTextReferenceParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "reference") end
	do v:setString("reference", self.reference) end
	do v:setString("text", self.text) end
	do return v end
end

function jk.template.RichTextReferenceParagraph:toHtml(refs)
	local reftitle = nil
	local href = nil
	if _g.jk.lang.String:isEmpty(self.text) == false then
		reftitle = self.text
	end
	if _g.jk.lang.String:isEmpty(reftitle) then
		if refs ~= nil then
			reftitle = refs:getReferenceTitle(self.reference)
		else
			reftitle = self.reference
		end
	end
	if refs ~= nil then
		href = refs:getReferenceHref(self.reference)
	else
		href = self.reference
	end
	if _g.jk.lang.String:isEmpty(href) then
		do return "" end
	end
	if _g.jk.lang.String:isEmpty(reftitle) then
		reftitle = href
	end
	do return "<p class=\"reference\"><a href=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(href)) .. "\">" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(reftitle)) .. "</a></p>\n" end
end

function jk.template.RichTextReferenceParagraph:getReference()
	do return self.reference end
end

function jk.template.RichTextReferenceParagraph:setReference(v)
	self.reference = v
	do return self end
end

function jk.template.RichTextReferenceParagraph:getText()
	do return self.text end
end

function jk.template.RichTextReferenceParagraph:setText(v)
	self.text = v
	do return self end
end

jk.template.RichTextWikiMarkupParser = {}
jk.template.RichTextWikiMarkupParser.__index = jk.template.RichTextWikiMarkupParser
_vm:set_metatable(jk.template.RichTextWikiMarkupParser, {})

function jk.template.RichTextWikiMarkupParser._create()
	local v = _vm:set_metatable({}, jk.template.RichTextWikiMarkupParser)
	return v
end

function jk.template.RichTextWikiMarkupParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextWikiMarkupParser'
	self['_isType.jk.template.RichTextWikiMarkupParser'] = true
	self.file = nil
	self.data = nil
	self.allowInclude = true
end

function jk.template.RichTextWikiMarkupParser:_construct0()
	jk.template.RichTextWikiMarkupParser._init(self)
	return self
end

function jk.template.RichTextWikiMarkupParser:parseFile(file)
	do return _g.jk.template.RichTextWikiMarkupParser._construct0(_g.jk.template.RichTextWikiMarkupParser._create()):setFile(file):parse() end
end

function jk.template.RichTextWikiMarkupParser:parseString(data)
	do return _g.jk.template.RichTextWikiMarkupParser._construct0(_g.jk.template.RichTextWikiMarkupParser._create()):setData(data):parse() end
end

function jk.template.RichTextWikiMarkupParser:skipEmptyLines(pr)
	local line = nil
	while not ((function()
		line = pr:readLine()
		do return line end
	end)() == nil) do
		line = _g.jk.lang.String:strip(line)
		if line ~= nil and _g.jk.lang.String:startsWith(line, "#", 0) then
			goto _continue1
		end
		if _g.jk.lang.String:isEmpty(line) == false then
			do break end
		end
		::_continue1::
	end
	do return line end
end

function jk.template.RichTextWikiMarkupParser:readPreformattedParagraph(id, pr)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local line = nil
	while not ((function()
		line = pr:readLine()
		do return line end
	end)() == nil) do
		if _g.jk.lang.String:startsWith(line, "---", 0) and _g.jk.lang.String:endsWith(line, "---") then
			local lid = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 3, _g.jk.lang.String:getLength(line) - 6))
			if _g.jk.lang.String:isEmpty(id) then
				if _g.jk.lang.String:isEmpty(lid) then
					do break end
				end
			elseif _g.jk.lang.String:equals(id, lid) then
				do break end
			end
		end
		do sb:appendString(line) end
		do sb:appendCharacter(10) end
	end
	do return _g.jk.template.RichTextPreformattedParagraph._construct0(_g.jk.template.RichTextPreformattedParagraph._create()):setId(id):setText(sb:toString()) end
end

function jk.template.RichTextWikiMarkupParser:readBlockParagraph(id, pr)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local line = nil
	while not ((function()
		line = pr:readLine()
		do return line end
	end)() == nil) do
		if _g.jk.lang.String:startsWith(line, "--", 0) and _g.jk.lang.String:endsWith(line, "--") then
			local lid = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 2, _g.jk.lang.String:getLength(line) - 4))
			if _g.jk.lang.String:isEmpty(id) then
				if _g.jk.lang.String:isEmpty(lid) then
					do break end
				end
			elseif _g.jk.lang.String:equals(id, lid) then
				do break end
			end
		end
		do sb:appendString(line) end
		do sb:appendCharacter(10) end
	end
	do return _g.jk.template.RichTextBlockParagraph._construct0(_g.jk.template.RichTextBlockParagraph._create()):setId(id):setText(sb:toString()) end
end

function jk.template.RichTextWikiMarkupParser:readListParagraph(type, l, pr)
	local line = l
	local prefix = _g.jk.lang.String:getSubString(line, 0, 2)
	local list = {}
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	repeat
		line = _g.jk.lang.String:strip(line)
		if _g.jk.lang.String:startsWith(line, prefix, 0) == false then
			do break end
		end
		line = _g.jk.lang.String:getEndOfString(line, 2)
		do
			local it = _g.jk.lang.String:iterate(line)
			local c = 0
			local pc = 0
			while (function()
				c = it:getNextChar()
				do return c end
			end)() > 0 do
				if c == 32 or c == 9 or c == 13 or c == 10 then
					if pc == 32 then
						goto _continue2
					end
					c = 32
				end
				do sb:appendCharacter(c) end
				pc = c
				::_continue2::
			end
			if sb:count() > 0 then
				do _g.jk.lang.Vector:append(list, sb:toString()) end
				do sb:clear() end
			end
		end
	until not not ((function()
		line = pr:readLine()
		do return line end
	end)() == nil)
	do return _g.jk.template.RichTextListParagraph._construct0(_g.jk.template.RichTextListParagraph._create()):setList(list):setType(type) end
end

function jk.template.RichTextWikiMarkupParser:processInput(pr, cwd, doc)
	local line = self:skipEmptyLines(pr)
	if not (line ~= nil) then
		do return false end
	end
	if line == "-" then
		do doc:addParagraph(_g.jk.template.RichTextSeparatorParagraph._construct0(_g.jk.template.RichTextSeparatorParagraph._create())) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@content ", 0) then
		local id = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 9))
		do doc:addParagraph(_g.jk.template.RichTextContentParagraph._construct0(_g.jk.template.RichTextContentParagraph._create()):setContentId(id)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 7))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image100 ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 10))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image75 ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 9))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref):setWidth(75)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image50 ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 9))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref):setWidth(50)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image25 ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 9))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref):setWidth(25)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@reference ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 11))
		local sq = _g.jk.text.StringUtil:quotedStringToVector(ref, 32, true, 92)
		local rrf = _g.jk.lang.Vector:getAt(sq, 0)
		local txt = _g.jk.lang.Vector:getAt(sq, 1)
		do doc:addParagraph(_g.jk.template.RichTextReferenceParagraph._construct0(_g.jk.template.RichTextReferenceParagraph._create()):setReference(rrf):setText(txt)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@set ", 0) then
		local link = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 5))
		local sq = _g.jk.text.StringUtil:quotedStringToVector(link, 32, true, 92)
		local key = _g.jk.lang.Vector:getAt(sq, 0)
		local val = _g.jk.lang.Vector:getAt(sq, 1)
		if _g.jk.lang.String:isEmpty(key) then
			do return true end
		end
		do doc:setMetadata(key, val) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@link ", 0) then
		local link = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 6))
		local sq = _g.jk.text.StringUtil:quotedStringToVector(link, 32, true, 92)
		local url = _g.jk.lang.Vector:getAt(sq, 0)
		local txt = _g.jk.lang.Vector:getAt(sq, 1)
		local flags = _g.jk.lang.Vector:getAt(sq, 2)
		if _g.jk.lang.String:isEmpty(txt) then
			txt = url
		end
		do
			local v = _g.jk.template.RichTextLinkParagraph._construct0(_g.jk.template.RichTextLinkParagraph._create())
			do v:setLink(url) end
			do v:setText(txt) end
			if _g.jk.lang.String:equals("internal", flags) then
				do v:setPopup(false) end
			else
				do v:setPopup(true) end
			end
			do doc:addParagraph(v) end
			do return true end
		end
	end
	if _g.jk.lang.String:startsWith(line, "@include ", 0) then
		local filename = _g.jk.lang.String:getEndOfString(line, 9)
		if _g.jk.lang.String:isEmpty(filename) then
			do return true end
		end
		if cwd ~= nil and self.allowInclude then
			local ff = cwd
			local array = _g.jk.lang.String:split(_g.jk.lang.String:replaceCharacter(filename, 92, 47), 47, 0)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local comp = array[n + 1]
						if comp ~= nil then
							if comp == "." or _g.jk.lang.String:startsWith(comp, "..", 0) then
								goto _continue3
							end
							ff = ff:entry(comp)
						end
						::_continue3::
						do n = n + 1 end
					end
				end
			end
			do
				local prx = _g.jk.io.PrintReader:forReader(ff:read())
				if prx ~= nil then
					do self:parseToDocument(prx, ff:getParent(), doc) end
					do prx:close() end
				end
			end
		end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "---", 0) and _g.jk.lang.String:endsWith(line, "---") then
		local id = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 3, _g.jk.lang.String:getLength(line) - 6))
		if _g.jk.lang.String:isEmpty(id) then
			id = nil
		end
		do doc:addParagraph(self:readPreformattedParagraph(id, pr)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "--", 0) and _g.jk.lang.String:endsWith(line, "--") then
		local id = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 2, _g.jk.lang.String:getLength(line) - 4))
		if _g.jk.lang.String:isEmpty(id) then
			id = nil
		end
		do doc:addParagraph(self:readBlockParagraph(id, pr)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "* ", 0) then
		do doc:addParagraph(self:readListParagraph("unordered", line, pr)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "+ ", 0) then
		do doc:addParagraph(self:readListParagraph("ordered", line, pr)) end
		do return true end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local pc = 0
		repeat
			line = _g.jk.lang.String:strip(line)
			if _g.jk.lang.String:isEmpty(line) then
				do break end
			end
			if _g.jk.lang.String:startsWith(line, "#", 0) == false then
				local it = _g.jk.lang.String:iterate(line)
				local c = 0
				if sb:count() > 0 and pc ~= 32 then
					do sb:appendCharacter(32) end
					pc = 32
				end
				while (function()
					c = it:getNextChar()
					do return c end
				end)() > 0 do
					if c == 32 or c == 9 or c == 13 or c == 10 then
						if pc == 32 then
							goto _continue4
						end
						c = 32
					end
					do sb:appendCharacter(c) end
					pc = c
					::_continue4::
				end
			end
		until not not ((function()
			line = pr:readLine()
			do return line end
		end)() == nil)
		do
			local s = sb:toString()
			if _g.jk.lang.String:isEmpty(s) then
				do return false end
			end
			do doc:addParagraph(_g.jk.template.RichTextStyledParagraph:forString(s)) end
			do return true end
		end
	end
end

function jk.template.RichTextWikiMarkupParser:parseToDocument(pr, cwd, v)
	if not (pr ~= nil) then
		do return end
	end
	while self:processInput(pr, cwd, v) do
	end
end

function jk.template.RichTextWikiMarkupParser:parse()
	local pr = nil
	local cwd = nil
	if self.file ~= nil then
		pr = _g.jk.io.PrintReader:forReader(self.file:read())
		cwd = self.file:getParent()
	elseif self.data ~= nil then
		pr = _g.jk.io.StringLineReader._construct1(_g.jk.io.StringLineReader._create(), self.data)
		cwd = nil
	end
	do
		local v = _g.jk.template.RichTextDocument._construct0(_g.jk.template.RichTextDocument._create())
		do self:parseToDocument(pr, cwd, v) end
		do return v end
	end
end

function jk.template.RichTextWikiMarkupParser:getFile()
	do return self.file end
end

function jk.template.RichTextWikiMarkupParser:setFile(v)
	self.file = v
	do return self end
end

function jk.template.RichTextWikiMarkupParser:getData()
	do return self.data end
end

function jk.template.RichTextWikiMarkupParser:setData(v)
	self.data = v
	do return self end
end

function jk.template.RichTextWikiMarkupParser:getAllowInclude()
	do return self.allowInclude end
end

function jk.template.RichTextWikiMarkupParser:setAllowInclude(v)
	self.allowInclude = v
	do return self end
end

jk.template.RichTextSegment = {}
jk.template.RichTextSegment.__index = jk.template.RichTextSegment
_vm:set_metatable(jk.template.RichTextSegment, {})

function jk.template.RichTextSegment._create()
	local v = _vm:set_metatable({}, jk.template.RichTextSegment)
	return v
end

function jk.template.RichTextSegment:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextSegment'
	self['_isType.jk.template.RichTextSegment'] = true
	self.text = nil
	self.bold = false
	self.italic = false
	self.underline = false
	self.color = nil
	self.link = nil
	self.reference = nil
	self.isInline = false
	self.linkPopup = false
end

function jk.template.RichTextSegment:_construct0()
	jk.template.RichTextSegment._init(self)
	return self
end

function jk.template.RichTextSegment:addMarkupModifiers(sb)
	if self.bold then
		do sb:appendString("**") end
	end
	if self.italic then
		do sb:appendString("''") end
	end
	if self.underline then
		do sb:appendString("__") end
	end
end

function jk.template.RichTextSegment:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do self:addMarkupModifiers(sb) end
	if _g.jk.lang.String:isEmpty(self.link) == false then
		do sb:appendCharacter(91) end
		if self.isInline then
			do sb:appendCharacter(62) end
		end
		do sb:appendString(self.link) end
		if _g.jk.lang.String:isEmpty(self.text) == false then
			do sb:appendCharacter(124) end
			do sb:appendString(self.text) end
		end
		do sb:appendCharacter(93) end
	elseif _g.jk.lang.String:isEmpty(self.reference) == false then
		do sb:appendCharacter(123) end
		if self.isInline then
			do sb:appendCharacter(62) end
		end
		do sb:appendString(self.reference) end
		if _g.jk.lang.String:isEmpty(self.text) == false then
			do sb:appendCharacter(124) end
			do sb:appendString(self.text) end
		end
		do sb:appendCharacter(125) end
	else
		do sb:appendString(self.text) end
	end
	do self:addMarkupModifiers(sb) end
	do return sb:toString() end
end

function jk.template.RichTextSegment:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("text", self.text) end
	if self.isInline then
		do v:setBoolean("inline", self.isInline) end
	end
	if self.bold then
		do v:setBoolean("bold", self.bold) end
	end
	if self.italic then
		do v:setBoolean("italic", self.italic) end
	end
	if self.underline then
		do v:setBoolean("underline", self.underline) end
	end
	if _g.jk.lang.String:isEmpty(self.color) == false then
		do v:setString("color", self.color) end
	end
	if _g.jk.lang.String:isEmpty(self.link) == false then
		do v:setString("link", self.link) end
	end
	if _g.jk.lang.String:isEmpty(self.reference) == false then
		do v:setString("reference", self.reference) end
	end
	do return v end
end

function jk.template.RichTextSegment:toHtml(refs)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local aOpen = false
	local text = self:getText()
	local link = self:getLink()
	if _g.jk.lang.String:isEmpty(link) == false then
		if self:getIsInline() then
			do sb:appendString("<img src=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(link)) .. "\" />") end
		else
			local targetblank = ""
			if self:getLinkPopup() then
				targetblank = " target=\"_blank\""
			end
			do sb:appendString("<a" .. _g.jk.lang.String:safeString(targetblank) .. " class=\"urlLink\" href=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(link)) .. "\">") end
			aOpen = true
		end
	end
	if _g.jk.lang.String:isEmpty(self:getReference()) == false then
		local ref = self:getReference()
		local href = nil
		if refs ~= nil then
			href = refs:getReferenceHref(ref)
			if _g.jk.lang.String:isEmpty(text) then
				text = refs:getReferenceTitle(ref)
			end
		end
		if _g.jk.lang.String:isEmpty(href) == false then
			if _g.jk.lang.String:isEmpty(text) then
				text = ref
			end
			do sb:appendString("<a class=\"referenceLink\" href=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(href)) .. "\">") end
			aOpen = true
		end
	end
	if self:getIsInline() == false then
		if self:getBold() then
			do sb:appendString("<b>") end
		end
		if self:getItalic() then
			do sb:appendString("<i>") end
		end
		if self:getUnderline() then
			do sb:appendString("<u>") end
		end
		if _g.jk.lang.String:isEmpty(self:getColor()) == false then
			do sb:appendString("<span style=\"color: " .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self:getColor())) .. ";\">") end
		end
		do sb:appendString(_g.jk.xml.HTMLString:sanitize(text)) end
		if _g.jk.lang.String:isEmpty(self:getColor()) == false then
			do sb:appendString("</span>") end
		end
		if self:getUnderline() then
			do sb:appendString("</u>") end
		end
		if self:getItalic() then
			do sb:appendString("</i>") end
		end
		if self:getBold() then
			do sb:appendString("</b>") end
		end
	end
	if aOpen then
		do sb:appendString("</a>") end
	end
	do return sb:toString() end
end

function jk.template.RichTextSegment:getText()
	do return self.text end
end

function jk.template.RichTextSegment:setText(v)
	self.text = v
	do return self end
end

function jk.template.RichTextSegment:getBold()
	do return self.bold end
end

function jk.template.RichTextSegment:setBold(v)
	self.bold = v
	do return self end
end

function jk.template.RichTextSegment:getItalic()
	do return self.italic end
end

function jk.template.RichTextSegment:setItalic(v)
	self.italic = v
	do return self end
end

function jk.template.RichTextSegment:getUnderline()
	do return self.underline end
end

function jk.template.RichTextSegment:setUnderline(v)
	self.underline = v
	do return self end
end

function jk.template.RichTextSegment:getColor()
	do return self.color end
end

function jk.template.RichTextSegment:setColor(v)
	self.color = v
	do return self end
end

function jk.template.RichTextSegment:getLink()
	do return self.link end
end

function jk.template.RichTextSegment:setLink(v)
	self.link = v
	do return self end
end

function jk.template.RichTextSegment:getReference()
	do return self.reference end
end

function jk.template.RichTextSegment:setReference(v)
	self.reference = v
	do return self end
end

function jk.template.RichTextSegment:getIsInline()
	do return self.isInline end
end

function jk.template.RichTextSegment:setIsInline(v)
	self.isInline = v
	do return self end
end

function jk.template.RichTextSegment:getLinkPopup()
	do return self.linkPopup end
end

function jk.template.RichTextSegment:setLinkPopup(v)
	self.linkPopup = v
	do return self end
end

jk.template.RichTextPreformattedParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextPreformattedParagraph.__index = jk.template.RichTextPreformattedParagraph
_vm:set_metatable(jk.template.RichTextPreformattedParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextPreformattedParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextPreformattedParagraph)
	return v
end

function jk.template.RichTextPreformattedParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextPreformattedParagraph'
	self['_isType.jk.template.RichTextPreformattedParagraph'] = true
	self.id = nil
	self.text = nil
end

function jk.template.RichTextPreformattedParagraph:_construct0()
	jk.template.RichTextPreformattedParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextPreformattedParagraph:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local delim = nil
	if _g.jk.lang.String:isEmpty(self.id) then
		delim = "---"
	else
		delim = "--- " .. _g.jk.lang.String:safeString(self.id) .. " ---"
	end
	do sb:appendString(delim) end
	do sb:appendCharacter(10) end
	if self.text ~= nil then
		do sb:appendString(self.text) end
		if _g.jk.lang.String:endsWith(self.text, "\n") == false then
			do sb:appendCharacter(10) end
		end
	end
	do sb:appendString(delim) end
	do return sb:toString() end
end

function jk.template.RichTextPreformattedParagraph:toText()
	do return self.text end
end

function jk.template.RichTextPreformattedParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "preformatted") end
	do v:setString("id", self.id) end
	do v:setString("text", self.text) end
	do return v end
end

function jk.template.RichTextPreformattedParagraph:toHtml(refs)
	local ids = ""
	if _g.jk.lang.String:isEmpty(self.id) == false then
		ids = " id=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self.id)) .. "\""
	end
	do
		local codeo = ""
		local codec = ""
		if _g.jk.lang.String:equals("code", self.id) then
			codeo = "<code>"
			codec = "</code>"
		end
		do return "<pre" .. _g.jk.lang.String:safeString(ids) .. ">" .. _g.jk.lang.String:safeString(codeo) .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self.text)) .. _g.jk.lang.String:safeString(codec) .. "</pre>" end
	end
end

function jk.template.RichTextPreformattedParagraph:getId()
	do return self.id end
end

function jk.template.RichTextPreformattedParagraph:setId(v)
	self.id = v
	do return self end
end

function jk.template.RichTextPreformattedParagraph:getText()
	do return self.text end
end

function jk.template.RichTextPreformattedParagraph:setText(v)
	self.text = v
	do return self end
end

jk.template.TextTemplate = {}
jk.template.TextTemplate.__index = jk.template.TextTemplate
_vm:set_metatable(jk.template.TextTemplate, {})

jk.template.TextTemplate.TYPE_GENERIC = 0
jk.template.TextTemplate.TYPE_HTML = 1
jk.template.TextTemplate.TYPE_JSON = 2

function jk.template.TextTemplate._create()
	local v = _vm:set_metatable({}, jk.template.TextTemplate)
	return v
end

function jk.template.TextTemplate:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.TextTemplate'
	self['_isType.jk.template.TextTemplate'] = true
	self.tokens = nil
	self.text = nil
	self.markerBegin = nil
	self.markerEnd = nil
	self.logContext = nil
	self.type = _g.jk.template.TextTemplate.TYPE_GENERIC
	self.languagePreferences = nil
	self.includeDirs = nil
	self.includeFileData = nil
end

function jk.template.TextTemplate:_construct0()
	jk.template.TextTemplate._init(self)
	return self
end

jk.template.TextTemplate.TagData = {}
jk.template.TextTemplate.TagData.__index = jk.template.TextTemplate.TagData
_vm:set_metatable(jk.template.TextTemplate.TagData, {})

function jk.template.TextTemplate.TagData._create()
	local v = _vm:set_metatable({}, jk.template.TextTemplate.TagData)
	return v
end

function jk.template.TextTemplate.TagData:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.TextTemplate.TagData'
	self['_isType.jk.template.TextTemplate.TagData'] = true
	self.words = nil
end

function jk.template.TextTemplate.TagData:_construct0()
	jk.template.TextTemplate.TagData._init(self)
	return self
end

function jk.template.TextTemplate.TagData:_construct1(words)
	jk.template.TextTemplate.TagData._init(self)
	self.words = words
	return self
end

function jk.template.TextTemplate:processFile(file, markerBegin, markerEnd, vars)
	local v = _g.jk.template.TextTemplate:forFile(file, markerBegin, markerEnd, 0, nil, nil, nil)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:execute(vars, nil) end
end

function jk.template.TextTemplate:processString(text, markerBegin, markerEnd, vars)
	local v = _g.jk.template.TextTemplate:forString(text, markerBegin, markerEnd, 0, nil, nil, nil)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:execute(vars, nil) end
end

function jk.template.TextTemplate:forFile(file, markerBegin, markerEnd, type, includeDirs, includeFileData, logContext)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local text = file:getContentsUTF8()
		if not (text ~= nil) then
			do return nil end
		end
		do
			local ids = includeDirs
			if not (ids ~= nil) then
				ids = {}
				do _g.jk.lang.Vector:append(ids, file:getParent()) end
			end
			do return _g.jk.template.TextTemplate:forString(text, markerBegin, markerEnd, type, ids, includeFileData, logContext) end
		end
	end
end

function jk.template.TextTemplate:forHTMLFile(file, includeDirs, includeFileData, logContext)
	do return _g.jk.template.TextTemplate:forFile(file, "<%", "%>", _g.jk.template.TextTemplate.TYPE_HTML, includeDirs, includeFileData, logContext) end
end

function jk.template.TextTemplate:forString(text, markerBegin, markerEnd, type, includeDirs, includeFileData, logContext)
	local v = _g.jk.template.TextTemplate._construct0(_g.jk.template.TextTemplate._create())
	do v:setLogContext(logContext) end
	do v:setText(text) end
	do v:setType(type) end
	do v:setMarkerBegin(markerBegin) end
	do v:setMarkerEnd(markerEnd) end
	do v:setIncludeDirs(includeDirs) end
	do v:setIncludeFileData(includeFileData) end
	if v:prepare() == false then
		v = nil
	end
	do return v end
end

function jk.template.TextTemplate:forHTMLString(text, includeDirs, includeFileData, logContext)
	local v = _g.jk.template.TextTemplate._construct0(_g.jk.template.TextTemplate._create())
	do v:setLogContext(logContext) end
	do v:setText(text) end
	do v:setType(_g.jk.template.TextTemplate.TYPE_HTML) end
	do v:setMarkerBegin("<%") end
	do v:setMarkerEnd("%>") end
	do v:setIncludeDirs(includeDirs) end
	do v:setIncludeFileData(includeFileData) end
	if v:prepare() == false then
		v = nil
	end
	do return v end
end

function jk.template.TextTemplate:forJSONString(text, includeDirs, includeFileData, logContext)
	local v = _g.jk.template.TextTemplate._construct0(_g.jk.template.TextTemplate._create())
	do v:setLogContext(logContext) end
	do v:setText(text) end
	do v:setType(_g.jk.template.TextTemplate.TYPE_JSON) end
	do v:setMarkerBegin("{{") end
	do v:setMarkerEnd("}}") end
	do v:setIncludeDirs(includeDirs) end
	do v:setIncludeFileData(includeFileData) end
	if v:prepare() == false then
		v = nil
	end
	do return v end
end

function jk.template.TextTemplate:setLanguagePreference(language)
	self.languagePreferences = {}
	if language ~= nil then
		do _g.jk.lang.Vector:append(self.languagePreferences, language) end
	end
end

function jk.template.TextTemplate:getIncludeFileContent(fileName)
	if not (fileName ~= nil) then
		do return nil end
	end
	do
		local ff = nil
		if self.includeFileData ~= nil then
			local o = _g.jk.lang.Map:get(self.includeFileData, fileName)
			if o ~= nil then
				if (_vm:get_variable_type(o) == 'string') then
					do return o end
				end
				if _util:is_buffer(o) then
					do return _g.jk.lang.String:forUTF8Buffer(o) end
				end
				if (_vm:to_table_with_key(o, '_isType.jk.fs.File') ~= nil) then
					ff = o
				end
			end
		end
		if not (ff ~= nil) then
			if _g.jk.fs.PathInfo:isAbsolutePath(fileName) then
				ff = _g.jk.fs.File:forPath(fileName)
			end
		end
		if not (ff ~= nil) then
			if self.includeDirs ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(self.includeDirs)
				do
					n = 0
					while n < m do
						local includeDir = self.includeDirs[n + 1]
						if includeDir ~= nil then
							local x = _g.jk.fs.File:forRelativePath(fileName, includeDir, false)
							if x:isFile() then
								ff = x
								do break end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		if not (ff ~= nil and ff:isFile()) then
			do _g.jk.log.Log:warning(self.logContext, "Included file was not found: `" .. _g.jk.lang.String:safeString(fileName) .. "'") end
			do return nil end
		end
		do
			local cc = ff:getContentsUTF8()
			if not (cc ~= nil) then
				do _g.jk.log.Log:warning(self.logContext, "Failed to read included file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
			end
			do return cc end
		end
	end
end

function jk.template.TextTemplate:tokenizeString(inputdata)
	if self.markerBegin == nil or self.markerEnd == nil then
		do _g.jk.log.Log:error(self.logContext, "No template markers were given") end
		do return nil end
	end
	if _g.jk.lang.String:getLength(self.markerBegin) ~= 2 or _g.jk.lang.String:getLength(self.markerEnd) ~= 2 then
		do _g.jk.log.Log:error(self.logContext, "Invalid template markers: `" .. _g.jk.lang.String:safeString(self.markerBegin) .. "' and `" .. _g.jk.lang.String:safeString(self.markerEnd) .. "'") end
		do return nil end
	end
	do
		local mb1 = _g.jk.lang.String:getChar(self.markerBegin, 0)
		local mb2 = _g.jk.lang.String:getChar(self.markerBegin, 1)
		local me1 = _g.jk.lang.String:getChar(self.markerEnd, 0)
		local me2 = _g.jk.lang.String:getChar(self.markerEnd, 1)
		local pc = 0
		local tag = nil
		local data = nil
		local it = _g.jk.lang.String:iterate(inputdata)
		local v = {}
		while it ~= nil do
			local c = it:getNextChar()
			if c <= 0 then
				do break end
			end
			if tag ~= nil then
				if pc == me1 and tag:count() > 2 then
					do tag:appendCharacter(pc) end
					do tag:appendCharacter(c) end
					if c == me2 then
						local tt = tag:toString()
						local tts = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(tt, 2, _g.jk.lang.String:getLength(tt) - 4))
						local words = _g.jk.text.StringUtil:quotedStringToVector(tts, 32, true, 92)
						if _g.jk.lang.Vector:get(words, 0) == "include" then
							local fileName = _g.jk.lang.Vector:get(words, 1)
							if _g.jk.lang.String:isEmpty(fileName) then
								do _g.jk.log.Log:warning(self.logContext, "Include tag with empty filename. Ignoring it.") end
							else
								local cc = self:getIncludeFileContent(fileName)
								if cc ~= nil then
									local nt = _g.jk.template.TextTemplate:forString(cc, self.markerBegin, self.markerEnd, self.type, self.includeDirs, self.includeFileData, nil)
									if nt == nil then
										do _g.jk.log.Log:warning(self.logContext, "Failed to process included template file: `" .. _g.jk.lang.String:safeString(fileName) .. "'") end
									else
										local array = nt:getTokens()
										if array ~= nil then
											local n = 0
											local m = _g.jk.lang.Vector:getSize(array)
											do
												n = 0
												while n < m do
													local token = array[n + 1]
													if token ~= nil then
														do _g.jk.lang.Vector:append(v, token) end
													end
													do n = n + 1 end
												end
											end
										end
									end
								else
									do _g.jk.log.Log:warning(self.logContext, "Failed to get include file content: `" .. _g.jk.lang.String:safeString(fileName) .. "'") end
								end
							end
						else
							do _g.jk.lang.Vector:append(v, _g.jk.template.TextTemplate.TagData._construct1(_g.jk.template.TextTemplate.TagData._create(), words)) end
						end
						tag = nil
					end
				elseif c ~= me1 then
					do tag:appendCharacter(c) end
				end
			elseif pc == mb1 then
				if c == mb2 then
					if data ~= nil then
						do _g.jk.lang.Vector:append(v, data) end
						data = nil
					end
					tag = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do tag:appendCharacter(pc) end
					do tag:appendCharacter(c) end
				else
					if data == nil then
						data = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					end
					do data:appendCharacter(pc) end
					do data:appendCharacter(c) end
				end
			elseif c ~= mb1 then
				if data == nil then
					data = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
				do data:appendCharacter(c) end
			end
			pc = c
		end
		if pc == mb1 then
			if data == nil then
				data = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			do data:appendCharacter(pc) end
		end
		if data ~= nil then
			do _g.jk.lang.Vector:append(v, data) end
			data = nil
		end
		if tag ~= nil then
			do _g.jk.log.Log:error(self.logContext, "Unfinished tag: `" .. _g.jk.lang.String:safeString(tag:toString()) .. "'") end
			do return nil end
		end
		do return v end
	end
end

function jk.template.TextTemplate:prepare()
	local str = self.text
	if not (str ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "No input string was specified.") end
		do return false end
	end
	if not ((function()
		self.tokens = self:tokenizeString(str)
		do return self.tokens end
	end)() ~= nil) then
		do return false end
	end
	do return true end
end

function jk.template.TextTemplate:execute(vars, importDirs)
	if not (self.tokens ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "TextTemplate has not been prepared") end
		do return nil end
	end
	do
		local result = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if not self:doExecute(self.tokens, vars, result, importDirs) then
			do return nil end
		end
		do return result:toString() end
	end
end

function jk.template.TextTemplate:substituteVariables(orig, vars)
	if orig == nil then
		do return orig end
	end
	if _g.jk.lang.String:getIndexOfString(orig, "${", 0) < 0 then
		do return orig end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local varbuf = nil
		local flag = false
		local it = _g.jk.lang.String:iterate(orig)
		while it ~= nil do
			local c = it:getNextChar()
			if c <= 0 then
				do break end
			end
			if varbuf ~= nil then
				if c == 125 then
					local varname = varbuf:toString()
					if vars ~= nil then
						local varcut = nil
						if _g.jk.lang.String:getIndexOfCharacter(varname, 33, 0) > 0 then
							local sp = _g.jk.lang.Vector:iterate(_g.jk.lang.String:split(varname, 33, 2))
							varname = sp:next()
							varcut = sp:next()
						end
						do
							local r = self:getVariableValueString(vars, varname)
							if _g.jk.lang.String:isEmpty(varcut) == false then
								local itc = _g.jk.lang.String:iterate(varcut)
								local cx = 0
								while (function()
									cx = itc:getNextChar()
									do return cx end
								end)() > 0 do
									local n = _g.jk.lang.String:getLastIndexOfCharacter(r, cx, -1)
									if n < 0 then
										do break end
									end
									r = _g.jk.lang.String:getSubString(r, 0, n)
								end
							end
							do sb:appendString(r) end
						end
					end
					varbuf = nil
				else
					do varbuf:appendCharacter(c) end
				end
				goto _continue5
			end
			if flag == true then
				flag = false
				if c == 123 then
					varbuf = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				else
					do sb:appendCharacter(36) end
					do sb:appendCharacter(c) end
				end
				goto _continue5
			end
			if c == 36 then
				flag = true
				goto _continue5
			end
			do sb:appendCharacter(c) end
			::_continue5::
		end
		do return sb:toString() end
	end
end

function jk.template.TextTemplate:getVariableValue(vars, varname)
	if vars == nil or varname == nil then
		do return nil end
	end
	do
		local vv = vars:get(varname)
		if vv ~= nil then
			do return vv end
		end
		do
			local ll = _g.jk.lang.String:split(varname, 46, 0)
			if _g.jk.lang.Vector:getSize(ll) < 2 then
				do return nil end
			end
			do
				local nvar = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(_g.jk.lang.Vector:get(ll, _g.jk.lang.Vector:getSize(ll) - 1))
				do _g.jk.lang.Vector:removeLast(ll) end
				do
					local cc = vars
					if ll ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(ll)
						do
							n = 0
							while n < m do
								local vv2 = ll[n + 1]
								if vv2 ~= nil then
									if cc == nil then
										do return nil end
									end
									do
										local vv2o = cc:get(vv2)
										cc = _vm:to_table_with_key(vv2o, '_isType.jk.lang.DynamicMap')
										if cc == nil and vv2o ~= nil and (_vm:to_table_with_key(vv2o, '_isType.jk.json.JSONObject') ~= nil) then
											cc = _vm:to_table_with_key(vv2o:toJsonObject(), '_isType.jk.lang.DynamicMap')
										end
									end
								end
								do n = n + 1 end
							end
						end
					end
					if cc ~= nil then
						do return cc:get(nvar) end
					end
					do return nil end
				end
			end
		end
	end
end

function jk.template.TextTemplate:getVariableValueString(vars, varname)
	local v = self:getVariableValue(vars, varname)
	if not (v ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(v, '_isType.jk.lang.DynamicMap') ~= nil) then
		if self.languagePreferences ~= nil then
			if self.languagePreferences ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(self.languagePreferences)
				do
					n = 0
					while n < m do
						local language = self.languagePreferences[n + 1]
						if language ~= nil then
							local s = v:getString(language, nil)
							if s ~= nil then
								do return s end
							end
						end
						do n = n + 1 end
					end
				end
			end
		else
			local s = v:getString("en", nil)
			if s ~= nil then
				do return s end
			end
		end
		do return nil end
	end
	do return _g.jk.lang.String:asString(v) end
end

function jk.template.TextTemplate:getVariableValueVector(vars, varname)
	local v = self:getVariableValue(vars, varname)
	if not (v ~= nil) then
		do return nil end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(v) then
		do return v end
	end
	if (_vm:to_table_with_key(v, '_isType.jk.lang.VectorObject') ~= nil) then
		local vo = v
		local vv = vo:toVector()
		do return vv end
	end
	if (_vm:to_table_with_key(v, '_isType.jk.lang.ArrayObject') ~= nil) then
		local vo = _vm:to_table_with_key(v, '_isType.jk.lang.ArrayObject')
		local vv = vo:toArray()
		local vvx = _g.jk.lang.Vector:forArray(vv)
		do return vvx end
	end
	if (_vm:to_table_with_key(v, '_isType.jk.lang.DynamicVector') ~= nil) then
		local dv = v
		do return dv:toVector() end
	end
	do return nil end
end

function jk.template.TextTemplate:handleBlock(vars, tag, data, result, importDirs)
	if not (tag ~= nil) then
		do return false end
	end
	do
		local tagname = _g.jk.lang.Vector:get(tag, 0)
		if _g.jk.lang.String:isEmpty(tagname) then
			do return false end
		end
		if tagname == "for" then
			local varname = _g.jk.lang.Vector:get(tag, 1)
			local inword = _g.jk.lang.Vector:get(tag, 2)
			local origvar = self:substituteVariables(_g.jk.lang.Vector:get(tag, 3), vars)
			if _g.jk.lang.String:isEmpty(varname) or _g.jk.lang.String:isEmpty(origvar) or not (inword == "in") then
				do _g.jk.log.Log:error(self.logContext, "Invalid for tag: `" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:combine(tag, 32, false, 0)) .. "'") end
				do return false end
			end
			do
				local index = 0
				do vars:setString("__for_first", "true") end
				do
					local vv = self:getVariableValueVector(vars, origvar)
					if vv ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(vv)
						do
							n = 0
							while n < m do
								local o = vv[n + 1]
								if o ~= nil then
									if _util:convert_to_integer(index % 2) == 0 then
										do vars:setString("__for_parity", "even") end
									else
										do vars:setString("__for_parity", "odd") end
									end
									do vars:setObject(varname, o) end
									if self:doExecute(data, vars, result, importDirs) == false then
										do return false end
									end
									if index == 0 then
										do vars:setString("__for_first", "false") end
									end
									do index = index + 1 end
								end
								do n = n + 1 end
							end
						end
					end
					do vars:remove("__for_first") end
					do vars:remove("__for_parity") end
					do return true end
				end
			end
		end
		if tagname == "if" then
			local lvalue = _g.jk.lang.Vector:get(tag, 1)
			if lvalue == nil then
				do return true end
			end
			do
				local operator = _g.jk.lang.Vector:get(tag, 2)
				if operator == nil then
					local varval = self:getVariableValue(vars, lvalue)
					if varval == nil then
						do return true end
					end
					if (_vm:to_table_with_key(varval, '_isType.jk.lang.VectorObject') ~= nil) then
						if _g.jk.lang.Vector:isEmpty(varval:toVector()) then
							do return true end
						end
					end
					if (_vm:to_table_with_key(varval, '_isType.jk.lang.DynamicMap') ~= nil) then
						local value = varval
						if value:getCount() < 1 then
							do return true end
						end
					end
					if (_vm:get_variable_type(varval) == 'string') then
						if _g.jk.lang.String:isEmpty(varval) then
							do return true end
						end
					end
					if (_vm:to_table_with_key(varval, '_isType.jk.lang.StringObject') ~= nil) then
						if _g.jk.lang.String:isEmpty(varval:toString()) then
							do return true end
						end
					end
					if self:doExecute(data, vars, result, importDirs) == false then
						do return false end
					end
					do return true end
				end
				lvalue = self:substituteVariables(lvalue, vars)
				do
					local rvalue = _g.jk.lang.Vector:get(tag, 3)
					if rvalue ~= nil then
						rvalue = self:substituteVariables(rvalue, vars)
					end
					if lvalue == nil or _g.jk.lang.String:isEmpty(operator) or rvalue == nil then
						do _g.jk.log.Log:error(self.logContext, "Invalid if tag: `" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:combine(tag, 32, false, 0)) .. "'") end
						do return false end
					end
					if operator == "==" or operator == "=" or operator == "is" then
						if not (rvalue == lvalue) then
							do return true end
						end
						if self:doExecute(data, vars, result, importDirs) == false then
							do return false end
						end
						do return true end
					end
					if operator == "!=" or operator == "not" then
						if rvalue == lvalue then
							do return true end
						end
						if self:doExecute(data, vars, result, importDirs) == false then
							do return false end
						end
						do return true end
					end
					do _g.jk.log.Log:error(self.logContext, "Unknown operator `" .. _g.jk.lang.String:safeString(operator) .. "' in if tag: `" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:combine(tag, 32, false, 0)) .. "'") end
					do return false end
				end
			end
		end
		do return false end
	end
end

function jk.template.TextTemplate:doExecute(data, avars, result, importDirs)
	if data == nil then
		do return true end
	end
	do
		local blockctr = 0
		local blockdata = nil
		local blocktag = nil
		local vars = avars
		if vars == nil then
			vars = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		end
		if data ~= nil then
			local n2 = 0
			local m = _g.jk.lang.Vector:getSize(data)
			do
				n2 = 0
				while n2 < m do
					local o = data[n2 + 1]
					if o ~= nil then
						local tagname = nil
						local words = nil
						local tagData = _vm:to_table_with_key(o, '_isType.jk.template.TextTemplate.TagData')
						if tagData ~= nil then
							words = tagData.words
							if words ~= nil then
								tagname = _g.jk.lang.Vector:get(words, 0)
								if _g.jk.lang.String:isEmpty(tagname) then
									do _g.jk.log.Log:warning(self.logContext, "Empty tag encountered. Ignoring it.") end
									goto _continue6
								end
							end
						end
						if tagname == "end" then
							do blockctr = blockctr - 1 end
							if blockctr == 0 and blockdata ~= nil then
								if self:handleBlock(vars, blocktag, blockdata, result, importDirs) == false then
									do _g.jk.log.Log:error(self.logContext, "Handling of a block failed") end
									goto _continue6
								end
								blockdata = nil
								blocktag = nil
							end
						end
						if blockctr > 0 then
							if tagname == "for" or tagname == "if" then
								do blockctr = blockctr + 1 end
							end
							if blockdata == nil then
								blockdata = {}
							end
							do _g.jk.lang.Vector:append(blockdata, o) end
							goto _continue6
						end
						if (_vm:get_variable_type(o) == 'string') or (_vm:to_table_with_key(o, '_isType.jk.lang.StringObject') ~= nil) then
							do result:appendString(_g.jk.lang.String:asString(o)) end
							goto _continue6
						end
						if tagname == "=" or tagname == "printstring" then
							local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(varname) == false then
								local vv = self:getVariableValueString(vars, varname)
								if _g.jk.lang.String:isEmpty(vv) == false then
									if self.type == _g.jk.template.TextTemplate.TYPE_HTML then
										vv = _g.jk.xml.HTMLString:sanitize(vv)
									end
									do result:appendString(vv) end
								else
									local defaultvalue = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
									if _g.jk.lang.String:isEmpty(defaultvalue) == false then
										if self.type == _g.jk.template.TextTemplate.TYPE_HTML then
											defaultvalue = _g.jk.xml.HTMLString:sanitize(defaultvalue)
										end
										do result:appendString(defaultvalue) end
									end
								end
							end
						elseif tagname == "printRaw" then
							local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(varname) == false then
								local vv = self:getVariableValueString(vars, varname)
								if _g.jk.lang.String:isEmpty(vv) == false then
									do result:appendString(vv) end
								else
									local defaultvalue = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
									if _g.jk.lang.String:isEmpty(defaultvalue) == false then
										do result:appendString(defaultvalue) end
									end
								end
							end
						elseif tagname == "catPath" then
							local hasSlash = false
							local n = 0
							if words ~= nil then
								local n3 = 0
								local m2 = _g.jk.lang.Vector:getSize(words)
								do
									n3 = 0
									while n3 < m2 do
										local word = words[n3 + 1]
										if word ~= nil then
											do n = n + 1 end
											if n == 1 then
												goto _continue7
											end
											word = self:substituteVariables(word, vars)
											do
												local it = _g.jk.lang.String:iterate(word)
												if it == nil then
													goto _continue7
												end
												if n > 2 and hasSlash == false then
													do result:appendCharacter(47) end
													hasSlash = true
												end
												while true do
													local c = it:getNextChar()
													if c < 1 then
														do break end
													end
													if c == 47 then
														if hasSlash == false then
															do result:appendCharacter(c) end
															hasSlash = true
														end
													else
														do result:appendCharacter(c) end
														hasSlash = false
													end
												end
											end
										end
										::_continue7::
										do n3 = n3 + 1 end
									end
								end
							end
						elseif tagname == "printJson" then
							local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(varname) == false then
								local vv = self:getVariableValue(vars, varname)
								if vv ~= nil then
									do result:appendString(_g.jk.json.JSONEncoder:encode(vv, true, false)) end
								end
							end
						elseif tagname == "printRichText" then
							local markup = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(markup) == false then
								local doc = _g.jk.template.RichTextDocument:forWikiMarkupString(markup)
								if doc ~= nil then
									do result:appendString(doc:toHtml(nil)) end
								end
							end
						elseif tagname == "printDate" then
							local timestamp = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							local aslong = _g.jk.lang.String:toLong(timestamp)
							local asstring = _g.jk.lang.DateTime:forSeconds(aslong):toStringDate(47)
							do result:appendString(asstring) end
						elseif tagname == "printTime" then
							local timestamp = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							local aslong = _g.jk.lang.String:toLong(timestamp)
							local asstring = _g.jk.lang.DateTime:forSeconds(aslong):toStringTime(58)
							do result:appendString(asstring) end
						elseif tagname == "printDateTime" then
							local timestamp = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							local aslong = _g.jk.lang.String:toLong(timestamp)
							local dt = _g.jk.lang.DateTime:forSeconds(aslong)
							do result:appendString(dt:toStringDate(47)) end
							do result:appendCharacter(32) end
							do result:appendString(dt:toStringTime(58)) end
						elseif tagname == "import" then
							local type = _g.jk.lang.Vector:get(words, 1)
							local filename = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
							if _g.jk.lang.String:isEmpty(filename) then
								do _g.jk.log.Log:warning(self.logContext, "Invalid import tag with empty filename") end
								goto _continue6
							end
							do
								local ff = nil
								if importDirs ~= nil then
									local n4 = 0
									local m3 = _g.jk.lang.Vector:getSize(importDirs)
									do
										n4 = 0
										while n4 < m3 do
											local dir = importDirs[n4 + 1]
											if dir ~= nil then
												ff = _g.jk.fs.File:forRelativePath(filename, dir, false)
												if ff ~= nil and ff:isFile() then
													do break end
												end
											end
											do n4 = n4 + 1 end
										end
									end
								end
								if ff == nil or ff:isFile() == false then
									do _g.jk.log.Log:error(self.logContext, "Unable to find file to import: `" .. _g.jk.lang.String:safeString(filename) .. "'") end
									goto _continue6
								end
								do _g.jk.log.Log:debug(self.logContext, "Attempting to import file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
								do
									local content = ff:getContentsUTF8()
									if _g.jk.lang.String:isEmpty(content) then
										do _g.jk.log.Log:error(self.logContext, "Unable to read import file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
										goto _continue6
									end
									if type == "html" then
										content = _g.jk.xml.HTMLString:sanitize(content)
									elseif type == "template" then
										local t = _g.jk.template.TextTemplate:forString(content, self.markerBegin, self.markerEnd, self.type, importDirs, nil, nil)
										if t == nil then
											do _g.jk.log.Log:error(self.logContext, "Failed to parse imported template file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
											goto _continue6
										end
										if self:doExecute(t:getTokens(), vars, result, importDirs) == false then
											do _g.jk.log.Log:error(self.logContext, "Failed to process imported template file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
											goto _continue6
										end
										content = nil
									elseif type == "raw" then
									else
										do _g.jk.log.Log:error(self.logContext, "Unknown type for import: `" .. _g.jk.lang.String:safeString(type) .. "'. Ignoring the import.") end
										goto _continue6
									end
									if _g.jk.lang.String:isEmpty(content) == false then
										do result:appendString(content) end
									end
								end
							end
						elseif tagname == "escapeHtml" then
							local content = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(content) == false then
								content = _g.jk.xml.HTMLString:sanitize(content)
								if _g.jk.lang.String:isEmpty(content) == false then
									do result:appendString(content) end
								end
							end
						elseif tagname == "set" then
							if _g.jk.lang.Vector:getSize(words) ~= 3 then
								do _g.jk.log.Log:warning(self.logContext, "Invalid number of parameters for set tag encountered: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.lang.Vector:getSize(words)))) end
								goto _continue6
							end
							do
								local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
								if _g.jk.lang.String:isEmpty(varname) then
									do _g.jk.log.Log:warning(self.logContext, "Empty variable name in set tag encountered.") end
									goto _continue6
								end
								do
									local newValue = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
									do vars:setString(varname, newValue) end
								end
							end
						elseif tagname == "assign" then
							if _g.jk.lang.Vector:getSize(words) ~= 3 then
								do _g.jk.log.Log:warning(self.logContext, "Invalid number of parameters for assign tag encountered: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.lang.Vector:getSize(words)))) end
								goto _continue6
							end
							do
								local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
								if _g.jk.lang.String:isEmpty(varname) then
									do _g.jk.log.Log:warning(self.logContext, "Empty variable name in assign tag encountered.") end
									goto _continue6
								end
								do
									local vv = _g.jk.lang.Vector:get(words, 2)
									if vv == "none" then
										do vars:remove(varname) end
									else
										do vars:setObject(varname, self:getVariableValue(vars, vv)) end
									end
								end
							end
						elseif tagname == "for" or tagname == "if" then
							if blockctr == 0 then
								blocktag = words
							end
							do blockctr = blockctr + 1 end
						elseif tagname == "end" then
						elseif self.type == _g.jk.template.TextTemplate.TYPE_HTML then
							do self:onHTMLTag(vars, result, importDirs, tagname, words) end
						elseif self.type == _g.jk.template.TextTemplate.TYPE_JSON then
							do self:onJSONTag(vars, result, importDirs, tagname, words) end
						else
						end
					end
					::_continue6::
					do n2 = n2 + 1 end
				end
			end
		end
		do return true end
	end
end

function jk.template.TextTemplate:basename(path)
	if not (path ~= nil) then
		do return nil end
	end
	do
		local v = ""
		local comps = _g.jk.lang.Vector:iterate(_g.jk.lang.String:split(path, 47, 0))
		if comps ~= nil then
			local comp = comps:next()
			while comp ~= nil do
				if _g.jk.lang.String:getLength(comp) > 0 then
					v = comp
				end
				comp = comps:next()
			end
		end
		do return v end
	end
end

function jk.template.TextTemplate:onHTMLTag(vars, result, importDirs, tagname, words)
	if tagname == "link" then
		local path = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
		local text = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
		if _g.jk.lang.String:isEmpty(text) then
			text = self:basename(path)
		end
		if _g.jk.lang.String:isEmpty(text) then
			do return end
		end
		do result:appendString("<a href=\"" .. _g.jk.lang.String:safeString(path) .. "\"><span>" .. _g.jk.lang.String:safeString(text) .. "</span></a>") end
		do return end
	end
end

function jk.template.TextTemplate:encodeJSONString(s, sb)
	if not (s ~= nil) then
		do return end
	end
	do
		local it = _g.jk.lang.String:iterate(s)
		if not (it ~= nil) then
			do return end
		end
		do
			local c = 0
			while (function()
				c = it:getNextChar()
				do return c end
			end)() > 0 do
				if c == 34 then
					do sb:appendCharacter(92) end
				elseif c == 92 then
					do sb:appendCharacter(92) end
				end
				do sb:appendCharacter(c) end
			end
		end
	end
end

function jk.template.TextTemplate:onJSONTag(vars, result, importDirs, tagname, words)
	if tagname == "quotedstring" then
		local string = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
		do self:encodeJSONString(string, result) end
	end
end

function jk.template.TextTemplate:getTokens()
	do return self.tokens end
end

function jk.template.TextTemplate:setTokens(v)
	self.tokens = v
	do return self end
end

function jk.template.TextTemplate:getText()
	do return self.text end
end

function jk.template.TextTemplate:setText(v)
	self.text = v
	do return self end
end

function jk.template.TextTemplate:getMarkerBegin()
	do return self.markerBegin end
end

function jk.template.TextTemplate:setMarkerBegin(v)
	self.markerBegin = v
	do return self end
end

function jk.template.TextTemplate:getMarkerEnd()
	do return self.markerEnd end
end

function jk.template.TextTemplate:setMarkerEnd(v)
	self.markerEnd = v
	do return self end
end

function jk.template.TextTemplate:getLogContext()
	do return self.logContext end
end

function jk.template.TextTemplate:setLogContext(v)
	self.logContext = v
	do return self end
end

function jk.template.TextTemplate:getType()
	do return self.type end
end

function jk.template.TextTemplate:setType(v)
	self.type = v
	do return self end
end

function jk.template.TextTemplate:getLanguagePreferences()
	do return self.languagePreferences end
end

function jk.template.TextTemplate:setLanguagePreferences(v)
	self.languagePreferences = v
	do return self end
end

function jk.template.TextTemplate:getIncludeDirs()
	do return self.includeDirs end
end

function jk.template.TextTemplate:setIncludeDirs(v)
	self.includeDirs = v
	do return self end
end

function jk.template.TextTemplate:getIncludeFileData()
	do return self.includeFileData end
end

function jk.template.TextTemplate:setIncludeFileData(v)
	self.includeFileData = v
	do return self end
end

jk.template.RichTextStyledParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextStyledParagraph.__index = jk.template.RichTextStyledParagraph
_vm:set_metatable(jk.template.RichTextStyledParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextStyledParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextStyledParagraph)
	return v
end

function jk.template.RichTextStyledParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextStyledParagraph'
	self['_isType.jk.template.RichTextStyledParagraph'] = true
	self.heading = 0
	self.segments = nil
end

function jk.template.RichTextStyledParagraph:_construct0()
	jk.template.RichTextStyledParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextStyledParagraph:forString(text)
	local rtsp = _g.jk.template.RichTextStyledParagraph._construct0(_g.jk.template.RichTextStyledParagraph._create())
	do return rtsp:parse(text) end
end

function jk.template.RichTextStyledParagraph:isHeading()
	if self.heading > 0 then
		do return true end
	end
	do return false end
end

function jk.template.RichTextStyledParagraph:getTextContent()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.segments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.segments)
		do
			n = 0
			while n < m do
				local segment = self.segments[n + 1]
				if segment ~= nil then
					do sb:appendString(segment:getText()) end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.template.RichTextStyledParagraph:toJson()
	local segs = {}
	if self.segments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.segments)
		do
			n = 0
			while n < m do
				local segment = self.segments[n + 1]
				if segment ~= nil then
					local segj = segment:toJson()
					if segj ~= nil then
						do _g.jk.lang.Vector:append(segs, segj) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do v:setString("type", "styled") end
		do v:setInteger("heading", self.heading) end
		do v:setObject("segments", segs) end
		do return v end
	end
end

function jk.template.RichTextStyledParagraph:toText()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.segments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.segments)
		do
			n = 0
			while n < m do
				local sg = self.segments[n + 1]
				if sg ~= nil then
					do sb:appendString(sg:getText()) end
					do
						local link = sg:getLink()
						if _g.jk.lang.String:isEmpty(link) == false then
							do sb:appendString(" (" .. _g.jk.lang.String:safeString(link) .. ")") end
						end
						do
							local ref = sg:getReference()
							if _g.jk.lang.String:isEmpty(ref) == false then
								do sb:appendString(" {" .. _g.jk.lang.String:safeString(ref) .. "}") end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.template.RichTextStyledParagraph:toHtml(refs)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local tag = "p"
	if self.heading > 0 then
		tag = "h" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.heading))
	end
	do sb:appendString("<") end
	do sb:appendString(tag) end
	do sb:appendString(">") end
	if self.segments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.segments)
		do
			n = 0
			while n < m do
				local sg = self.segments[n + 1]
				if sg ~= nil then
					do sb:appendString(sg:toHtml(refs)) end
				end
				do n = n + 1 end
			end
		end
	end
	do sb:appendString("</" .. _g.jk.lang.String:safeString(tag) .. ">") end
	do return sb:toString() end
end

function jk.template.RichTextStyledParagraph:addSegment(rts)
	if rts == nil then
		do return self end
	end
	if self.segments == nil then
		self.segments = {}
	end
	do _g.jk.lang.Vector:append(self.segments, rts) end
	do return self end
end

function jk.template.RichTextStyledParagraph:setSegmentLink(seg, alink)
	if alink == nil then
		do seg:setLink(nil) end
		do return end
	end
	do
		local link = alink
		if _g.jk.lang.String:startsWith(link, ">", 0) then
			do seg:setIsInline(true) end
			link = _g.jk.lang.String:getEndOfString(link, 1)
		end
		if _g.jk.lang.String:startsWith(link, "!", 0) then
			do seg:setLinkPopup(false) end
			link = _g.jk.lang.String:getEndOfString(link, 1)
		else
			do seg:setLinkPopup(true) end
		end
		do seg:setLink(link) end
	end
end

function jk.template.RichTextStyledParagraph:parseSegments(txt)
	if not (txt ~= nil) then
		do return end
	end
	do
		local segmentsb = nil
		local linksb = nil
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local it = _g.jk.lang.String:iterate(txt)
		local c = 0
		local pc = 0
		local seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
		while (function()
			c = it:getNextChar()
			do return c end
		end)() > 0 do
			if pc == 91 then
				if c == 91 then
					do sb:appendCharacter(c) end
					pc = 0
					goto _continue8
				end
				if sb:count() > 0 then
					do seg:setText(sb:toString()) end
					do sb:clear() end
					do self:addSegment(seg) end
				end
				seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
				linksb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do linksb:appendCharacter(c) end
				pc = c
				goto _continue8
			end
			if linksb ~= nil then
				if c == 124 then
					do self:setSegmentLink(seg, linksb:toString()) end
					do linksb:clear() end
					pc = c
					goto _continue8
				end
				if c == 93 then
					local xt = linksb:toString()
					if seg:getLink() == nil then
						do self:setSegmentLink(seg, xt) end
					else
						do seg:setText(xt) end
					end
					if _g.jk.lang.String:isEmpty(seg:getText()) then
						local ll = xt
						if _g.jk.lang.String:startsWith(ll, "http://", 0) then
							ll = _g.jk.lang.String:getEndOfString(ll, 7)
						end
						do seg:setText(ll) end
					end
					do self:addSegment(seg) end
					seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
					linksb = nil
				else
					do linksb:appendCharacter(c) end
				end
				pc = c
				goto _continue8
			end
			if pc == 123 then
				if c == 123 then
					do sb:appendCharacter(c) end
					pc = 0
					goto _continue8
				end
				if sb:count() > 0 then
					do seg:setText(sb:toString()) end
					do sb:clear() end
					do self:addSegment(seg) end
				end
				seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
				segmentsb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do segmentsb:appendCharacter(c) end
				pc = c
				goto _continue8
			end
			if segmentsb ~= nil then
				if c == 124 then
					do seg:setReference(segmentsb:toString()) end
					do segmentsb:clear() end
					pc = c
					goto _continue8
				end
				if c == 125 then
					local xt = segmentsb:toString()
					if seg:getReference() == nil then
						do seg:setReference(xt) end
					else
						do seg:setText(xt) end
					end
					do self:addSegment(seg) end
					seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
					segmentsb = nil
				else
					do segmentsb:appendCharacter(c) end
				end
				pc = c
				goto _continue8
			end
			if pc == 42 then
				if c == 42 then
					if sb:count() > 0 then
						do seg:setText(sb:toString()) end
						do sb:clear() end
						do self:addSegment(seg) end
					end
					if seg:getBold() then
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setBold(false)
					else
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setBold(true)
					end
				else
					do sb:appendCharacter(pc) end
					do sb:appendCharacter(c) end
				end
				pc = 0
				goto _continue8
			end
			if pc == 95 then
				if c == 95 then
					if sb:count() > 0 then
						do seg:setText(sb:toString()) end
						do sb:clear() end
						do self:addSegment(seg) end
					end
					if seg:getUnderline() then
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setUnderline(false)
					else
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setUnderline(true)
					end
				else
					do sb:appendCharacter(pc) end
					do sb:appendCharacter(c) end
				end
				pc = 0
				goto _continue8
			end
			if pc == 39 then
				if c == 39 then
					if sb:count() > 0 then
						do seg:setText(sb:toString()) end
						do sb:clear() end
						do self:addSegment(seg) end
					end
					if seg:getItalic() then
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setItalic(false)
					else
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setItalic(true)
					end
				else
					do sb:appendCharacter(pc) end
					do sb:appendCharacter(c) end
				end
				pc = 0
				goto _continue8
			end
			if c ~= 42 and c ~= 95 and c ~= 39 and c ~= 123 and c ~= 91 then
				do sb:appendCharacter(c) end
			end
			pc = c
			::_continue8::
		end
		if pc == 42 or pc == 95 or (pc == 39 and pc ~= 123 and pc ~= 91) then
			do sb:appendCharacter(pc) end
		end
		if sb:count() > 0 then
			do seg:setText(sb:toString()) end
			do sb:clear() end
			do self:addSegment(seg) end
		end
	end
end

function jk.template.RichTextStyledParagraph:parse(text)
	if text == nil then
		do return self end
	end
	do
		local txt = text
		local prefixes = {
			"=",
			"==",
			"===",
			"====",
			"====="
		}
		local n = 0
		do
			n = 0
			while n < #prefixes do
				local key = prefixes[n + 1]
				if _g.jk.lang.String:startsWith(txt, _g.jk.lang.String:safeString(key) .. " ", 0) and _g.jk.lang.String:endsWith(txt, " " .. _g.jk.lang.String:safeString(key)) then
					do self:setHeading(n + 1) end
					txt = _g.jk.lang.String:getSubString(txt, _g.jk.lang.String:getLength(key) + 1, _g.jk.lang.String:getLength(txt) - _g.jk.lang.String:getLength(key) * 2 - 2)
					if txt ~= nil then
						txt = _g.jk.lang.String:strip(txt)
					end
					do break end
				end
				do n = n + 1 end
			end
		end
		do self:parseSegments(txt) end
		do return self end
	end
end

function jk.template.RichTextStyledParagraph:toMarkup()
	local ident = nil
	if self.heading == 1 then
		ident = "="
	elseif self.heading == 2 then
		ident = "=="
	elseif self.heading == 3 then
		ident = "==="
	elseif self.heading == 4 then
		ident = "===="
	elseif self.heading == 5 then
		ident = "====="
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if _g.jk.lang.String:isEmpty(ident) == false then
			do sb:appendString(ident) end
			do sb:appendCharacter(32) end
		end
		if self.segments ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.segments)
			do
				n = 0
				while n < m do
					local segment = self.segments[n + 1]
					if segment ~= nil then
						do sb:appendString(segment:toMarkup()) end
					end
					do n = n + 1 end
				end
			end
		end
		if _g.jk.lang.String:isEmpty(ident) == false then
			do sb:appendCharacter(32) end
			do sb:appendString(ident) end
		end
		do return sb:toString() end
	end
end

function jk.template.RichTextStyledParagraph:getHeading()
	do return self.heading end
end

function jk.template.RichTextStyledParagraph:setHeading(v)
	self.heading = v
	do return self end
end

function jk.template.RichTextStyledParagraph:getSegments()
	do return self.segments end
end

function jk.template.RichTextStyledParagraph:setSegments(v)
	self.segments = v
	do return self end
end

jk.template.RichTextImageParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextImageParagraph.__index = jk.template.RichTextImageParagraph
_vm:set_metatable(jk.template.RichTextImageParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextImageParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextImageParagraph)
	return v
end

function jk.template.RichTextImageParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextImageParagraph'
	self['_isType.jk.template.RichTextImageParagraph'] = true
	self.filename = nil
	self.width = 100
end

function jk.template.RichTextImageParagraph:_construct0()
	jk.template.RichTextImageParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextImageParagraph:toMarkup()
	if self.width >= 100 then
		do return "@image " .. _g.jk.lang.String:safeString(self.filename) .. "\n" end
	end
	if self.width >= 75 then
		do return "@image75 " .. _g.jk.lang.String:safeString(self.filename) .. "\n" end
	end
	if self.width >= 50 then
		do return "@image50 " .. _g.jk.lang.String:safeString(self.filename) .. "\n" end
	end
	do return "@image25 " .. _g.jk.lang.String:safeString(self.filename) .. "\n" end
end

function jk.template.RichTextImageParagraph:toText()
	do return "[image:" .. _g.jk.lang.String:safeString(self.filename) .. "]\n" end
end

function jk.template.RichTextImageParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "image") end
	do v:setInteger("width", self.width) end
	do v:setString("filename", self.filename) end
	do return v end
end

function jk.template.RichTextImageParagraph:toHtml(refs)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.width >= 100 then
		do sb:appendString("<div class=\"img100\">") end
	elseif self.width >= 75 then
		do sb:appendString("<div class=\"img75\">") end
	elseif self.width >= 50 then
		do sb:appendString("<div class=\"img50\">") end
	else
		do sb:appendString("<div class=\"img25\">") end
	end
	do sb:appendString("<img src=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self.filename)) .. "\" />") end
	do sb:appendString("</div>\n") end
	do return sb:toString() end
end

function jk.template.RichTextImageParagraph:getFilename()
	do return self.filename end
end

function jk.template.RichTextImageParagraph:setFilename(v)
	self.filename = v
	do return self end
end

function jk.template.RichTextImageParagraph:getWidth()
	do return self.width end
end

function jk.template.RichTextImageParagraph:setWidth(v)
	self.width = v
	do return self end
end

jk.template.RichTextDocument = {}
jk.template.RichTextDocument.__index = jk.template.RichTextDocument
_vm:set_metatable(jk.template.RichTextDocument, {})

function jk.template.RichTextDocument._create()
	local v = _vm:set_metatable({}, jk.template.RichTextDocument)
	return v
end

function jk.template.RichTextDocument:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextDocument'
	self['_isType.jk.template.RichTextDocument'] = true
	self.metadata = nil
	self.paragraphs = nil
end

function jk.template.RichTextDocument:forWikiMarkupFile(file)
	do return _g.jk.template.RichTextWikiMarkupParser:parseFile(file) end
end

function jk.template.RichTextDocument:forWikiMarkupString(str)
	do return _g.jk.template.RichTextWikiMarkupParser:parseString(str) end
end

function jk.template.RichTextDocument:_construct0()
	jk.template.RichTextDocument._init(self)
	self.metadata = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	return self
end

function jk.template.RichTextDocument:getTitle()
	do return self.metadata:getString("title", nil) end
end

function jk.template.RichTextDocument:setTitle(v)
	do self.metadata:setString("title", v) end
	do return self end
end

function jk.template.RichTextDocument:getAllMetadata()
	do return self.metadata end
end

function jk.template.RichTextDocument:getMetadata(k)
	do return self.metadata:getString(k, nil) end
end

function jk.template.RichTextDocument:setMetadata(k, v)
	do self.metadata:setString(k, v) end
	do return self end
end

function jk.template.RichTextDocument:addParagraph(rtp)
	if rtp == nil then
		do return self end
	end
	if self.paragraphs == nil then
		self.paragraphs = {}
	end
	do _g.jk.lang.Vector:append(self.paragraphs, rtp) end
	if self:getTitle() == nil and (_vm:to_table_with_key(rtp, '_isType.jk.template.RichTextStyledParagraph') ~= nil) and _vm:to_table_with_key(rtp, '_isType.jk.template.RichTextStyledParagraph'):getHeading() == 1 then
		do self:setTitle(_vm:to_table_with_key(rtp, '_isType.jk.template.RichTextStyledParagraph'):getTextContent()) end
	end
	do return self end
end

function jk.template.RichTextDocument:getAllReferences()
	local v = {}
	if self.paragraphs ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.paragraphs)
		do
			n = 0
			while n < m do
				local paragraph = self.paragraphs[n + 1]
				if paragraph ~= nil then
					if (_vm:to_table_with_key(paragraph, '_isType.jk.template.RichTextReferenceParagraph') ~= nil) then
						local ref = paragraph:getReference()
						if _g.jk.lang.String:isEmpty(ref) == false then
							do _g.jk.lang.Vector:append(v, ref) end
						end
					elseif (_vm:to_table_with_key(paragraph, '_isType.jk.template.RichTextStyledParagraph') ~= nil) then
						local array = paragraph:getSegments()
						if array ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array)
							do
								n2 = 0
								while n2 < m2 do
									local segment = array[n2 + 1]
									if segment ~= nil then
										local ref = segment:getReference()
										if _g.jk.lang.String:isEmpty(ref) == false then
											do _g.jk.lang.Vector:append(v, ref) end
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.template.RichTextDocument:getAllLinks()
	local v = {}
	if self.paragraphs ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.paragraphs)
		do
			n = 0
			while n < m do
				local paragraph = self.paragraphs[n + 1]
				if paragraph ~= nil then
					if (_vm:to_table_with_key(paragraph, '_isType.jk.template.RichTextLinkParagraph') ~= nil) then
						local link = paragraph:getLink()
						if _g.jk.lang.String:isEmpty(link) == false then
							do _g.jk.lang.Vector:append(v, link) end
						end
					elseif (_vm:to_table_with_key(paragraph, '_isType.jk.template.RichTextStyledParagraph') ~= nil) then
						local array = paragraph:getSegments()
						if array ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array)
							do
								n2 = 0
								while n2 < m2 do
									local segment = array[n2 + 1]
									if segment ~= nil then
										local link = segment:getLink()
										if _g.jk.lang.String:isEmpty(link) == false then
											do _g.jk.lang.Vector:append(v, link) end
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.template.RichTextDocument:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setObject("metadata", self.metadata) end
	do v:setString("title", self:getTitle()) end
	do
		local pp = {}
		if self.paragraphs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.paragraphs)
			do
				n = 0
				while n < m do
					local par = self.paragraphs[n + 1]
					if par ~= nil then
						local pj = par:toJson()
						if pj ~= nil then
							do _g.jk.lang.Vector:append(pp, pj) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do v:setObject("paragraphs", pp) end
		do return v end
	end
end

function jk.template.RichTextDocument:toHtml(refs)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local array = self:getParagraphs()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local paragraph = array[n + 1]
				if paragraph ~= nil then
					local html = paragraph:toHtml(refs)
					if _g.jk.lang.String:isEmpty(html) == false then
						do sb:appendString(html) end
						do sb:appendCharacter(10) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.template.RichTextDocument:getParagraphs()
	do return self.paragraphs end
end

function jk.template.RichTextDocument:setParagraphs(v)
	self.paragraphs = v
	do return self end
end

jk.template.RichTextDocumentReferenceResolver = {}

jk.template.RichTextContentParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextContentParagraph.__index = jk.template.RichTextContentParagraph
_vm:set_metatable(jk.template.RichTextContentParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextContentParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextContentParagraph)
	return v
end

function jk.template.RichTextContentParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextContentParagraph'
	self['_isType.jk.template.RichTextContentParagraph'] = true
	self.contentId = nil
end

function jk.template.RichTextContentParagraph:_construct0()
	jk.template.RichTextContentParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextContentParagraph:toMarkup()
	do return "@content " .. _g.jk.lang.String:safeString(self.contentId) .. "\n" end
end

function jk.template.RichTextContentParagraph:toText()
	do return "[content:" .. _g.jk.lang.String:safeString(self.contentId) .. "]\n" end
end

function jk.template.RichTextContentParagraph:toJson()
	local map = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do map:setString("type", "content") end
	do map:setString("id", self.contentId) end
	do return map end
end

function jk.template.RichTextContentParagraph:toHtml(refs)
	local cc = nil
	if refs ~= nil and self.contentId ~= nil then
		cc = refs:getContentString(self.contentId)
	end
	if cc == nil then
		cc = ""
	end
	do return cc end
end

function jk.template.RichTextContentParagraph:getContentId()
	do return self.contentId end
end

function jk.template.RichTextContentParagraph:setContentId(v)
	self.contentId = v
	do return self end
end

jk.template.RichTextBlockParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextBlockParagraph.__index = jk.template.RichTextBlockParagraph
_vm:set_metatable(jk.template.RichTextBlockParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextBlockParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextBlockParagraph)
	return v
end

function jk.template.RichTextBlockParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextBlockParagraph'
	self['_isType.jk.template.RichTextBlockParagraph'] = true
	self.id = nil
	self.text = nil
end

function jk.template.RichTextBlockParagraph:_construct0()
	jk.template.RichTextBlockParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextBlockParagraph:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local delim = nil
	if _g.jk.lang.String:isEmpty(self.id) then
		delim = "-- "
	else
		delim = "-- " .. _g.jk.lang.String:safeString(self.id) .. " --"
	end
	do sb:appendString(delim) end
	do sb:appendCharacter(10) end
	if self.text ~= nil then
		do sb:appendString(self.text) end
		if _g.jk.lang.String:endsWith(self.text, "\n") == false then
			do sb:appendCharacter(10) end
		end
	end
	do sb:appendString(delim) end
	do return sb:toString() end
end

function jk.template.RichTextBlockParagraph:toText()
	do return self.text end
end

function jk.template.RichTextBlockParagraph:toJson()
	local map = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do map:setString("type", "block") end
	do map:setString("id", self.id) end
	do map:setString("text", self.text) end
	do return map end
end

function jk.template.RichTextBlockParagraph:toHtml(refs)
	local ids = ""
	if _g.jk.lang.String:isEmpty(self.id) == false then
		ids = " " .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self.id))
	end
	do
		local content = _g.jk.template.RichTextStyledParagraph:forString(self.text)
		do return "<div class=\"block" .. _g.jk.lang.String:safeString(ids) .. "\">" .. _g.jk.lang.String:safeString(content:toHtml(refs)) .. "</div>" end
	end
end

function jk.template.RichTextBlockParagraph:getId()
	do return self.id end
end

function jk.template.RichTextBlockParagraph:setId(v)
	self.id = v
	do return self end
end

function jk.template.RichTextBlockParagraph:getText()
	do return self.text end
end

function jk.template.RichTextBlockParagraph:setText(v)
	self.text = v
	do return self end
end

jk.template.RichTextListParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextListParagraph.__index = jk.template.RichTextListParagraph
_vm:set_metatable(jk.template.RichTextListParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextListParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextListParagraph)
	return v
end

function jk.template.RichTextListParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextListParagraph'
	self['_isType.jk.template.RichTextListParagraph'] = true
	self.type = nil
	self.list = nil
end

function jk.template.RichTextListParagraph:_construct0()
	jk.template.RichTextListParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextListParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", self.type) end
	do v:setObject("list", self.list) end
	do return v end
end

function jk.template.RichTextListParagraph:processList(refs, v)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local str = v[n + 1]
				if str ~= nil then
					do sb:appendString("<li>") end
					do
						local cc = _g.jk.template.RichTextStyledParagraph:forString(str)
						if cc ~= nil then
							do sb:appendString(cc:toHtml(refs)) end
						end
						do sb:appendString("</li>") end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.template.RichTextListParagraph:toHtml(refs)
	local tag = ""
	if _g.jk.lang.String:equals("unordered", self.type) then
		tag = "ul"
	elseif _g.jk.lang.String:equals("ordered", self.type) then
		tag = "ol"
	end
	do return "<" .. _g.jk.lang.String:safeString(tag) .. " class=\"list\">" .. _g.jk.lang.String:safeString(self:processList(refs, self.list)) .. "</" .. _g.jk.lang.String:safeString(tag) .. ">" end
end

function jk.template.RichTextListParagraph:getType()
	do return self.type end
end

function jk.template.RichTextListParagraph:setType(v)
	self.type = v
	do return self end
end

function jk.template.RichTextListParagraph:getList()
	do return self.list end
end

function jk.template.RichTextListParagraph:setList(v)
	self.list = v
	do return self end
end

jk.template.TextTemplateManager = {}
jk.template.TextTemplateManager.__index = jk.template.TextTemplateManager
_vm:set_metatable(jk.template.TextTemplateManager, {})

function jk.template.TextTemplateManager._create()
	local v = _vm:set_metatable({}, jk.template.TextTemplateManager)
	return v
end

function jk.template.TextTemplateManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.TextTemplateManager'
	self['_isType.jk.template.TextTemplateManager'] = true
	self.templates = nil
end

function jk.template.TextTemplateManager:_construct0()
	jk.template.TextTemplateManager._init(self)
	return self
end

function jk.template.TextTemplateManager:forDirectory(dir, cached)
	if not (dir ~= nil and dir:isDirectory()) then
		do return nil end
	end
	do
		local it = dir:entries()
		if not (it ~= nil) then
			do return nil end
		end
		do
			local v = {}
			while true do
				local f = it:next()
				if not (f ~= nil) then
					do break end
				end
				if f:isFile() then
					if cached then
						local b = f:getContentsUTF8()
						if not (b ~= nil) then
							do return nil end
						end
						do _g.jk.lang.Map:set(v, f:getBasename(), b) end
						goto _continue9
					end
					do _g.jk.lang.Map:set(v, f:getBasename(), f) end
				end
				::_continue9::
			end
			do return _g.jk.template.TextTemplateManager:forTemplates(v) end
		end
	end
end

function jk.template.TextTemplateManager:forTemplates(data)
	local v = _g.jk.template.TextTemplateManager._construct0(_g.jk.template.TextTemplateManager._create())
	do v:setTemplates(data) end
	do return v end
end

function jk.template.TextTemplateManager:getTemplateData(name)
	if not (name ~= nil) then
		do return nil end
	end
	if not (self.templates ~= nil) then
		do return nil end
	end
	do
		local o = _g.jk.lang.Map:get(self.templates, name)
		if not (o ~= nil) then
			do return nil end
		end
		if (_vm:get_variable_type(o) == 'string') then
			do return o end
		end
		if _util:is_buffer(o) then
			do return _g.jk.lang.String:forUTF8Buffer(o) end
		end
		if (_vm:to_table_with_key(o, '_isType.jk.fs.File') ~= nil) then
			do return o:getContentsUTF8() end
		end
		do return nil end
	end
end

function jk.template.TextTemplateManager:getText(name, vars)
	local td = self:getTemplateData(name)
	if not (td ~= nil) then
		do return nil end
	end
	do
		local vv = vars
		if not (vv ~= nil) then
			vv = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		end
		do
			local tt = _g.jk.template.TextTemplate:forHTMLString(td, nil, self.templates, nil)
			if not (tt ~= nil) then
				do return nil end
			end
			do return tt:execute(vv, nil) end
		end
	end
end

function jk.template.TextTemplateManager:getTemplates()
	do return self.templates end
end

function jk.template.TextTemplateManager:setTemplates(v)
	self.templates = v
	do return self end
end

jk.template.RichTextLinkParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextLinkParagraph.__index = jk.template.RichTextLinkParagraph
_vm:set_metatable(jk.template.RichTextLinkParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextLinkParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextLinkParagraph)
	return v
end

function jk.template.RichTextLinkParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextLinkParagraph'
	self['_isType.jk.template.RichTextLinkParagraph'] = true
	self.link = nil
	self.text = nil
	self.popup = false
end

function jk.template.RichTextLinkParagraph:_construct0()
	jk.template.RichTextLinkParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextLinkParagraph:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("@link ") end
	do sb:appendString(self.link) end
	do sb:appendCharacter(32) end
	do sb:appendCharacter(34) end
	if _g.jk.lang.String:isEmpty(self.text) == false then
		do sb:appendString(self.text) end
	end
	do sb:appendCharacter(34) end
	if self.popup then
		do sb:appendString(" popup") end
	end
	do return sb:toString() end
end

function jk.template.RichTextLinkParagraph:toText()
	local v = self.text
	if _g.jk.lang.String:isEmpty(v) then
		v = self.link
	end
	do return v end
end

function jk.template.RichTextLinkParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "link") end
	do v:setString("link", self.link) end
	do v:setString("text", self.text) end
	do return v end
end

function jk.template.RichTextLinkParagraph:toHtml(refs)
	local href = _g.jk.xml.HTMLString:sanitize(self.link)
	local tt = self.text
	if _g.jk.lang.String:isEmpty(tt) then
		tt = href
	end
	if _g.jk.lang.String:isEmpty(tt) then
		tt = "(empty link)"
	end
	do
		local targetblank = ""
		if self.popup then
			targetblank = " target=\"_blank\""
		end
		do return "<p class=\"link\"><a href=\"" .. _g.jk.lang.String:safeString(href) .. "\"" .. _g.jk.lang.String:safeString(targetblank) .. ">" .. _g.jk.lang.String:safeString(tt) .. "</a></p>\n" end
	end
end

function jk.template.RichTextLinkParagraph:getLink()
	do return self.link end
end

function jk.template.RichTextLinkParagraph:setLink(v)
	self.link = v
	do return self end
end

function jk.template.RichTextLinkParagraph:getText()
	do return self.text end
end

function jk.template.RichTextLinkParagraph:setText(v)
	self.text = v
	do return self end
end

function jk.template.RichTextLinkParagraph:getPopup()
	do return self.popup end
end

function jk.template.RichTextLinkParagraph:setPopup(v)
	self.popup = v
	do return self end
end
jk = jk or {}

jk.worker = jk.worker or {}

jk.worker.Worker = {}
jk.worker.Worker.__index = jk.worker.Worker
_vm:set_metatable(jk.worker.Worker, {})

function jk.worker.Worker._create()
	local v = _vm:set_metatable({}, jk.worker.Worker)
	return v
end

function jk.worker.Worker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.worker.Worker'
	self['_isType.jk.worker.Worker'] = true
end

function jk.worker.Worker:_construct0()
	jk.worker.Worker._init(self)
	return self
end

function jk.worker.Worker:getOutputWriter()
	do return _g.jk.thread.SushiThread:getOutputWriter() end
end

function jk.worker.Worker:getInputBuffer()
	do return _g.jk.thread.SushiThread:getInputBuffer() end
end

jk.worker.WorkerPool = {}
jk.worker.WorkerPool.__index = jk.worker.WorkerPool
_vm:set_metatable(jk.worker.WorkerPool, {})

function jk.worker.WorkerPool._create()
	local v = _vm:set_metatable({}, jk.worker.WorkerPool)
	return v
end

function jk.worker.WorkerPool:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.worker.WorkerPool'
	self['_isType.jk.worker.WorkerPool'] = true
	self.ctx = nil
	self.maxWorkers = 200
	self.maxQueue = 1000
end

function jk.worker.WorkerPool:_construct0()
	jk.worker.WorkerPool._init(self)
	return self
end

function jk.worker.WorkerPool:forContext(ctx)
	local v = _g.jk.worker.WorkerPoolForSushi._construct0(_g.jk.worker.WorkerPoolForSushi._create())
	do v:setCtx(ctx) end
	do return v end
end

function jk.worker.WorkerPool:executeWorker(workertype, input, handler)
end

function jk.worker.WorkerPool:getCtx()
	do return self.ctx end
end

function jk.worker.WorkerPool:setCtx(v)
	self.ctx = v
	do return self end
end

function jk.worker.WorkerPool:getMaxWorkers()
	do return self.maxWorkers end
end

function jk.worker.WorkerPool:setMaxWorkers(v)
	self.maxWorkers = v
	do return self end
end

function jk.worker.WorkerPool:getMaxQueue()
	do return self.maxQueue end
end

function jk.worker.WorkerPool:setMaxQueue(v)
	self.maxQueue = v
	do return self end
end

jk.worker.WorkerPoolForSushi = _g.jk.worker.WorkerPool._create()
jk.worker.WorkerPoolForSushi.__index = jk.worker.WorkerPoolForSushi
_vm:set_metatable(jk.worker.WorkerPoolForSushi, {
	__index = _g.jk.worker.WorkerPool
})

function jk.worker.WorkerPoolForSushi._create()
	local v = _vm:set_metatable({}, jk.worker.WorkerPoolForSushi)
	return v
end

function jk.worker.WorkerPoolForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.worker.WorkerPoolForSushi'
	self['_isType.jk.worker.WorkerPoolForSushi'] = true
	self.queue = _g.jk.lang.Queue._construct0(_g.jk.lang.Queue._create())
	self.workers = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	self.createdWorkers = 0
end

function jk.worker.WorkerPoolForSushi:_construct0()
	jk.worker.WorkerPoolForSushi._init(self)
	do _g.jk.worker.WorkerPool._construct0(self) end
	return self
end

jk.worker.WorkerPoolForSushi.MyTask = {}
jk.worker.WorkerPoolForSushi.MyTask.__index = jk.worker.WorkerPoolForSushi.MyTask
_vm:set_metatable(jk.worker.WorkerPoolForSushi.MyTask, {})

function jk.worker.WorkerPoolForSushi.MyTask._create()
	local v = _vm:set_metatable({}, jk.worker.WorkerPoolForSushi.MyTask)
	return v
end

function jk.worker.WorkerPoolForSushi.MyTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.worker.WorkerPoolForSushi.MyTask'
	self['_isType.jk.worker.WorkerPoolForSushi.MyTask'] = true
	self.worker = nil
	self.input = nil
	self.handler = nil
end

function jk.worker.WorkerPoolForSushi.MyTask:_construct0()
	jk.worker.WorkerPoolForSushi.MyTask._init(self)
	return self
end

function jk.worker.WorkerPoolForSushi.MyTask:getWorker()
	do return self.worker end
end

function jk.worker.WorkerPoolForSushi.MyTask:setWorker(v)
	self.worker = v
	do return self end
end

function jk.worker.WorkerPoolForSushi.MyTask:getInput()
	do return self.input end
end

function jk.worker.WorkerPoolForSushi.MyTask:setInput(v)
	self.input = v
	do return self end
end

function jk.worker.WorkerPoolForSushi.MyTask:getHandler()
	do return self.handler end
end

function jk.worker.WorkerPoolForSushi.MyTask:setHandler(v)
	self.handler = v
	do return self end
end

function jk.worker.WorkerPoolForSushi:getWorker()
	local v = self.workers:pop()
	if not (v ~= nil) then
		if self.createdWorkers < self.maxWorkers then
			v = _g.jk.thread.SushiThread:forThisProgram()
			do v:setReuseInterpreter(true) end
			do self.createdWorkers = self.createdWorkers + 1 end
			do _g.jk.log.Log:debug(self:getCtx(), "Created a new worker. createdWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.createdWorkers)) .. ", maxWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maxWorkers))) end
		end
	else
		do _g.jk.log.Log:debug(self:getCtx(), "Reused a worker. createdWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.createdWorkers)) .. ", maxWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maxWorkers))) end
	end
	do return v end
end

function jk.worker.WorkerPoolForSushi:onWorkerDone(worker)
	do _g.jk.log.Log:debug(self:getCtx(), "Worker done. createdWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.createdWorkers)) .. ", workersInStack=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.workers:getSize())) .. ", queueSize=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.queue:getSize()))) end
	while true do
		local task = self.queue:pop()
		if not (task ~= nil) then
			do break end
		end
		do _g.jk.log.Log:debug(self:getCtx(), "Reusing worker to execute a task from queue. queueSize=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.queue:getSize()))) end
		do
			local v = self:executeWorkerWithThread(worker, task:getWorker(), task:getInput(), task:getHandler())
			if v then
				do return end
			end
			do _g.jk.log.Log:debug(self:getCtx(), "Failed to start queued task.") end
		end
	end
	do self.workers:push(worker) end
	do _g.jk.log.Log:debug(self:getCtx(), "Released a worker. createdWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.createdWorkers)) .. ", workersInStack=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.workers:getSize()))) end
end

function jk.worker.WorkerPoolForSushi:executeWorker(workertype, input, handler)
	if not (workertype ~= nil) then
		do return false end
	end
	do
		local typename = workertype
		if not _g.jk.lang.String:startsWith(typename, "class:", 0) then
			do return false end
		end
		typename = _g.jk.lang.String:getEndOfString(typename, 6)
		if not _g.jk.lang.String:isNotEmpty(typename) then
			do return false end
		end
		do
			local code = "_g." .. _g.jk.lang.String:safeString(typename) .. "._construct0(_g." .. _g.jk.lang.String:safeString(typename) .. "._create()):run()"
			local thread = self:getWorker()
			if not (thread ~= nil) then
				if self.queue:getSize() >= self.maxQueue then
					do _g.jk.log.Log:error(self.ctx, "Worker pool ran out of threads and queue is full. Rejecting task.") end
					if handler ~= nil then
						do handler(nil, 0) end
					end
					do return false end
				end
				do
					local t = _g.jk.worker.WorkerPoolForSushi.MyTask._construct0(_g.jk.worker.WorkerPoolForSushi.MyTask._create())
					do t:setWorker(code) end
					do t:setInput(input) end
					do t:setHandler(handler) end
					do self.queue:push(t) end
					do _g.jk.log.Log:debug(self:getCtx(), "Added a task to queue. queueSize=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.queue:getSize()))) end
					do return true end
				end
			end
			do
				local v = self:executeWorkerWithThread(thread, code, input, handler)
				if not v then
					do self:onWorkerDone(thread) end
				end
				do return v end
			end
		end
	end
end

function jk.worker.WorkerPoolForSushi:executeWorkerWithThread(thread, worker, input, handler)
	local iomgr = _g.jk.socket.io.IOManager:getCurrent()
	if not (iomgr ~= nil) then
		do _g.jk.log.Log:error(self:getCtx(), "There is no current IO manager. Unable to execute workers.") end
		if handler ~= nil then
			do handler(nil, 0) end
		end
		do return false end
	end
	do
		local reader = thread:startPiped(worker, input)
		if not (reader ~= nil) then
			do _g.jk.log.Log:error(self:getCtx(), "Failed to start piped sushi thread.") end
			if handler ~= nil then
				do handler(nil, 0) end
			end
			do return false end
		end
		do
			local ee = iomgr:add(reader)
			if not (ee ~= nil) then
				do _g.jk.log.Log:error(self:getCtx(), "Failed to register reader with IO manager.") end
				if (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
					do reader:close() end
				end
				if handler ~= nil then
					do handler(nil, 0) end
				end
				do return false end
			end
			do
				local buffer = _util:allocate_buffer(65536)
				local v = ee:setReadListener(function()
					local r = reader:read(buffer)
					if r < 1 then
						if handler ~= nil then
							do handler(nil, 0) end
						end
						do ee:remove() end
						if (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
							do reader:close() end
						end
						do self:onWorkerDone(thread) end
					elseif handler ~= nil then
						do handler(buffer, r) end
					end
				end)
				if not v then
					do _g.jk.log.Log:error(self:getCtx(), "Failed to set read listener for new thread pipe") end
					if handler ~= nil then
						do handler(nil, 0) end
					end
				end
				do return v end
			end
		end
	end
end
jk = jk or {}

jk.server = jk.server or {}

jk.server.web = jk.server.web or {}

jk.server.web.WebServer = _g.jk.server.CommonServer._create()
jk.server.web.WebServer.__index = jk.server.web.WebServer
_vm:set_metatable(jk.server.web.WebServer, {
	__index = _g.jk.server.CommonServer
})

function jk.server.web.WebServer._create()
	local v = _vm:set_metatable({}, jk.server.web.WebServer)
	return v
end

function jk.server.web.WebServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.WebServer'
	self['_isType.jk.server.web.WebServer'] = true
	self.handler = nil
	self.worker = nil
	self.enableRequestLogging = false
	self.enableRateLimit = nil
	self.timeoutDelay = 0
	self.maintenanceTimerDelay = 0
	self.workers = _g.jk.worker.WorkerPool:forContext(self.ctx)
end

jk.server.web.WebServer.MyHTTPServer = _g.jk.http.server.HTTPServer._create()
jk.server.web.WebServer.MyHTTPServer.__index = jk.server.web.WebServer.MyHTTPServer
_vm:set_metatable(jk.server.web.WebServer.MyHTTPServer, {
	__index = _g.jk.http.server.HTTPServer
})

function jk.server.web.WebServer.MyHTTPServer._create()
	local v = _vm:set_metatable({}, jk.server.web.WebServer.MyHTTPServer)
	return v
end

function jk.server.web.WebServer.MyHTTPServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.WebServer.MyHTTPServer'
	self['_isType.jk.server.web.WebServer.MyHTTPServer'] = true
	self.myParent = nil
end

function jk.server.web.WebServer.MyHTTPServer:_construct0()
	jk.server.web.WebServer.MyHTTPServer._init(self)
	do _g.jk.http.server.HTTPServer._construct0(self) end
	return self
end

function jk.server.web.WebServer.MyHTTPServer:onMaintenance()
	do _g.jk.http.server.HTTPServer.onMaintenance(self) end
	do self.myParent:onMaintenance() end
end

function jk.server.web.WebServer.MyHTTPServer:getMyParent()
	do return self.myParent end
end

function jk.server.web.WebServer.MyHTTPServer:setMyParent(v)
	self.myParent = v
	do return self end
end

function jk.server.web.WebServer:_construct0()
	jk.server.web.WebServer._init(self)
	do _g.jk.server.CommonServer._construct0(self) end
	do self:initConfigValue("ENABLE_REQUEST_LOGGING", "true") end
	do self:initConfigValue("ENABLE_RATE_LIMIT", nil) end
	do self:initConfigValue("TIMEOUT_DELAY", "30") end
	do self:initConfigValue("MAINTENANCE_TIMER_DELAY", "0") end
	do self:initConfigValue("MAX_WORKER_COUNT", "200") end
	do self:initConfigValue("MAX_WORKER_QUEUE", "1000") end
	return self
end

function jk.server.web.WebServer:configure(key, value, relativeTo, error)
	if key == "ENABLE_REQUEST_LOGGING" or key == "enableRequestLogging" then
		self.enableRequestLogging = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	if key == "ENABLE_RATE_LIMIT" or key == "enableRateLimit" then
		self.enableRateLimit = value
		do return true end
	end
	if key == "TIMEOUT_DELAY" or key == "timeoutDelay" then
		self.timeoutDelay = _g.jk.lang.Integer:asInteger(value)
		if self.timeoutDelay < 30 then
			self.timeoutDelay = 30
		end
		do return true end
	end
	if key == "MAINTENANCE_TIMER_DELAY" or key == "maintenanceTimerDelay" then
		self.maintenanceTimerDelay = _g.jk.lang.Integer:asInteger(value)
		if self.maintenanceTimerDelay < 0 then
			self.maintenanceTimerDelay = 0
		end
		do return true end
	end
	if key == "MAX_WORKER_COUNT" or key == "maxWorkerCount" then
		do self.workers:setMaxWorkers(_g.jk.lang.Integer:asInteger(value)) end
		do return true end
	end
	if key == "MAX_WORKER_QUEUE" or key == "maxWorkerQueue" then
		do self.workers:setMaxQueue(_g.jk.lang.Integer:asInteger(value)) end
		do return true end
	end
	do return _g.jk.server.CommonServer.configure(self, key, value, relativeTo, error) end
end

function jk.server.web.WebServer:initializeHandlers(server)
	if self.handler ~= nil then
		do server:pushRequestHandler2(self.handler) end
	end
	if self.worker ~= nil then
		do server:pushRequestHandler1(function(req, next)
			do self:handleRequestWithWorker(req, self.worker) end
		end) end
	end
end

function jk.server.web.WebServer:initializeServer(server)
	if _g.jk.lang.String:isNotEmpty(self.enableRateLimit) then
		local limit = _g.jk.server.web.HTTPServerRateLimitHandler._construct0(_g.jk.server.web.HTTPServerRateLimitHandler._create())
		if self.enableRateLimit == "true" or self.enableRateLimit == "yes" then
		else
			local comps = _g.jk.lang.String:split(self.enableRateLimit, 58, 3)
			do limit:setCountLimit(_g.jk.lang.Integer:asInteger(_g.jk.lang.Vector:get(comps, 0))) end
			do limit:setCountDuration(_g.jk.lang.Integer:asInteger(_g.jk.lang.Vector:get(comps, 1))) end
			do limit:setIgnoreDuration(_g.jk.lang.Integer:asInteger(_g.jk.lang.Vector:get(comps, 2))) end
		end
		do server:pushRequestHandler2(limit) end
	end
	do self:initializeHandlers(server) end
	do return true end
end

function jk.server.web.WebServer:initializeNetworkServer(server)
	if not _g.jk.server.CommonServer.initializeNetworkServer(self, server) then
		do return false end
	end
	if (_vm:to_table_with_key(server, '_isType.jk.http.server.HTTPServer') ~= nil) then
		if not self:initializeServer(server) then
			do return false end
		end
		if self.enableRequestLogging then
			do server:addRequestHandlerListener2(_g.jk.http.server.HTTPServerRequestLogger._construct0(_g.jk.http.server.HTTPServerRequestLogger._create()):setLogContext(self.ctx):setLogdir(self:getLoggingDirectory())) end
		end
	end
	do return true end
end

function jk.server.web.WebServer:createServer()
	local server = _g.jk.server.web.WebServer.MyHTTPServer._construct0(_g.jk.server.web.WebServer.MyHTTPServer._create())
	do server:setTimeoutDelay(self.timeoutDelay) end
	do server:setMaintenanceTimerDelay(self.maintenanceTimerDelay) end
	do server:setMyParent(self) end
	do server:setPort(self:getListenPort()) end
	do return server end
end

function jk.server.web.WebServer:handleRequestWithWorker(req, worker)
	if not (req ~= nil) then
		do return end
	end
	do
		local fulldata = nil
		do self.workers:executeWorker(worker, req:toMyPacket(), function(data, size)
			if not (data ~= nil) then
				if not (fulldata ~= nil) then
					do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
				else
					do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forMyPacket(fulldata)) end
				end
			else
				fulldata = _g.jk.lang.Buffer:append(fulldata, data, size)
			end
		end) end
	end
end

function jk.server.web.WebServer:executeForHandler(handler, args)
	do self:setHandler(handler) end
	do return self:executeMain(args) end
end

function jk.server.web.WebServer:getHandler()
	do return self.handler end
end

function jk.server.web.WebServer:setHandler(v)
	self.handler = v
	do return self end
end

function jk.server.web.WebServer:getWorker()
	do return self.worker end
end

function jk.server.web.WebServer:setWorker(v)
	self.worker = v
	do return self end
end

jk.server.web.WebSiteServerHandler = _g.jk.http.server.HTTPServerRequestHandlerMap._create()
jk.server.web.WebSiteServerHandler.__index = jk.server.web.WebSiteServerHandler
_vm:set_metatable(jk.server.web.WebSiteServerHandler, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerMap
})

function jk.server.web.WebSiteServerHandler._create()
	local v = _vm:set_metatable({}, jk.server.web.WebSiteServerHandler)
	return v
end

function jk.server.web.WebSiteServerHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.WebSiteServerHandler'
	self['_isType.jk.server.web.WebSiteServerHandler'] = true
	self.templateDir = nil
	self.resourceDir = nil
	self.templates = nil
end

function jk.server.web.WebSiteServerHandler:_construct0()
	jk.server.web.WebSiteServerHandler._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerMap._construct0(self) end
	return self
end

function jk.server.web.WebSiteServerHandler:getTemplates()
	if not (self.templates ~= nil) then
		self.templates = _g.jk.template.TextTemplateManager:forDirectory(self.templateDir, false)
	end
	do return self.templates end
end

function jk.server.web.WebSiteServerHandler:processTemplate(name, params)
	local templates = self:getTemplates()
	if not (templates ~= nil) then
		do return nil end
	end
	do return templates:getText(name, params) end
end

function jk.server.web.WebSiteServerHandler:initialize(server)
	do _g.jk.http.server.HTTPServerRequestHandlerMap.initialize(self, server) end
	do self:get("*", function(req)
		do req:sendFromDirectory(self.resourceDir) end
	end) end
end

function jk.server.web.WebSiteServerHandler:getTemplateDir()
	do return self.templateDir end
end

function jk.server.web.WebSiteServerHandler:setTemplateDir(v)
	self.templateDir = v
	do return self end
end

function jk.server.web.WebSiteServerHandler:getResourceDir()
	do return self.resourceDir end
end

function jk.server.web.WebSiteServerHandler:setResourceDir(v)
	self.resourceDir = v
	do return self end
end

jk.server.web.HTTPServerRateLimitHandler = {}
jk.server.web.HTTPServerRateLimitHandler.__index = jk.server.web.HTTPServerRateLimitHandler
_vm:set_metatable(jk.server.web.HTTPServerRateLimitHandler, {})

function jk.server.web.HTTPServerRateLimitHandler._create()
	local v = _vm:set_metatable({}, jk.server.web.HTTPServerRateLimitHandler)
	return v
end

function jk.server.web.HTTPServerRateLimitHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.HTTPServerRateLimitHandler'
	self['_isType.jk.server.web.HTTPServerRateLimitHandler'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandler'] = true
	self['_isType.jk.http.server.HTTPServerComponent'] = true
	self.countLimit = 5
	self.countDuration = 5
	self.ignoreDuration = 60
	self.maintenanceCleanupDelay = 60
	self.lastCleanupTimeStamp = 0
	self.addresses = nil
end

jk.server.web.HTTPServerRateLimitHandler.RequestCounter = {}
jk.server.web.HTTPServerRateLimitHandler.RequestCounter.__index = jk.server.web.HTTPServerRateLimitHandler.RequestCounter
_vm:set_metatable(jk.server.web.HTTPServerRateLimitHandler.RequestCounter, {})

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter._create()
	local v = _vm:set_metatable({}, jk.server.web.HTTPServerRateLimitHandler.RequestCounter)
	return v
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.HTTPServerRateLimitHandler.RequestCounter'
	self['_isType.jk.server.web.HTTPServerRateLimitHandler.RequestCounter'] = true
	self.ipAddress = nil
	self.startCountTimeStamp = 0
	self.startIgnoreTimeStamp = 0
	self.requestCount = 1
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:_construct0()
	jk.server.web.HTTPServerRateLimitHandler.RequestCounter._init(self)
	return self
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:getCountAfterIncrement()
	do return (function() self.requestCount = self.requestCount + 1 return self.requestCount end)() end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:getIpAddress()
	do return self.ipAddress end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:setIpAddress(v)
	self.ipAddress = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:getStartCountTimeStamp()
	do return self.startCountTimeStamp end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:setStartCountTimeStamp(v)
	self.startCountTimeStamp = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:getStartIgnoreTimeStamp()
	do return self.startIgnoreTimeStamp end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:setStartIgnoreTimeStamp(v)
	self.startIgnoreTimeStamp = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler:_construct0()
	jk.server.web.HTTPServerRateLimitHandler._init(self)
	self.addresses = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	return self
end

function jk.server.web.HTTPServerRateLimitHandler:initialize(server)
end

function jk.server.web.HTTPServerRateLimitHandler:onMaintenance()
	if not (self.addresses ~= nil) then
		do return end
	end
	do
		local now = _g.jk.time.SystemClock:asSeconds()
		if now - self.lastCleanupTimeStamp < self.maintenanceCleanupDelay then
			do return end
		end
		self.lastCleanupTimeStamp = now
		do
			local keys = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
			local itr = self.addresses:iterateValues()
			if not (itr ~= nil) then
				do return end
			end
			while true do
				local rc = _vm:to_table_with_key(itr:next(), '_isType.jk.server.web.HTTPServerRateLimitHandler.RequestCounter')
				if rc == nil then
					do break end
				end
				if rc:getStartIgnoreTimeStamp() == 0 and now - rc:getStartCountTimeStamp() > self.countDuration then
					do keys:appendObject(rc:getIpAddress()) end
				end
			end
			do
				local array = keys:toVector()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local k = (function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(array[n + 1])
							if k ~= nil then
								do self.addresses:remove(k) end
							end
							do n = n + 1 end
						end
					end
				end
			end
		end
	end
end

function jk.server.web.HTTPServerRateLimitHandler:onRefresh()
end

function jk.server.web.HTTPServerRateLimitHandler:cleanup()
end

function jk.server.web.HTTPServerRateLimitHandler:handleRequest(req, next)
	if self:isRequestRejected(req) then
		do req:sendJSONObject(_g.jk.http.server.HTTPServerJSONResponse:forNotAllowed()) end
		do return end
	end
	do next() end
end

function jk.server.web.HTTPServerRateLimitHandler:isRequestRejected(req)
	local connection = req:getConnection()
	if connection == nil then
		do return true end
	end
	do
		local socket = connection:getSocket()
		if socket == nil then
			do return true end
		end
		do
			local ipAddress = nil
			if (_vm:to_table_with_key(socket, '_isType.jk.socket.TCPSocket') ~= nil) then
				ipAddress = socket:getRemoteAddress()
			else
				ipAddress = req:getRemoteAddress()
			end
			if _g.jk.lang.String:isEmpty(ipAddress) then
				do return true end
			end
			do
				local now = _g.jk.time.SystemClock:asSeconds()
				local rc = _vm:to_table_with_key(self.addresses:get(ipAddress), '_isType.jk.server.web.HTTPServerRateLimitHandler.RequestCounter')
				if rc == nil then
					do self.addresses:setObject(ipAddress, _g.jk.server.web.HTTPServerRateLimitHandler.RequestCounter._construct0(_g.jk.server.web.HTTPServerRateLimitHandler.RequestCounter._create()):setIpAddress(ipAddress):setStartCountTimeStamp(now)) end
					do return false end
				end
				if rc:getStartIgnoreTimeStamp() > 0 then
					if now - rc:getStartIgnoreTimeStamp() <= self.ignoreDuration then
						do return true end
					end
					do self.addresses:remove(ipAddress) end
					do return false end
				end
				if now - rc:getStartCountTimeStamp() <= self.countDuration then
					local count = rc:getCountAfterIncrement()
					if count >= self.countLimit then
						do rc:setStartIgnoreTimeStamp(now) end
						do return true end
					end
					do return false end
				end
				do self.addresses:remove(ipAddress) end
				do return false end
			end
		end
	end
end

function jk.server.web.HTTPServerRateLimitHandler:getCountLimit()
	do return self.countLimit end
end

function jk.server.web.HTTPServerRateLimitHandler:setCountLimit(v)
	self.countLimit = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler:getCountDuration()
	do return self.countDuration end
end

function jk.server.web.HTTPServerRateLimitHandler:setCountDuration(v)
	self.countDuration = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler:getIgnoreDuration()
	do return self.ignoreDuration end
end

function jk.server.web.HTTPServerRateLimitHandler:setIgnoreDuration(v)
	self.ignoreDuration = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler:getMaintenanceCleanupDelay()
	do return self.maintenanceCleanupDelay end
end

function jk.server.web.HTTPServerRateLimitHandler:setMaintenanceCleanupDelay(v)
	self.maintenanceCleanupDelay = v
	do return self end
end

jk.server.web.WebSiteServerMain = _g.jk.server.web.WebServer._create()
jk.server.web.WebSiteServerMain.__index = jk.server.web.WebSiteServerMain
_vm:set_metatable(jk.server.web.WebSiteServerMain, {
	__index = _g.jk.server.web.WebServer
})

function jk.server.web.WebSiteServerMain._create()
	local v = _vm:set_metatable({}, jk.server.web.WebSiteServerMain)
	return v
end

function jk.server.web.WebSiteServerMain:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.WebSiteServerMain'
	self['_isType.jk.server.web.WebSiteServerMain'] = true
	self.templateDir = nil
	self.resourceDir = nil
end

function jk.server.web.WebSiteServerMain:_construct0()
	jk.server.web.WebSiteServerMain._init(self)
	do _g.jk.server.web.WebServer._construct0(self) end
	local cdir = nil
	local lib = _g.jk.env.CommonPath:getCodeFileForObject(self)
	if lib ~= nil then
		cdir = lib:getParent()
	end
	if not (cdir ~= nil) or (_vm:to_table_with_key(cdir, '_isType.jk.fs.FileInvalid') ~= nil) then
		cdir = _g.jk.env.CommonPath:getAppDirectory()
	end
	if not (cdir ~= nil) or (_vm:to_table_with_key(cdir, '_isType.jk.fs.FileInvalid') ~= nil) then
		cdir = _g.jk.fs.File:forPath(".")
	end
	if cdir ~= nil then
		self.templateDir = cdir:entry("templates")
		self.resourceDir = cdir:entry("resources")
	end
	return self
end

function jk.server.web.WebSiteServerMain:configure(key, value, relativeTo, error)
	if key == "templates" then
		self.templateDir = _g.jk.fs.File:forRelativePath(value, relativeTo, false)
		do return true end
	end
	if key == "resources" then
		self.resourceDir = _g.jk.fs.File:forRelativePath(value, relativeTo, false)
		do return true end
	end
	do return _g.jk.server.web.WebServer.configure(self, key, value, relativeTo, error) end
end

function jk.server.web.WebSiteServerMain:initializeServer(server)
	if not _g.jk.server.web.WebServer.initializeServer(self, server) then
		do return false end
	end
	do
		local wssh = _vm:to_table_with_key(self:getHandler(), '_isType.jk.server.web.WebSiteServerHandler')
		if wssh ~= nil then
			do wssh:setTemplateDir(self.templateDir) end
			do wssh:setResourceDir(self.resourceDir) end
		end
		do return true end
	end
end

function jk.server.web.WebSiteServerMain:getTemplateDir()
	do return self.templateDir end
end

function jk.server.web.WebSiteServerMain:setTemplateDir(v)
	self.templateDir = v
	do return self end
end

function jk.server.web.WebSiteServerMain:getResourceDir()
	do return self.resourceDir end
end

function jk.server.web.WebSiteServerMain:setResourceDir(v)
	self.resourceDir = v
	do return self end
end
jk = jk or {}

jk.http = jk.http or {}

jk.http.server = jk.http.server or {}

jk.http.server.fs = jk.http.server.fs or {}

jk.http.server.fs.HTTPServerDirectoryHandler = _g.jk.http.server.HTTPServerRequestHandlerAdapter._create()
jk.http.server.fs.HTTPServerDirectoryHandler.__index = jk.http.server.fs.HTTPServerDirectoryHandler
_vm:set_metatable(jk.http.server.fs.HTTPServerDirectoryHandler, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerAdapter
})

function jk.http.server.fs.HTTPServerDirectoryHandler._create()
	local v = _vm:set_metatable({}, jk.http.server.fs.HTTPServerDirectoryHandler)
	return v
end

function jk.http.server.fs.HTTPServerDirectoryHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.fs.HTTPServerDirectoryHandler'
	self['_isType.jk.http.server.fs.HTTPServerDirectoryHandler'] = true
	self.listDirectories = false
	self.processTemplateFiles = false
	self.directory = nil
	self.maxAge = 300
	self.serverURL = nil
	self.indexFiles = nil
	self.templateIncludeDirs = nil
	self.serverName = nil
	self.templateData = nil
end

function jk.http.server.fs.HTTPServerDirectoryHandler:_construct0()
	jk.http.server.fs.HTTPServerDirectoryHandler._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter._construct0(self) end
	return self
end

function jk.http.server.fs.HTTPServerDirectoryHandler:forDirectory(dir)
	local v = _g.jk.http.server.fs.HTTPServerDirectoryHandler._construct0(_g.jk.http.server.fs.HTTPServerDirectoryHandler._create())
	do v:setDirectory(dir) end
	do return v end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:addTemplateIncludeDir(dir)
	if dir == nil then
		do return end
	end
	if self.templateIncludeDirs == nil then
		self.templateIncludeDirs = {}
	end
	do _g.jk.lang.Vector:append(self.templateIncludeDirs, dir) end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setIndexFiles(files)
	self.indexFiles = {}
	if files ~= nil then
		local n = 0
		local m = #files
		do
			n = 0
			while n < m do
				local file = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(files[n + 1])
				if file ~= nil then
					do _g.jk.lang.Vector:append(self.indexFiles, file) end
				end
				do n = n + 1 end
			end
		end
	end
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setServerName(name)
	self.serverName = name
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getServerName()
	if self.serverName ~= nil then
		do return self.serverName end
	end
	do
		local server = self:getServer()
		if not (server ~= nil) then
			do return nil end
		end
		do return server:getServerName() end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getDirectoryEntries(dir, allEntries, dirs, files)
	if not (dir ~= nil) then
		do return end
	end
	do
		local entries = dir:entries()
		while entries ~= nil do
			local entry = entries:next()
			if entry == nil then
				do break end
			end
			do
				local name = entry:getBasename()
				if dirs ~= nil and entry:isDirectory() then
					do _g.jk.lang.Vector:append(dirs, name) end
				end
				if files ~= nil and entry:isFile() then
					do _g.jk.lang.Vector:append(files, name) end
				end
				if allEntries ~= nil then
					do _g.jk.lang.Vector:append(allEntries, name) end
				end
			end
		end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:dirToJSONObject(dir)
	local allEntries = {}
	local dirs = {}
	local files = {}
	do self:getDirectoryEntries(dir, allEntries, dirs, files) end
	do
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do v:setObject("files", _g.jk.lang.DynamicVector:forStringVector(files)) end
		do v:setObject("dirs", _g.jk.lang.DynamicVector:forStringVector(dirs)) end
		do v:setObject("all", _g.jk.lang.DynamicVector:forStringVector(allEntries)) end
		do return v end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:dirToJSON(dir)
	do return _g.jk.json.JSONEncoder:encode(self:dirToJSONObject(dir), true, false) end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getTemplateVariablesForFile(file)
	do return nil end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:dirToHTML(dir)
	if not (dir ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("<html>\n") end
		do sb:appendString("<head>\n") end
		do sb:appendString("<title>") end
		do sb:appendString(dir:getBasename()) end
		do sb:appendString("</title>\n") end
		do sb:appendString("<style>\n") end
		do sb:appendString("* { font-face: arial; font-size: 12px; }\n") end
		do sb:appendString("h1 { font-face: arial; font-size: 14px; font-style: bold; border-bottom: solid 1px black; padding: 4px; margin: 4px}\n") end
		do sb:appendString("#content a { text-decoration: none; color: #000080; }\n") end
		do sb:appendString("#content a:hover { text-decoration: none; color: #FFFFFF; font-weight: bold; }\n") end
		do sb:appendString(".entry { padding: 4px; }\n") end
		do sb:appendString(".entry:hover { background-color: #AAAACC; }\n") end
		do sb:appendString(".dir { font-weight: bold; }\n") end
		do sb:appendString(".even { background-color: #DDDDDD; }\n") end
		do sb:appendString(".odd { background-color: #EEEEEE; }\n") end
		do sb:appendString("#footer { border-top: 1px solid black; padding: 4px; margin: 4px; font-size: 10px; text-align: right; }\n") end
		do sb:appendString("#footer a { font-size: 10px; text-decoration: none; color: #000000; }\n") end
		do sb:appendString("#footer a:hover { font-size: 10px; text-decoration: underline; color: #000000; }\n") end
		do sb:appendString("</style>\n") end
		do sb:appendString("<meta name=\"viewport\" content=\"initial-scale=1,maximum-scale=1\" />\n") end
		do sb:appendString("</head>\n") end
		do sb:appendString("<body>\n") end
		do sb:appendString("<h1>") end
		do sb:appendString(dir:getBasename()) end
		do sb:appendString("</h1>\n") end
		do sb:appendString("<div id=\"content\">\n") end
		do
			local dirs = {}
			local files = {}
			do self:getDirectoryEntries(dir, nil, dirs, files) end
			do
				local n = 0
				if dirs ~= nil then
					local n2 = 0
					local m = _g.jk.lang.Vector:getSize(dirs)
					do
						n2 = 0
						while n2 < m do
							local dn = dirs[n2 + 1]
							if dn ~= nil then
								local cc = nil
								if _util:convert_to_integer(n % 2) == 0 then
									cc = "even"
								else
									cc = "odd"
								end
								do sb:appendString("<a href=\"") end
								do sb:appendString(dn) end
								do sb:appendString("/\"><div class=\"entry dir ") end
								do sb:appendString(cc) end
								do sb:appendString("\">") end
								do sb:appendString(dn) end
								do sb:appendString("/</div></a>\n") end
								do n = n + 1 end
							end
							do n2 = n2 + 1 end
						end
					end
				end
				if files ~= nil then
					local n3 = 0
					local m2 = _g.jk.lang.Vector:getSize(files)
					do
						n3 = 0
						while n3 < m2 do
							local fn = files[n3 + 1]
							if fn ~= nil then
								local cc = nil
								if _util:convert_to_integer(n % 2) == 0 then
									cc = "even"
								else
									cc = "odd"
								end
								do sb:appendString("<a href=\"") end
								do sb:appendString(fn) end
								do sb:appendString("\"><div class=\"entry ") end
								do sb:appendString(cc) end
								do sb:appendString("\">") end
								do sb:appendString(fn) end
								do sb:appendString("</div></a>\n") end
								do n = n + 1 end
							end
							do n3 = n3 + 1 end
						end
					end
				end
				do sb:appendString("</div>\n") end
				do sb:appendString("<div id=\"footer\">") end
				do
					local serverName = self:getServerName()
					if _g.jk.lang.String:isEmpty(serverName) == false then
						if _g.jk.lang.String:isEmpty(self.serverURL) == false then
							do sb:appendString("Generated by <a href=\"") end
							if _g.jk.lang.String:contains(self.serverURL, "://") == false then
								do sb:appendString("http://") end
							end
							do sb:appendString(self.serverURL) end
							do sb:appendString("\">") end
							do sb:appendString(serverName) end
							do sb:appendString("</a>\n") end
						else
							do sb:appendString("Generated by ") end
							do sb:appendString(serverName) end
							do sb:appendString("\n") end
						end
					end
					do sb:appendString("</div>\n") end
					do sb:appendString("</body>\n") end
					do sb:appendString("</html>\n") end
					do return sb:toString() end
				end
			end
		end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:onGET1(req)
	local startingResource = req:getCurrentResource()
	if self.directory == nil then
		do return false end
	end
	do
		local dd = self.directory
		while true do
			local comp = req:popResource()
			if comp == nil then
				do break end
			end
			dd = dd:entry(comp)
		end
		if dd:isDirectory() then
			if self.indexFiles ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(self.indexFiles)
				do
					n = 0
					while n < m do
						local indexFile = self.indexFiles[n + 1]
						if indexFile ~= nil then
							local ff = dd:entry(indexFile)
							if ff:isFile() then
								dd = ff
								do break end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		if dd:isDirectory() then
			if req:isForDirectory() == false then
				do req:sendRedirectAsDirectory() end
				do return true end
			end
			if self.listDirectories == false then
				if startingResource ~= req:getCurrentResource() then
					do req:setCurrentResource(startingResource) end
				end
				do return false end
			end
			do req:sendHTMLString(self:dirToHTML(dd)) end
			do return true end
		end
		if dd:exists() == false and self.processTemplateFiles then
			local bn = dd:getBasename()
			local nf = dd:getParent():entry(_g.jk.lang.String:safeString(bn) .. ".t")
			if nf:isFile() then
				dd = nf
			else
				nf = dd:getParent():entry(_g.jk.lang.String:safeString(bn) .. ".html.t")
				if nf:isFile() then
					dd = nf
				end
			end
		end
		if dd:isFile() then
			local resp = nil
			if self.processTemplateFiles then
				local bn = dd:getBasename()
				local isJSONTemplate = false
				local isHTMLTemplate = false
				local isCSSTemplate = false
				if _g.jk.lang.String:endsWith(bn, ".html.t") then
					isHTMLTemplate = true
				elseif _g.jk.lang.String:endsWith(bn, ".css.t") then
					isCSSTemplate = true
				elseif _g.jk.lang.String:endsWith(bn, ".json.t") then
					isJSONTemplate = true
				end
				if isHTMLTemplate or isCSSTemplate or isJSONTemplate then
					local data = dd:getContentsUTF8()
					if data == nil then
						do _g.jk.log.Log:error(self.logContext, "Failed to read template file content: `" .. _g.jk.lang.String:safeString(dd:getPath()) .. "'") end
						do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
						do return true end
					end
					do
						local includeDirs = {}
						do _g.jk.lang.Vector:append(includeDirs, dd:getParent()) end
						if self.templateIncludeDirs ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(self.templateIncludeDirs)
							do
								n2 = 0
								while n2 < m2 do
									local dir = self.templateIncludeDirs[n2 + 1]
									if dir ~= nil then
										do _g.jk.lang.Vector:append(includeDirs, dir) end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						do
							local tt = nil
							if isHTMLTemplate or isCSSTemplate then
								tt = _g.jk.template.TextTemplate:forHTMLString(data, includeDirs, nil, self.logContext)
							else
								tt = _g.jk.template.TextTemplate:forJSONString(data, includeDirs, nil, self.logContext)
							end
							if tt == nil then
								do _g.jk.log.Log:error(self.logContext, "Failed to process template file content: `" .. _g.jk.lang.String:safeString(dd:getPath()) .. "'") end
								do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
								do return true end
							end
							do
								local tdata = self.templateData
								local dynamicData = self:getTemplateVariablesForFile(dd)
								if dynamicData ~= nil then
									if tdata == nil then
										tdata = dynamicData
									else
										do tdata:mergeFrom(dynamicData) end
									end
								end
								do
									local text = tt:execute(tdata, includeDirs)
									if text == nil then
										do _g.jk.log.Log:error(self.logContext, "Failed to execute template: `" .. _g.jk.lang.String:safeString(dd:getPath()) .. "'") end
										do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
										do return true end
									end
									if isHTMLTemplate then
										resp = _g.jk.http.server.HTTPServerResponse:forHTMLString(text)
									elseif isCSSTemplate then
										resp = _g.jk.http.server.HTTPServerResponse:forString(text, "text/css")
									else
										resp = _g.jk.http.server.HTTPServerResponse:forJSONString(text)
									end
								end
							end
						end
					end
				end
			end
			if resp == nil then
				resp = _g.jk.http.server.HTTPServerResponse:forFile(dd, -1)
			end
			if self.maxAge > 0 then
				do resp:addHeader("Cache-Control", "max-age=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maxAge))) end
			end
			do req:sendResponse(resp) end
			do return true end
		end
		if startingResource ~= req:getCurrentResource() then
			do req:setCurrentResource(startingResource) end
		end
		do return false end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getListDirectories()
	do return self.listDirectories end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setListDirectories(v)
	self.listDirectories = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getProcessTemplateFiles()
	do return self.processTemplateFiles end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setProcessTemplateFiles(v)
	self.processTemplateFiles = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getDirectory()
	do return self.directory end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setDirectory(v)
	self.directory = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getMaxAge()
	do return self.maxAge end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setMaxAge(v)
	self.maxAge = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getServerURL()
	do return self.serverURL end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setServerURL(v)
	self.serverURL = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getIndexFiles()
	do return self.indexFiles end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getTemplateIncludeDirs()
	do return self.templateIncludeDirs end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setTemplateIncludeDirs(v)
	self.templateIncludeDirs = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getTemplateData()
	do return self.templateData end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setTemplateData(v)
	self.templateData = v
	do return self end
end
filesy = filesy or {}

filesy.FilesyApp = _g.jk.server.web.WebServer._create()
filesy.FilesyApp.__index = filesy.FilesyApp
_vm:set_metatable(filesy.FilesyApp, {
	__index = _g.jk.server.web.WebServer
})

function filesy.FilesyApp._create()
	local v = _vm:set_metatable({}, filesy.FilesyApp)
	return v
end

function filesy.FilesyApp:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'filesy.FilesyApp'
	self['_isType.filesy.FilesyApp'] = true
	self.contentDirectory = nil
	self.listDirectories = true
	self.processTemplateFiles = false
end

function filesy.FilesyApp:_construct0()
	filesy.FilesyApp._init(self)
	do _g.jk.server.web.WebServer._construct0(self) end
	return self
end

function filesy.FilesyApp:printHeader(stdout)
	do _g.jk.console.ConsoleApplicationUtil:printHeader(_g.jk.console.Stdout:instance(), "filesy", "0.9.0", "Copyright (c) 2018 Eqela Oy", "Licensed under AGPLv3 (see LICENSE for details)", "Sushi", nil) end
end

function filesy.FilesyApp:printVersion(stdout, longFormat)
	do _g.jk.console.ConsoleApplicationUtil:printVersion(_g.jk.console.Stdout:instance(), "0.9.0", "filesy") end
end

function filesy.FilesyApp:configure(key, value, relativeTo, error)
	if _g.jk.server.web.WebServer.configure(self, key, value, relativeTo, error) then
		do return true end
	end
	if key == "contentDirectory" then
		self.contentDirectory = _g.jk.fs.File:forRelativePath(value, relativeTo, false)
		do return true end
	end
	if key == "listDirectories" then
		self.listDirectories = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	if key == "processTemplateFiles" then
		self.processTemplateFiles = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	do return false end
end

function filesy.FilesyApp:acceptCommandLineArgument(arg)
	if _g.jk.server.web.WebServer.acceptCommandLineArgument(self, arg) then
		do return true end
	end
	if arg:isParameter() then
		self.contentDirectory = _g.jk.fs.File:forPath(arg.parameter)
		do return true end
	end
	do return false end
end

function filesy.FilesyApp:initializeServer(server)
	if not _g.jk.server.web.WebServer.initializeServer(self, server) then
		do return false end
	end
	do server:setServerName("filesy" .. "/" .. "0.9.0") end
	if not (self.contentDirectory ~= nil) then
		do _g.jk.log.Log:error(self.ctx, "No `contentDirectory' specified. Either use a config file or specify -OcontentDirectory=<directory>") end
		do return false end
	end
	if not self.contentDirectory:isDirectory() then
		do _g.jk.log.Log:error(self.ctx, "Not a directory: `" .. _g.jk.lang.String:safeString(self.contentDirectory:getPath()) .. "'") end
		do return false end
	end
	do
		local files = _g.jk.http.server.fs.HTTPServerDirectoryHandler:forDirectory(self.contentDirectory)
		do files:setListDirectories(self.listDirectories) end
		do files:setProcessTemplateFiles(self.processTemplateFiles) end
		if self.processTemplateFiles then
			do files:setIndexFiles({
				"index.html",
				"index.html.t"
			}) end
		else
			do files:setIndexFiles({
				"index.html"
			}) end
		end
		do files:setServerURL("") end
		do files:setServerName("filesy" .. "/" .. "0.9.0") end
		do server:pushRequestHandler2(files) end
		do return true end
	end
end

function filesy.FilesyApp:_main(args)
	if _g.filesy.FilesyApp._construct0(_g.filesy.FilesyApp._create()):execute(args) == false then
		do return 1 end
	end
	do return 0 end
end

function _main(args)
	do return filesy.FilesyApp:_main(args) end
end

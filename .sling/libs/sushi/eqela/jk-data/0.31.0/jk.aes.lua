jk = jk or {}

jk.aes = jk.aes or {}

jk.aes.BlockCipherWriter = {}
jk.aes.BlockCipherWriter.__index = jk.aes.BlockCipherWriter
_vm:set_metatable(jk.aes.BlockCipherWriter, {})

function jk.aes.BlockCipherWriter._create()
	local v = _vm:set_metatable({}, jk.aes.BlockCipherWriter)
	return v
end

function jk.aes.BlockCipherWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.aes.BlockCipherWriter'
	self['_isType.jk.aes.BlockCipherWriter'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.io.SeekableWriter'] = true
	self.cipher = nil
	self.writer = nil
	self.bsize = 0
	self.bcurr = 0
	self.bdata = nil
	self.outbuf = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.aes.BlockCipherWriter:_construct0()
	jk.aes.BlockCipherWriter._init(self)
	return self
end

function jk.aes.BlockCipherWriter:create(writer, cipher)
	if not (writer ~= nil) then
		do return nil end
	end
	if not (cipher ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.aes.BlockCipherWriter._construct0(_g.jk.aes.BlockCipherWriter._create())
		v.writer = writer
		v.cipher = cipher
		v.bsize = cipher:getBlockSize()
		v.bcurr = 0
		v.bdata = _g.jk.lang.Buffer:allocate(cipher:getBlockSize())
		v.outbuf = _g.jk.lang.Buffer:allocate(cipher:getBlockSize())
		do return v end
	end
end

function jk.aes.BlockCipherWriter:_destruct()
	do self:close() end
end

function jk.aes.BlockCipherWriter:close()
	if self.writer ~= nil and self.bdata ~= nil then
		local bb = _g.jk.lang.Buffer:allocate(1)
		local bbptr = bb
		local n = 0
		do
			n = self.bcurr
			while n < self.bsize do
				do _g.jk.lang.Buffer:setByte(self.bdata, n, self.bsize - self.bcurr) end
				do n = n + 1 end
			end
		end
		do
			local wcb = self:writeCompleteBlock(self.bdata)
			if not wcb then
				do _g.jk.lang.Buffer:setByte(bbptr, 0, self.bsize - self.bcurr) end
				do self.writer:write(bb, -1) end
			end
		end
	end
	self.writer = nil
	self.cipher = nil
	self.bdata = nil
end

function jk.aes.BlockCipherWriter:setCurrentPosition(n)
	if self.writer ~= nil and (_vm:to_table_with_key(self.writer, '_isType.jk.io.SeekableWriter') ~= nil) then
		local sw = self.writer
		do return sw:setCurrentPosition(n) end
	end
	do return false end
end

function jk.aes.BlockCipherWriter:getCurrentPosition()
	if self.writer ~= nil and (_vm:to_table_with_key(self.writer, '_isType.jk.io.SeekableWriter') ~= nil) then
		local sw = self.writer
		do return sw:getCurrentPosition() end
	end
	do return -1 end
end

function jk.aes.BlockCipherWriter:writeCompleteBlock(buf)
	do self.cipher:encryptBlock(buf, self.outbuf) end
	if self.writer:write(self.outbuf, -1) == _g.jk.lang.Buffer:getSize(self.outbuf) then
		do return true end
	end
	do return false end
end

function jk.aes.BlockCipherWriter:writeBlock(buf)
	local size = _g.jk.lang.Buffer:getSize(buf)
	if self.bcurr + size < self.bsize then
		local bufptr = buf
		do _g.jk.lang.Buffer:copyFrom(self.bdata, bufptr, 0, self.bcurr, size) end
		self.bcurr = self.bcurr + size
		do return size end
	end
	if self.bcurr > 0 then
		local bufptr = buf
		local x = self.bsize - self.bcurr
		do _g.jk.lang.Buffer:copyFrom(self.bdata, bufptr, 0, self.bcurr, x) end
		if self:writeCompleteBlock(self.bdata) == false then
			do return 0 end
		end
		self.bcurr = 0
		if x == size then
			do return x end
		end
		do return x + self:writeBlock(_g.jk.lang.Buffer:getSubBuffer(buf, x, size - x, false)) end
	end
	if self:writeCompleteBlock(buf) == false then
		do return 0 end
	end
	do return self.bsize end
end

function jk.aes.BlockCipherWriter:write(buf, asize)
	if buf == nil then
		do return 0 end
	end
	do
		local bufptr = buf
		if bufptr == nil then
			do return 0 end
		end
		do
			local size = asize
			if size < 0 then
				size = _g.jk.lang.Buffer:getSize(buf)
			end
			if size < 1 then
				do return 0 end
			end
			do
				local v = 0
				local n = 0
				do
					n = 0
					while n < size do
						local x = self.bsize
						if n + x > size then
							x = size - n
						end
						v = v + self:writeBlock(_g.jk.lang.Buffer:getSubBuffer(buf, n, x, false))
						n = n + self.bsize
					end
				end
				do return v end
			end
		end
	end
end

jk.aes.AES128Cipher = {}
jk.aes.AES128Cipher.__index = jk.aes.AES128Cipher
_vm:set_metatable(jk.aes.AES128Cipher, {})

function jk.aes.AES128Cipher._create()
	local v = _vm:set_metatable({}, jk.aes.AES128Cipher)
	return v
end

function jk.aes.AES128Cipher:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.aes.AES128Cipher'
	self['_isType.jk.aes.AES128Cipher'] = true
end

function jk.aes.AES128Cipher:_construct0()
	jk.aes.AES128Cipher._init(self)
	return self
end

function jk.aes.AES128Cipher:create(key, iv)
	local aes = _g.jk.aes.AES128CipherGeneric._construct0(_g.jk.aes.AES128CipherGeneric._create())
	do aes:setKey(key) end
	do aes:setInitializationVector(iv) end
	do return aes end
end

jk.aes.BlockCipher = {}
jk.aes.BlockCipher.__index = jk.aes.BlockCipher
_vm:set_metatable(jk.aes.BlockCipher, {})

function jk.aes.BlockCipher._create()
	local v = _vm:set_metatable({}, jk.aes.BlockCipher)
	return v
end

function jk.aes.BlockCipher:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.aes.BlockCipher'
	self['_isType.jk.aes.BlockCipher'] = true
end

function jk.aes.BlockCipher:_construct0()
	jk.aes.BlockCipher._init(self)
	return self
end

function jk.aes.BlockCipher:encryptString(data, cipher)
	if not (data ~= nil) then
		do return nil end
	end
	do return _g.jk.aes.BlockCipher:encryptBuffer(_g.jk.lang.String:toUTF8Buffer(data), cipher) end
end

function jk.aes.BlockCipher:decryptString(data, cipher)
	local db = _g.jk.aes.BlockCipher:decryptBuffer(data, cipher)
	if not (db ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.String:forUTF8Buffer(db) end
end

function jk.aes.BlockCipher:encryptBuffer(data, cipher)
	if not (cipher ~= nil) then
		do return nil end
	end
	if not (data ~= nil) then
		do return nil end
	end
	do
		local bw = _g.jk.io.BufferWriter._construct0(_g.jk.io.BufferWriter._create())
		if not (bw ~= nil) then
			do return nil end
		end
		do
			local ww = _g.jk.aes.BlockCipherWriter:create(bw, cipher)
			if not (ww ~= nil) then
				do return nil end
			end
			do
				local r = ww:write(data, -1)
				do ww:close() end
				if r < _g.jk.lang.Buffer:getSize(data) then
					do return nil end
				end
				do return bw:getBuffer() end
			end
		end
	end
end

function jk.aes.BlockCipher:decryptBuffer(data, cipher)
	if not (cipher ~= nil) then
		do return nil end
	end
	if not (data ~= nil) then
		do return nil end
	end
	do
		local br = _g.jk.io.BufferReader:forBuffer(data)
		if not (br ~= nil) then
			do return nil end
		end
		do
			local rr = _g.jk.aes.BlockCipherReader:create(br, cipher)
			if not (rr ~= nil) then
				do return nil end
			end
			do
				local db = _g.jk.lang.Buffer:allocate(_g.jk.lang.Buffer:getSize(data))
				if not (db ~= nil) then
					do return nil end
				end
				do
					local ll = rr:read(db)
					if ll < 0 then
						do return nil end
					end
					do
						local nptr = db
						if _g.jk.lang.Buffer:getSize(db) > ll then
							nptr = _g.jk.lang.Buffer:resize(db, ll)
						end
						do return nptr end
					end
				end
			end
		end
	end
end

function jk.aes.BlockCipher:getBlockSize()
end

function jk.aes.BlockCipher:encryptBlock(src, dest)
end

function jk.aes.BlockCipher:decryptBlock(src, dest)
end

jk.aes.BlockCipherReader = {}
jk.aes.BlockCipherReader.__index = jk.aes.BlockCipherReader
_vm:set_metatable(jk.aes.BlockCipherReader, {})

function jk.aes.BlockCipherReader._create()
	local v = _vm:set_metatable({}, jk.aes.BlockCipherReader)
	return v
end

function jk.aes.BlockCipherReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.aes.BlockCipherReader'
	self['_isType.jk.aes.BlockCipherReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.io.SizedReader'] = true
	self['_isType.jk.io.SeekableReader'] = true
	self.cipher = nil
	self.reader = nil
	self.bcurrent = nil
	self.csize = 0
	self.cindex = 0
	self.bnext = nil
	self.nsize = 0
	self.ddata = nil
end

function jk.aes.BlockCipherReader:_construct0()
	jk.aes.BlockCipherReader._init(self)
	return self
end

function jk.aes.BlockCipherReader:create(reader, cipher)
	if not (reader ~= nil) then
		do return nil end
	end
	if cipher == nil then
		do return reader end
	end
	do
		local v = _g.jk.aes.BlockCipherReader._construct0(_g.jk.aes.BlockCipherReader._create())
		v.reader = reader
		v.cipher = cipher
		v.bcurrent = _g.jk.lang.Buffer:allocate(cipher:getBlockSize())
		v.bnext = _g.jk.lang.Buffer:allocate(cipher:getBlockSize())
		v.ddata = _g.jk.lang.Buffer:allocate(cipher:getBlockSize())
		v.csize = 0
		v.cindex = 0
		v.nsize = 0
		do return v end
	end
end

function jk.aes.BlockCipherReader:getSize()
	if not (self.reader ~= nil) then
		do return 0 end
	end
	do return self.reader:getSize() end
end

function jk.aes.BlockCipherReader:setCurrentPosition(n)
	local rem = _util:convert_to_integer(n % self.cipher:getBlockSize())
	local ss = n - rem
	self.csize = 0
	self.cindex = 0
	self.nsize = 0
	do
		local v = false
		if self.reader ~= nil and (_vm:to_table_with_key(self.reader, '_isType.jk.io.SeekableReader') ~= nil) then
			v = self.reader:setCurrentPosition(ss)
		end
		if v and rem > 0 then
			local bb = _g.jk.lang.Buffer:allocate(rem)
			if self:read(bb) ~= rem then
				v = false
			end
		end
		do return v end
	end
end

function jk.aes.BlockCipherReader:getCurrentPosition()
	if self.reader ~= nil and (_vm:to_table_with_key(self.reader, '_isType.jk.io.SeekableReader') ~= nil) then
		do return self.reader:getCurrentPosition() end
	end
	do return -1 end
end

function jk.aes.BlockCipherReader:read(buf)
	if buf == nil or _g.jk.lang.Buffer:getSize(buf) < 1 then
		do return 0 end
	end
	do
		local ptr = buf
		if not (ptr ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			local bs = self.cipher:getBlockSize()
			while v < _g.jk.lang.Buffer:getSize(buf) do
				local x = bs
				if v + x > _g.jk.lang.Buffer:getSize(buf) then
					x = _g.jk.lang.Buffer:getSize(buf) - v
				end
				do
					local r = self:readBlock(ptr, v, x)
					if r < 1 then
						do break end
					end
					v = v + r
				end
			end
			do return v end
		end
	end
end

function jk.aes.BlockCipherReader:readAndDecrypt(buf)
	local v = self.reader:read(self.ddata)
	if v == self.cipher:getBlockSize() then
		do self.cipher:decryptBlock(self.ddata, buf) end
	else
		do _g.jk.lang.Buffer:copyFrom(self.ddata, buf, 0, 0, v) end
	end
	do return v end
end

function jk.aes.BlockCipherReader:readBlock(ptr, offset, size)
	if self.cindex >= self.csize then
		self.csize = 0
	end
	if self.nsize < 1 then
		self.nsize = self:readAndDecrypt(self.bnext)
	end
	if self.csize < 1 then
		if self.nsize < self.cipher:getBlockSize() then
			do return 0 end
		end
		do
			local nn = self.bcurrent
			self.bcurrent = self.bnext
			self.csize = self.nsize
			self.cindex = 0
			self.bnext = nn
			self.nsize = self:readAndDecrypt(self.bnext)
		end
	end
	do
		local dsize = 0
		local data = self.cipher:getBlockSize()
		if self.nsize < data then
			local ptr2 = self.bcurrent
			if ptr2 ~= nil then
				data = data - _g.jk.lang.Buffer:getByte(ptr2, 0)
				do
					local newSize = _g.jk.lang.Buffer:getSize(self.bcurrent)
					local padding = _g.jk.lang.Buffer:getByte(self.bcurrent, newSize - 1)
					local finalLength = newSize - padding
					local fbuf = nil
					if finalLength < 0 then
						fbuf = self.bcurrent
					elseif padding >= 1 then
						fbuf = _g.jk.lang.Buffer:resize(self.bcurrent, finalLength)
					end
					dsize = _g.jk.lang.Buffer:getSize(fbuf)
					do _g.jk.lang.Buffer:copyFrom(ptr, fbuf, 0, offset, finalLength) end
				end
			end
		else
			dsize = _g.jk.lang.Buffer:getSize(self.bcurrent)
		end
		do _g.jk.lang.Buffer:copyFrom(ptr, self.bcurrent, self.cindex, offset, size) end
		self.cindex = self.cindex + size
		do return dsize end
	end
end

jk.aes.AES128CipherGeneric = _g.jk.aes.BlockCipher._create()
jk.aes.AES128CipherGeneric.__index = jk.aes.AES128CipherGeneric
_vm:set_metatable(jk.aes.AES128CipherGeneric, {
	__index = _g.jk.aes.BlockCipher
})

jk.aes.AES128CipherGeneric.ENCRYPT_MODE = 0
jk.aes.AES128CipherGeneric.DECRYPT_MODE = 1

function jk.aes.AES128CipherGeneric._create()
	local v = _vm:set_metatable({}, jk.aes.AES128CipherGeneric)
	return v
end

function jk.aes.AES128CipherGeneric:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.aes.AES128CipherGeneric'
	self['_isType.jk.aes.AES128CipherGeneric'] = true
	self.key = nil
	self.iv = nil
end

function jk.aes.AES128CipherGeneric:_construct0()
	jk.aes.AES128CipherGeneric._init(self)
	do _g.jk.aes.BlockCipher._construct0(self) end
	return self
end

function jk.aes.AES128CipherGeneric:setKey(str)
	if not _g.jk.lang.String:isNotEmpty(str) then
		do return end
	end
	if not (_g.jk.lang.String:getLength(str) == 16) then
		do return end
	end
	self.key = _g.jk.lang.String:toUTF8Buffer(str)
end

function jk.aes.AES128CipherGeneric:setInitializationVector(str)
	if not _g.jk.lang.String:isNotEmpty(str) then
		do return end
	end
	if not (_g.jk.lang.String:getLength(str) == 16) then
		do return end
	end
	self.iv = _g.jk.lang.String:toUTF8Buffer(str)
end

function jk.aes.AES128CipherGeneric:getBlockSize()
	do return 16 end
end

function jk.aes.AES128CipherGeneric:doCipher(src, dest, mode)
	if not (self.key ~= nil) then
		do return end
	end
	if not (self.iv ~= nil) then
		do return end
	end
	if not (src ~= nil) then
		do return end
	end
	if not (dest ~= nil) then
		do return end
	end
	if _g.jk.lang.Buffer:getSize(src) ~= 16 or _g.jk.lang.Buffer:getSize(dest) ~= 16 then
		do return end
	end
	if mode == _g.jk.aes.AES128CipherGeneric.ENCRYPT_MODE then
		local buf = _g.jk.aes.AES128CipherGeneric.AES128:encrypt(src, self.key, self.iv)
		self.iv = buf
		do _g.jk.lang.Buffer:copyFrom(dest, buf, 0, 0, _g.jk.lang.Buffer:getSize(buf)) end
	elseif mode == _g.jk.aes.AES128CipherGeneric.DECRYPT_MODE then
		local buf = _g.jk.aes.AES128CipherGeneric.AES128:decrypt(src, self.key, self.iv)
		do _g.jk.lang.Buffer:copyFrom(self.iv, src, 0, 0, _g.jk.lang.Buffer:getSize(src)) end
		do _g.jk.lang.Buffer:copyFrom(dest, buf, 0, 0, _g.jk.lang.Buffer:getSize(buf)) end
	end
end

function jk.aes.AES128CipherGeneric:encryptBlock(src, dest)
	do self:doCipher(src, dest, _g.jk.aes.AES128CipherGeneric.ENCRYPT_MODE) end
end

function jk.aes.AES128CipherGeneric:decryptBlock(src, dest)
	do self:doCipher(src, dest, _g.jk.aes.AES128CipherGeneric.DECRYPT_MODE) end
end

jk.aes.AES128CipherGeneric.AES128 = {}
jk.aes.AES128CipherGeneric.AES128.__index = jk.aes.AES128CipherGeneric.AES128
_vm:set_metatable(jk.aes.AES128CipherGeneric.AES128, {})

function jk.aes.AES128CipherGeneric.AES128._create()
	local v = _vm:set_metatable({}, jk.aes.AES128CipherGeneric.AES128)
	return v
end

function jk.aes.AES128CipherGeneric.AES128:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.aes.AES128CipherGeneric.AES128'
	self['_isType.jk.aes.AES128CipherGeneric.AES128'] = true
	self.nk = 4
	self.nb = 4
	self.nr = 10
	self.sbox = nil
	self.sboxINV = nil
	self.rcon = {
		141,
		1,
		2,
		4,
		8,
		16,
		32,
		64,
		128,
		27,
		54,
		108,
		216,
		171,
		77,
		154,
		47,
		94,
		188,
		99,
		198,
		151,
		53,
		106,
		212,
		179,
		125,
		250,
		239,
		197,
		145,
		57,
		114,
		228,
		211,
		189,
		97,
		194,
		159,
		37,
		74,
		148,
		51,
		102,
		204,
		131,
		29,
		58,
		116,
		232,
		203,
		141,
		1,
		2,
		4,
		8,
		16,
		32,
		64,
		128,
		27,
		54,
		108,
		216,
		171,
		77,
		154,
		47,
		94,
		188,
		99,
		198,
		151,
		53,
		106,
		212,
		179,
		125,
		250,
		239,
		197,
		145,
		57,
		114,
		228,
		211,
		189,
		97,
		194,
		159,
		37,
		74,
		148,
		51,
		102,
		204,
		131,
		29,
		58,
		116,
		232,
		203,
		141,
		1,
		2,
		4,
		8,
		16,
		32,
		64,
		128,
		27,
		54,
		108,
		216,
		171,
		77,
		154,
		47,
		94,
		188,
		99,
		198,
		151,
		53,
		106,
		212,
		179,
		125,
		250,
		239,
		197,
		145,
		57,
		114,
		228,
		211,
		189,
		97,
		194,
		159,
		37,
		74,
		148,
		51,
		102,
		204,
		131,
		29,
		58,
		116,
		232,
		203,
		141,
		1,
		2,
		4,
		8,
		16,
		32,
		64,
		128,
		27,
		54,
		108,
		216,
		171,
		77,
		154,
		47,
		94,
		188,
		99,
		198,
		151,
		53,
		106,
		212,
		179,
		125,
		250,
		239,
		197,
		145,
		57,
		114,
		228,
		211,
		189,
		97,
		194,
		159,
		37,
		74,
		148,
		51,
		102,
		204,
		131,
		29,
		58,
		116,
		232,
		203,
		141,
		1,
		2,
		4,
		8,
		16,
		32,
		64,
		128,
		27,
		54,
		108,
		216,
		171,
		77,
		154,
		47,
		94,
		188,
		99,
		198,
		151,
		53,
		106,
		212,
		179,
		125,
		250,
		239,
		197,
		145,
		57,
		114,
		228,
		211,
		189,
		97,
		194,
		159,
		37,
		74,
		148,
		51,
		102,
		204,
		131,
		29,
		58,
		116,
		232,
		203,
		141
	}
	self.t0 = {
		2774754246,
		2222750968,
		2574743534,
		2373680118,
		234025727,
		3177933782,
		2976870366,
		1422247313,
		1345335392,
		50397442,
		2842126286,
		2099981142,
		436141799,
		1658312629,
		3870010189,
		2591454956,
		1170918031,
		2642575903,
		1086966153,
		2273148410,
		368769775,
		3948501426,
		3376891790,
		200339707,
		3970805057,
		1742001331,
		4255294047,
		3937382213,
		3214711843,
		4154762323,
		2524082916,
		1539358875,
		3266819957,
		486407649,
		2928907069,
		1780885068,
		1513502316,
		1094664062,
		49805301,
		1338821763,
		1546925160,
		4104496465,
		887481809,
		150073849,
		2473685474,
		1943591083,
		1395732834,
		1058346282,
		201589768,
		1388824469,
		1696801606,
		1589887901,
		672667696,
		2711000631,
		251987210,
		3046808111,
		151455502,
		907153956,
		2608889883,
		1038279391,
		652995533,
		1764173646,
		3451040383,
		2675275242,
		453576978,
		2659418909,
		1949051992,
		773462580,
		756751158,
		2993581788,
		3998898868,
		4221608027,
		4132590244,
		1295727478,
		1641469623,
		3467883389,
		2066295122,
		1055122397,
		1898917726,
		2542044179,
		4115878822,
		1758581177,
		0,
		753790401,
		1612718144,
		536673507,
		3367088505,
		3982187446,
		3194645204,
		1187761037,
		3653156455,
		1262041458,
		3729410708,
		3561770136,
		3898103984,
		1255133061,
		1808847035,
		720367557,
		3853167183,
		385612781,
		3309519750,
		3612167578,
		1429418854,
		2491778321,
		3477423498,
		284817897,
		100794884,
		2172616702,
		4031795360,
		1144798328,
		3131023141,
		3819481163,
		4082192802,
		4272137053,
		3225436288,
		2324664069,
		2912064063,
		3164445985,
		1211644016,
		83228145,
		3753688163,
		3249976951,
		1977277103,
		1663115586,
		806359072,
		452984805,
		250868733,
		1842533055,
		1288555905,
		336333848,
		890442534,
		804056259,
		3781124030,
		2727843637,
		3427026056,
		957814574,
		1472513171,
		4071073621,
		2189328124,
		1195195770,
		2892260552,
		3881655738,
		723065138,
		2507371494,
		2690670784,
		2558624025,
		3511635870,
		2145180835,
		1713513028,
		2116692564,
		2878378043,
		2206763019,
		3393603212,
		703524551,
		3552098411,
		1007948840,
		2044649127,
		3797835452,
		487262998,
		1994120109,
		1004593371,
		1446130276,
		1312438900,
		503974420,
		3679013266,
		168166924,
		1814307912,
		3831258296,
		1573044895,
		1859376061,
		4021070915,
		2791465668,
		2828112185,
		2761266481,
		937747667,
		2339994098,
		854058965,
		1137232011,
		1496790894,
		3077402074,
		2358086913,
		1691735473,
		3528347292,
		3769215305,
		3027004632,
		4199962284,
		133494003,
		636152527,
		2942657994,
		2390391540,
		3920539207,
		403179536,
		3585784431,
		2289596656,
		1864705354,
		1915629148,
		605822008,
		4054230615,
		3350508659,
		1371981463,
		602466507,
		2094914977,
		2624877800,
		555687742,
		3712699286,
		3703422305,
		2257292045,
		2240449039,
		2423288032,
		1111375484,
		3300242801,
		2858837708,
		3628615824,
		84083462,
		32962295,
		302911004,
		2741068226,
		1597322602,
		4183250862,
		3501832553,
		2441512471,
		1489093017,
		656219450,
		3114180135,
		954327513,
		335083755,
		3013122091,
		856756514,
		3144247762,
		1893325225,
		2307821063,
		2811532339,
		3063651117,
		572399164,
		2458355477,
		552200649,
		1238290055,
		4283782570,
		2015897680,
		2061492133,
		2408352771,
		4171342169,
		2156497161,
		386731290,
		3669999461,
		837215959,
		3326231172,
		3093850320,
		3275833730,
		2962856233,
		1999449434,
		286199582,
		3417354363,
		4233385128,
		3602627437,
		974525996
	}
	self.t0INV = {
		1353184337,
		1399144830,
		3282310938,
		2522752826,
		3412831035,
		4047871263,
		2874735276,
		2466505547,
		1442459680,
		4134368941,
		2440481928,
		625738485,
		4242007375,
		3620416197,
		2151953702,
		2409849525,
		1230680542,
		1729870373,
		2551114309,
		3787521629,
		41234371,
		317738113,
		2744600205,
		3338261355,
		3881799427,
		2510066197,
		3950669247,
		3663286933,
		763608788,
		3542185048,
		694804553,
		1154009486,
		1787413109,
		2021232372,
		1799248025,
		3715217703,
		3058688446,
		397248752,
		1722556617,
		3023752829,
		407560035,
		2184256229,
		1613975959,
		1165972322,
		3765920945,
		2226023355,
		480281086,
		2485848313,
		1483229296,
		436028815,
		2272059028,
		3086515026,
		601060267,
		3791801202,
		1468997603,
		715871590,
		120122290,
		63092015,
		2591802758,
		2768779219,
		4068943920,
		2997206819,
		3127509762,
		1552029421,
		723308426,
		2461301159,
		4042393587,
		2715969870,
		3455375973,
		3586000134,
		526529745,
		2331944644,
		2639474228,
		2689987490,
		853641733,
		1978398372,
		971801355,
		2867814464,
		111112542,
		1360031421,
		4186579262,
		1023860118,
		2919579357,
		1186850381,
		3045938321,
		90031217,
		1876166148,
		4279586912,
		620468249,
		2548678102,
		3426959497,
		2006899047,
		3175278768,
		2290845959,
		945494503,
		3689859193,
		1191869601,
		3910091388,
		3374220536,
		0,
		2206629897,
		1223502642,
		2893025566,
		1316117100,
		4227796733,
		1446544655,
		517320253,
		658058550,
		1691946762,
		564550760,
		3511966619,
		976107044,
		2976320012,
		266819475,
		3533106868,
		2660342555,
		1338359936,
		2720062561,
		1766553434,
		370807324,
		179999714,
		3844776128,
		1138762300,
		488053522,
		185403662,
		2915535858,
		3114841645,
		3366526484,
		2233069911,
		1275557295,
		3151862254,
		4250959779,
		2670068215,
		3170202204,
		3309004356,
		880737115,
		1982415755,
		3703972811,
		1761406390,
		1676797112,
		3403428311,
		277177154,
		1076008723,
		538035844,
		2099530373,
		4164795346,
		288553390,
		1839278535,
		1261411869,
		4080055004,
		3964831245,
		3504587127,
		1813426987,
		2579067049,
		4199060497,
		577038663,
		3297574056,
		440397984,
		3626794326,
		4019204898,
		3343796615,
		3251714265,
		4272081548,
		906744984,
		3481400742,
		685669029,
		646887386,
		2764025151,
		3835509292,
		227702864,
		2613862250,
		1648787028,
		3256061430,
		3904428176,
		1593260334,
		4121936770,
		3196083615,
		2090061929,
		2838353263,
		3004310991,
		999926984,
		2809993232,
		1852021992,
		2075868123,
		158869197,
		4095236462,
		28809964,
		2828685187,
		1701746150,
		2129067946,
		147831841,
		3873969647,
		3650873274,
		3459673930,
		3557400554,
		3598495785,
		2947720241,
		824393514,
		815048134,
		3227951669,
		935087732,
		2798289660,
		2966458592,
		366520115,
		1251476721,
		4158319681,
		240176511,
		804688151,
		2379631990,
		1303441219,
		1414376140,
		3741619940,
		3820343710,
		461924940,
		3089050817,
		2136040774,
		82468509,
		1563790337,
		1937016826,
		776014843,
		1511876531,
		1389550482,
		861278441,
		323475053,
		2355222426,
		2047648055,
		2383738969,
		2302415851,
		3995576782,
		902390199,
		3991215329,
		1018251130,
		1507840668,
		1064563285,
		2043548696,
		3208103795,
		3939366739,
		1537932639,
		342834655,
		2262516856,
		2180231114,
		1053059257,
		741614648,
		1598071746,
		1925389590,
		203809468,
		2336832552,
		1100287487,
		1895934009,
		3736275976,
		2632234200,
		2428589668,
		1636092795,
		1890988757,
		1952214088,
		1113045200
	}
	self.t1 = {
		1667483301,
		2088564868,
		2004348569,
		2071721613,
		4076011277,
		1802229437,
		1869602481,
		3318059348,
		808476752,
		16843267,
		1734856361,
		724260477,
		4278118169,
		3621238114,
		2880130534,
		1987505306,
		3402272581,
		2189565853,
		3385428288,
		2105408135,
		4210749205,
		1499050731,
		1195871945,
		4042324747,
		2913812972,
		3570709351,
		2728550397,
		2947499498,
		2627478463,
		2762232823,
		1920132246,
		3233848155,
		3082253762,
		4261273884,
		2475900334,
		640044138,
		909536346,
		1061125697,
		4160222466,
		3435955023,
		875849820,
		2779075060,
		3857043764,
		4059166984,
		1903288979,
		3638078323,
		825320019,
		353708607,
		67373068,
		3351745874,
		589514341,
		3284376926,
		404238376,
		2526427041,
		84216335,
		2593796021,
		117902857,
		303178806,
		2155879323,
		3806519101,
		3958099238,
		656887401,
		2998042573,
		1970662047,
		151589403,
		2206408094,
		741103732,
		437924910,
		454768173,
		1852759218,
		1515893998,
		2694863867,
		1381147894,
		993752653,
		3604395873,
		3014884814,
		690573947,
		3823361342,
		791633521,
		2223248279,
		1397991157,
		3520182632,
		0,
		3991781676,
		538984544,
		4244431647,
		2981198280,
		1532737261,
		1785386174,
		3419114822,
		3200149465,
		960066123,
		1246401758,
		1280088276,
		1482207464,
		3486483786,
		3503340395,
		4025468202,
		2863288293,
		4227591446,
		1128498885,
		1296931543,
		859006549,
		2240090516,
		1162185423,
		4193904912,
		33686534,
		2139094657,
		1347461360,
		1010595908,
		2678007226,
		2829601763,
		1364304627,
		2745392638,
		1077969088,
		2408514954,
		2459058093,
		2644320700,
		943222856,
		4126535940,
		3166462943,
		3065411521,
		3671764853,
		555827811,
		269492272,
		4294960410,
		4092853518,
		3537026925,
		3452797260,
		202119188,
		320022069,
		3974939439,
		1600110305,
		2543269282,
		1145342156,
		387395129,
		3301217111,
		2812761586,
		2122251394,
		1027439175,
		1684326572,
		1566423783,
		421081643,
		1936975509,
		1616953504,
		2172721560,
		1330618065,
		3705447295,
		572671078,
		707417214,
		2425371563,
		2290617219,
		1179028682,
		4008625961,
		3099093971,
		336865340,
		3739133817,
		1583267042,
		185275933,
		3688607094,
		3772832571,
		842163286,
		976909390,
		168432670,
		1229558491,
		101059594,
		606357612,
		1549580516,
		3267534685,
		3553869166,
		2896970735,
		1650640038,
		2442213800,
		2509582756,
		3840201527,
		2038035083,
		3890730290,
		3368586051,
		926379609,
		1835915959,
		2374828428,
		3587551588,
		1313774802,
		2846444000,
		1819072692,
		1448520954,
		4109693703,
		3941256997,
		1701169839,
		2054878350,
		2930657257,
		134746136,
		3132780501,
		2021191816,
		623200879,
		774790258,
		471611428,
		2795919345,
		3031724999,
		3334903633,
		3907570467,
		3722289532,
		1953818780,
		522141217,
		1263245021,
		3183305180,
		2341145990,
		2324303749,
		1886445712,
		1044282434,
		3048567236,
		1718013098,
		1212715224,
		50529797,
		4143380225,
		235805714,
		1633796771,
		892693087,
		1465364217,
		3115936208,
		2256934801,
		3250690392,
		488454695,
		2661164985,
		3789674808,
		4177062675,
		2560109491,
		286335539,
		1768542907,
		3654920560,
		2391672713,
		2492740519,
		2610638262,
		505297954,
		2273777042,
		3924412704,
		3469641545,
		1431677695,
		673730680,
		3755976058,
		2357986191,
		2711706104,
		2307459456,
		218962455,
		3216991706,
		3873888049,
		1111655622,
		1751699640,
		1094812355,
		2576951728,
		757946999,
		252648977,
		2964356043,
		1414834428,
		3149622742,
		370551866
	}
	self.t1INV = {
		2817806672,
		1698790995,
		2752977603,
		1579629206,
		1806384075,
		1167925233,
		1492823211,
		65227667,
		4197458005,
		1836494326,
		1993115793,
		1275262245,
		3622129660,
		3408578007,
		1144333952,
		2741155215,
		1521606217,
		465184103,
		250234264,
		3237895649,
		1966064386,
		4031545618,
		2537983395,
		4191382470,
		1603208167,
		2626819477,
		2054012907,
		1498584538,
		2210321453,
		561273043,
		1776306473,
		3368652356,
		2311222634,
		2039411832,
		1045993835,
		1907959773,
		1340194486,
		2911432727,
		2887829862,
		986611124,
		1256153880,
		823846274,
		860985184,
		2136171077,
		2003087840,
		2926295940,
		2692873756,
		722008468,
		1749577816,
		4249194265,
		1826526343,
		4168831671,
		3547573027,
		38499042,
		2401231703,
		2874500650,
		686535175,
		3266653955,
		2076542618,
		137876389,
		2267558130,
		2780767154,
		1778582202,
		2182540636,
		483363371,
		3027871634,
		4060607472,
		3798552225,
		4107953613,
		3188000469,
		1647628575,
		4272342154,
		1395537053,
		1442030240,
		3783918898,
		3958809717,
		3968011065,
		4016062634,
		2675006982,
		275692881,
		2317434617,
		115185213,
		88006062,
		3185986886,
		2371129781,
		1573155077,
		3557164143,
		357589247,
		4221049124,
		3921532567,
		1128303052,
		2665047927,
		1122545853,
		2341013384,
		1528424248,
		4006115803,
		175939911,
		256015593,
		512030921,
		0,
		2256537987,
		3979031112,
		1880170156,
		1918528590,
		4279172603,
		948244310,
		3584965918,
		959264295,
		3641641572,
		2791073825,
		1415289809,
		775300154,
		1728711857,
		3881276175,
		2532226258,
		2442861470,
		3317727311,
		551313826,
		1266113129,
		437394454,
		3130253834,
		715178213,
		3760340035,
		387650077,
		218697227,
		3347837613,
		2830511545,
		2837320904,
		435246981,
		125153100,
		3717852859,
		1618977789,
		637663135,
		4117912764,
		996558021,
		2130402100,
		692292470,
		3324234716,
		4243437160,
		4058298467,
		3694254026,
		2237874704,
		580326208,
		298222624,
		608863613,
		1035719416,
		855223825,
		2703869805,
		798891339,
		817028339,
		1384517100,
		3821107152,
		380840812,
		3111168409,
		1217663482,
		1693009698,
		2365368516,
		1072734234,
		746411736,
		2419270383,
		1313441735,
		3510163905,
		2731183358,
		198481974,
		2180359887,
		3732579624,
		2394413606,
		3215802276,
		2637835492,
		2457358349,
		3428805275,
		1182684258,
		328070850,
		3101200616,
		4147719774,
		2948825845,
		2153619390,
		2479909244,
		768962473,
		304467891,
		2578237499,
		2098729127,
		1671227502,
		3141262203,
		2015808777,
		408514292,
		3080383489,
		2588902312,
		1855317605,
		3875515006,
		3485212936,
		3893751782,
		2615655129,
		913263310,
		161475284,
		2091919830,
		2997105071,
		591342129,
		2493892144,
		1721906624,
		3159258167,
		3397581990,
		3499155632,
		3634836245,
		2550460746,
		3672916471,
		1355644686,
		4136703791,
		3595400845,
		2968470349,
		1303039060,
		76997855,
		3050413795,
		2288667675,
		523026872,
		1365591679,
		3932069124,
		898367837,
		1955068531,
		1091304238,
		493335386,
		3537605202,
		1443948851,
		1205234963,
		1641519756,
		211892090,
		351820174,
		1007938441,
		665439982,
		3378624309,
		3843875309,
		2974251580,
		3755121753,
		1945261375,
		3457423481,
		935818175,
		3455538154,
		2868731739,
		1866325780,
		3678697606,
		4088384129,
		3295197502,
		874788908,
		1084473951,
		3273463410,
		635616268,
		1228679307,
		2500722497,
		27801969,
		3003910366,
		3837057180,
		3243664528,
		2227927905,
		3056784752,
		1550600308,
		1471729730
	}
	self.t2 = {
		1673962851,
		2096661628,
		2012125559,
		2079755643,
		4076801522,
		1809235307,
		1876865391,
		3314635973,
		811618352,
		16909057,
		1741597031,
		727088427,
		4276558334,
		3618988759,
		2874009259,
		1995217526,
		3398387146,
		2183110018,
		3381215433,
		2113570685,
		4209972730,
		1504897881,
		1200539975,
		4042984432,
		2906778797,
		3568527316,
		2724199842,
		2940594863,
		2619588508,
		2756966308,
		1927583346,
		3231407040,
		3077948087,
		4259388669,
		2470293139,
		642542118,
		913070646,
		1065238847,
		4160029431,
		3431157708,
		879254580,
		2773611685,
		3855693029,
		4059629809,
		1910674289,
		3635114968,
		828527409,
		355090197,
		67636228,
		3348452039,
		591815971,
		3281870531,
		405809176,
		2520228246,
		84545285,
		2586817946,
		118360327,
		304363026,
		2149292928,
		3806281186,
		3956090603,
		659450151,
		2994720178,
		1978310517,
		152181513,
		2199756419,
		743994412,
		439627290,
		456535323,
		1859957358,
		1521806938,
		2690382752,
		1386542674,
		997608763,
		3602342358,
		3011366579,
		693271337,
		3822927587,
		794718511,
		2215876484,
		1403450707,
		3518589137,
		0,
		3988860141,
		541089824,
		4242743292,
		2977548465,
		1538714971,
		1792327274,
		3415033547,
		3194476990,
		963791673,
		1251270218,
		1285084236,
		1487988824,
		3481619151,
		3501943760,
		4022676207,
		2857362858,
		4226619131,
		1132905795,
		1301993293,
		862344499,
		2232521861,
		1166724933,
		4192801017,
		33818114,
		2147385727,
		1352724560,
		1014514748,
		2670049951,
		2823545768,
		1369633617,
		2740846243,
		1082179648,
		2399505039,
		2453646738,
		2636233885,
		946882616,
		4126213365,
		3160661948,
		3061301686,
		3668932058,
		557998881,
		270544912,
		4293204735,
		4093447923,
		3535760850,
		3447803085,
		202904588,
		321271059,
		3972214764,
		1606345055,
		2536874647,
		1149815876,
		388905239,
		3297990596,
		2807427751,
		2130477694,
		1031423805,
		1690872932,
		1572530013,
		422718233,
		1944491379,
		1623236704,
		2165938305,
		1335808335,
		3701702620,
		574907938,
		710180394,
		2419829648,
		2282455944,
		1183631942,
		4006029806,
		3094074296,
		338181140,
		3735517662,
		1589437022,
		185998603,
		3685578459,
		3772464096,
		845436466,
		980700730,
		169090570,
		1234361161,
		101452294,
		608726052,
		1555620956,
		3265224130,
		3552407251,
		2890133420,
		1657054818,
		2436475025,
		2503058581,
		3839047652,
		2045938553,
		3889509095,
		3364570056,
		929978679,
		1843050349,
		2365688973,
		3585172693,
		1318900302,
		2840191145,
		1826141292,
		1454176854,
		4109567988,
		3939444202,
		1707781989,
		2062847610,
		2923948462,
		135272456,
		3127891386,
		2029029496,
		625635109,
		777810478,
		473441308,
		2790781350,
		3027486644,
		3331805638,
		3905627112,
		3718347997,
		1961401460,
		524165407,
		1268178251,
		3177307325,
		2332919435,
		2316273034,
		1893765232,
		1048330814,
		3044132021,
		1724688998,
		1217452104,
		50726147,
		4143383030,
		236720654,
		1640145761,
		896163637,
		1471084887,
		3110719673,
		2249691526,
		3248052417,
		490350365,
		2653403550,
		3789109473,
		4176155640,
		2553000856,
		287453969,
		1775418217,
		3651760345,
		2382858638,
		2486413204,
		2603464347,
		507257374,
		2266337927,
		3922272489,
		3464972750,
		1437269845,
		676362280,
		3752164063,
		2349043596,
		2707028129,
		2299101321,
		219813645,
		3211123391,
		3872862694,
		1115997762,
		1758509160,
		1099088705,
		2569646233,
		760903469,
		253628687,
		2960903088,
		1420360788,
		3144537787,
		371997206
	}
	self.t2INV = {
		4098969767,
		1098797925,
		387629988,
		658151006,
		2872822635,
		2636116293,
		4205620056,
		3813380867,
		807425530,
		1991112301,
		3431502198,
		49620300,
		3847224535,
		717608907,
		891715652,
		1656065955,
		2984135002,
		3123013403,
		3930429454,
		4267565504,
		801309301,
		1283527408,
		1183687575,
		3547055865,
		2399397727,
		2450888092,
		1841294202,
		1385552473,
		3201576323,
		1951978273,
		3762891113,
		3381544136,
		3262474889,
		2398386297,
		1486449470,
		3106397553,
		3787372111,
		2297436077,
		550069932,
		3464344634,
		3747813450,
		451248689,
		1368875059,
		1398949247,
		1689378935,
		1807451310,
		2180914336,
		150574123,
		1215322216,
		1167006205,
		3734275948,
		2069018616,
		1940595667,
		1265820162,
		534992783,
		1432758955,
		3954313000,
		3039757250,
		3313932923,
		936617224,
		674296455,
		3206787749,
		50510442,
		384654466,
		3481938716,
		2041025204,
		133427442,
		1766760930,
		3664104948,
		84334014,
		886120290,
		2797898494,
		775200083,
		4087521365,
		2315596513,
		4137973227,
		2198551020,
		1614850799,
		1901987487,
		1857900816,
		557775242,
		3717610758,
		1054715397,
		3863824061,
		1418835341,
		3295741277,
		100954068,
		1348534037,
		2551784699,
		3184957417,
		1082772547,
		3647436702,
		3903896898,
		2298972299,
		434583643,
		3363429358,
		2090944266,
		1115482383,
		2230896926,
		0,
		2148107142,
		724715757,
		287222896,
		1517047410,
		251526143,
		2232374840,
		2923241173,
		758523705,
		252339417,
		1550328230,
		1536938324,
		908343854,
		168604007,
		1469255655,
		4004827798,
		2602278545,
		3229634501,
		3697386016,
		2002413899,
		303830554,
		2481064634,
		2696996138,
		574374880,
		454171927,
		151915277,
		2347937223,
		3056449960,
		504678569,
		4049044761,
		1974422535,
		2582559709,
		2141453664,
		33005350,
		1918680309,
		1715782971,
		4217058430,
		1133213225,
		600562886,
		3988154620,
		3837289457,
		836225756,
		1665273989,
		2534621218,
		3330547729,
		1250262308,
		3151165501,
		4188934450,
		700935585,
		2652719919,
		3000824624,
		2249059410,
		3245854947,
		3005967382,
		1890163129,
		2484206152,
		3913753188,
		4238918796,
		4037024319,
		2102843436,
		857927568,
		1233635150,
		953795025,
		3398237858,
		3566745099,
		4121350017,
		2057644254,
		3084527246,
		2906629311,
		976020637,
		2018512274,
		1600822220,
		2119459398,
		2381758995,
		3633375416,
		959340279,
		3280139695,
		1570750080,
		3496574099,
		3580864813,
		634368786,
		2898803609,
		403744637,
		2632478307,
		1004239803,
		650971512,
		1500443672,
		2599158199,
		1334028442,
		2514904430,
		4289363686,
		3156281551,
		368043752,
		3887782299,
		1867173430,
		2682967049,
		2955531900,
		2754719666,
		1059729699,
		2781229204,
		2721431654,
		1316239292,
		2197595850,
		2430644432,
		2805143000,
		82922136,
		3963746266,
		3447656016,
		2434215926,
		1299615190,
		4014165424,
		2865517645,
		2531581700,
		3516851125,
		1783372680,
		750893087,
		1699118929,
		1587348714,
		2348899637,
		2281337716,
		201010753,
		1739807261,
		3683799762,
		283718486,
		3597472583,
		3617229921,
		2704767500,
		4166618644,
		334203196,
		2848910887,
		1639396809,
		484568549,
		1199193265,
		3533461983,
		4065673075,
		337148366,
		3346251575,
		4149471949,
		4250885034,
		1038029935,
		1148749531,
		2949284339,
		1756970692,
		607661108,
		2747424576,
		488010435,
		3803974693,
		1009290057,
		234832277,
		2822336769,
		201907891,
		3034094820,
		1449431233,
		3413860740,
		852848822,
		1816687708,
		3100656215
	}
	self.t3 = {
		3332727651,
		4169432188,
		4003034999,
		4136467323,
		4279104242,
		3602738027,
		3736170351,
		2438251973,
		1615867952,
		33751297,
		3467208551,
		1451043627,
		3877240574,
		3043153879,
		1306962859,
		3969545846,
		2403715786,
		530416258,
		2302724553,
		4203183485,
		4011195130,
		3001768281,
		2395555655,
		4211863792,
		1106029997,
		3009926356,
		1610457762,
		1173008303,
		599760028,
		1408738468,
		3835064946,
		2606481600,
		1975695287,
		3776773629,
		1034851219,
		1282024998,
		1817851446,
		2118205247,
		4110612471,
		2203045068,
		1750873140,
		1374987685,
		3509904869,
		4178113009,
		3801313649,
		2876496088,
		1649619249,
		708777237,
		135005188,
		2505230279,
		1181033251,
		2640233411,
		807933976,
		933336726,
		168756485,
		800430746,
		235472647,
		607523346,
		463175808,
		3745374946,
		3441880043,
		1315514151,
		2144187058,
		3936318837,
		303761673,
		496927619,
		1484008492,
		875436570,
		908925723,
		3702681198,
		3035519578,
		1543217312,
		2767606354,
		1984772923,
		3076642518,
		2110698419,
		1383803177,
		3711886307,
		1584475951,
		328696964,
		2801095507,
		3110654417,
		0,
		3240947181,
		1080041504,
		3810524412,
		2043195825,
		3069008731,
		3569248874,
		2370227147,
		1742323390,
		1917532473,
		2497595978,
		2564049996,
		2968016984,
		2236272591,
		3144405200,
		3307925487,
		1340451498,
		3977706491,
		2261074755,
		2597801293,
		1716859699,
		294946181,
		2328839493,
		3910203897,
		67502594,
		4269899647,
		2700103760,
		2017737788,
		632987551,
		1273211048,
		2733855057,
		1576969123,
		2160083008,
		92966799,
		1068339858,
		566009245,
		1883781176,
		4043634165,
		1675607228,
		2009183926,
		2943736538,
		1113792801,
		540020752,
		3843751935,
		4245615603,
		3211645650,
		2169294285,
		403966988,
		641012499,
		3274697964,
		3202441055,
		899848087,
		2295088196,
		775493399,
		2472002756,
		1441965991,
		4236410494,
		2051489085,
		3366741092,
		3135724893,
		841685273,
		3868554099,
		3231735904,
		429425025,
		2664517455,
		2743065820,
		1147544098,
		1417554474,
		1001099408,
		193169544,
		2362066502,
		3341414126,
		1809037496,
		675025940,
		2809781982,
		3168951902,
		371002123,
		2910247899,
		3678134496,
		1683370546,
		1951283770,
		337512970,
		2463844681,
		201983494,
		1215046692,
		3101973596,
		2673722050,
		3178157011,
		1139780780,
		3299238498,
		967348625,
		832869781,
		3543655652,
		4069226873,
		3576883175,
		2336475336,
		1851340599,
		3669454189,
		25988493,
		2976175573,
		2631028302,
		1239460265,
		3635702892,
		2902087254,
		4077384948,
		3475368682,
		3400492389,
		4102978170,
		1206496942,
		270010376,
		1876277946,
		4035475576,
		1248797989,
		1550986798,
		941890588,
		1475454630,
		1942467764,
		2538718918,
		3408128232,
		2709315037,
		3902567540,
		1042358047,
		2531085131,
		1641856445,
		226921355,
		260409994,
		3767562352,
		2084716094,
		1908716981,
		3433719398,
		2430093384,
		100991747,
		4144101110,
		470945294,
		3265487201,
		1784624437,
		2935576407,
		1775286713,
		395413126,
		2572730817,
		975641885,
		666476190,
		3644383713,
		3943954680,
		733190296,
		573772049,
		3535497577,
		2842745305,
		126455438,
		866620564,
		766942107,
		1008868894,
		361924487,
		3374377449,
		2269761230,
		2868860245,
		1350051880,
		2776293343,
		59739276,
		1509466529,
		159418761,
		437718285,
		1708834751,
		3610371814,
		2227585602,
		3501746280,
		2193834305,
		699439513,
		1517759789,
		504434447,
		2076946608,
		2835108948,
		1842789307,
		742004246
	}
	self.t3INV = {
		1364240372,
		2119394625,
		449029143,
		982933031,
		1003187115,
		535905693,
		2896910586,
		1267925987,
		542505520,
		2918608246,
		2291234508,
		4112862210,
		1341970405,
		3319253802,
		645940277,
		3046089570,
		3729349297,
		627514298,
		1167593194,
		1575076094,
		3271718191,
		2165502028,
		2376308550,
		1808202195,
		65494927,
		362126482,
		3219880557,
		2514114898,
		3559752638,
		1490231668,
		1227450848,
		2386872521,
		1969916354,
		4101536142,
		2573942360,
		668823993,
		3199619041,
		4028083592,
		3378949152,
		2108963534,
		1662536415,
		3850514714,
		2539664209,
		1648721747,
		2984277860,
		3146034795,
		4263288961,
		4187237128,
		1884842056,
		2400845125,
		2491903198,
		1387788411,
		2871251827,
		1927414347,
		3814166303,
		1714072405,
		2986813675,
		788775605,
		2258271173,
		3550808119,
		821200680,
		598910399,
		45771267,
		3982262806,
		2318081231,
		2811409529,
		4092654087,
		1319232105,
		1707996378,
		114671109,
		3508494900,
		3297443494,
		882725678,
		2728416755,
		87220618,
		2759191542,
		188345475,
		1084944224,
		1577492337,
		3176206446,
		1056541217,
		2520581853,
		3719169342,
		1296481766,
		2444594516,
		1896177092,
		74437638,
		1627329872,
		421854104,
		3600279997,
		2311865152,
		1735892697,
		2965193448,
		126389129,
		3879230233,
		2044456648,
		2705787516,
		2095648578,
		4173930116,
		0,
		159614592,
		843640107,
		514617361,
		1817080410,
		4261150478,
		257308805,
		1025430958,
		908540205,
		174381327,
		1747035740,
		2614187099,
		607792694,
		212952842,
		2467293015,
		3033700078,
		463376795,
		2152711616,
		1638015196,
		1516850039,
		471210514,
		3792353939,
		3236244128,
		1011081250,
		303896347,
		235605257,
		4071475083,
		767142070,
		348694814,
		1468340721,
		2940995445,
		4005289369,
		2751291519,
		4154402305,
		1555887474,
		1153776486,
		1530167035,
		2339776835,
		3420243491,
		3060333805,
		3093557732,
		3620396081,
		1108378979,
		322970263,
		2216694214,
		2239571018,
		3539484091,
		2920362745,
		3345850665,
		491466654,
		3706925234,
		233591430,
		2010178497,
		728503987,
		2845423984,
		301615252,
		1193436393,
		2831453436,
		2686074864,
		1457007741,
		586125363,
		2277985865,
		3653357880,
		2365498058,
		2553678804,
		2798617077,
		2770919034,
		3659959991,
		1067761581,
		753179962,
		1343066744,
		1788595295,
		1415726718,
		4139914125,
		2431170776,
		777975609,
		2197139395,
		2680062045,
		1769771984,
		1873358293,
		3484619301,
		3359349164,
		279411992,
		3899548572,
		3682319163,
		3439949862,
		1861490777,
		3959535514,
		2208864847,
		3865407125,
		2860443391,
		554225596,
		4024887317,
		3134823399,
		1255028335,
		3939764639,
		701922480,
		833598116,
		707863359,
		3325072549,
		901801634,
		1949809742,
		4238789250,
		3769684112,
		857069735,
		4048197636,
		1106762476,
		2131644621,
		389019281,
		1989006925,
		1129165039,
		3428076970,
		3839820950,
		2665723345,
		1276872810,
		3250069292,
		1182749029,
		2634345054,
		22885772,
		4201870471,
		4214112523,
		3009027431,
		2454901467,
		3912455696,
		1829980118,
		2592891351,
		930745505,
		1502483704,
		3951639571,
		3471714217,
		3073755489,
		3790464284,
		2050797895,
		2623135698,
		1430221810,
		410635796,
		1941911495,
		1407897079,
		1599843069,
		3742658365,
		2022103876,
		3397514159,
		3107898472,
		942421028,
		3261022371,
		376619805,
		3154912738,
		680216892,
		4282488077,
		963707304,
		148812556,
		3634160820,
		1687208278,
		2069988555,
		3580933682,
		1215585388,
		3494008760
	}
	self.u1 = {
		0,
		185403662,
		370807324,
		488053522,
		741614648,
		658058550,
		976107044,
		824393514,
		1483229296,
		1399144830,
		1316117100,
		1165972322,
		1952214088,
		2136040774,
		1648787028,
		1766553434,
		2966458592,
		3151862254,
		2798289660,
		2915535858,
		2632234200,
		2548678102,
		2331944644,
		2180231114,
		3904428176,
		3820343710,
		4272081548,
		4121936770,
		3297574056,
		3481400742,
		3533106868,
		3650873274,
		2075868123,
		1890988757,
		1839278535,
		1722556617,
		1468997603,
		1552029421,
		1100287487,
		1251476721,
		601060267,
		685669029,
		902390199,
		1053059257,
		266819475,
		82468509,
		436028815,
		317738113,
		3412831035,
		3227951669,
		3715217703,
		3598495785,
		3881799427,
		3964831245,
		4047871263,
		4199060497,
		2466505547,
		2551114309,
		2233069911,
		2383738969,
		3208103795,
		3023752829,
		2838353263,
		2720062561,
		4134368941,
		4250959779,
		3765920945,
		3950669247,
		3663286933,
		3511966619,
		3426959497,
		3343796615,
		2919579357,
		2768779219,
		3089050817,
		3004310991,
		2184256229,
		2302415851,
		2485848313,
		2670068215,
		1186850381,
		1303441219,
		1353184337,
		1537932639,
		1787413109,
		1636092795,
		2090061929,
		2006899047,
		517320253,
		366520115,
		147831841,
		63092015,
		853641733,
		971801355,
		620468249,
		804688151,
		2379631990,
		2262516856,
		2613862250,
		2428589668,
		2715969870,
		2867814464,
		3086515026,
		3170202204,
		3586000134,
		3736275976,
		3282310938,
		3366526484,
		4186579262,
		4068943920,
		4019204898,
		3835509292,
		1023860118,
		906744984,
		723308426,
		538035844,
		288553390,
		440397984,
		120122290,
		203809468,
		1701746150,
		1852021992,
		1937016826,
		2021232372,
		1230680542,
		1113045200,
		1598071746,
		1414376140,
		4158319681,
		4242007375,
		3787521629,
		3939366739,
		3689859193,
		3504587127,
		3455375973,
		3338261355,
		2947720241,
		2764025151,
		3114841645,
		2997206819,
		2206629897,
		2290845959,
		2510066197,
		2660342555,
		1191869601,
		1275557295,
		1360031421,
		1511876531,
		1799248025,
		1613975959,
		2099530373,
		1982415755,
		526529745,
		342834655,
		158869197,
		41234371,
		861278441,
		945494503,
		625738485,
		776014843,
		2355222426,
		2272059028,
		2591802758,
		2440481928,
		2689987490,
		2874735276,
		3058688446,
		3175278768,
		3557400554,
		3741619940,
		3256061430,
		3374220536,
		4164795346,
		4080055004,
		3995576782,
		3844776128,
		1018251130,
		935087732,
		715871590,
		564550760,
		277177154,
		461924940,
		111112542,
		227702864,
		1691946762,
		1876166148,
		1925389590,
		2043548696,
		1223502642,
		1138762300,
		1593260334,
		1442459680,
		28809964,
		179999714,
		397248752,
		480281086,
		763608788,
		646887386,
		999926984,
		815048134,
		1507840668,
		1389550482,
		1338359936,
		1154009486,
		1978398372,
		2129067946,
		1676797112,
		1761406390,
		2976320012,
		3127509762,
		2809993232,
		2893025566,
		2639474228,
		2522752826,
		2336832552,
		2151953702,
		3910091388,
		3791801202,
		4279586912,
		4095236462,
		3309004356,
		3459673930,
		3542185048,
		3626794326,
		2047648055,
		1895934009,
		1813426987,
		1729870373,
		1446544655,
		1563790337,
		1076008723,
		1261411869,
		577038663,
		694804553,
		880737115,
		1064563285,
		240176511,
		90031217,
		407560035,
		323475053,
		3403428311,
		3251714265,
		3703972811,
		3620416197,
		3873969647,
		3991215329,
		4042393587,
		4227796733,
		2461301159,
		2579067049,
		2226023355,
		2409849525,
		3196083615,
		3045938321,
		2828685187,
		2744600205
	}
	self.u2 = {
		0,
		218697227,
		437394454,
		387650077,
		874788908,
		959264295,
		775300154,
		591342129,
		1749577816,
		1698790995,
		1918528590,
		2136171077,
		1550600308,
		1365591679,
		1182684258,
		1266113129,
		3499155632,
		3717852859,
		3397581990,
		3347837613,
		3837057180,
		3921532567,
		4272342154,
		4088384129,
		3101200616,
		3050413795,
		2731183358,
		2948825845,
		2365368516,
		2180359887,
		2532226258,
		2615655129,
		3141262203,
		3056784752,
		2703869805,
		2887829862,
		2401231703,
		2182540636,
		2500722497,
		2550460746,
		3547573027,
		3732579624,
		3378624309,
		3295197502,
		3881276175,
		3932069124,
		4249194265,
		4031545618,
		1806384075,
		1721906624,
		1907959773,
		2091919830,
		1603208167,
		1384517100,
		1167925233,
		1217663482,
		65227667,
		250234264,
		435246981,
		351820174,
		935818175,
		986611124,
		768962473,
		551313826,
		1836494326,
		1618977789,
		2003087840,
		2054012907,
		1498584538,
		1415289809,
		1128303052,
		1313441735,
		88006062,
		137876389,
		523026872,
		304467891,
		823846274,
		1007938441,
		722008468,
		637663135,
		3185986886,
		2968470349,
		2817806672,
		2868731739,
		2311222634,
		2227927905,
		2479909244,
		2665047927,
		3584965918,
		3634836245,
		3485212936,
		3266653955,
		3783918898,
		3968011065,
		4221049124,
		4136703791,
		3595400845,
		3678697606,
		3428805275,
		3243664528,
		3798552225,
		4016062634,
		4168831671,
		4117912764,
		3188000469,
		3003910366,
		2752977603,
		2837320904,
		2317434617,
		2267558130,
		2419270383,
		2637835492,
		115185213,
		198481974,
		483363371,
		298222624,
		855223825,
		1072734234,
		686535175,
		635616268,
		1855317605,
		1671227502,
		1955068531,
		2039411832,
		1521606217,
		1471729730,
		1084473951,
		1303039060,
		3672916471,
		3622129660,
		3237895649,
		3455538154,
		4006115803,
		3821107152,
		4107953613,
		4191382470,
		2997105071,
		3215802276,
		2830511545,
		2780767154,
		2256537987,
		2341013384,
		2626819477,
		2442861470,
		175939911,
		125153100,
		275692881,
		493335386,
		1045993835,
		860985184,
		608863613,
		692292470,
		1647628575,
		1866325780,
		2015808777,
		1966064386,
		1443948851,
		1528424248,
		1275262245,
		1091304238,
		1641519756,
		1826526343,
		2076542618,
		1993115793,
		1442030240,
		1492823211,
		1340194486,
		1122545853,
		161475284,
		76997855,
		328070850,
		512030921,
		1035719416,
		817028339,
		665439982,
		715178213,
		2974251580,
		3159258167,
		2874500650,
		2791073825,
		2237874704,
		2288667675,
		2675006982,
		2457358349,
		3641641572,
		3557164143,
		3273463410,
		3457423481,
		3979031112,
		3760340035,
		4147719774,
		4197458005,
		3080383489,
		3130253834,
		2911432727,
		2692873756,
		2210321453,
		2394413606,
		2578237499,
		2493892144,
		3755121753,
		3537605202,
		3317727311,
		3368652356,
		3958809717,
		3875515006,
		4058298467,
		4243437160,
		1728711857,
		1778582202,
		2098729127,
		1880170156,
		1395537053,
		1579629206,
		1228679307,
		1144333952,
		256015593,
		38499042,
		357589247,
		408514292,
		996558021,
		913263310,
		561273043,
		746411736,
		211892090,
		27801969,
		380840812,
		465184103,
		948244310,
		898367837,
		580326208,
		798891339,
		1693009698,
		1776306473,
		2130402100,
		1945261375,
		1355644686,
		1573155077,
		1256153880,
		1205234963,
		3694254026,
		3510163905,
		3324234716,
		3408578007,
		3893751782,
		3843875309,
		4060607472,
		4279172603,
		3027871634,
		3111168409,
		2926295940,
		2741155215,
		2153619390,
		2371129781,
		2588902312,
		2537983395
	}
	self.u3 = {
		0,
		151915277,
		303830554,
		454171927,
		607661108,
		758523705,
		908343854,
		1059729699,
		1215322216,
		1098797925,
		1517047410,
		1398949247,
		1816687708,
		1699118929,
		2119459398,
		2002413899,
		2430644432,
		2582559709,
		2197595850,
		2347937223,
		3034094820,
		3184957417,
		2797898494,
		2949284339,
		3633375416,
		3516851125,
		3398237858,
		3280139695,
		4238918796,
		4121350017,
		4004827798,
		3887782299,
		1004239803,
		852848822,
		700935585,
		550069932,
		534992783,
		384654466,
		234832277,
		82922136,
		1940595667,
		2057644254,
		1639396809,
		1756970692,
		1469255655,
		1587348714,
		1167006205,
		1283527408,
		2872822635,
		2721431654,
		3106397553,
		2955531900,
		2399397727,
		2249059410,
		2636116293,
		2484206152,
		3813380867,
		3930429454,
		4049044761,
		4166618644,
		3346251575,
		3464344634,
		3580864813,
		3697386016,
		1991112301,
		2141453664,
		1689378935,
		1841294202,
		1385552473,
		1536938324,
		1082772547,
		1233635150,
		1054715397,
		936617224,
		750893087,
		634368786,
		451248689,
		334203196,
		150574123,
		33005350,
		3863824061,
		4014165424,
		4098969767,
		4250885034,
		3262474889,
		3413860740,
		3496574099,
		3647436702,
		2923241173,
		2805143000,
		3156281551,
		3039757250,
		2315596513,
		2198551020,
		2551784699,
		2434215926,
		1299615190,
		1148749531,
		1600822220,
		1449431233,
		1766760930,
		1614850799,
		2069018616,
		1918680309,
		84334014,
		201907891,
		387629988,
		504678569,
		557775242,
		674296455,
		857927568,
		976020637,
		3717610758,
		3566745099,
		3481938716,
		3330547729,
		4188934450,
		4037024319,
		3954313000,
		3803974693,
		2514904430,
		2632478307,
		2281337716,
		2398386297,
		2984135002,
		3100656215,
		2747424576,
		2865517645,
		3963746266,
		3847224535,
		4267565504,
		4149471949,
		3363429358,
		3245854947,
		3664104948,
		3547055865,
		2754719666,
		2906629311,
		3056449960,
		3206787749,
		2148107142,
		2298972299,
		2450888092,
		2602278545,
		2090944266,
		1974422535,
		1857900816,
		1739807261,
		1486449470,
		1368875059,
		1250262308,
		1133213225,
		886120290,
		1038029935,
		650971512,
		801309301,
		283718486,
		434583643,
		49620300,
		201010753,
		3617229921,
		3734275948,
		3313932923,
		3431502198,
		4087521365,
		4205620056,
		3787372111,
		3903896898,
		2682967049,
		2531581700,
		2381758995,
		2230896926,
		3151165501,
		3000824624,
		2848910887,
		2696996138,
		1199193265,
		1316239292,
		1432758955,
		1550328230,
		1665273989,
		1783372680,
		1901987487,
		2018512274,
		252339417,
		100954068,
		488010435,
		337148366,
		724715757,
		574374880,
		959340279,
		807425530,
		2599158199,
		2481064634,
		2297436077,
		2180914336,
		3201576323,
		3084527246,
		2898803609,
		2781229204,
		3533461983,
		3683799762,
		3229634501,
		3381544136,
		4137973227,
		4289363686,
		3837289457,
		3988154620,
		168604007,
		50510442,
		403744637,
		287222896,
		775200083,
		658151006,
		1009290057,
		891715652,
		1115482383,
		1265820162,
		1348534037,
		1500443672,
		1715782971,
		1867173430,
		1951978273,
		2102843436,
		2704767500,
		2822336769,
		3005967382,
		3123013403,
		2232374840,
		2348899637,
		2534621218,
		2652719919,
		3913753188,
		3762891113,
		4217058430,
		4065673075,
		3447656016,
		3295741277,
		3747813450,
		3597472583,
		836225756,
		953795025,
		600562886,
		717608907,
		368043752,
		484568549,
		133427442,
		251526143,
		2041025204,
		1890163129,
		1807451310,
		1656065955,
		1570750080,
		1418835341,
		1334028442,
		1183687575
	}
	self.u4 = {
		0,
		235605257,
		471210514,
		303896347,
		942421028,
		908540205,
		607792694,
		707863359,
		1884842056,
		2119394625,
		1817080410,
		1648721747,
		1215585388,
		1182749029,
		1415726718,
		1516850039,
		3769684112,
		4005289369,
		4238789250,
		4071475083,
		3634160820,
		3600279997,
		3297443494,
		3397514159,
		2431170776,
		2665723345,
		2365498058,
		2197139395,
		2831453436,
		2798617077,
		3033700078,
		3134823399,
		3682319163,
		3580933682,
		3345850665,
		3378949152,
		3814166303,
		3982262806,
		4282488077,
		4048197636,
		2871251827,
		2770919034,
		3073755489,
		3107898472,
		2467293015,
		2634345054,
		2400845125,
		2165502028,
		1003187115,
		901801634,
		668823993,
		701922480,
		65494927,
		233591430,
		535905693,
		301615252,
		1267925987,
		1167593194,
		1468340721,
		1502483704,
		1941911495,
		2108963534,
		1873358293,
		1638015196,
		2918608246,
		2751291519,
		2984277860,
		3219880557,
		2514114898,
		2614187099,
		2311865152,
		2277985865,
		3719169342,
		3550808119,
		3250069292,
		3484619301,
		3850514714,
		3951639571,
		4187237128,
		4154402305,
		1296481766,
		1129165039,
		1364240372,
		1599843069,
		1969916354,
		2069988555,
		1769771984,
		1735892697,
		1025430958,
		857069735,
		554225596,
		788775605,
		87220618,
		188345475,
		421854104,
		389019281,
		1989006925,
		2022103876,
		1788595295,
		1687208278,
		1319232105,
		1084944224,
		1387788411,
		1555887474,
		114671109,
		148812556,
		449029143,
		348694814,
		1056541217,
		821200680,
		586125363,
		753179962,
		2520581853,
		2553678804,
		2318081231,
		2216694214,
		2920362745,
		2686074864,
		2986813675,
		3154912738,
		3865407125,
		3899548572,
		4201870471,
		4101536142,
		3729349297,
		3494008760,
		3261022371,
		3428076970,
		1106762476,
		1341970405,
		1575076094,
		1407897079,
		2044456648,
		2010178497,
		1707996378,
		1808202195,
		833598116,
		1067761581,
		767142070,
		598910399,
		159614592,
		126389129,
		362126482,
		463376795,
		2705787516,
		2940995445,
		3176206446,
		3009027431,
		2573942360,
		2539664209,
		2239571018,
		2339776835,
		3508494900,
		3742658365,
		3439949862,
		3271718191,
		3912455696,
		3879230233,
		4112862210,
		4214112523,
		2592891351,
		2491903198,
		2258271173,
		2291234508,
		2728416755,
		2896910586,
		3199619041,
		2965193448,
		3939764639,
		3839820950,
		4139914125,
		4173930116,
		3539484091,
		3706925234,
		3471714217,
		3236244128,
		2050797895,
		1949809742,
		1714072405,
		1747035740,
		1108378979,
		1276872810,
		1577492337,
		1343066744,
		174381327,
		74437638,
		376619805,
		410635796,
		843640107,
		1011081250,
		777975609,
		542505520,
		3959535514,
		3792353939,
		4028083592,
		4263288961,
		3559752638,
		3659959991,
		3359349164,
		3325072549,
		2623135698,
		2454901467,
		2152711616,
		2386872521,
		2759191542,
		2860443391,
		3093557732,
		3060333805,
		212952842,
		45771267,
		279411992,
		514617361,
		882725678,
		982933031,
		680216892,
		645940277,
		2095648578,
		1927414347,
		1627329872,
		1861490777,
		1153776486,
		1255028335,
		1490231668,
		1457007741,
		930745505,
		963707304,
		728503987,
		627514298,
		257308805,
		22885772,
		322970263,
		491466654,
		1193436393,
		1227450848,
		1530167035,
		1430221810,
		2131644621,
		1896177092,
		1662536415,
		1829980118,
		3620396081,
		3653357880,
		3420243491,
		3319253802,
		4024887317,
		3790464284,
		4092654087,
		4261150478,
		2811409529,
		2845423984,
		3146034795,
		3046089570,
		2680062045,
		2444594516,
		2208864847,
		2376308550
	}
end

function jk.aes.AES128CipherGeneric.AES128:_construct0()
	jk.aes.AES128CipherGeneric.AES128._init(self)
	return self
end

function jk.aes.AES128CipherGeneric.AES128:encrypt(src, key, iv)
	if not (src ~= nil) then
		do return nil end
	end
	if not (key ~= nil) then
		do return nil end
	end
	if not (iv ~= nil) then
		do return nil end
	end
	do
		local aes = _g.jk.aes.AES128CipherGeneric.AES128._construct0(_g.jk.aes.AES128CipherGeneric.AES128._create())
		do return aes:encryptBlock(src, key, iv) end
	end
end

function jk.aes.AES128CipherGeneric.AES128:decrypt(src, key, iv)
	if not (src ~= nil) then
		do return nil end
	end
	if not (key ~= nil) then
		do return nil end
	end
	if not (iv ~= nil) then
		do return nil end
	end
	do
		local aes = _g.jk.aes.AES128CipherGeneric.AES128._construct0(_g.jk.aes.AES128CipherGeneric.AES128._create())
		do return aes:decryptBlock(src, key, iv) end
	end
end

function jk.aes.AES128CipherGeneric.AES128:encryptBlock(block, keyData, ivData)
	if not (block ~= nil) then
		do return nil end
	end
	do
		local buf = self:xor(ivData, block)
		do return self:encryptCipherOperation(buf, keyData) end
	end
end

function jk.aes.AES128CipherGeneric.AES128:xor(iv, block)
	if not (iv ~= nil) then
		do return nil end
	end
	if not (block ~= nil) then
		do return nil end
	end
	do
		local size = _g.jk.lang.Buffer:getSize(block)
		local buf = _g.jk.lang.Buffer:allocate(size)
		do
			local i = 0
			while i < size do
				buf[i + 1] = _vm:bitwise_xor(iv[i + 1], block[i + 1])
				do i = i + 1 end
			end
		end
		do return buf end
	end
end

function jk.aes.AES128CipherGeneric.AES128:encryptCipherOperation(block, keyData)
	local rounds = self.nr
	local exkey = self:expandKey(keyData)
	local b = self:toUInt32Array(block)
	local t = _vm:allocate_array(4)
	do
		local r = 0
		while r < rounds - 1 do
			t[0 + 1] = _vm:bitwise_xor(b[0 + 1], exkey[r + 1][0 + 1])
			t[1 + 1] = _vm:bitwise_xor(b[1 + 1], exkey[r + 1][1 + 1])
			t[2 + 1] = _vm:bitwise_xor(b[2 + 1], exkey[r + 1][2 + 1])
			t[3 + 1] = _vm:bitwise_xor(b[3 + 1], exkey[r + 1][3 + 1])
			do
				local lb00 = self.t0[_vm:bitwise_and(t[0 + 1], 255) + 1]
				local lb01 = self.t1[_vm:bitwise_and(_vm:bitwise_right_shift(t[1 + 1], 8), 255) + 1]
				local lb02 = self.t2[_vm:bitwise_and(_vm:bitwise_right_shift(t[2 + 1], 16), 255) + 1]
				local lb03 = self.t3[_vm:bitwise_right_shift(t[3 + 1], 24) + 1]
				b[0 + 1] = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_xor(lb00, lb01), lb02), lb03)
				do
					local lb10 = self.t0[_vm:bitwise_and(t[1 + 1], 255) + 1]
					local lb11 = self.t1[_vm:bitwise_and(_vm:bitwise_right_shift(t[2 + 1], 8), 255) + 1]
					local lb12 = self.t2[_vm:bitwise_and(_vm:bitwise_right_shift(t[3 + 1], 16), 255) + 1]
					local lb13 = self.t3[_vm:bitwise_right_shift(t[0 + 1], 24) + 1]
					b[1 + 1] = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_xor(lb10, lb11), lb12), lb13)
					do
						local lb20 = self.t0[_vm:bitwise_and(t[2 + 1], 255) + 1]
						local lb21 = self.t1[_vm:bitwise_and(_vm:bitwise_right_shift(t[3 + 1], 8), 255) + 1]
						local lb22 = self.t2[_vm:bitwise_and(_vm:bitwise_right_shift(t[0 + 1], 16), 255) + 1]
						local lb23 = self.t3[_vm:bitwise_right_shift(t[1 + 1], 24) + 1]
						b[2 + 1] = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_xor(lb20, lb21), lb22), lb23)
						do
							local lb30 = self.t0[_vm:bitwise_and(t[3 + 1], 255) + 1]
							local lb31 = self.t1[_vm:bitwise_and(_vm:bitwise_right_shift(t[0 + 1], 8), 255) + 1]
							local lb32 = self.t2[_vm:bitwise_and(_vm:bitwise_right_shift(t[1 + 1], 16), 255) + 1]
							local lb33 = self.t3[_vm:bitwise_right_shift(t[2 + 1], 24) + 1]
							b[3 + 1] = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_xor(lb30, lb31), lb32), lb33)
						end
					end
				end
			end
			do r = r + 1 end
		end
	end
	do
		local r = rounds - 1
		t[0 + 1] = _vm:bitwise_xor(b[0 + 1], exkey[r + 1][0 + 1])
		t[1 + 1] = _vm:bitwise_xor(b[1 + 1], exkey[r + 1][1 + 1])
		t[2 + 1] = _vm:bitwise_xor(b[2 + 1], exkey[r + 1][2 + 1])
		t[3 + 1] = _vm:bitwise_xor(b[3 + 1], exkey[r + 1][3 + 1])
		b[0 + 1] = _vm:bitwise_xor(self:f1(t[0 + 1], t[1 + 1], t[2 + 1], t[3 + 1]), exkey[rounds + 1][0 + 1])
		b[1 + 1] = _vm:bitwise_xor(self:f1(t[1 + 1], t[2 + 1], t[3 + 1], t[0 + 1]), exkey[rounds + 1][1 + 1])
		b[2 + 1] = _vm:bitwise_xor(self:f1(t[2 + 1], t[3 + 1], t[0 + 1], t[1 + 1]), exkey[rounds + 1][2 + 1])
		b[3 + 1] = _vm:bitwise_xor(self:f1(t[3 + 1], t[0 + 1], t[1 + 1], t[2 + 1]), exkey[rounds + 1][3 + 1])
		do
			local output = _g.jk.lang.Buffer:allocate(#b * 4)
			local i = 0
			local j = 0
			do
				i = 0
				j = 0
				while i < #b do
					output[(function() local v = j j = j + 1 return v end)() + 1] = _vm:bitwise_and(b[i + 1], 255)
					output[(function() local v = j j = j + 1 return v end)() + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(b[i + 1], 8), 255)
					output[(function() local v = j j = j + 1 return v end)() + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(b[i + 1], 16), 255)
					output[(function() local v = j j = j + 1 return v end)() + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(b[i + 1], 24), 255)
					do i = i + 1 end
				end
			end
			do return output end
		end
	end
end

function jk.aes.AES128CipherGeneric.AES128:decryptBlock(block, keyData, ivData)
	if not (block ~= nil) then
		do return nil end
	end
	do
		local decrypted = self:decryptCipherOperation(block, keyData)
		local buf = self:xor(ivData, decrypted)
		do return buf end
	end
end

function jk.aes.AES128CipherGeneric.AES128:decryptCipherOperation(block, keyData)
	local rounds = self.nr
	local rk = self:expandKeyInv(keyData)
	local b = self:toUInt32Array(block)
	local t = _vm:allocate_array(4)
	do
		local r = rounds
		while r >= 2 do
			t[0 + 1] = _vm:bitwise_xor(b[0 + 1], rk[r + 1][0 + 1])
			t[1 + 1] = _vm:bitwise_xor(b[1 + 1], rk[r + 1][1 + 1])
			t[2 + 1] = _vm:bitwise_xor(b[2 + 1], rk[r + 1][2 + 1])
			t[3 + 1] = _vm:bitwise_xor(b[3 + 1], rk[r + 1][3 + 1])
			do
				local b00 = self.t0INV[_vm:bitwise_and(t[0 + 1], 255) + 1]
				local b01 = self.t1INV[_vm:bitwise_and(_vm:bitwise_right_shift(t[3 + 1], 8), 255) + 1]
				local b02 = self.t2INV[_vm:bitwise_and(_vm:bitwise_right_shift(t[2 + 1], 16), 255) + 1]
				local b03 = self.t3INV[_vm:bitwise_right_shift(t[1 + 1], 24) + 1]
				b[0 + 1] = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_xor(b00, b01), b02), b03)
				do
					local b10 = self.t0INV[_vm:bitwise_and(t[1 + 1], 255) + 1]
					local b11 = self.t1INV[_vm:bitwise_and(_vm:bitwise_right_shift(t[0 + 1], 8), 255) + 1]
					local b12 = self.t2INV[_vm:bitwise_and(_vm:bitwise_right_shift(t[3 + 1], 16), 255) + 1]
					local b13 = self.t3INV[_vm:bitwise_right_shift(t[2 + 1], 24) + 1]
					b[1 + 1] = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_xor(b10, b11), b12), b13)
					do
						local b20 = self.t0INV[_vm:bitwise_and(t[2 + 1], 255) + 1]
						local b21 = self.t1INV[_vm:bitwise_and(_vm:bitwise_right_shift(t[1 + 1], 8), 255) + 1]
						local b22 = self.t2INV[_vm:bitwise_and(_vm:bitwise_right_shift(t[0 + 1], 16), 255) + 1]
						local b23 = self.t3INV[_vm:bitwise_right_shift(t[3 + 1], 24) + 1]
						b[2 + 1] = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_xor(b20, b21), b22), b23)
						do
							local b30 = self.t0INV[_vm:bitwise_and(t[3 + 1], 255) + 1]
							local b31 = self.t1INV[_vm:bitwise_and(_vm:bitwise_right_shift(t[2 + 1], 8), 255) + 1]
							local b32 = self.t2INV[_vm:bitwise_and(_vm:bitwise_right_shift(t[1 + 1], 16), 255) + 1]
							local b33 = self.t3INV[_vm:bitwise_right_shift(t[0 + 1], 24) + 1]
							b[3 + 1] = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_xor(b30, b31), b32), b33)
						end
					end
				end
			end
			do r = r - 1 end
		end
	end
	t[0 + 1] = _vm:bitwise_xor(b[0 + 1], rk[1 + 1][0 + 1])
	t[1 + 1] = _vm:bitwise_xor(b[1 + 1], rk[1 + 1][1 + 1])
	t[2 + 1] = _vm:bitwise_xor(b[2 + 1], rk[1 + 1][2 + 1])
	t[3 + 1] = _vm:bitwise_xor(b[3 + 1], rk[1 + 1][3 + 1])
	do
		local lb00 = _vm:bitwise_and(self.sboxINV[self:b0(t[0 + 1]) + 1], 255)
		local lb01 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b1(t[3 + 1]) + 1], 255), 8)
		local lb02 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b2(t[2 + 1]) + 1], 255), 16)
		local lb03 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b3(t[1 + 1]) + 1], 255), 24)
		b[0 + 1] = _vm:bitwise_xor(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(lb00, lb01), lb02), lb03), rk[0 + 1][0 + 1])
		do
			local lb10 = _vm:bitwise_and(self.sboxINV[self:b0(t[1 + 1]) + 1], 255)
			local lb11 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b1(t[0 + 1]) + 1], 255), 8)
			local lb12 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b2(t[3 + 1]) + 1], 255), 16)
			local lb13 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b3(t[2 + 1]) + 1], 255), 24)
			b[1 + 1] = _vm:bitwise_xor(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(lb10, lb11), lb12), lb13), rk[0 + 1][1 + 1])
			do
				local lb20 = _vm:bitwise_and(self.sboxINV[self:b0(t[2 + 1]) + 1], 255)
				local lb21 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b1(t[1 + 1]) + 1], 255), 8)
				local lb22 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b2(t[0 + 1]) + 1], 255), 16)
				local lb23 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b3(t[3 + 1]) + 1], 255), 24)
				b[2 + 1] = _vm:bitwise_xor(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(lb20, lb21), lb22), lb23), rk[0 + 1][2 + 1])
				do
					local lb30 = _vm:bitwise_and(self.sboxINV[self:b0(t[3 + 1]) + 1], 255)
					local lb31 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b1(t[2 + 1]) + 1], 255), 8)
					local lb32 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b2(t[1 + 1]) + 1], 255), 16)
					local lb33 = _vm:bitwise_left_shift(_vm:bitwise_and(self.sboxINV[self:b3(t[0 + 1]) + 1], 255), 24)
					b[3 + 1] = _vm:bitwise_xor(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(lb30, lb31), lb32), lb33), rk[0 + 1][3 + 1])
					do
						local i = 0
						local j = 0
						local output = _g.jk.lang.Buffer:allocate(#b * 4)
						do
							i = 0
							j = 0
							while i < #b do
								output[(function() local v = j j = j + 1 return v end)() + 1] = _vm:bitwise_and(b[i + 1], 255)
								output[(function() local v = j j = j + 1 return v end)() + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(b[i + 1], 8), 255)
								output[(function() local v = j j = j + 1 return v end)() + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(b[i + 1], 16), 255)
								output[(function() local v = j j = j + 1 return v end)() + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(b[i + 1], 24), 255)
								do i = i + 1 end
							end
						end
						do return output end
					end
				end
			end
		end
	end
end

function jk.aes.AES128CipherGeneric.AES128:expandKey(key)
	do self:calculateBox() end
	do
		local g = self.nb * (self.nr + 1) * 4
		local w = _vm:allocate_array(g)
		do
			local i = 0
			while i < self.nk do
				do
					local x = 0
					while x < 4 do
						w[4 * i + x + 1] = key[4 * i + x + 1]
						do x = x + 1 end
					end
				end
				do i = i + 1 end
			end
		end
		do
			local i = 4
			while i < self.nb * (self.nr + 1) do
				local tmp = _vm:allocate_array(4)
				do
					local x = 0
					while x < 4 do
						tmp[x + 1] = w[4 * (i - 1) + x + 1]
						do x = x + 1 end
					end
				end
				if _util:convert_to_integer(i % self.nk) == 0 then
					local newTmp = _vm:allocate_array(4)
					newTmp[0 + 1] = tmp[1 + 1]
					newTmp[1 + 1] = tmp[2 + 1]
					newTmp[2 + 1] = tmp[3 + 1]
					newTmp[3 + 1] = tmp[0 + 1]
					tmp = self:subWord(newTmp)
					tmp[0 + 1] = _vm:bitwise_xor(tmp[0 + 1], self.rcon[_util:convert_to_integer(i / self.nk) + 1])
				elseif self.nk > 6 and _util:convert_to_integer(i % self.nk) == 4 then
					tmp = self:subWord(tmp)
				end
				do
					local x = 0
					while x < 4 do
						w[4 * i + x + 1] = _vm:bitwise_xor(w[4 * (i - self.nk) + x + 1], tmp[x + 1])
						do x = x + 1 end
					end
				end
				do i = i + 1 end
			end
		end
		do return self:convertExpandedKey(w) end
	end
end

function jk.aes.AES128CipherGeneric.AES128:expandKeyInv(key)
	do self:calculateBox() end
	do
		local rounds = self.nr
		local rk2 = self:expandKey(key)
		local w = 0
		do
			local r = 1
			while r < rounds do
				w = rk2[r + 1][0 + 1]
				do
					local ua1 = _vm:bitwise_xor(self.u1[self:b0(w) + 1], self.u2[self:b1(w) + 1])
					local ua2 = _vm:bitwise_xor(self.u3[self:b2(w) + 1], self.u4[self:b3(w) + 1])
					rk2[r + 1][0 + 1] = _vm:bitwise_xor(ua1, ua2)
					w = rk2[r + 1][1 + 1]
					do
						local ua11 = _vm:bitwise_xor(self.u1[self:b0(w) + 1], self.u2[self:b1(w) + 1])
						local ua12 = _vm:bitwise_xor(self.u3[self:b2(w) + 1], self.u4[self:b3(w) + 1])
						rk2[r + 1][1 + 1] = _vm:bitwise_xor(ua11, ua12)
						w = rk2[r + 1][2 + 1]
						do
							local ua21 = _vm:bitwise_xor(self.u1[self:b0(w) + 1], self.u2[self:b1(w) + 1])
							local ua22 = _vm:bitwise_xor(self.u3[self:b2(w) + 1], self.u4[self:b3(w) + 1])
							rk2[r + 1][2 + 1] = _vm:bitwise_xor(ua21, ua22)
							w = rk2[r + 1][3 + 1]
							do
								local ua31 = _vm:bitwise_xor(self.u1[self:b0(w) + 1], self.u2[self:b1(w) + 1])
								local ua32 = _vm:bitwise_xor(self.u3[self:b2(w) + 1], self.u4[self:b3(w) + 1])
								rk2[r + 1][3 + 1] = _vm:bitwise_xor(ua31, ua32)
							end
						end
					end
				end
				do r = r + 1 end
			end
		end
		do return rk2 end
	end
end

function jk.aes.AES128CipherGeneric.AES128:rotateLeft(value, by)
	local a = _vm:bitwise_and(_vm:bitwise_left_shift(value, by), 255)
	local b = _vm:bitwise_right_shift(value, 8 - by)
	do return _vm:bitwise_or(a, b) end
end

function jk.aes.AES128CipherGeneric.AES128:arrayToInteger(array)
	if not (array ~= nil) then
		do return 0 end
	end
	do
		local result = 0
		if array ~= nil then
			local n = 0
			local m = #array
			do
				n = 0
				while n < m do
					local v = array[n + 1]
					result = _vm:bitwise_or(_vm:bitwise_left_shift(result, 8), v)
					do n = n + 1 end
				end
			end
		end
		do return result end
	end
end

function jk.aes.AES128CipherGeneric.AES128:subWord(word)
	local result = word
	do
		local i = 0
		while i < 4 do
			result[i + 1] = self.sbox[word[i + 1] + 1]
			do i = i + 1 end
		end
	end
	do return result end
end

function jk.aes.AES128CipherGeneric.AES128:convertExpandedKey(expanded)
	local arr = _vm:allocate_array(_util:convert_to_integer(#expanded / 4))
	do
		local idx = 0
		while idx < #expanded do
			local four = _vm:allocate_array(4)
			do
				local i = 0
				while i < 4 do
					four[i + 1] = expanded[i + idx + 1]
					do i = i + 1 end
				end
			end
			do
				local a = 0
				local b = #four - 1
				local four2 = _vm:allocate_array(4)
				while a <= b do
					four2[a + 1] = four[b - a + 1]
					do a = a + 1 end
				end
				do
					local num = self:arrayToInteger(four2)
					arr[_util:convert_to_integer(idx / 4) + 1] = num
				end
			end
			idx = idx + 4
		end
	end
	do
		local allarr = {}
		do
			local idx = 0
			while idx < #arr do
				local v = _vm:allocate_array(4)
				do
					local i = 0
					while i < 4 do
						v[i + 1] = arr[i + idx + 1]
						do i = i + 1 end
					end
				end
				do _g.jk.lang.Vector:append(allarr, v) end
				idx = idx + 4
			end
		end
		do return allarr end
	end
end

function jk.aes.AES128CipherGeneric.AES128:calculateBox()
	local box = _vm:allocate_array(256)
	local nbox = _vm:allocate_array(256)
	box[0 + 1] = 99
	do
		local p = 1
		local q = 1
		while true do
			local c = 0
			if _vm:bitwise_and(p, 128) == 128 then
				c = 27
			end
			p = _vm:bitwise_and(_vm:bitwise_xor(_vm:bitwise_xor(p, _vm:bitwise_left_shift(p, 1) + 0), c), 255)
			q = _vm:bitwise_and(_vm:bitwise_xor(q, _vm:bitwise_left_shift(q, 1)), 255)
			q = _vm:bitwise_and(_vm:bitwise_xor(q, _vm:bitwise_left_shift(q, 2)), 255)
			q = _vm:bitwise_and(_vm:bitwise_xor(q, _vm:bitwise_left_shift(q, 4)), 255)
			do
				local a = 0
				if _vm:bitwise_and(q, 128) == 128 then
					a = 9
				end
				q = _vm:bitwise_xor(q, a)
				do
					local x = _vm:bitwise_xor(99, q)
					local y = _vm:bitwise_and(_vm:bitwise_xor(_vm:bitwise_xor(self:rotateLeft(q, 1), self:rotateLeft(q, 2)), self:rotateLeft(q, 3)), 255)
					local s = _vm:bitwise_and(_vm:bitwise_xor(_vm:bitwise_xor(x, y), self:rotateLeft(q, 4)), 255)
					box[p + 1] = s
					nbox[s + 1] = p
					if p == 1 then
						do break end
					end
				end
			end
		end
		self.sbox = box
		self.sboxINV = nbox
	end
end

function jk.aes.AES128CipherGeneric.AES128:toUInt32Array(value)
	local size = _g.jk.lang.Buffer:getSize(value)
	local result = _vm:allocate_array(_util:convert_to_integer(size / 4))
	do
		local i = 0
		while i < size do
			local val = 0
			local a = 0
			if size > 3 then
				a = _vm:bitwise_left_shift(value[i + 3 + 1], 24)
			end
			val = _vm:bitwise_or(val, a)
			do
				local b = 0
				if size > 2 then
					b = _vm:bitwise_left_shift(value[i + 2 + 1], 16)
				end
				val = _vm:bitwise_or(val, b)
				do
					local c = 0
					if size > 1 then
						c = _vm:bitwise_left_shift(value[i + 1 + 1], 8)
					end
					val = _vm:bitwise_or(val, c)
					do
						local d = 0
						if value ~= nil then
							d = value[i + 1]
						end
						val = _vm:bitwise_or(val, d)
						result[_util:convert_to_integer(i / 4) + 1] = val
					end
				end
			end
			i = i + 4
		end
	end
	do return result end
end

function jk.aes.AES128CipherGeneric.AES128:f1(x0, x1, x2, x3)
	local result = 0
	result = _vm:bitwise_or(result, self:b1(self.t0[_vm:bitwise_and(x0, 255) + 1]))
	result = _vm:bitwise_or(result, _vm:bitwise_left_shift(self:b1(self.t0[_vm:bitwise_and(_vm:bitwise_right_shift(x1, 8), 255) + 1]), 8))
	result = _vm:bitwise_or(result, _vm:bitwise_left_shift(self:b1(self.t0[_vm:bitwise_and(_vm:bitwise_right_shift(x2, 16), 255) + 1]), 16))
	result = _vm:bitwise_or(result, _vm:bitwise_left_shift(self:b1(self.t0[_vm:bitwise_right_shift(x3, 24) + 1]), 24))
	do return result end
end

function jk.aes.AES128CipherGeneric.AES128:b0(value)
	do return _vm:bitwise_and(value, 255) end
end

function jk.aes.AES128CipherGeneric.AES128:b1(value)
	do return _vm:bitwise_and(_vm:bitwise_right_shift(value, 8), 255) end
end

function jk.aes.AES128CipherGeneric.AES128:b2(value)
	do return _vm:bitwise_and(_vm:bitwise_right_shift(value, 16), 255) end
end

function jk.aes.AES128CipherGeneric.AES128:b3(value)
	do return _vm:bitwise_and(_vm:bitwise_right_shift(value, 24), 255) end
end

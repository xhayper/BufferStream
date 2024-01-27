--!strict
--!native

local BufferStream = {}
BufferStream.ClassName = "BufferStream"
BufferStream.__index = BufferStream

type BufferStreamImpl = {
	__index: BufferStreamImpl,

	new: (buffer: (buffer | string)?) -> BufferStream,
}

type BufferStreamProto = {
	ClassName: "BufferStream",

	buffer: buffer,
	byteOffset: number,
}

export type BufferStream = typeof(setmetatable({} :: BufferStreamProto, {} :: BufferStreamImpl))

function BufferStream.new(data: (buffer | string)?): BufferStream
	local self = setmetatable({} :: BufferStreamProto, BufferStream)
	self.byteOffset = 0

	local buf

	if typeof(data) == "string" then
		buf = buffer.fromstring(data)
	elseif typeof(data) == "buffer" then
		buf = data
	else
		buf = buffer.create(0)
	end

	self.buffer = buf

	return self
end

return BufferStream

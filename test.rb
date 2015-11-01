require "ffi"

module Rust
  extend FFI::Library
  ffi_lib "target/release/test.dll"
  ffi_convention :stdcall
  attach_function :square, [:int ], :int
end

module Win32
   extend FFI::Library
   ffi_lib 'user32'
   attach_function :messageBox,
       :MessageBoxA,[ :pointer, :string, :string, :long ], :int
end

Win32.messageBox(nil, "Hello Windows! Rust calculated: #{Rust.square(100)}", "nice", 0x40)

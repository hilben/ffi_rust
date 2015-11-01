fn test(arg: i32) -> i32 { arg*arg }

#[no_mangle]
pub extern fn square(i: i32) -> i32 {
  test(i)
}

use std::ffi::CString;
extern "C" {
    fn print_l(buff: *const std::os::raw::c_char);
}

fn print_lex(inpt: &str) {
    let input = CString::new(inpt).unwrap();
    println!("LINE 1");
    unsafe { print_l(input.as_ptr()) }
}

fn main() {
    const INPUT: &str = "public class Simple1 {
	public static void main (String args [ ] ) {
		int x=3;
		int y=5;
		int res= x + x *y + 2 ;
		System.out.print(\"Result: \");
		System.out.println(res);
	}
}
";
    print_lex(INPUT);
}

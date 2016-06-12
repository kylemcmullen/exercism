pub fn hello(name: Option<&str>) -> String {
    let mut greeting = "Hello, ".to_string();

    greeting.push_str(name.unwrap_or("World"));
    
    greeting.push('!');

    return greeting;
}
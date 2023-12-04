const std = @import("std");

pub fn main() !void {
    try day_1();
}

pub fn day_1() !void {
    const input_a =
        \\1abc2
        \\pqr3stu8vwx
        \\a1b2c3d4e5f
        \\treb7uchet
    ;

    for (input_a) |char| {
        std.debug.print("{d}\n", .{char});
    }
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

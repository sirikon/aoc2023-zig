const std = @import("std");

pub fn main() !void {
    try day_1();
}

pub fn day_1() !void {
    std.debug.print("{s}\n", .{"--- Day 1 ---"});
    try resolve_day_1(@embedFile("./inputs/day_1/example.txt"));
    try resolve_day_1(@embedFile("./inputs/day_1/part1.txt"));
}

pub fn resolve_day_1(input: []const u8) !void {
    var it = std.mem.split(u8, input, "\n");
    var sum: i32 = 0;
    while (it.next()) |line| {
        var first: ?u8 = null;
        var last: ?u8 = null;

        var i: usize = 0;
        while (i < line.len) {
            const char = line[i];
            if (is_number(char)) {
                first = char;
                break;
            }
            i += 1;
        }

        i = line.len - 1;
        while (i >= 0) {
            const char = line[i];
            if (is_number(char)) {
                last = char;
                break;
            }
            i -= 1;
        }

        if (first == null or last == null) {
            unreachable;
        }

        const values = [2]u8{ first.?, last.? };
        const result = try std.fmt.parseInt(i32, &values, 10);
        sum += result;
    }
    std.debug.print("{d}\n", .{sum});
}

pub fn is_number(char: u8) bool {
    return char >= '0' and char <= '9';
}

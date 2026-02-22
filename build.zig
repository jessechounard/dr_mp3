const std = @import("std");

pub fn build(b: *std.Build) void {
    const upstream = b.dependency("dr_mp3", .{});
    const lib = b.addLibrary(.{
        .name = "dr_mp3",
        .linkage = .static,
        .root_module = b.createModule(.{
            .target = b.standardTargetOptions(.{}),
            .optimize = b.standardOptimizeOption(.{}),
            .link_libc = true,
        }),
    });
    lib.addIncludePath(upstream.path(""));
    lib.addCSourceFiles(.{
        .files = &.{
            "dr_mp3.c",
        },
    });
    lib.installHeadersDirectory(upstream.path("."), "", .{ .include_extensions = &.{
        "dr_mp3.h",
    } });
    b.installArtifact(lib);
}

# dr_mp3
This is [dr_mp3 from dr_libs](https://github.com/mackron/dr_libs), packaged for [Zig](https://ziglang.org/). (Intended for C or C++ projects using Zig as a build tool.)

## Usage
First, update your `build.zig.zon`:
```sh
zig fetch --save git+https://github.com/jessechounard/dr_mp3
```

Next, in your `build.zig`, you can access the library as a dependency:
```zig
const dr_mp3_dep = b.dependency("dr_mp3", .{
    .target = target,
    .optimize = optimize,
});
const dr_mp3_lib = dr_mp3_dep.artifact("dr_mp3");

exe.root_module.linkLibrary(dr_mp3_lib);
```

Finally, in your C++ file, you can use the library:
```cpp
#include <dr_mp3.h>
#include <stdio.h>

int main() {
  drmp3 mp3;
  if (!drmp3_init_file(&mp3, "song.mp3", NULL)) {
    printf("Couldn't open file!\n");
  } else {
    drmp3_uninit(&mp3);
  }
  return 0;
}```
